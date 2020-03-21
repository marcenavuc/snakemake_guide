import os
SAMPLES = list(map(lambda x: x[:x.find('.')], os.listdir('data')))

rule all:
	input:
		"results.txt"

rule word_counts:
	input:
		"data/{file}.txt"
	output:
		"{file}_wc.txt"
	shell:
		"wc {input} > {output}"

rule cat:
	input:	
		expand("{file}_wc.txt", file=SAMPLES)
	output:
		"results.txt"
	shell:
		"cat {input} > {output}"
