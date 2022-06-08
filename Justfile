run +args: run-good
	nim c -r addword.nim {{args}}

run-good:
	nim c -r goodwords.nim > goodwords.txt
