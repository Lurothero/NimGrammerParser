#Import Libs
import std/strutils
import std/[algorithm]

#Other files 
include derivation

#Globar Variables - Reset on call
var currentPos : int = 0
var savedString : seq[string] = @[]

#Foward Declaration
proc removeWhiteSpaces(input: string) : string
proc joiner (toJoin : seq[string]) : string
proc toCharArray (getString : string) : bool
proc buildingBack (charArr : seq[char]) : seq[string] 
proc checkCmd (charArr : seq[char],currentPosIndex : int)
proc processRecCommand(charArr : seq[char],currentPosIndex : int)
proc processTriCommand(charArr : seq[char],currentPosIndex : int)
proc processCirCommand(charArr : seq[char],currentPosIndex : int) 
proc processAxesCommand(charArr : seq[char],currentPosIndex : int) 
proc processFillCommand(charArr : seq[char],currentPosIndex : int)

proc errorDump(charArray : seq[char],ErrorPos : int) 

#Pass in the string from the user
proc getInput(input : string ) : void =
  
  currentPos = 0 
  savedString = @[]

  #discard - Ignores the return value
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

 
  #Joiner takes the input and queue them in one string
  discard joiner(toArray)

  #Separate each character into a sequence
  discard toCharArray(joiner(toArray))

  return "done"
#end of removeWhiteSpaces

#Joins the string in a single char sequence
proc joiner (toJoin : seq[string]):string =

  #Empty string
  var holdThisStringForMePlz : string

  #Start to construct string of words
  for each in toJoin:
    holdThisStringForMePlz.add $each

  return holdThisStringForMePlz
#end of joiner

#Contruct the character sequence
proc toCharArray (getString : string) : bool = 

  #if true then throw an error
  if isEmptyOrWhitespace(getString) :

    echo "ERROR! YOUR INPUT CANNOT BE EMPTY"
    return false 

  else:

    var charArray : seq[char] = @[]

    #individually add the characters from the string into a sequence
    for each in cast[seq[char]](getString):
      charArray.add $each

    discard buildingBack(charArray)

#end of toCharArray


#Start processing the command
proc buildingBack (charArr : seq[char]) : seq[string] =


  #Checks to see if the charArr has the word "go"
  #charArr.len()-1 is used to prevent crashes if there is no stop 
  if charArr[currentPos] == 'g' and currentPos < charArr.len()-1 :

    inc currentPos

    if charArr[currentPos] == 'o' and currentPos < charArr.len()-1 :

      #Checks to see if we immediately close the command and throw an error
      if charArr[currentPos+1] == 's':
        echo "Error at pos :",currentPos+1," Are you attempting to stop after go?" 
      else:

      #It doesnt stop after go so proceed
        savedString.add $"go"
        checkCmd(charArr,currentPos)

    else:
      echo "Error at pos: ", currentPos+1, " Did you mean \'go\'?"

  else:
    echo "Error at pos: ", currentPos+1," type \'go\'to get started "

  
  return savedString
#end of buildingBack

