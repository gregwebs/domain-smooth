Find domain names that you like.
This will add small or 1 syllable words onto a seed word
and check it against available domain names.

Dependencies
  * [nim compiler](https://nim-lang.org/install.html)
  * [just](https://github.com/casey/just#packages)

just automates the workflow in a [Justfile](https://github.com/casey/just).
You can look st the Justfile and run the commands manually if you like.

First generate goodwords.txt

	just run-good

You can change goodwords.nim to your liking.
It should be trivial to translate to python.
But to use Nim, just `brew install nim`, etc works.

Next you need the list of registered domain names. You can get this from ICANN here: https://czds.icann.org/
Place this as com.zone and then run

	just com-domains

Now run:

	just run word

Where `word` is a word you want to use in your domain name.


## References

syllables data taken from here:
https://docs.rs/crate/syllable/0.1.0/source/resource/data.csv

Inspired by this post: https://sive.rs/com

Can't run the program?
Try https://leandomainsearch.com
