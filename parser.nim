#Imports 
import std/strutils

#main parser starts here

#foward declaration
proc removeWhiteSpaces(input: string) : string





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


  for tokens in processString.splitWhitespace():
    echo '"', tokens, '"'



  return "done"


#end of removeWhiteSpaces








