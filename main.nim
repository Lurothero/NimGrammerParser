#   CMPS3111 Programming Project 2
#   Due Date 28/10/2021
import strutils

#Printing Grammar 
proc grammar() =
    echo "\n"
    echo "------------------------------------------"
    echo "========       BNF Grammar        ========"
    echo "------------------------------------------"
    echo "\n"
    echo "\t  <shapes> → go <commands> stop"
    echo "\t<commands> → <draw>"
    echo "\t            |<draw> , <commands>"
    echo "\t    <draw> → rec <xy> . <xy>"
    echo "\t            | tri <xy> . <xy> . <xy>"
    echo "\t            | cir <xy> . <xy>"
    echo "\t            | axes <x> . <y>"
    echo "\t            | fill <x> . <y>"
    echo "\t      <xy> → <x> . <y>"
    echo "\t       <x> → a|b|c|d|e|f|g|h|i"
    echo "\t       <x> → 1|2|3|4|5|6|7|8|9"
    echo "\n"
    echo "------------------------------------------"
    echo "Commands: EXIT (To end the program), GRAMMAR (View BNF Grammar)"

#end of grammer

 #Display BNF Grammar
grammar() #makes it display once on start up 


   


#state of the program to keep running
var status = true

while status:


    #User input Command
    echo "\n\nCommand: "
    let input = readLine(stdin)

    if input == "EXIT":
        echo "Exiting Program"
        break

    elif input == "exit":
        echo "ERROR: exit in UPPERCASE only"
    
    elif input == "GRAMMAR":
        grammar()

    elif input.startsWith("go") == true and input.endsWith("stop") == true :
        echo "Thing to do Here!"
    
    else:
        echo "ERROR: Invalid Command" 