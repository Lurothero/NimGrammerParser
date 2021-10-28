import strutils
import std/[algorithm]
#import shlex
import os


#Parse Tree
proc parseTree*(innerCommand : seq[string]) =
  
  # From Sequence of String to on string
    var temp = innerCommand.join()

    #removing go & stop from the command
    temp.removePrefix("go")
    temp.removeSuffix("stop")

    #Separate Commands after every ',' => array of strings
    var commands = temp.split(',')

    #Remove all white space and joins everything in 1 string
    #var removeWhiteSpace = innerCommand.replace(" ", "").replace("\t", "")

    #Separate Commands after ever ',' => array of strings
    #var commands = removeWhiteSpace.split(',')
    #commands = commands.reversed()
    echo "this is me", commands

    # Counter for # string in the array
    var counter = len(commands)

    #Variables to print
    var 
        go = "\t → go "
        stop = " stop"
        draw = "<draw>, "
        updatedStr: string  
        dataSize = 0
        i = 0 
        completeBranch = "/     |     \\"
        center = "  | "
        left = " / "
        right = " \\ "
        tab = "\t"
        command = "<commands>"

    # Print Tree headerDefault
    echo "\n=============================================="
    echo "==            Printing Parse Tree           =="
    echo "==============================================\n\n"
    echo "\t  <shapes> \n"
    echo "\t", completeBranch
    echo " go  <commands> stop"

    echo tab,"   ",center
    if counter > 1:
      echo "      ",draw," ",command 
      echo "\t  ", left, "\t\t\t", right
    else :
      echo "      ",draw
      echo "      ",center 

    dataSize = counter
    #Derivation # of Commands

    #decriment Counter
    dec counter

    while dataSize != 0 :
        #Shape : Rectangle
        if commands[i].startsWith("rec") == true:
          
            
          echo tab.repeat(counter),"rec <xy>.<xy>","\t", draw.repeat(counter)
            
          if counter >= 1:
            echo tab.repeat(counter + 1), left, "    ", right,"\t\t", right
            echo tab.repeat(counter),"<x> <y>"," ", "<x> <y>"
            echo tab.repeat(counter), left, "  ",right, left, "  ",right
            echo tab.repeat (counter),(commands[i])[3],"\t   ", (commands[i])[4]," ",(commands[i])[6],"\t   ", (commands[i])[^1]
            
          else:
            echo tab.repeat(counter + 1),left, "    ",right
            echo tab.repeat(counter),"<x> <y>"," ", "<x> <y>"
            echo tab.repeat(counter), left, "  ",right, left, "  ",right
            echo tab.repeat (counter),(commands[i])[3],"\t   ", (commands[i])[4]," ",(commands[i])[6],"\t   ", (commands[i])[^1]
            

          updatedStr =  ", rec <" & (commands[i])[3] & (commands[i])[4] & ">.<" & (commands[i])[6] & (commands[i])[^1] & ">" & updatedStr
          dec counter

        #Shape : Triangle
        elif commands[i].startsWith("tri") == true:
            echo tab.repeat(counter + 4),"tri <xy>.<xy>.<xy>"
            echo tab.repeat(counter + 5),completeBranch
            echo tab.repeat(counter + 4),"<x> <y> <x> <y> <x> <y>"
            echo tab.repeat(counter + 4),left," ",right," ",left," ",right," ",left," ",right
            echo "\t\t\t\t\t",(commands[i])[3], "\t ",(commands[i])[4],"\t ",(commands[i])[6], "\t ",(commands[i])[7],"\t",(commands[i])[9],"\t  ",(commands[i])[^1]
                
          
          
            dec counter

        #Shape : Circle Completed
        elif commands[i].startsWith("cir") == true:
            echo tab.repeat(counter),"cir <xy>.<xy>","\t", draw.repeat(counter)
            if counter >= 1:
              echo tab.repeat(counter + 1), left, "    ", right,"\t\t", right
              echo tab.repeat(counter),"<x> <y>"," ", "<x> <y>"
              echo tab.repeat(counter), left, "  ",right, left, "  ",right
              echo tab.repeat (counter),(commands[i])[3],"\t   ", (commands[i])[4]," ",(commands[i])[6],"\t   ", (commands[i])[^1]
            
            else:
                echo tab.repeat(counter + 1),left, "    ",right
                echo tab.repeat(counter),"<x> <y>"," ", "<x> <y>"
                echo tab.repeat(counter), left, "  ",right, left, "  ",right
                echo tab.repeat (counter),(commands[i])[3],"\t   ", (commands[i])[4]," ",(commands[i])[6],"\t   ", (commands[i])[^1]
          
            dec counter
        
        #Shape : Axes
        elif commands[i].startsWith("axes") == true:
          echo tab.repeat(counter),"axes <x>.<y>","\t", draw.repeat(counter)
          if counter >= 1:
            echo tab.repeat(counter + 1)," ", center,"\t\t ", right
            echo tab.repeat(counter + 1), "<x>  <y>"
            echo tab.repeat(counter + 1), left, "  ", right
            echo tab.repeat(counter + 1), (commands[i])[4],"\t\t",(commands[i])[^1]
            
          else:
            echo tab.repeat(counter + 1)," ", center
            echo tab.repeat(counter + 1), "<x>  <y>"
            echo tab.repeat(counter + 1), left, "  ", right
            echo tab.repeat(counter + 1), (commands[i])[4],"\t\t",(commands[i])[^1]
               
           
           

          updatedStr = ", axes <" & (commands[i])[4] & ">.<" & (commands[i])[^1] & ">" & updatedStr
          dec counter
       
       #Shape : Fill
        elif commands[i].startsWith("fill") == true:
          echo tab.repeat(counter),"fill <x>.<y>","\t", draw.repeat(counter)
          if counter >= 1:
            echo tab.repeat(counter + 1)," ", center,"\t\t ", right
            echo tab.repeat(counter + 1), "<x>  <y>"
            echo tab.repeat(counter + 1), left, "  ", right
            echo tab.repeat(counter + 1), (commands[i])[4],"\t\t",(commands[i])[^1]
           
          else:
            echo tab.repeat(counter + 1)," ", center
            echo tab.repeat(counter + 1), "<x>  <y>"
            echo tab.repeat(counter + 1), left, "  ", right
            echo tab.repeat(counter + 1), (commands[i])[4],"\t\t",(commands[i])[^1]
            
            
         
          updatedStr = ", fill <" & (commands[i])[4] & ">.<" & (commands[i])[^1] & ">" & updatedStr
          dec counter
    
        inc i
        dec dataSize



