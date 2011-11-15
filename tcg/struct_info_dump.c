#include "struct_info_dump.h"

static int is_simple_arm_insn(const char *name) {
	if (name[0] == 'v' && name[1] == 'f' && name[2] == 'p')
		return 0;

	if (name[0] == 'n' && name[1] == 'e' && name[2] == 'o')
		return 0;
	
	if (name[0] == 'i' && name[1] == 'w' && name[2] == 'm')
		return 0;
	return 1;
}

static void struct_dump_tcg_helpers_info(const TCGHelperInfo *helpers, const int size) {
	#ifdef DEBUG_DISAS
	if (unlikely(qemu_loglevel_mask(CPU_LOG_TB_OP))) {
        int i, j;
        unsigned int insn;
        for (i = 0; i < size; i++) {
            char *name = (char *)helpers[i].name;
            if (!is_simple_arm_insn(name))
                continue;
		    qemu_log("	name: %s, func_addr: %d\n", (char *)helpers[i].name, (int)helpers[i].func);
			//TODO(dima): hack!
		    for (j = 0; j < 5; j++) {
			    unsigned int addr = (unsigned int)helpers[i].func;
                insn = *(unsigned int *)(addr + j * 32);
			    qemu_log("		 :: %x\n", insn);
                simple_arm_insn_disas(insn);
                 
		    }
        }
		

	}
	qemu_log("\n");
	#endif


}

static void struct_dump_tcg_context(const TCGContext *s) {
	#ifdef DEBUG_DISAS
	if (unlikely(qemu_loglevel_mask(CPU_LOG_TB_OP))) {
		int i;
		qemu_log("\nTCGContext dump:\n");
		qemu_log("nb_labels = %d\n", s->nb_labels);
		if (s->nb_labels > 0)
			qemu_log("==label list==\n");
		for(i = 0; i < s->nb_labels; i++)
			qemu_log("	labels[%d] = (%d, %d)\n",
				i, (s->labels[i]).has_value, (int)(s->labels[i]).u.value);
		qemu_log("nb_globals = %d\n", s->nb_globals);
		qemu_log("nb_temps = %d\n", s->nb_temps);
	
		qemu_log("==temp list==\n");
		qemu_log("temps[i] = (name, base_type, type, val_type, reg, val, mem_reg)\n");
		for (i = 0; i < s->nb_temps; i++) {
			qemu_log("	temps[%d] = (%s, %d, %d, %d, %d, %d, %d);\n",
				i, (s->temps[i]).name, (int)(s->temps[i]).base_type,
				(int)(s->temps[i]).type,
				(s->temps[i]).val_type,
				(s->temps[i]).reg,
				(int)(s->temps[i]). val,
				(s->temps[i]).mem_reg);
		}
		qemu_log("code_buf ptr = %d\n", s->code_buf);	
		qemu_log("current_frame_offset = %d\n", s->current_frame_offset);
		qemu_log("frame_start = %d\n", s->frame_start);
		qemu_log("frame_end = %d\n", s->frame_end);
		qemu_log("frame_reg = %d\n", s->frame_reg);
		qemu_log("code ptr = %d\n", s->code_ptr);
		qemu_log("==helpers list==\n");
        struct_dump_tcg_helpers_info(s->helpers, s->nb_helpers);

	}
	#endif
	return;
}

static int simple_arm_insn_disas(unsigned int insn) {
    unsigned int cond, val, op1, i, shift, rm, rs, rd, rn, sh;
    cond = insn >> 28;
    if (cond == 0xf) {
        qemu_log("unused instr, cond = never\n");
    }
    if (cond != 0xe) {
        qemu_log("conditional instr. cond = %x\n", cond);
    }
    if ((insn & 0x0f900000) == 0x03000000) {
        if ((insn & (1 << 21)) == 0) {
            rd = (insn >> 12) & 0xf;
            val = ((insn >> 4) & 0xf000) | (insn & 0xfff);
            if ((insn & (1 << 22)) == 0) { 
                qemu_log("[MOVW: rd = %x  val = %x]\n");
            } else {
                qemu_log("[MOVT: rd = %x  val = %x]\n");
            }
        } else {
            if (((insn >> 12) & 0xf) != 0xf)
                qemu_log("illegal op\n");
            if (((insn >> 16) & 0xf) == 0) {
                qemu_log("nop hint op\n");
            } else {
                /* CPSR = immediate */
                val = insn & 0xff;
                shift = ((insn >> 8) & 0xf) * 2;
                if (shift)
                    val = (val >> shift) | (val << (32 - shift));
                i = ((insn & (1 << 22)) != 0);
                qemu_log("[cpsr immediate: val = %x  shift = %x]\n", val, shift);
            }
        }
    }


    return 0;
}

