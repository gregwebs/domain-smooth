run +args: run-good
	just run-add {{args}} > suggestions2.txt
	mv suggestions2.txt suggestions.txt

run-add +args:
	nim c -r addword.nim {{args}}

run-good:
	nim c -r goodwords.nim > goodwords.txt

com-domains:
	gunzip -c com.zone | awk '{print $1}' > com-domains-unsorted.txt
	sort com-domains.unsorted.txt -o com-domains.txt
	rm com-domains-unsorted.txt
