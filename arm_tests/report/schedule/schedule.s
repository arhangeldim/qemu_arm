Dump of assembler code for function schedule:
   0xc024965c <+0>:	push	{r3, r4, r5, r6, r7, r8, r11, lr}
   0xc0249660 <+4>:	add	r11, sp, #28
   0xc0249664 <+8>:	mov	r0, #0
   0xc0249668 <+12>:	bl	0xc00696fc <rcu_sched_qs>
   0xc024966c <+16>:	ldr	r3, [pc, #864]	; 0xc02499d4 <schedule+888>
   0xc0249670 <+20>:	mov	r2, sp
   0xc0249674 <+24>:	ldr	r6, [r3, #972]	; 0x3cc
   0xc0249678 <+28>:	bic	r3, r2, #8128	; 0x1fc0
   0xc024967c <+32>:	bic	r3, r3, #63	; 0x3f
   0xc0249680 <+36>:	ldr	r3, [r3, #4]
   0xc0249684 <+40>:	bics	r2, r3, #1073741824	; 0x40000000
   0xc0249688 <+44>:	beq	0xc02496a0 <schedule+68>
   0xc024968c <+48>:	ldr	r3, [r6, #176]	; 0xb0
   0xc0249690 <+52>:	cmp	r3, #0
   0xc0249694 <+56>:	bne	0xc02496a0 <schedule+68>
   0xc0249698 <+60>:	mov	r0, r6
   0xc024969c <+64>:	bl	0xc0037a38 <__schedule_bug>
   0xc02496a0 <+68>:	mrs	r3, CPSR
   0xc02496a4 <+72>:	orr	r3, r3, #128	; 0x80
   0xc02496a8 <+76>:	msr	CPSR_c, r3
   0xc02496ac <+80>:	ldr	r3, [r6]
   0xc02496b0 <+84>:	add	r8, r6, #340	; 0x154
   0xc02496b4 <+88>:	cmp	r3, #0
   0xc02496b8 <+92>:	beq	0xc0249804 <schedule+424>
   0xc02496bc <+96>:	mov	r2, sp
   0xc02496c0 <+100>:	bic	r3, r2, #8128	; 0x1fc0
   0xc02496c4 <+104>:	bic	r3, r3, #63	; 0x3f
   0xc02496c8 <+108>:	ldr	r3, [r3, #4]
   0xc02496cc <+112>:	tst	r3, #1073741824	; 0x40000000
   0xc02496d0 <+116>:	bne	0xc0249804 <schedule+424>
   0xc02496d4 <+120>:	ldr	r3, [r6]
   0xc02496d8 <+124>:	tst	r3, #129	; 0x81
   0xc02496dc <+128>:	beq	0xc0249704 <schedule+168>
   0xc02496e0 <+132>:	ldr	r2, [r6, #4]
   0xc02496e4 <+136>:	ldr	r2, [r2]
   0xc02496e8 <+140>:	tst	r2, #1
   0xc02496ec <+144>:	beq	0xc0249704 <schedule+168>
   0xc02496f0 <+148>:	tst	r3, #1
   0xc02496f4 <+152>:	bne	0xc02499c8 <schedule+876>
   0xc02496f8 <+156>:	ldr	r3, [r6, #512]	; 0x200
   0xc02496fc <+160>:	tst	r3, #256	; 0x100
   0xc0249700 <+164>:	bne	0xc02499c8 <schedule+876>
   0xc0249704 <+168>:	ldr	r3, [r6, #12]
   0xc0249708 <+172>:	tst	r3, #32
   0xc024970c <+176>:	beq	0xc02497a8 <schedule+332>
   0xc0249710 <+180>:	mov	r0, r6
   0xc0249714 <+184>:	mov	r1, #0
   0xc0249718 <+188>:	bl	0xc0050a6c <wq_worker_sleeping>
   0xc024971c <+192>:	subs	r4, r0, #0
   0xc0249720 <+196>:	beq	0xc02497a8 <schedule+332>
   0xc0249724 <+200>:	mov	r2, sp
   0xc0249728 <+204>:	bic	r3, r2, #8128	; 0x1fc0
   0xc024972c <+208>:	bic	r3, r3, #63	; 0x3f
   0xc0249730 <+212>:	ldr	r3, [r3, #12]
   0xc0249734 <+216>:	cmp	r4, r3
   0xc0249738 <+220>:	ldreq	r0, [pc, #664]	; 0xc02499d8 <schedule+892>
   0xc024973c <+224>:	moveq	r1, #2560	; 0xa00
   0xc0249740 <+228>:	beq	0xc0249884 <schedule+552>
   0xc0249744 <+232>:	ldr	r3, [r4]
   0xc0249748 <+236>:	tst	r3, #3
   0xc024974c <+240>:	beq	0xc02497a8 <schedule+332>
   0xc0249750 <+244>:	ldr	r3, [r4, #76]	; 0x4c
   0xc0249754 <+248>:	cmp	r3, #0
   0xc0249758 <+252>:	movne	r5, #0
   0xc024975c <+256>:	bne	0xc0249774 <schedule+280>
   0xc0249760 <+260>:	ldr	r0, [pc, #620]	; 0xc02499d4 <schedule+888>
   0xc0249764 <+264>:	mov	r1, r4
   0xc0249768 <+268>:	mov	r2, #1
   0xc024976c <+272>:	bl	0xc0037b58 <activate_task>
   0xc0249770 <+276>:	mov	r5, #1
   0xc0249774 <+280>:	mov	r1, r4
   0xc0249778 <+284>:	ldr	r0, [pc, #596]	; 0xc02499d4 <schedule+888>
   0xc024977c <+288>:	mov	r2, #0
   0xc0249780 <+292>:	bl	0xc00376d0 <check_preempt_curr>
   0xc0249784 <+296>:	ldr	r3, [r4, #12]
   0xc0249788 <+300>:	mov	r1, #0
   0xc024978c <+304>:	tst	r3, #32
   0xc0249790 <+308>:	str	r1, [r4]
   0xc0249794 <+312>:	beq	0xc02497a8 <schedule+332>
   0xc0249798 <+316>:	cmp	r5, r1
   0xc024979c <+320>:	beq	0xc02497a8 <schedule+332>
   0xc02497a0 <+324>:	mov	r0, r4
   0xc02497a4 <+328>:	bl	0xc0050a2c <wq_worker_waking_up>
   0xc02497a8 <+332>:	mov	r0, r6
   0xc02497ac <+336>:	mov	r1, #1
   0xc02497b0 <+340>:	bl	0xc00384f0 <deactivate_task.clone.124>
   0xc02497b4 <+344>:	ldr	r0, [r6, #576]	; 0x240
   0xc02497b8 <+348>:	cmp	r0, #0
   0xc02497bc <+352>:	moveq	r3, r0
   0xc02497c0 <+356>:	beq	0xc02497e8 <schedule+396>
   0xc02497c4 <+360>:	ldr	r2, [r0, #4]
   0xc02497c8 <+364>:	add	r3, r0, #4
   0xc02497cc <+368>:	cmp	r2, r3
   0xc02497d0 <+372>:	movne	r3, #1
   0xc02497d4 <+376>:	bne	0xc02497e8 <schedule+396>
   0xc02497d8 <+380>:	ldr	r2, [r0, #12]
   0xc02497dc <+384>:	add	r3, r0, #12
   0xc02497e0 <+388>:	subs	r3, r2, r3
   0xc02497e4 <+392>:	movne	r3, #1
   0xc02497e8 <+396>:	tst	r3, #255	; 0xff
   0xc02497ec <+400>:	beq	0xc0249800 <schedule+420>
   0xc02497f0 <+404>:	cmp	r0, #0
   0xc02497f4 <+408>:	beq	0xc0249800 <schedule+420>
   0xc02497f8 <+412>:	mov	r1, #1
   0xc02497fc <+416>:	bl	0xc012ab5c <blk_flush_plug_list>
   0xc0249800 <+420>:	add	r8, r6, #336	; 0x150
   0xc0249804 <+424>:	ldr	r3, [r6, #76]	; 0x4c
   0xc0249808 <+428>:	cmp	r3, #0
   0xc024980c <+432>:	beq	0xc0249818 <schedule+444>
   0xc0249810 <+436>:	ldr	r0, [pc, #444]	; 0xc02499d4 <schedule+888>
   0xc0249814 <+440>:	bl	0xc0037a98 <update_rq_clock>
   0xc0249818 <+444>:	ldr	r4, [pc, #436]	; 0xc02499d4 <schedule+888>
   0xc024981c <+448>:	ldr	r3, [r6, #40]	; 0x28
   0xc0249820 <+452>:	mov	r0, r4
   0xc0249824 <+456>:	ldr	r3, [r3, #28]
   0xc0249828 <+460>:	mov	r1, r6
   0xc024982c <+464>:	blx	r3
   0xc0249830 <+468>:	ldr	r2, [r4]
   0xc0249834 <+472>:	ldr	r3, [r4, #64]	; 0x40
   0xc0249838 <+476>:	cmp	r2, r3
   0xc024983c <+480>:	beq	0xc0249848 <schedule+492>
   0xc0249840 <+484>:	ldr	r4, [pc, #404]	; 0xc02499dc <schedule+896>
   0xc0249844 <+488>:	b	0xc0249874 <schedule+536>
   0xc0249848 <+492>:	mov	r0, r4
   0xc024984c <+496>:	bl	0xc0037d38 <pick_next_task_fair>
   0xc0249850 <+500>:	subs	r7, r0, #0
   0xc0249854 <+504>:	bne	0xc0249888 <schedule+556>
   0xc0249858 <+508>:	b	0xc0249840 <schedule+484>
   0xc024985c <+512>:	ldr	r3, [r4, #24]
   0xc0249860 <+516>:	ldr	r0, [pc, #364]	; 0xc02499d4 <schedule+888>
   0xc0249864 <+520>:	blx	r3
   0xc0249868 <+524>:	subs	r7, r0, #0
   0xc024986c <+528>:	bne	0xc0249888 <schedule+556>
   0xc0249870 <+532>:	ldr	r4, [r4]
   0xc0249874 <+536>:	cmp	r4, #0
   0xc0249878 <+540>:	bne	0xc024985c <schedule+512>
   0xc024987c <+544>:	ldr	r0, [pc, #340]	; 0xc02499d8 <schedule+892>
   0xc0249880 <+548>:	ldr	r1, [pc, #344]	; 0xc02499e0 <schedule+900>
   0xc0249884 <+552>:	bl	0xc002ffd0 <__bug>
   0xc0249888 <+556>:	ldr	r3, [r6, #4]
   0xc024988c <+560>:	mrs	r2, CPSR
   0xc0249890 <+564>:	orr	r1, r2, #128	; 0x80
   0xc0249894 <+568>:	msr	CPSR_c, r1
   0xc0249898 <+572>:	ldr	r1, [r3]
   0xc024989c <+576>:	bic	r1, r1, #2
   0xc02498a0 <+580>:	str	r1, [r3]
   0xc02498a4 <+584>:	msr	CPSR_c, r2
   0xc02498a8 <+588>:	ldr	r1, [pc, #292]	; 0xc02499d4 <schedule+888>
   0xc02498ac <+592>:	mov	r0, #0
   0xc02498b0 <+596>:	cmp	r6, r7
   0xc02498b4 <+600>:	str	r0, [r1, #28]
   0xc02498b8 <+604>:	beq	0xc02499a0 <schedule+836>
   0xc02498bc <+608>:	mov	r4, #1
   0xc02498c0 <+612>:	ldrd	r2, [r1, #48]	; 0x30
   0xc02498c4 <+616>:	mov	r5, #0
   0xc02498c8 <+620>:	adds	r2, r2, r4
   0xc02498cc <+624>:	adc	r3, r3, r5
   0xc02498d0 <+628>:	strd	r2, [r1, #48]	; 0x30
   0xc02498d4 <+632>:	str	r7, [r1, #972]	; 0x3cc
   0xc02498d8 <+636>:	ldr	r3, [r8]
   0xc02498dc <+640>:	add	r3, r3, #1
   0xc02498e0 <+644>:	str	r3, [r8]
   0xc02498e4 <+648>:	mrs	r3, CPSR
   0xc02498e8 <+652>:	bic	r3, r3, #128	; 0x80
   0xc02498ec <+656>:	msr	CPSR_c, r3
   0xc02498f0 <+660>:	ldr	r4, [r7, #164]	; 0xa4
   0xc02498f4 <+664>:	ldr	r5, [r6, #168]	; 0xa8
   0xc02498f8 <+668>:	cmp	r4, r0
   0xc02498fc <+672>:	bne	0xc0249924 <schedule+712>
   0xc0249900 <+676>:	str	r5, [r7, #168]	; 0xa8
   0xc0249904 <+680>:	mrs	r3, CPSR
   0xc0249908 <+684>:	orr	r2, r3, #128	; 0x80
   0xc024990c <+688>:	msr	CPSR_c, r2
   0xc0249910 <+692>:	ldr	r2, [r5, #44]	; 0x2c
   0xc0249914 <+696>:	add	r2, r2, #1
   0xc0249918 <+700>:	str	r2, [r5, #44]	; 0x2c
   0xc024991c <+704>:	msr	CPSR_c, r3
   0xc0249920 <+708>:	b	0xc0249974 <schedule+792>
   0xc0249924 <+712>:	add	r1, r4, #332	; 0x14c
   0xc0249928 <+716>:	bl	0xc01396d8 <_test_and_set_bit>
   0xc024992c <+720>:	cmp	r0, #0
   0xc0249930 <+724>:	beq	0xc024993c <schedule+736>
   0xc0249934 <+728>:	cmp	r5, r4
   0xc0249938 <+732>:	beq	0xc0249974 <schedule+792>
   0xc024993c <+736>:	ldr	r3, [pc, #160]	; 0xc02499e4 <schedule+904>
   0xc0249940 <+740>:	ldr	r2, [r4, #336]	; 0x150
   0xc0249944 <+744>:	ldr	r3, [r3, #336]	; 0x150
   0xc0249948 <+748>:	cmp	r2, r3
   0xc024994c <+752>:	beq	0xc0249958 <schedule+764>
   0xc0249950 <+756>:	mov	r0, r4
   0xc0249954 <+760>:	bl	0xc0033de8 <__check_kvm_seq>
   0xc0249958 <+764>:	ldr	r0, [r4, #36]	; 0x24
   0xc024995c <+768>:	mov	r1, r4
   0xc0249960 <+772>:	add	r0, r0, #1073741824	; 0x40000000
   0xc0249964 <+776>:	bl	0xc0035da0 <cpu_arm926_switch_mm>
   0xc0249968 <+780>:	mov	r0, #0
   0xc024996c <+784>:	add	r1, r5, #332	; 0x14c
   0xc0249970 <+788>:	bl	0xc0136ba0 <_clear_bit>
   0xc0249974 <+792>:	ldr	r3, [r6, #164]	; 0xa4
   0xc0249978 <+796>:	mov	r0, r6
   0xc024997c <+800>:	cmp	r3, #0
   0xc0249980 <+804>:	streq	r3, [r6, #168]	; 0xa8
   0xc0249984 <+808>:	ldreq	r3, [pc, #72]	; 0xc02499d4 <schedule+888>
   0xc0249988 <+812>:	streq	r5, [r3, #988]	; 0x3dc
   0xc024998c <+816>:	ldr	r1, [r6, #4]
   0xc0249990 <+820>:	ldr	r2, [r7, #4]
   0xc0249994 <+824>:	bl	0xc002d0d0 <__switch_to>
   0xc0249998 <+828>:	bl	0xc00382c0 <finish_task_switch.clone.117.clone.119>
   0xc024999c <+832>:	b	0xc02499ac <schedule+848>
   0xc02499a0 <+836>:	mrs	r3, CPSR
   0xc02499a4 <+840>:	bic	r3, r3, #128	; 0x80
   0xc02499a8 <+844>:	msr	CPSR_c, r3
   0xc02499ac <+848>:	mov	r2, sp
   0xc02499b0 <+852>:	bic	r3, r2, #8128	; 0x1fc0
   0xc02499b4 <+856>:	bic	r3, r3, #63	; 0x3f
   0xc02499b8 <+860>:	ldr	r3, [r3]
   0xc02499bc <+864>:	tst	r3, #2
   0xc02499c0 <+868>:	popeq	{r3, r4, r5, r6, r7, r8, r11, pc}
   0xc02499c4 <+872>:	b	0xc0249664 <schedule+8>
   0xc02499c8 <+876>:	mov	r3, #0
   0xc02499cc <+880>:	str	r3, [r6]
   0xc02499d0 <+884>:	b	0xc0249800 <schedule+420>
   0xc02499d4 <+888>:	eorsgt	pc, r0, r0, ror r8	; <UNPREDICTABLE>
   0xc02499d8 <+892>:	eorgt	r3, r11, r8, ror #20
   0xc02499dc <+896>:	eorgt	r12, r4, r8, lsr r2
   0xc02499e0 <+900>:	andeq	r0, r0, r4, ror #31
   0xc02499e4 <+904>:	eorsgt	r6, r1, r4, lsl #19
