#Imports 
import std/strutils

#main parser starts here

#foward declaration
proc removeWhiteSpaces(input: string) : string


proc printArray(arr : seq[string])



proc joiner (toJoin : seq[string]) : string



proc toCharArray (getString : string) : seq[char]


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





#end of toCharArray











#TEMP FUNCTIONS

proc printArray(arr : seq[string])=

  for i in arr:
    echo "Element: ", i





