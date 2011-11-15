//#include "translate.c"

static int is_simple_arm_insn(const char *name);
static void struct_dump_tcg_helpers_info(
                const TCGHelperInfo *helpers, const int size);
static void struct_dump_tcg_context(const TCGContext *s);
static int simple_arm_insn_disas(unsigned int insn);




