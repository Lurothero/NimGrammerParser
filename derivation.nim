#Right Most Derivation 
proc derivation(innerCommand : seq[string]) =

    # From Sequence of String to on string
    var temp = innerCommand.join()

    #removing go & stop from the command
    temp.removePrefix("go")
    temp.removeSuffix("stop")

    #Separate Commands after every ',' => array of strings
    var commands = temp.split(',')

    #Reversing all commands from the seq of strings
    commands = commands.reversed()

    # Counter for # string in the array
    var counter = len(commands)

    # Print Derivation headerDefault
    echo "\n=============================================="
    echo "==             Printing Derivation          =="
    echo "==============================================\n\n"

    # Print Derivation headerDefault
    echo "\n<shapes> → go <commands> stop"
    # echo "\t → go <draw>,<commands> stop"


    # Variables to print
    var 
        go = "\t → go "
        stop = " stop"
        draw = "<draw>, "
        updatedStr: string  
        dataSize = 0
        i = 0 
       

    dataSize = counter
    
    for i in 1 .. dataSize - 1:
        echo go,draw.repeat(i),"<commands>",stop 
 
    #Derivation # of Commands
    echo go,draw.repeat(counter),stop 

    #decriment Counter
    dec counter

    while dataSize != 0 :
        #Shape : Rectangle
        if commands[i].startsWith("rec") == true:
            echo go,draw.repeat(counter), "rec <xy>.<xy>", updatedStr, stop
            echo go,draw.repeat(counter), "rec <xy>.<x><y>", updatedStr, stop
            echo go,draw.repeat(counter), "rec <xy>.<x>", (commands[i])[^1], updatedStr, stop
            echo go,draw.repeat(counter), "rec <xy>.", (commands[i])[6], (commands[i])[^1], updatedStr, stop
            echo go,draw.repeat(counter), "rec <x><y>.", (commands[i])[6], (commands[i])[^1], updatedStr, stop
            echo go,draw.repeat(counter), "rec <x>", (commands[i])[4],".", (commands[i])[6], (commands[i])[^1], updatedStr, stop
            echo go,draw.repeat(counter), "rec ", (commands[i])[3], (commands[i])[4], ".", (commands[i])[6], (commands[i])[^1], "", updatedStr, stop
            updatedStr =  ", rec " & (commands[i])[3] & "." & (commands[i])[4] & "." & (commands[i])[6] & (commands[i])[^1]  & updatedStr
            dec counter

        #Shape : Triangle
        elif commands[i].startsWith("tri") == true:
            echo go,draw.repeat(counter),"tri <xy>.<xy>.<xy>", updatedStr, stop
            echo go,draw.repeat(counter),"tri <xy>.<xy>.<x><y>", updatedStr, stop
            echo go,draw.repeat(counter),"tri <xy>.<xy>.<x>", (commands[i])[^1], updatedStr, stop
            echo go,draw.repeat(counter),"tri <xy>.<xy>.", (commands[i])[9],  (commands[i])[^1], updatedStr, stop
            echo go,draw.repeat(counter),"tri <xy>.<x><y>.", (commands[i])[9],  (commands[i])[^1], updatedStr, stop
            echo go,draw.repeat(counter),"tri <xy>.<x>", (commands[i])[7], ".", (commands[i])[9],  (commands[i])[^1], updatedStr, stop
            echo go,draw.repeat(counter),"tri <xy>.", (commands[i])[6], (commands[i])[7], ".", (commands[i])[9],  (commands[i])[^1], updatedStr, stop
            echo go,draw.repeat(counter),"tri <x><y>.", (commands[i])[6], (commands[i])[7], ".", (commands[i])[9],  (commands[i])[^1], updatedStr, stop
            echo go,draw.repeat(counter),"tri <x>", (commands[i])[4],".", (commands[i])[6], (commands[i])[7], ".", (commands[i])[9],  (commands[i])[^1], updatedStr, stop
            echo go,draw.repeat(counter),"tri ", (commands[i])[3], (commands[i])[4],".", (commands[i])[6], (commands[i])[7], ".", (commands[i])[9], (commands[i])[^1], updatedStr, stop
            updatedStr =  ", tri " & (commands[i])[3] & (commands[i])[4] & "." & (commands[i])[6] & (commands[i])[7] & "." & (commands[i])[9] & (commands[i])[^1] & updatedStr
            dec counter

        #Shape : Circle
        elif commands[i].startsWith("cir") == true:
            echo go,draw.repeat(counter), "cir <xy>.<xy>", updatedStr, stop
            echo go,draw.repeat(counter), "cir <xy>.<x><y>", updatedStr, stop
            echo go,draw.repeat(counter), "cir <xy>.<x>", (commands[i])[^1], updatedStr, stop
            echo go,draw.repeat(counter), "cir <xy>.", (commands[i])[6],(commands[i])[^1], updatedStr, stop
            echo go,draw.repeat(counter), "cir <x><y>.", (commands[i])[6],(commands[i])[^1], updatedStr, stop
            echo go,draw.repeat(counter), "cir <x>", (commands[i])[4], ".", (commands[i])[6], (commands[i])[^1], updatedStr, stop
            echo go,draw.repeat(counter), "cir ", (commands[i])[3], (commands[i])[4], ".", (commands[i])[6], (commands[i])[^1], updatedStr, stop
            updatedStr =  ", cir " & (commands[i])[3] & (commands[i])[4] & "." & (commands[i])[6] & (commands[i])[^1]  & updatedStr
            dec counter
        
        #Shape : Axes
        elif commands[i].startsWith("axes") == true:
            echo go,draw.repeat(counter), "axes <x>.<y>", updatedStr, stop
            echo go,draw.repeat(counter), "axes <x>.", (commands[i])[^1], updatedStr, stop
            echo go,draw.repeat(counter), "axes ", (commands[i])[4], ".", (commands[i])[^1], updatedStr, stop
            updatedStr = ", axes " & (commands[i])[4] & "." & (commands[i])[^1] & updatedStr
            dec counter
       
       #Shape : Fill
        elif commands[i].startsWith("fill") == true:
            echo go,draw.repeat(counter), "fill <x>.<y>", updatedStr, stop
            echo go,draw.repeat(counter), "fill <x>.", (commands[i])[^1], updatedStr, stop
            echo go,draw.repeat(counter), "fill ", (commands[i])[4], ".", (commands[i])[^1], updatedStr, stop
            updatedStr = ", fill " & (commands[i])[4] & "." & (commands[i])[^1] & updatedStr
            dec counter
    
        inc i
        dec dataSize
