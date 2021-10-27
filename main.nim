

include parser


#   CMPS3111 Programming Project 2
#   Due Date 28/10/2021

#Printing Grammar aa
proc grammar() =
    echo "\n"
    echo "------------------------------------------"
    echo "========       BNF Grammar        ========"
    echo "------------------------------------------"
    echo "\n"
    echo "\t  <shapes> → go<commands> stop"
    echo "\t<commands> → <draw>"
    echo "\t            |<draw> , <commands>"
    echo "\t    <draw> → rec <xy>.<xy>"
    echo "\t            | tri <xy>.<xy>.<xy>"
    echo "\t            | cir <xy>.<xy>"
    echo "\t            | axes <x>.<y>"
    echo "\t            | fill <x>.<y>"
    echo "\t      <xy> → <x><y>"
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

  of "test":
    var testArr : seq[string]= @[]
    testArr.add $"go rec a1.a1 stop"
    testArr.add $"go tri a1.a1.a1 stop"
    testArr.add $"go cir a1.a1 stop"
    testArr.add $"go axes a.1 stop"
    testArr.add $"go fill a.1 stop"

    testArr.add $"go rec a1.a1, rec a2.a2 stop"
    testArr.add $"go tri a1.a1.a1, tri a2.a2.a2 stop"
    testArr.add $"go cir a1.a1, cir a2.a2 stop"
    testArr.add $"go axes a.1, axes a.2 stop"
    testArr.add $"go fill a.1, fill a.2 stop"


    testArr.add $"go rec a1.a1, tri a1.a1.a1, cir a1.a1, axes a.1, fill a.1 stop"

    testArr.add $""
    testArr.add $"d"
    testArr.add $"g"
    testArr.add $"gx"
    testArr.add $"go"
    testArr.add $"go go"
    testArr.add $"go stop"

    testArr.add $"stop"
    testArr.add $"stop stop"
    testArr.add $"go stop stop"
    testArr.add $"go rec a1.a1 stop stop"


    testArr.add $"go xec a1.a1 stop"
    testArr.add $"go ruc a1.a1 stop"
    testArr.add $"go res a1.a1 stop"
    testArr.add $"go rec z1.a1 stop"
    testArr.add $"go rec a1.a1 stop"
    testArr.add $"go rec a11.a1 stop"

    testArr.add $"go rec a1.a1 rec a2.a2 stop"
    testArr.add $"go rec a1.a1, rec a2.a2, stop"
    testArr.add $"go rec a1.a1; rec a2.a2 stop"

    testArr.add $"go rec a1.a1, rec a2.a2 stop"

    testArr.add $"go rec "
    testArr.add $"go rec a "
    testArr.add $"go rec a1"
    testArr.add $"go rec a1."
    testArr.add $"go rec a1.1"
    testArr.add $"go rec a1.a1"
    testArr.add $"go rec a1.a1 s"
    testArr.add $"go rec a1.a1 st"
    testArr.add $"go rec a1.a1 sto"
    testArr.add $"go rec a1.a1 stop"

    


    testArr.add $"go tri "
    testArr.add $"go tri a"
    testArr.add $"go tri a1."
    testArr.add $"go tri a1.a"
    testArr.add $"go tri a1.a1. "
    testArr.add $"go tri a1.a1.a "
    testArr.add $"go tri a1.a1.a1 "
    testArr.add $"go tri a1.a1.a1 s"
    testArr.add $"go tri a1.a1.a1 st"
    testArr.add $"go tri a1.a1.a1 sto"
    testArr.add $"go tri a1.a1.a1 stop"



    testArr.add $"go cir "
    testArr.add $"go cir a "
    testArr.add $"go cir a1"
    testArr.add $"go cir a1."
    testArr.add $"go cir a1.1"
    testArr.add $"go cir a1.a1"
    testArr.add $"go cir a1.a1 s"
    testArr.add $"go cir a1.a1 st"
    testArr.add $"go cir a1.a1 sto"
    testArr.add $"go cir a1.a1 stop"



    testArr.add $"go axes"
    testArr.add $"go axes a"
    testArr.add $"go axes a. "
    testArr.add $"go axes a.1 "
    testArr.add $"go axes a.1 s"
    testArr.add $"go axes a.1 st"
    testArr.add $"go axes a.1 sto"
    testArr.add $"go axes a.1 stop"

    testArr.add $"go fill"
    testArr.add $"go fill a"
    testArr.add $"go fill a. "
    testArr.add $"go fill a.1 "
    testArr.add $"go fill a.1 s"
    testArr.add $"go fill a.1 st"
    testArr.add $"go fill a.1 sto"
    testArr.add $"go fill a.1 stop"

    for each in testArr:
      getInput(each)



  of "EXIT":
    echo "Leave the program"
    status = false

  of "HELP":
    echo "Generating command"

  of "GRAMMAR":
    grammar()
    
  else:
    echo "ASSUME THE COMMAND"
    getInput(grammar)


#end of while


echo "BYE BYE"

