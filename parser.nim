#Imports 
import std/strutils


var currentPos : int = 0



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

#[

Idea Note:
================

Using the current position 

call a func that checks pos 0 and 1 , return a string that combined the chars. pos must be tracked 


pos already moved
if pos  = r,t,c,a,f

then move to their appropriate code block to process the rest of the string

eg after detecting r the program should build e and c (throw errors that doenst match)


if the next position = a to i then add to a string and concat the next string if its 1-7

if its a . (period) then we should call back the same prev function recursively 


this should generate the middle command if done properly


we either check to see if the next part is end or another command 

if another command then we call back the command checker function 


if it says ends then you made it through and we call our grammar decom, parse tree and generate the graphic






]#












proc buildingBack (charArr : seq[char]) : seq[string] =

  currentPos  = 0

  var savedString : seq[string] 






  #check for Go






  #check for Command


  while currentPos <= charArr.len()-1 :









  #Check for Go





    var str : string


    str = "testing" & " " & $currentPos
    savedString.add $str

    inc currentPos





















  echo savedString
  return savedString










#TEMP FUNCTIONS

proc printArray(arr : seq[string])=

  for i in arr:
    echo "Element: ", i





