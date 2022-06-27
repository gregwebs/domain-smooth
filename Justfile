run +args: run-good
	just run-add {{args}} > suggestions.txt

run-add +args:
	nim c -r addword.nim {{args}}

run-good:
	nim c -r goodwords.nim > goodwords.txt

com-domains:
	gunzip -c com.zone > com.zone.unzipped
	cat com.zone.unzipped | awk '{print $1}' > com-domains.txt
	rm com.zone.unzipped
