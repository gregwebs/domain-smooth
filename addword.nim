# There are a lot of taken domains
# We itereate through them one-by-one to keep memory usage small.
# Because this program takes a long time,
# We want to print out a good domain name immediately once we know it is not taken
import os
import strutils
import std/sets

let seedword = paramStr(1)

var goods = open("goodwords.txt", bufSize=8000)
var reservations = open("com-domains.txt", bufSize=8000)
var good = newStringOfCap(80)
var reserved = newStringOfCap(80)

var beforeSeed = true
var afterSeed = false

# There are two forms of the seed: starts with or ends with
var startsWithSeed = initOrderedSet[string]()

for line in lines "goodwords.txt":
  startsWithSeed.incl(seedword & line)

if not goods.readLine(good):
  echo "no goodwords"
  quit(1)

var suggest = newStringOfCap(80)
suggest = good & seedword

# Read existing domains One-by-one
while reservations.readLine(reserved):
  reserved.removeSuffix(".com.")
  # I don't know why there are subdomains. Skip them
  if reserved.contains("."):
    continue

  # skip dashed domain names and domain names with a number
  if reserved.contains("-") or reserved.contains(Digits):
    continue

  let cmpSeed = strutils.cmpIgnoreCase(seedword, reserved)
  if not afterSeed:
    if beforeSeed and cmpSeed <= 0:
      beforeSeed = false

    if not beforeSeed:
      if reserved.startsWith(seedword):
        startsWithSeed.excl(reserved)
      else:
        afterSeed = true
        for domain in startsWithSeed.items:
          echo domain

  let cmp = strutils.cmpIgnoreCase(suggest, reserved)
  if cmp < 0:
    echo suggest
    if not goods.readLine(good):
      quit(0)
    suggest = good & seedword


# Simple non-streaming version
# import std/sets
# var wanted = initOrderedSet[string]()

# for line in lines "goodwords.txt":
#  wanted.incl(seedword & line)
#  wanted.incl(line & seedword)

#for line in lines "com-domains.txt":
#  wanted.excl(line)

#for domain in wanted.items:
#  echo domain
