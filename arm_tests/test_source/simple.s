	.text
start:
	msr CPSR_c, #0x1f
stop:   b stop

