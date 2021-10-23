import strutils
import std/[algorithm]



proc printString () = 

  echo 


#Printing Grammar 
proc grammar*() =
    echo "\n"
    echo "------------------------------------------"
    echo "========       BNF Grammar        ========"
    echo "------------------------------------------"
    echo "\n"
    echo "\t  <shapes> → go <commands> stop"
    echo "\t<commands> → <draw>"
    echo "\t            |<draw>,<commands>"
    echo "\t    <draw> → rec <xy>.<xy>"
    echo "\t            | tri <xy>.<xy>.<xy>"
    echo "\t            | cir <xy>.<xy>"
    echo "\t            | axes <x>.<y>"
    echo "\t            | fill <x>.<y>"
    echo "\t      <xy> → <x>.<y>"
    echo "\t       <x> → a|b|c|d|e|f|g|h|i"
    echo "\t       <y> → 1|2|3|4|5|6|7|8|9"
    echo "\n"
    echo "------------------------------------------"
    echo "Commands: EXIT (To end the program), GRAMMAR (View BNF Grammar)"

#print Drivation Header
proc singleHeaderPrint*() =
    echo "<shapes> → go <commands> stop"
    echo "\t → go <draw>,<commands> stop"
    echo "\t → go <draw> stop"
    

#Derivation 
proc singleRightDerivation(innerCommand : string) =

    var rightDerivation = innerCommand.strip()

    if rightDerivation.startsWith("rec") == true :
        echo "\t → go rec <xy>.<xy> stop"


        # var size = rightDerivation.len
        # var commandString: array[9, char]


        # for i in 0..rightDerivation.len:
        #     commandString[i] = '*'
            #echo rightDerivation[i]
        
        # echo commandString[8]


            

        
        #Star rightMost
        # var i = rightDerivation.len - 1
        # for letter in reversed(rightDerivation) :
        #     echo rightDerivation, letter = rightDerivation[i]
        #     dec i

            

        # echo "::::", rightDerivation[^1]
            # for i in 0 .. rightDerivation.len :
            #     if letter == letter[9]  :
            #         echo rightDerivation.len
            # #         break
        

       


    elif rightDerivation.startsWith("tri") == true :
        echo " "
    elif rightDerivation.startsWith("cir") == true :
        echo " "
    elif rightDerivation.startsWith("axes") == true :
        echo " "
    elif rightDerivation.startsWith("fill") == true :
        echo " "
    

#Determins Which Shape or Shapes
proc shape(innerCommand : string) = 
    
    if innerCommand.contains(",") == true :
        echo "Multiple Commands Derivations Goes here \n"
        # multipleRightDerivation(innerCommand)
        #Derivation Next then other Things to do
    else :
        echo "\n1 Command Only \n"
        singleHeaderPrint()
        singleRightDerivation(innerCommand)
       
        #Derivation Next then other Things to do


#Parsing the Command
proc parseCommand*(input: string) =
    
    var command = input

    #Remove Go & Stop
    command.removePrefix("go")
    command.removeSuffix("stop")

    #Remove blackspace
    var stripCommand = command.strip()

    #Checks if the command is valid after GO & STOP are removed
    for word in stripCommand.split(','):

        #remove additional white space
        var strip = word.strip()

        #Checks if Command key exist in the string
        if strip.startsWith("rec") == true or strip.startsWith("tri") == true or strip.startsWith("cir") == true or strip.startsWith("axes") == true or strip.startsWith("fill") == true :
            shape(command)
            break
        
        #Not Valid Commands
        else:
            echo "\n------"
            echo "ERROR: Invalid Command: (", input ,"), Press g for Grammar "
            echo "------"
            break

 


    














    # echo stripCommand.split()

    # var reStripCommand = stripCommand.strip()

    # echo reStripCommand
    # echo reStripCommand.split




    # validateCommand(stripCommand)

#Validate Command
# proc validateCommand*(stripCommand: string) =

    #Checks if Command Valid
    
    
    # var i = 0
    # var shapeType = ["rec","tri","cir"]
    
    # for word in shlex(stripCommand):
    #     for i in 0 .. 4:
    #         if word == shapeType[i] :
    #             echo "Yes! its here"
    #             break
    #     inc i

        
        

    # 
    
    # if stripCommand.contains("rec"):
    #     echo " Contains a Key"
    

    # if stripCommand.contains(",") == true :
    #     echo "Multiple Commands"
    # else :
    #     echo "1 Command Only"

    