#Handles the draw command
proc checkCmd (charArr : seq[char],currentPosIndex : int) =

  #Get the current index that was passed in
  currentPos = currentPosIndex

  #Increment the counter 
  inc currentPos

  #Checks for missing stop
  if currentPos < charArr.len()-1 :

    #Switch statement that checks the first letter and perform the appropriate checks
    case charArr[currentPos]
    of 'r': 

      inc currentPos

      if charArr[currentPos] == 'e':
        inc currentPos

        if charArr[currentPos] == 'c':

          #add rec to the string array
          savedString.add $"rec"
          inc currentPos
          #call to process rec command
          processRecCommand(charArr,currentPos)

        else:
           
          errorDump(charArr,currentPos)

          echo "Unknown char at pos: ",currentPos+1," Did you mean \'rec\' you were 1 letter off"
      else:
        echo "Unknown char at pos: ",currentPos+1," Did you mean \'rec\'"

    of 't':
      inc currentPos

      if charArr[currentPos] == 'r':
        inc currentPos

        if charArr[currentPos] == 'i':

          savedString.add $"tri"
          inc currentPos
          #call to process tri command
          processTriCommand(charArr,currentPos) 
        else:            
          echo "Unknown char at pos: ",currentPos+1," Did you mean \'tri\' you were 1 letter off"
      else:
        echo "Unknown char at pos: ",currentPos+1," Did you mean \'tri\'"


    of 'c':

      inc currentPos

      if charArr[currentPos] == 'i':
        inc currentPos

        if charArr[currentPos] == 'r':
          savedString.add $"cir"
          inc currentPos
                    #call to process rec command
          processCirCommand(charArr,currentPos) #//CHANGE THIS 

        else:            
          echo "Unknown char at pos: ",currentPos+1," Did you mean \'cir\' you were 1 letter off"

      else:
        echo "Unknown char at pos: ",currentPos+1," Did you mean \'cir\'"

    of 'a':
      inc currentPos

      if charArr[currentPos] == 'x':
        inc currentPos

        if charArr[currentPos] == 'e':
          inc currentPos

          if charArr[currentPos] == 's':  
            savedString.add $"axes"
            inc currentPos
                  #call to process rec command
            processAxesCommand(charArr,currentPos) #//CHANGE THIS 

          else:            
            echo "Unknown char at pos: ",currentPos+1," Did you mean \'axes\' you were 1 letter off"
        else:
          echo "Unknown char at pos: ",currentPos+1," Did you mean \'axes\'"
      else:
        echo "Unknown char at pos: ",currentPos+1

    of 'f':
      inc currentPos

      if charArr[currentPos] == 'i':
        inc currentPos

        if charArr[currentPos] == 'l':
          inc currentPos

          if charArr[currentPos] == 'l':            
            savedString.add $"fill"
            inc currentPos
                    #call to process rec command
            processFillCommand(charArr,currentPos) #//CHANGE THIS 
          else:
            echo "Error at pos: ",currentPos+1," missed last letter on fill?"
        else:
          echo "Error at pos: ",currentPos+1," missed third letter on fill?"
      else:
        echo "Error at pos: ",currentPos+1," missed second letter on fill?"
      
    of 's':
      inc currentPos

      if charArr[currentPos] == 't':
        inc currentPos

        if charArr[currentPos] == 'o':
          inc currentPos


          if charArr[currentPos] == 'p' and currentPos == charArr.len()-1:
            savedString.add $"stop"
            
            derivation(savedString)
            #CALL FUNCTIONS BELOW THIS CODE
            

            #[
            
              Hello there, if you need the string to do other process note that it is a STRING of SEQ 

                ==>savedString<==

              INPUT STRING :
                go rec a1.a1 stop

              savedString :
                @["go", "rec", "a1.a1", "stop"]

                
            
            ]#

            echo "If you are here then you made it into the end of the program"

            echo "Pretend the parser, tree and graphic are generated here"

            echo savedString        
            echo "THIS IS THE ARRAY POS: ", currentPos

     

            #CALL FUNCTIONS ABOVE THIS LINE

          elif charArr[currentPos] != 'p':
            echo "Error at pos: ", currentPos+1," Maybe a typo?? "

          elif currentPos != charArr.len()-1:
            echo "Error at pos: ",currentPos+1," command continued but should be terminated!"

          else:
            echo "Error at pos: ",currentPos+1," did you mistyped???"

    else:
      echo "Error at pos: ",currentPos+1," unknown command"

  else:
    echo "Error at pos: ", currentPos+1 ,"Reached the end of the command but should be more to process..."

#Process for rec command validation
proc processRecCommand(charArr : seq[char],currentPosIndex : int) =

  currentPos = currentPosIndex

#We need to build the string that will construct the command
  var recStringCmd : string =""


  if currentPos < charArr.len()-1 :

    if "abcdefghi".contains(charArr[currentPos]) and currentPos < charArr.len()-1:
      recStringCmd = recStringCmd & charArr[currentPos]
      inc currentPos

      if "123456789".contains(charArr[currentPos]) and currentPos < charArr.len()-1:
        recStringCmd = recStringCmd & charArr[currentPos]
        inc currentPos

        if ".".contains(charArr[currentPos]) and currentPos < charArr.len()-1:
          recStringCmd = recStringCmd & charArr[currentPos]
          inc currentPos

          if "abcdefghi".contains(charArr[currentPos]) and currentPos < charArr.len()-1:
            recStringCmd = recStringCmd & charArr[currentPos]
            inc currentPos

            if "123456789".contains(charArr[currentPos]) and currentPos < charArr.len()-1:
              #then we should have continue the command
              recStringCmd = recStringCmd & charArr[currentPos]

              if currentPos < charArr.len()-4:

                if charArr[currentPos+1] == ',' and charArr[currentPos+2] != 's':
                  recStringCmd = recStringCmd & charArr[currentPos+1]
                  savedString.add recStringCmd
                  inc currentPos
                  checkCmd(charArr,currentPos)

                elif charArr[currentPos+1] == 's':
                  #It should be the last command so we just add the string and call the checkCmd

                  savedString.add recStringCmd
                  checkCmd(charArr,currentPos)

                else:
                  if charArr[currentPos+1] != ',' :

                    echo "Error at pos ",currentPos+2, " Incorrect character; Expected , but found ",charArr[currentPos+1] 

                  else:

                    echo "Error at pos: ",currentPos+2, " Expected command but found stop!"

              else:
                echo "HEY SOMETHING IS WRONG HERE!"

           
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


