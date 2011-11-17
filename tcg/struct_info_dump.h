//#include "translate.c"

static int is_simple_arm_insn(const char *name);
static void struct_dump_tcg_helpers_info(
                const TCGHelperInfo *helpers, const int size);
static void struct_dump_tcg_context(const TCGContext *s);
static int simple_arm_insn_disas(unsigned int insn);
static const char* get_description_by_cond(int cond);

enum condition {
    EQ, NE, CS, CC, MI, PL, VS, VC, HI, LS, GE, LT, GT, LE, AL, NW
};

const char* const desc[] = {
    "EQ", "NE", "CS", "CC", "MI", "PL", "VS", "VC", "HI", "LS",
    "GE", "LT", "GT", "LE", "AL", "NW"
};
