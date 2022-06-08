import strutils

for line in lines "syllables.csv":
  let splits = line.split(",")
  let word = splits[0]
  let syllables = splits[1]
  if word.len <= 4 or parseBiggestInt(syllables) == 1:
    echo word
