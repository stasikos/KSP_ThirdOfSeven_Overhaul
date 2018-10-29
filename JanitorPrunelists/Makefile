all: 0_all.prnlst

0_all.prnlst: [!0_all]*.prnlst
	rm -f $@
	for FN in $^; do cat $${FN} >> $@; done
