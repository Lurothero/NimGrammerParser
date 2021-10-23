#   CMPS3111 Programming Project 2
#   Due Date 28/10/2021

#iclude the parser.nim
include parser


#state of the program to keep running
var status = true


#Display BNF Grammar
grammar()

while status:

    #User input Command
    echo "\n\nCommand: "
    let input = readLine(stdin)

    if input == "EXIT":
        echo "Exiting Program"
        break

    elif input == "exit":
        echo "ERROR: exit in UPPERCASE only"
    
    elif input == "g":
        grammar()

    elif input.startsWith("go") == true and input.endsWith("stop") == true :
        parseCommand(input)
    
    else:
        echo "\n------"
        echo "ERROR: Invalid Command: (", input ,"), Press g for Grammar "
        echo "------"
 