proc processTriCommand(charArr : seq[char],currentPosIndex : int) =

  currentPos = currentPosIndex

  #We need to build the string that will construct the command
  var triStringCmd : string =""


  if currentPos < charArr.len()-1 :


    if "abcdefghi".contains(charArr[currentPos])  and currentPos < charArr.len()-1:
      triStringCmd = triStringCmd & charArr[currentPos]
      inc currentPos


      if "123456789".contains(charArr[currentPos]) and currentPos < charArr.len()-1:
        triStringCmd = triStringCmd & charArr[currentPos]
        inc currentPos


        if ".".contains(charArr[currentPos]) and currentPos < charArr.len()-1:
          triStringCmd = triStringCmd & charArr[currentPos]
          inc currentPos

          if "abcdefghi".contains(charArr[currentPos]) and currentPos < charArr.len()-1:
            triStringCmd = triStringCmd & charArr[currentPos]
            inc currentPos


            if "123456789".contains(charArr[currentPos]) and currentPos < charArr.len()-1:
              triStringCmd = triStringCmd & charArr[currentPos]
              inc currentPos


              if ".".contains(charArr[currentPos]) and currentPos < charArr.len()-1:
                triStringCmd = triStringCmd & charArr[currentPos]
                inc currentPos

                if "abcdefghi".contains(charArr[currentPos]) and currentPos < charArr.len()-1:
                  triStringCmd = triStringCmd & charArr[currentPos]
                  inc currentPos
                

                  if "123456789".contains(charArr[currentPos])  and currentPos < charArr.len()-1:
                
                    #then we should have continue the command
                    triStringCmd = triStringCmd & charArr[currentPos]

                    if currentPos < charArr.len()-4:

                      if charArr[currentPos+1] == ',' and charArr[currentPos+2] != 's':
                        triStringCmd = triStringCmd & charArr[currentPos+1]
                        savedString.add triStringCmd
                        inc currentPos
                        checkCmd(charArr,currentPos)

                      elif charArr[currentPos+1] == 's':
                        #It should be the last command so we just add the string and call the checkCmd

                        savedString.add triStringCmd
                        checkCmd(charArr,currentPos)

                      else:
                        if charArr[currentPos+1] != ',' :

                          echo "Error at pos ",currentPos+2, " Incorrect character; Expected , but found ",charArr[currentPos+1] 

                        else:

                          echo "Error at pos: ",currentPos+2, " Expected command but found stop!"

                    else :
                      echo "failure at tri"
                  else:
                    echo "Error at pos: ", currentPos+1, " Unknown in the eighth position"
                else:
                  echo "Error at pos: ", currentPos+1, " Unknown in the seventh position"
              else:
                echo "Error at pos: ", currentPos+1, " Unknown in the sixth position"
            else:
              echo "Error at pos: ", currentPos+1, " Unknown in the fifth position"
          else:
            echo "Error at pos: ", currentPos+1, " Unknown in the fourth position"
        else:
          echo "Error at pos: ", currentPos+1, " Unknown in the third position"
      else:
        echo "Error at pos: ", currentPos+1, " Unknown in the second position"
    else:
      echo "Error at pos: ", currentPos+1, " Unknown in the first position"
        
  #fails the size check
  else:
    echo "Unexpected end of program at pos : ",currentPos+1, " The command was prob wrong"


#Process for rec command validation
proc processCirCommand(charArr : seq[char],currentPosIndex : int) =


  currentPos = currentPosIndex

#We need to build the string that will construct the command
  var cirStringCmd : string =""


  if currentPos < charArr.len()-1 :

    if "abcdefghi".contains(charArr[currentPos])  and currentPos < charArr.len()-1:
      cirStringCmd = cirStringCmd & charArr[currentPos]
      inc currentPos

      if "123456789".contains(charArr[currentPos])  and currentPos < charArr.len()-1:
        cirStringCmd = cirStringCmd & charArr[currentPos]
        inc currentPos

        if ".".contains(charArr[currentPos]) and currentPos < charArr.len()-1:
          cirStringCmd = cirStringCmd & charArr[currentPos]
          inc currentPos

          if "abcdefghi".contains(charArr[currentPos]) and currentPos < charArr.len()-1:
            cirStringCmd = cirStringCmd & charArr[currentPos]
            inc currentPos

            if "123456789".contains(charArr[currentPos]) and currentPos < charArr.len()-1:
              #then we should have continue the command
              cirStringCmd = cirStringCmd & charArr[currentPos]

              if currentPos < charArr.len()-4:

                if charArr[currentPos+1] == ',' and charArr[currentPos+2] != 's':
                  cirStringCmd = cirStringCmd & charArr[currentPos+1]
                  savedString.add cirStringCmd
                  inc currentPos
                  checkCmd(charArr,currentPos)

                elif charArr[currentPos+1] == 's':
                  #It should be the last command so we just add the string and call the checkCmd

                  savedString.add cirStringCmd
                  checkCmd(charArr,currentPos)

                else:
                  if charArr[currentPos+1] != ',' :

                    echo "Error at pos ",currentPos+2, " Incorrect character; Expected , but found ",charArr[currentPos+1] 

                  else:

                    echo "Error at pos: ",currentPos+2, " Expected command but found stop!"

              else:
                echo "failure at cir"

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




