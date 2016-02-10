## Questions

### 1

What does CLI stand for?

> Command Line Interface

### 2

What is the difference between the following commands? Explain each one. Try them out in vagrant if you'd like:

* `cd ~`
* `cd ~/`
* `cd .`
* `cd ..`
* `cd /`
* `cd -`

> The `/` at the end is just a path delimeter to break up folders. Eg of this: cd /Users/kvirani/lhl/cohort6/class

> `cd /` => change into the "root directory". Don't work directly in here. However, for your vagrant, the /vagrant directory is where you should put ALL your work/code related folders/files since they are visible to your HOST machine. This is a vagrant default behavior.

### 3

In the following command, the first word is called the "command", what is the remaining part (`-p`) referred to as?

    mkdir -p /Users/don/lhl/cohort6/class/w1d2

> The `-p` is an argument. More specifically it's a flag/option/switch. The second thing is not a flag or an option but a required argument.

### 4

What are the following commands doing? What is the difference between them? You may recall them from earlier today.

* `cat /usr/share/dict/words | grep "ous$"`
* `cat /usr/share/dict/words | grep "ous$" | wc -l`


### 5

Given the grep command from the previous question: `grep "ous$"`...

What is the dollar sign (`$`) being used for in the grep commands above? What happens if we don't specify that symbol?

This argument for grep (`"ous$"`), contained within the double quotes, is more than just a string. What is this type of expression called?

> Regular Expression. A very powerful tool to do more expressive searches within strings/text.

### 6

What does the `|` symbol, used in some of the Part 2 commands, do in Unix?

> Takes STDOUT (Standard Out) from the left side and pipes/directs it into the STDIN (Standard In) of the righ side.

### 7

What does the `>` symbol do in the Unix CLI?

> Similar to the pipe (|) but instead of another command on the right side, you give it a path to a file on the right side, and it will save the STDOUT (output) from the left into the file on the right.