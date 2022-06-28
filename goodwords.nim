import strutils

for line in lines "syllables.csv":
  let splits = line.split(",")
  let word = splits[0]
  if not Digits.contains(word[0]) and not word.contains(".") and not word.contains("-"):
    let syllables = splits[1]
    if word.len <= 4 or parseBiggestInt(syllables) == 1:
      echo word
