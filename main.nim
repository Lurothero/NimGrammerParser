
#   CMPS3111 Programming Project 2
#   Due Date 28/10/2021

#Printing Grammar 
proc grammar() =
    echo "\n"
    echo "------------------------------------------"
    echo "========       BNF Grammar        ========"
    echo "------------------------------------------"
    echo "\n"
    echo "\t  <shapes> → go<commands> stop"
    echo "\t<commands> → <draw>"
    echo "\t            |<draw> , <commands>"
    echo "\t    <draw> → rec <xy> . <xy>"
    echo "\t            | tri <xy> . <xy> . <xy>"
    echo "\t            | cir <xy> . <xy>"
    echo "\t            | axes <x> . <y>"
    echo "\t            | fill <x> . <y>"
    echo "\t      <xy> → <x> . <y>"
    echo "\t       <x> → a|b|c|d|e|f|g|h|i"
    echo "\t       <y> → 1|2|3|4|5|6|7|8|9"
    echo "\n"
    echo "------------------------------------------"
    echo "Commands: EXIT (To end the program), GRAMMAR (View BNF Grammar)"


grammar()




#Show the command to the screen
echo "Input the grammar to start the process; type \"HELP\" to see all commands!"


#Generic variable structure is 
# var <name>: <type>
# var <name>: <type> = <value>


# Main body loop to process commands

var status = true #rename?

while status:

  #Grab the user input
  var grammar : string = readLine(stdin)


  case grammar
  of "EXIT":
    echo "Leave the program"
    status = false

  of "HELP":
    echo "Generating command"

  of "GRAMMAR":
    grammar()
    
  else:
    echo "ASSUME THE COMMAND"


#end of while


echo "BYE BYE"

