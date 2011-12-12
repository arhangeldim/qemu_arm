/* kernel/sched.c
 *
 * context_switch - switch to the new MM and the new
 * thread's register state.
 *
 */

static inline void
context_switch(struct rq *rq, struct task_struct *prev,
         struct task_struct *next)
{
  struct mm_struct *mm, *oldmm;

  prepare_task_switch(rq, prev, next);

  mm = next->mm;
  oldmm = prev->active_mm;
  /*
   * For paravirt, this is coupled with an exit in switch_to to
   * combine the page table reload and the switch backend into
   * one hypercall.
   */
  arch_start_context_switch(prev);

  if (!mm) {
    next->active_mm = oldmm;
    atomic_inc(&oldmm->mm_count);
    enter_lazy_tlb(oldmm, next);
  } else
    switch_mm(oldmm, mm, next);

  if (!prev->mm) {
    prev->active_mm = NULL;
    rq->prev_mm = oldmm;
  }
  /*
   * Since the runqueue lock will be released by the next
   * task (which is an invalid locking op but in the case
   * of the scheduler it's an obvious special-case), so we
   * do an early lockdep release here:
   */
#ifndef __ARCH_WANT_UNLOCKED_CTXSW
  spin_release(&rq->lock.dep_map, 1, _THIS_IP_);
#endif

  /* Here we just switch the register state and the stack. */
  switch_to(prev, next, prev);

  barrier();
  /*
   * this_rq must be evaluated again because prev may have moved
   * CPUs since it called schedule(), thus the 'rq' on its stack
   * frame will be invalid.
   */
  finish_task_switch(this_rq(), prev);
}


/*
 * schedule() is the main scheduler function.
 */
asmlinkage void __sched schedule(void)
{
  struct task_struct *prev, *next;
  unsigned long *switch_count;
  struct rq *rq;
  int cpu;

need_resched:
  preempt_disable();
  cpu = smp_processor_id();
  rq = cpu_rq(cpu);
  rcu_note_context_switch(cpu);
  prev = rq->curr;

  schedule_debug(prev);

  if (sched_feat(HRTICK))
    hrtick_clear(rq);

  raw_spin_lock_irq(&rq->lock);

  switch_count = &prev->nivcsw;
  if (prev->state && !(preempt_count() & PREEMPT_ACTIVE)) {
    if (unlikely(signal_pending_state(prev->state, prev))) {
      prev->state = TASK_RUNNING;
    } else {
      /*
       * If a worker is going to sleep, notify and
       * ask workqueue whether it wants to wake up a
       * task to maintain concurrency.  If so, wake
       * up the task.
       */
      if (prev->flags & PF_WQ_WORKER) {
        struct task_struct *to_wakeup;

        to_wakeup = wq_worker_sleeping(prev, cpu);
        if (to_wakeup)
          try_to_wake_up_local(to_wakeup);
      }
      deactivate_task(rq, prev, DEQUEUE_SLEEP);

      /*
       * If we are going to sleep and we have plugged IO queued, make
       * sure to submit it to avoid deadlocks.
       */
      if (blk_needs_flush_plug(prev)) {
        raw_spin_unlock(&rq->lock);
        blk_schedule_flush_plug(prev);
        raw_spin_lock(&rq->lock);
      }
    }
    switch_count = &prev->nvcsw;
  }

  pre_schedule(rq, prev);

  if (unlikely(!rq->nr_running))
    idle_balance(cpu, rq);

  put_prev_task(rq, prev);
  next = pick_next_task(rq);
  clear_tsk_need_resched(prev);
  rq->skip_clock_update = 0;

  if (likely(prev != next)) {
    rq->nr_switches++;
    rq->curr = next;
    ++*switch_count;

    context_switch(rq, prev, next); /* unlocks the rq */
    /*
     * The context switch have flipped the stack from under us
     * and restored the local variables which were saved when
     * this task called schedule() in the past. prev == current
     * is still correct, but it can be moved to another cpu/rq.
     */
    cpu = smp_processor_id();
    rq = cpu_rq(cpu);
  } else
    raw_spin_unlock_irq(&rq->lock);

  post_schedule(rq);

  preempt_enable_no_resched();
  if (need_resched())
    goto need_resched;
}
