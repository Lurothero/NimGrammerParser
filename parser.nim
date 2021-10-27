#Imports 
import std/strutils


var currentPos : int = 0
var savedString : seq[string] = @[]


#main parser starts here

#foward declaration
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

#Pass in the string from the user
proc getInput(input : string ) : void =
  
  currentPos = 0 
  savedString = @[]

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

  discard joiner(toArray)
  discard toCharArray(joiner(toArray))

  return "done"
#end of removeWhiteSpaces

#Joins the string in a single char sequence
proc joiner (toJoin : seq[string]):string =

  var holdThisStringForMePlz : string

  for each in toJoin:
    holdThisStringForMePlz.add $each

  return holdThisStringForMePlz
#end of tokenizer

proc toCharArray (getString : string) : bool = 

  #if true then throw an error
  if isEmptyOrWhitespace(getString) :

    echo "ERROR! YOUR INPUT CANNOT BE EMPTY"
    return false 

  else:

    var charArray : seq[char] = @[]

    for each in cast[seq[char]](getString):
      charArray.add $each

    discard buildingBack(charArray)

#end of toCharArray



proc buildingBack (charArr : seq[char]) : seq[string] =

  if charArr[currentPos] == 'g' and currentPos < charArr.len()-1 :

    inc currentPos

    if charArr[currentPos] == 'o' and currentPos < charArr.len()-1 :
     
      savedString.add $"go"
      checkCmd(charArr,currentPos)

    else:
      echo "Error at pos: ", currentPos+1, " Did you mean \'go\'?"

  else:
    echo "Error at pos: ", currentPos+1," type \'go\'to get started "

  #check for Command
  return savedString


proc checkCmd (charArr : seq[char],currentPosIndex : int) =

  currentPos = currentPosIndex

  #check to see if the next starts a valid command
  inc currentPos

  if currentPos < charArr.len()-1 :

    case charArr[currentPos]


    of 'r':  
      inc currentPos

      if charArr[currentPos] == 'e':
        inc currentPos

        if charArr[currentPos] == 'c':
          savedString.add $"rec"
          inc currentPos
          #call to process rec command
          processRecCommand(charArr,currentPos)

        else:
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
            savedString.add $"axes"
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


            echo "\nIf you are here then you made it into the end of the program\n"

            echo "Pretend the parser, tree and graphic are generated here \n \n"
            

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
    echo "CURRENT POS: ", $currentPos
    echo "Chararr lenght - 1 ", charArr.len()-1

    if "abcdefghi".contains(charArr[currentPos]):
      recStringCmd = recStringCmd & charArr[currentPos]
      inc currentPos

      if "123456789".contains(charArr[currentPos]):
        recStringCmd = recStringCmd & charArr[currentPos]
        inc currentPos

        if ".".contains(charArr[currentPos]):
          recStringCmd = recStringCmd & charArr[currentPos]
          inc currentPos

          if "abcdefghi".contains(charArr[currentPos]):
            recStringCmd = recStringCmd & charArr[currentPos]
            inc currentPos

            if "123456789".contains(charArr[currentPos]):
              #then we should have continue the command
              echo currentPos , ":POS"
              echo recStringCmd , ": STRING 1"

              recStringCmd = recStringCmd & charArr[currentPos]
              inc currentPos

              echo currentPos , ":POS"
              echo recStringCmd , ": STRING 2"
             
              var thisProgramHasFunctionalSideEffects : int = currentPos

              if charArr[currentPos] == ',' and charArr[thisProgramHasFunctionalSideEffects+1] != 's':

                echo currentPos , ":POS"
                echo recStringCmd , ": STRING 3"

                recStringCmd = recStringCmd & charArr[currentPos]
                savedString.add recStringCmd
                checkCmd(charArr,currentPos)

            

              elif charArr[currentPos] == 's':
                #It should be the last command so we just add the string and call the checkCmd

                echo currentPos , ":POS"
                echo recStringCmd , ": STRING 4"

                savedString.add recStringCmd
                checkCmd(charArr,currentPos)

              else:
                if charArr[currentPos+1] != ',' :

                  echo "Error at pos ",currentPos+2, " Incorrect character; Expected , but found ",charArr[currentPos+1] 

                else:

                  echo "Error at pos: ",currentPos+2, " Expected command but found stop!"

           
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


    if "abcdefghi".contains(charArr[currentPos]):
      triStringCmd = triStringCmd & charArr[currentPos]
      inc currentPos


      if "123456789".contains(charArr[currentPos]):
        triStringCmd = triStringCmd & charArr[currentPos]
        inc currentPos


        if ".".contains(charArr[currentPos]):
          triStringCmd = triStringCmd & charArr[currentPos]
          inc currentPos

          if "abcdefghi".contains(charArr[currentPos]):
            triStringCmd = triStringCmd & charArr[currentPos]
            inc currentPos


            if "123456789".contains(charArr[currentPos]):
              triStringCmd = triStringCmd & charArr[currentPos]
              inc currentPos


              if ".".contains(charArr[currentPos]):
                triStringCmd = triStringCmd & charArr[currentPos]
                inc currentPos

                if "abcdefghi".contains(charArr[currentPos]):
                  triStringCmd = triStringCmd & charArr[currentPos]
                  inc currentPos
                

                  if "123456789".contains(charArr[currentPos]):
                
                    #then we should have continue the command
                    triStringCmd = triStringCmd & charArr[currentPos]

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

    if "abcdefghi".contains(charArr[currentPos]):
      cirStringCmd = cirStringCmd & charArr[currentPos]
      inc currentPos

      if "123456789".contains(charArr[currentPos]):
        cirStringCmd = cirStringCmd & charArr[currentPos]
        inc currentPos

        if ".".contains(charArr[currentPos]):
          cirStringCmd = cirStringCmd & charArr[currentPos]
          inc currentPos

          if "abcdefghi".contains(charArr[currentPos]):
            cirStringCmd = cirStringCmd & charArr[currentPos]
            inc currentPos

            if "123456789".contains(charArr[currentPos]):
              #then we should have continue the command
              cirStringCmd = cirStringCmd & charArr[currentPos]

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


    if "abcdefghi".contains(charArr[currentPos]):
      axesStringCmd = axesStringCmd & charArr[currentPos]
      inc currentPos


      if ".".contains(charArr[currentPos]):
        axesStringCmd = axesStringCmd & charArr[currentPos]
        inc currentPos
  

        if "123456789".contains(charArr[currentPos]):

          #then we should have continue the command
          axesStringCmd = axesStringCmd & charArr[currentPos]

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


    if "abcdefghi".contains(charArr[currentPos]):
      fillStringCmd = fillStringCmd & charArr[currentPos]
      inc currentPos


      if ".".contains(charArr[currentPos]):
        fillStringCmd = fillStringCmd & charArr[currentPos]
        inc currentPos
  

        if "123456789".contains(charArr[currentPos]):
        
          #then we should have continue the command
          fillStringCmd = fillStringCmd & charArr[currentPos]

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
           echo "Error at pos: ", currentPos+1, " Unknown in the third position"
      else:
         echo "Error at pos: ", currentPos+1, " Unknown in the second position"
    else:
       echo "Error at pos: ", currentPos+1, " Unknown in the first position"
       
#fails the size check
  else:
    echo "Unexpected end of program at pos : ",currentPos+1, " The command was prob wrong"
