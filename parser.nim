#Imports 
import std/strutils


var currentPos : int = 0
var savedString : seq[string] = @[]


#main parser starts here

#foward declaration
proc removeWhiteSpaces(input: string) : string


proc printArray(arr : seq[string])



proc joiner (toJoin : seq[string]) : string



proc toCharArray (getString : string) : bool

proc buildingBack (charArr : seq[char]) : seq[string] 

proc checkCmd (charArr : seq[char],currentPosIndex : int)

proc processRecCommand(charArr : seq[char],currentPosIndex : int)

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






proc toCharArray (getString : string) : bool = 

  #if true then throw an error
  if isEmptyOrWhitespace(getString) :

    echo "Error at pos: 0 Grammer is empty!"

    return false 

  else:

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



  if charArr[currentPos] == 'g' and currentPos < charArr.len()-1 :
    echo "Starts with G"

    inc currentPos

    if charArr[currentPos] == 'o' and currentPos < charArr.len()-1 :
      echo "Has go"

      #if we made it here then we have go

      savedString.add $"go"

      echo savedString


      #we call another function to check what is in between

      checkCmd(charArr,currentPos)

    else:
      echo "Error at pos: ", currentPos+1, "Failed the second letter"

  else:
    echo "Error at pos: ", currentPos+1," Failing at the first letter"

  #check for Command
  return savedString


proc checkCmd (charArr : seq[char],currentPosIndex : int) =


  echo charArr


  currentPos = currentPosIndex

  #check to see if the next starts a valid command
  inc currentPos

  if currentPos < charArr.len()-1 :
    echo "Valid lenght go on"
    echo charArr[currentPos]


    case charArr[currentPos]


    of 'r':
      echo "Assuming rec"
      inc currentPos

      if charArr[currentPos] == 'e':
        echo "Getting warmer"
        inc currentPos

        if charArr[currentPos] == 'c':
          echo "You typed rec"
          savedString.add $"rec"
          inc currentPos
          #call to process rec command
          processRecCommand(charArr,currentPos)

          echo "did we return back here"
          echo "What is our current pos? : ",currentPos


          echo "Lets see if the grammer gets saved"
          echo savedString


        





        else:
          echo "Unknown char at pos: ",currentPos+1," Did you mean \'rec\' you were 1 letter off"





      else:
        echo "Unknown char at pos: ",currentPos+1," Did you mean \'rec\'"


    of 't':
      echo "Assuming tri"
    of 'c':
      echo "Assuming cir"
    of 'a':
      echo "Assuming axes"
    of 'f':
      echo "Assuming fill"



    of 's':
      echo "Assuming stop"

      



    else:
      echo "Error at pos: ",currentPos+1," unknown command"

  else:

    echo "Error at pos: ", currentPos+1 ,"Reached the end of the command but should be more to process..."


proc processRecCommand(charArr : seq[char],currentPosIndex : int) =

  currentPos = currentPosIndex

#We need to build the string that will construct the command
  var recStringCmd : string =""


  if currentPos < charArr.len()-1 :


    if "abcdefghi".contains(charArr[currentPos]):
      recStringCmd = recStringCmd & charArr[currentPos]
      echo "This is a test for recString: ", recStringCmd
      echo recStringCmd

      inc currentPos


      if "123456789".contains(charArr[currentPos]):
        recStringCmd = recStringCmd & charArr[currentPos]
        echo "This is a test for recString: ", recStringCmd
        echo recStringCmd

        inc currentPos


        if ".".contains(charArr[currentPos]):
          recStringCmd = recStringCmd & charArr[currentPos]
          echo "This is a test for recString: ", recStringCmd
          echo recStringCmd

          inc currentPos

          if "abcdefghi".contains(charArr[currentPos]):
            recStringCmd = recStringCmd & charArr[currentPos]
            echo "This is a test for recString: ", recStringCmd
            echo recStringCmd

            inc currentPos

            if "123456789".contains(charArr[currentPos]):
              recStringCmd = recStringCmd & charArr[currentPos]
              echo "This is a test for recString: ", recStringCmd
              echo recStringCmd


              echo "IF UR HERE THEN WE SHOULD PASS ALL THE CHECKS SO"

              echo "THE FINAL RESULT : ", recStringCmd


              savedString.add recStringCmd

              checkCmd(charArr,currentPos)
              # call back the cmd checker



            else:
              echo "Error at pos: ",currentPos+1," Should be 1 - 9"

          else:
            echo "Error at pos: ",currentPos+1," Should be a to i"

        else:
          echo "Error at pos: ",currentPos+1," Should be ."

      else:
        echo "Error at pos: ",currentPos+1," Should be 1 - 9"

    #Close first
    else:

      echo "Error at pos: ",currentPos+1," Should be a to i"

#fails the size check
  else:

    echo "Unexpected end of program at pos : ",currentPos+1, " The command was prob wrong"



  
    #we must now process the command 


#TEMP FUNCTIONS

proc printArray(arr : seq[string])=

  for i in arr:
    echo "Element: ", i





