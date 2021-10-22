#Imports 
import std/strutils


var currentPos : int 



#main parser starts here

#foward declaration
proc removeWhiteSpaces(input: string) : string


proc printArray(arr : seq[string])



proc joiner (toJoin : seq[string]) : string



proc toCharArray (getString : string) : seq[char]

proc buildingBack (charArr : seq[char]) : seq[string] 



#Pass in the string from the user
proc getInput(input : string ) : void =
  echo "You Typed ", input

  #discard is used to process a function for its purpose and ignoring the return value.

  discard removeWhiteSpaces(input)
#end of getInput



#Start manipulate the string 

#getting rid of white spaces 
proc removeWhiteSpaces(input: string) : string =

  #Create a sequence (this version of empty arr)
  var toArray: seq[string] = @[]


  #Store the user input
  var processString : string = input


  #Add the parts into the array
  for tokens in processString.splitWhitespace():
    toArray.add(tokens)

  #FOR DEBUGGING PURPOSES
  printArray(toArray)


  echo joiner(toArray)

  discard toCharArray(joiner(toArray))

  return "done"
#end of removeWhiteSpaces




#EXPERIMENT TOKENIZING FOR REAL




proc joiner (toJoin : seq[string]):string =

  var holdThisStringForMePlz : string

  for each in toJoin:
    holdThisStringForMePlz.add $each

  return holdThisStringForMePlz
#end of tokenizer






proc toCharArray (getString : string) : seq[char]= 

  var charArray : seq[char] = @[]

  for each in cast[seq[char]](getString):
    charArray.add $each
  
  for i in charArray:
    echo i




  discard buildingBack(charArray)

  # return charArray

#end of toCharArray




proc buildingBack (charArr : seq[char]) : seq[string] =

  currentPos  = 0

  var savedString : seq[string] 


  while currentPos <= charArr.len()-1 :

    var str : string

    str = "testing" & " " & $currentPos
    savedString.add $str


    echo "testing" , " " , currentPos
    currentPos = currentPos + 1

  return savedString




#TEMP FUNCTIONS

proc printArray(arr : seq[string])=

  for i in arr:
    echo "Element: ", i





