class BeginProgram

  @@inputGrammer = 0
  @@grammerToArray = 0
  @@arrayIndex = 0
  @@stringPos = 0


  #use an array maybe 2d array

  @@constructsentence =""

#Grab the input from the user
def getInput




  puts "ENTER GRAMMER RULE"
  @@inputGrammer = gets
  #puts @@inputGrammer



  
  toArray

end #end of getInput method



#save the string input from the user
def toArray
  @@grammerToArray = @@inputGrammer.split()
  #puts @@grammerToArray

  grammerChecker


end #end of toArray method

def grammerChecker

#CALL THE OTHER FUNCTION
checkTo#should be rename to actual start or something


end #end of grammerChecker method

def checkTo

  #Keep it simple and add all the bells and whisles After
  if   @@grammerToArray[0].to_s == "to"

   #check if the end is valid
    if checkEnd

     puts "to <plot_cmd> end" #add this to an array

    #count the position
    @@stringPos = @@stringPos + @@grammerToArray[0].length()


    #Iterate the array index
    @@arrayIndex = @@arrayIndex + 1

    #call the next function
    checkNextStatement
    
    end#end of checkEnd if statement

  else

    puts "ERROR at pos: "+ @@stringPos.to_s +  " \'" +  @@grammerToArray[0].to_s + "\' not recognized!"

    #call the function again??
    return false
  end#end of if statement
  
return true
end#end of checkTo method
def checkEnd

  #check to see if the last index is an end
  if @@grammerToArray[@@grammerToArray.length - 1].to_s == "end" 

    puts "THE END OF THE PROGRAM"
    return true

  else

    puts "Unexpected end of file; EXPECTED end"
    return false
  end#end of if statement
  
end#end if checkEnd method


#MAKE THIS RECURSIVE 
#This need to generate the middle part

def checkNextStatement
  #create a temp variable to construct the middle part

  stringFormer = ""

  #it will iterate auto

  if @@grammerToArray[@@arrayIndex].to_s == "vbar"
    #start to contruct the middle sentence
    #We need to determine if the next character contains a ;

    if @@grammerToArray[@@arrayIndex+1].to_s.include? ";"

      #it has it so continue

      #
        puts "<cmd>; < plot_cmd >"
        stringFormer = stringFormer + "<cmd>; <plot_cmd> "

    
    @@arrayIndex = @@arrayIndex + 1
    checkVbarQuery

    else

      puts "<cmd> "
      
      stringFormer = stringFormer + "<cmd> "
      @@arrayIndex = @@arrayIndex + 1
      checkVbarQuery


    end#end of ; checker

   


    elsif @@grammerToArray[@@arrayIndex].to_s == "hbar"

      puts "you entered hbar"
      @@arrayIndex = @@arrayIndex + 1
      checkHbarQuery


    elsif @@grammerToArray[@@arrayIndex].to_s == "fill"

      puts "you entered fill"
      @@arrayIndex = @@arrayIndex + 1
      checkFillQuery

    elsif @@grammerToArray[@@arrayIndex].to_s == "end"

      puts "This is the OFFICIAL END OF THE CODE"
      return true

    else

      puts "INVALID COMMAND!!!!!"

    return false
  end # end of if statement

return true
end#end of checkNextStatement method


def checkVbarQuery

#the index has already been moved
#check to see if the size is correct

puts "vbar <x><y>,<y> "

  #checks the if the first number is valid
  if @@grammerToArray[@@arrayIndex].to_s[0,1] == "1" or "2" or "3" or "4" or "5" or "6" or "7"
  
    puts "vbar " +  @@grammerToArray[@@arrayIndex].to_s[0,1] +   " <y>,<y>"

  else

    puts "ERROR UNRECOGNIZED ENTRY AT FIRST POSITION"
    return false

  end#end of if statement to check for the first input

  
  if @@grammerToArray[@@arrayIndex].to_s[1,1] == "1" or "2" or "3" or "4" or "5" or "6" or "7"

     puts "vbar " +  @@grammerToArray[@@arrayIndex].to_s[0,1] +  @@grammerToArray[@@arrayIndex].to_s[1,1]  + ",<y>"

  else

    puts "ERROR UNRECOGNIZED ENTRY AT SECOND POSITION"
    return false

  end#end of if statement to check for the second input

 #checks for ,
  if @@grammerToArray[@@arrayIndex].to_s[2,1] == ","


    #prob not needed

   # puts "vbar " +  @@grammerToArray[@@arrayIndex].to_s[0,1] +  @@grammerToArray[@@arrayIndex].to_s[1,1]  + ","  + "<y>"


  else

    puts "ERROR UNRECOGNIZED ENTRY AT THIRD POSITION"
    return false

  end #end of if statement to check for the third input

     #checks for FOURTH POS
  if @@grammerToArray[@@arrayIndex].to_s[3,1] == "1" or "2" or "3" or "4" or "5" or "6" or "7"

      
    puts "vbar " +  @@grammerToArray[@@arrayIndex].to_s[0,1] +  @@grammerToArray[@@arrayIndex].to_s[1,1]  + ","  + @@grammerToArray[@@arrayIndex].to_s[3,1]
    


  else

    puts "ERROR UNRECOGNIZED ENTRY AT FOURTH POSITION"
    return false

  end #end of if statement to check for the fourth input

     #after successfully checking all 4 values, we look to see of there is a ; THIS indicate we have a new command to process

     #We need to check if the current index length is correct; with this we can safely compare the ;
  if @@grammerToArray[@@arrayIndex].size == 5 

    if @@grammerToArray[@@arrayIndex].to_s[4,1] == ";"

      puts "vbar " +  @@grammerToArray[@@arrayIndex].to_s[0,1] +  @@grammerToArray[@@arrayIndex].to_s[1,1]  + ","  + @@grammerToArray[@@arrayIndex].to_s[3,1] + ";"


          #move the counter and keep GOING
          @@arrayIndex = @@arrayIndex + 1
          checkNextStatement
          return true
        else

          puts "Error at pos: " + "expected ;"
          return false

        end#end internal loop to check for ;


      else #It must be 4 chars
      
        @@arrayIndex = @@arrayIndex + 1
          checkNextStatement

      end #end of loop to check if it has 5 chars

   
