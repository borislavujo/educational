#!/usr/bin/env python
# -*- coding: utf-8 -*-
# wsss.py = word-snack-sk-solver
# version 1.0 / 2017/10/01
# usage: $ python  wsss.py word1 nDes bFull
#   -  word1 = cluster of letters for word creation
#   -  nDes  = number of letters in the new word
#   -  bFull = if any character is used as a third argument, wordlist sk.txt is used
#              otherwise, wordlist test.txt is used
# requirements: wordlists sk.txt (full) and test.txt (first 100k words) in the same dir
# tested with slovak wordlist from https://github.com/danielhusar/slovak-wordlist.git on Oct 1, 2017

import sys

# load and test first column in a file
def getlines(cesta_ku):
    f = open(cesta_ku, 'r')
    lines = f.readlines()
    f.close()
    for i in range(len(lines)):
        if lines[i] == "":
            del lines[i]
        lines[i] = (lines[i].split()[0]).decode('utf8')
    return lines

# can wordTested be created from nDes letters from word1?
def isInWord(word1, wordTested, nDes):
    if len(wordTested)!=nDes:
        isok = 0
        return isok
    word1copy = list(word1)
    isok = 1
    nlet = len(wordTested)
    for i in range(nlet):
        letTested = wordTested[i] 
        if letTested in word1copy:
            for j in range(len(word1copy)):
                let1 = word1copy[j]
                if let1 == letTested:
                    del word1copy[j] 
                    break
        else:
            isok = 0
            break
    return isok


# 1. read letters
slovo = sys.argv[1].decode('utf8')
# 2. load number of letters in a new word
keloPismen = int(float(sys.argv[2]))
# 3. check whether all words should be used
if len(sys.argv)>3:
    wordList = getlines('sk.txt')
else:
    wordList = getlines('test.txt')
# 4. print check to stdout
print "slovo:", slovo
print "pismen:", keloPismen
print "slov vo wordliste:", len(wordList)
# 5. print al words created from the letters on input
for i in range(len(wordList)):
    if isInWord(slovo, wordList[i], keloPismen)>0:
        vystup = (wordList[i].encode('utf8').lower())
        sys.stdout.write(vystup + "\t")
# 6. leave empty line
print
