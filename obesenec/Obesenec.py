import random
def getlines(cesta_ku):
    f = open(cesta_ku, 'r')
    lines = f.readlines()
    f.close()
    for i in range(len(lines)):
        if lines[i] == "":
            del lines[i]
        lines[i] = lines[i].split()[0]
    return lines

def getRNDword(words):
    index = random.randint(0,len(words)-1)
    return words.pop(index)

def getIndexes(char, word):
    indexes = []
    for i in range(len(word)):
        if word[i] == char:
            indexes.append(i)
    return indexes

def insertChar(char, word, wordToShow):
    count = word.count(char)
    indexes = getIndexes(char, word)
    for i in range(count):   
        first = wordToShow[0:indexes[i]]
        second = wordToShow[indexes[i]+1:]
        wordToShow = first + char + second
    return wordToShow    

def render(wordToShow):
    rendered = ""
    for char in wordToShow:
        rendered += char + " "
    print(rendered)
    
wordList = getlines('words.txt')
max_pokusov = 7
word = getRNDword(wordList)
wordToShow = "_" * len(word)
chybne = []
for i in range(max_pokusov):
    omyl = 0
    while (omyl==0):
        if "_" not in wordToShow:
            print "Vyhral si!"
            omyl = -1
            break
        render(wordToShow)
        ujo = raw_input("Zadaj pismeno: ")[0]
        if ujo in word:
            if ujo in wordToShow:
                print "Toto pismeno si uz objavil"
            else:
                wordToShow = insertChar(ujo, word, wordToShow)
        elif ujo in chybne:
            print "Toto pismeno si uz skusal a nevydalo, tutu"
        elif (i<max_pokusov-1):
            omyl = 1
            chybne.append(ujo)
            print("Neprijemne si sa netrafil skus to znovu...")
            print "Mas uz len", max_pokusov-i-1 , "pokusov!"
        else:
            print "Prehral si!"
            omyl = -1
            break
    if (omyl==-1):
        break