proc processAxesCommand(charArr : seq[char],currentPosIndex : int) =

  currentPos = currentPosIndex

#We need to build the string that will construct the command
  var axesStringCmd : string =""


  if currentPos < charArr.len()-1 :


    if "abcdefghi".contains(charArr[currentPos]) and currentPos < charArr.len()-1:
      axesStringCmd = axesStringCmd & charArr[currentPos]
      inc currentPos


      if ".".contains(charArr[currentPos]) and currentPos < charArr.len()-1:
        axesStringCmd = axesStringCmd & charArr[currentPos]
        inc currentPos
  

        if "123456789".contains(charArr[currentPos]) and currentPos < charArr.len()-1:

          #then we should have continue the command
          axesStringCmd = axesStringCmd & charArr[currentPos]

          if currentPos < charArr.len()-4:

            if charArr[currentPos+1] == ',' and charArr[currentPos+2] != 's':
              axesStringCmd = axesStringCmd & charArr[currentPos+1]
              savedString.add axesStringCmd
              inc currentPos
              checkCmd(charArr,currentPos)

            elif charArr[currentPos+1] == 's':
                  #It should be the last command so we just add the string and call the checkCmd

              savedString.add axesStringCmd
              checkCmd(charArr,currentPos)

            else:
              if charArr[currentPos+1] != ',' :

                echo "Error at pos ",currentPos+2, " Incorrect character; Expected , but found ",charArr[currentPos+1] 

              else:

                echo "Error at pos: ",currentPos+2, " Expected command but found stop!"
          else:
            echo "failure at axes"

        else:
           echo "Error at pos: ", currentPos+1, " Unknown in the third position"
      else:
         echo "Error at pos: ", currentPos+1, " Unknown in the second position"
    else:
       echo "Error at pos: ", currentPos+1, " Unknown in the first position"
       
#fails the size check
  else:
    echo "Unexpected end of program at pos : ",currentPos+1, " The command was prob wrong"



proc processFillCommand(charArr : seq[char],currentPosIndex : int) =

  currentPos = currentPosIndex

#We need to build the string that will construct the command
  var fillStringCmd : string =""


  if currentPos < charArr.len()-1 :


    if "abcdefghi".contains(charArr[currentPos]) and currentPos < charArr.len()-1:
      fillStringCmd = fillStringCmd & charArr[currentPos]
      inc currentPos


      if ".".contains(charArr[currentPos]) and currentPos < charArr.len()-1:
        fillStringCmd = fillStringCmd & charArr[currentPos]
        inc currentPos
  

        if "123456789".contains(charArr[currentPos]) and currentPos < charArr.len()-1:
        
          #then we should have continue the command
          fillStringCmd = fillStringCmd & charArr[currentPos]

          if currentPos < charArr.len()-4:

            if charArr[currentPos+1] == ',' and charArr[currentPos+2] != 's':
              fillStringCmd = fillStringCmd & charArr[currentPos+1]
              savedString.add fillStringCmd
              inc currentPos
              checkCmd(charArr,currentPos)

            elif charArr[currentPos+1] == 's':
                  #It should be the last command so we just add the string and call the checkCmd

              savedString.add fillStringCmd
              checkCmd(charArr,currentPos)

            else:
              if charArr[currentPos+1] != ',' :

                echo "Error at pos ",currentPos+2, " Incorrect character; Expected , but found ",charArr[currentPos+1] 

              else:
                echo "Error at pos: ",currentPos+2, " Expected command but found stop!"
          else:
            echo "failure at fill"
        else:
           echo "Error at pos: ", currentPos+1, " Unknown in the third position"
      else:
         echo "Error at pos: ", currentPos+1, " Unknown in the second position"
    else:
       echo "Error at pos: ", currentPos+1, " Unknown in the first position"
       
#fails the size check
  else:
    echo "Unexpected end of program at pos : ",currentPos+1, " The command was prob wrong"


proc errorDump(charArray : seq[char],ErrorPos : int)  =

  var arr : seq[char] = charArray
  var count : int = 1

  for i in arr:
    echo i, " at POS ", count,"\n"
    inc count

