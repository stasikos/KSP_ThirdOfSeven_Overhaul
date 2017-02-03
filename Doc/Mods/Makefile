ModList.txt: **/*.txt
	echo -n > $@
	for FN in $^; do echo $${FN} >> $@ ; cat $${FN} >> $@; echo "--------------" >> $@; done

all: ModList.txt

clean:
	rm -fv ModList.txt
