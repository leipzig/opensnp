RS:= rs1042725 rs4988235 rs182549 rs12913832 rs1800407 rs12896399 rs16891982 rs1393350 rs12203592
CRS:= $(addsuffix .rs.clean.txt,$(RS))

all:$(CRS)

%.rs.txt:
	grep "$*\s" rawdata/*.txt > $@

%.rs.clean.txt:%.rs.txt
	perl -ne 'm/user([0-9]+).+([ACGT])\s*([ACGT]).*/;if($$1 lt $$2){print $$1."\t".$$2.$$3."\n";}else{print $$1."\t".$$3.$$2."\n";}' < $< > $@