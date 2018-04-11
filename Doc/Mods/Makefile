all: ModList.txt Credits.txt

ModList.txt: **/*.txt
	echo -n > $@
	for FN in $^; do cat $${FN} >> $@; echo "--------------" >> $@; done

Credits.txt: **/*.txt
	echo -n > $@
	for FN in $^; do grep -v "http" $${FN} >> $@; done


clean:
	rm -fv ModList.txt Credits.txt
