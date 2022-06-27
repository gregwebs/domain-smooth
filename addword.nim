import os
import std/sets


let seedword = paramStr(1)

var wanted = initHashSet[string]()

for line in lines "goodwords.txt":
  wanted.incl(seedword & line)
  wanted.incl(line & seedword)

for line in lines "com-domains.txt":
  wanted.excl(line)

for domain in wanted:
  echo domain
