run +args: run-good
	just run-add {{args}}

run-add +args:
	nim c -r addword.nim {{args}}

run-good:
	nim c -r goodwords.nim > goodwords.txt
