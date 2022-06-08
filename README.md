Find domain names that you like.
This will add small or 1 syllable words onto a seed word
and check it against available domain names.

First generate goodwords.txt

	nim c -r goodwords.nim > goodwords.txt

You can change goodwords.nim to your liking.
It should be trivial to translate to python.
But to use Nim, just `brew install nim`, etc works.

Next you need the list of registered domain names. You can get this from ICANN here: https://czds.icann.org/
Place this as registered.txt

Now run:

	nim c -r addword.nim word

Where `word` is a word you want to use in your domain name.

This workflow is wrapped up in a [Justfile](https://github.com/casey/just)


## References

syllables data taken from here:
https://docs.rs/crate/syllable/0.1.0/source/resource/data.csv

Inspired by this post: https://sive.rs/com

Can't run the program?
Try https://leandomainsearch.com
