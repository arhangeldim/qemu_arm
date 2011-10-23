	.text
start:
	msr cpsr_c, #0x1f
stop:
	b stop
