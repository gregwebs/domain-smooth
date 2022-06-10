import os
import std/sets


let seedword = paramStr(1)

var domains = initHashSet[string]()

for line in lines "domains.txt":
  domains.incl(line)

for line in lines "goodwords.csv":
  let prefix_domain = seedword & line
  if not(prefix_domain in domains):
    echo prefix_domain

  let suffix_domain = line & seedword
  if not(suffix_domain in domains):
    echo suffix_domain