return true

end#end of checkVbarQuery

#
#
#
def checkHbarQuery

  #the index has already been moved

  #checks the if the first number is valid
  if @@grammerToArray[@@arrayIndex].to_s[0,1] == "1" or "2" or "3" or "4" or "5" or "6" or "7"# and @@grammerToArray[@@arrayIndex].to_s.include? ";" #CHECKS if it has a ;
  
  
  
      puts  @@grammerToArray[@@arrayIndex-1].to_s + " WAS THE LAST ENTRY"


  end#end of if statement to check for the first input

  
  if @@grammerToArray[@@arrayIndex].to_s[1,1] == "1" or "2" or "3" or "4" or "5" or "6" or "7"

      puts "to " + @@grammerToArray[@@arrayIndex-1].to_s +  " "+@@grammerToArray[@@arrayIndex].to_s[0,1] + " <y>,<y>"+ " end"

  end#end of if statement to check for the second input

 #checks for ,
  if @@grammerToArray[@@arrayIndex].to_s[2,1] == ","

    puts "to " + @@grammerToArray[@@arrayIndex-1].to_s +  " "+@@grammerToArray[@@arrayIndex].to_s[0,1] +@@grammerToArray[@@arrayIndex].to_s[1,1] +     ",<y>"+ " end"


  end #end of if statement to check for the third input

     #checks for last y
  if @@grammerToArray[@@arrayIndex].to_s[3,1] == "1" or "2" or "3" or "4" or "5" or "6" or "7"

      

    puts "to " + @@grammerToArray[@@arrayIndex-1].to_s +  " "+@@grammerToArray[@@arrayIndex].to_s[0,1] +@@grammerToArray[@@arrayIndex].to_s[1,1] + ","    + @@grammerToArray[@@arrayIndex].to_s[3,1]      + " end"


  end #end of if statement to check for the fourth input

     #after successfully checking all 4 values, we look to see of there is a ; THIS indicate we have a new command to process

     #We need to check if the current index length is correct; with this we can safely compare the ;
  if @@grammerToArray[@@arrayIndex].size == 5 

    if @@grammerToArray[@@arrayIndex].to_s[4,1] == ";"

         puts "WE HAVE A SEMICOLON KEEP GOING!!!"

          #move the counter and keep GOING
          @@arrayIndex = @@arrayIndex + 1
          checkNextStatement

        else

          puts "Error at pos: " + "expected ;"


        end#end internal loop to check for ;

      end #end of loop to check if it has 5 chars
	  
	  
	  
	  
	  

end#end of checkHbarQuery method



def checkFillQuery

#the index has already been moved

  #checks the if the first number is valid
  if @@grammerToArray[@@arrayIndex].to_s[0,1] == "1" or "2" or "3" or "4" or "5" or "6" or "7"# and @@grammerToArray[@@arrayIndex].to_s.include? ";" #CHECKS if it has a ;
  
  
  
      puts  @@grammerToArray[@@arrayIndex-1].to_s + " WAS THE LAST ENTRY"


  end#end of if statement to check for the first input

  #check the if the second number is valid
  if @@grammerToArray[@@arrayIndex].to_s[1,1] == "1" or "2" or "3" or "4" or "5" or "6" or "7"

      puts "to " + @@grammerToArray[@@arrayIndex-1].to_s +  " "+@@grammerToArray[@@arrayIndex].to_s[0,1] + " <y>,<y>"+ " end"

  end#end of if statement to check for the second input

 

     #after successfully checking all 4 values, we look to see of there is a ; THIS indicate we have a new command to process

     #We need to check if the current index length is correct; with this we can safely compare the ;
  if @@grammerToArray[@@arrayIndex].size == 3 

    if @@grammerToArray[@@arrayIndex].to_s[2,1] == ";"

         puts "WE HAVE A SEMICOLON KEEP GOING!!!"

          #move the counter and keep GOING
          @@arrayIndex = @@arrayIndex + 1
          checkNextStatement

        else

          puts "Error at pos: " + "expected ;"


        end#end internal loop to check for ;

      end #end of loop to check if it has 5 chars




end#END OF checkFillQuery






end #end of class