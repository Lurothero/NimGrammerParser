# for pixie library to work, 
#go to shell and type: nimble install pixie
import pixie
import strutils
import std/math
#import std/[strformat]

let image = newImage(511, 511)
image.fill(rgb(255, 255, 255))

#########################################################################
#Draw grid lines with a scale of 16 (512x512) and point/dot in the center
proc drawGrid()=
  let linePath = newPath()
  let pointPath = newPath()
  let axesPath = newPath()

  let lineImage = newImage(511, 511)
  let pointImage = newImage(511, 511)
  let axesImage = newImage(511, 511)

  var counter = 0.0

  #create grid lines
  for i in 1..32:
    counter = counter + 1.0
    var series = 16.0*counter
    linePath.moveTo(0.0, series)
    linePath.lineTo(512.0,series)
    linePath.moveTo(series, 0.0)
    linePath.lineTo(series, 512.0) 
  
  #create the x and y axes 
  axesPath.moveTo(256.0, 0)
  axesPath.lineTo(256.0, 512.0)
  axesPath.moveTo(0, 256.0)
  axesPath.lineTo(512.0, 256.0)
  
  #color lines rgb(153, 255, 153)  rgb(0, 230, 0) rgb(204, 255, 204),rgb(127, 250, 188) rgb(175, 252, 214)
  lineImage.strokePath(linePath, rgb(127, 250, 188))
  axesImage.strokePath(axesPath, rgb(0, 0, 102))

  #Creates a dot in the center of the graph
  pointPath.ellipse(256.0, 256.0, 4.0, 4.0)

  #Fills/color the dot 
  pointImage.fillPath(pointPath, rgb(255, 0, 102))   

  #draw the line image before point/dot  
  image.draw(lineImage)
  image.draw(axesImage)
  image.draw(pointImage)  

  
##########################################################
#Draws a circle of center (x,y) with radius touching (x,y)  
proc drawCircle(x, y, x2, y2: float)=
  let radius = sqrt(((x2 - x)*(x2 - x)) + ((y2 - y)*(y2 - y)))
  let
    cx = x
    cy = y  
    rx = radius
    ry = radius

  let circlePath = newPath()
  let centerPath = newPath()
  let linePath = newPath()
  let pointPath = Path()
  
  #creates and draws a line from center (x, y) to the vertex (x2, y2)
  linePath.moveTo(cx, cy)
  linePath.lineTo(x2, y2)
  let lineImage = newImage(511, 511)
  lineImage.strokePath(linePath, rgb(0, 0, 102))
  image.draw(lineImage)

  #Creates and draw circle path given center and point
  circlePath.ellipse(cx, cy, rx, ry)
  let circleImage = newImage(511, 511)
  circleImage.strokePath(circlePath, rgb(0, 0, 102))
  image.draw(circleImage)

  #Creates and draw a point on the graph marking center of circle
  centerPath.ellipse(cx, cy, 3.0, 3.0)
  let centerImage = newImage(511, 511)
  centerImage.fillPath(centerPath, rgb(0, 0, 102))  
  image.draw(centerImage)

  #Creates and draw a point on the graph marking center of circle
  pointPath.ellipse(x2, y2, 3.0, 3.0)
  let pointImage = newImage(511, 511)
  pointImage.fillPath(pointPath, rgb(0, 0, 102))  
  image.draw(pointImage)

#Fill an area given atleast one point
proc fillArea()=
  let area = newPath()
  let areaImage = newImage(511, 511)
  let
    px = 100.0
    py = 100.0
    px2 = 200.0
    py2 = 200.0
    clockwise = true

  area.rect(px, py, px2, py2, clockwise)  
  areaImage.fillPath(area, rgb(255, 0, 102))
  image.draw(areaImage)


####################################################
#Draw x and y axes where axes ends at x and y values
proc drawAxes(xy: string)=
  var font = readFont("Roboto-Regular_1.ttf")
  font.size = 16

  var num = 230.0
  var xnum = 268.0
  var abc = "abcdefghi"
  let minus = 16.0
  let xplus = 16.0

  #Checks for the x axis label and labels it correctly
  if xy[0] == abc[8]:
    for i in 0..8:
      let xlabel = $abc[i]            
      image.fillText(font.typeset(xlabel, vec2(180, 180)), translate(vec2(xnum, 260)))
      xnum = xnum + xplus
  elif xy[0] == abc[7]:
    for i in 0..7:
      let xlabel = $abc[i]      
      image.fillText(font.typeset(xlabel, vec2(180, 180)), translate(vec2(xnum, 260)))
      xnum = xnum + xplus
  elif xy[0] == abc[6]:
    for i in 0..6:
      let xlabel = $abc[i]      
      image.fillText(font.typeset(xlabel, vec2(180, 180)), translate(vec2(xnum, 260)))
      xnum = xnum + xplus
  elif xy[0] == abc[5]:
    for i in 0..5:
      let xlabel = $abc[i]      
      image.fillText(font.typeset(xlabel, vec2(180, 180)), translate(vec2(xnum, 260)))
      xnum = xnum + xplus
  elif xy[0] == abc[4]:
    for i in 0..4:
      let xlabel = $abc[i]      
      image.fillText(font.typeset(xlabel, vec2(180, 180)), translate(vec2(xnum, 260)))
      xnum = xnum + xplus
  elif xy[0] == abc[3]:
    for i in 0..3:
      let xlabel = $abc[i]      
      image.fillText(font.typeset(xlabel, vec2(180, 180)), translate(vec2(xnum, 260)))
      xnum = xnum + xplus
  elif xy[0] == abc[2]:
    for i in 0..2:
      let xlabel = $abc[i]           
      image.fillText(font.typeset(xlabel, vec2(180, 180)), translate(vec2(xnum, 260)))
      xnum = xnum + xplus
  elif xy[0] == abc[1]:
    for i in 0..1:
      let xlabel = $abc[i]      
      image.fillText(font.typeset(xlabel, vec2(180, 180)), translate(vec2(xnum, 260)))
      xnum = xnum + xplus
  elif xy[0] == abc[0]:
    image.fillText(font.typeset("a", vec2(180, 180)), translate(vec2(268, 260)))
    
  #Checks for y axis label and labels it properly
  if xy[2] == '9':    
    for i in 1..9:
      let y = intToStr(i)          
      image.fillText(font.typeset(y, vec2(180, 180)), translate(vec2(236, num)))      
      num = num - minus
  elif xy[2] == '8':    
    for i in 1..8:
      let y = intToStr(i)          
      image.fillText(font.typeset(y, vec2(180, 180)), translate(vec2(236, num)))      
      num = num - minus    
  elif xy[2] == '7':    
    for i in 1..7:
      let y = intToStr(i)          
      image.fillText(font.typeset(y, vec2(180, 180)), translate(vec2(236, num)))      
      num = num - minus    
  elif xy[2] == '6':    
    for i in 1..6:
      let y = intToStr(i)          
      image.fillText(font.typeset(y, vec2(180, 180)), translate(vec2(236, num)))      
      num = num - minus          
  elif xy[2] == '5':    
    for i in 1..5:
      let y = intToStr(i)          
      image.fillText(font.typeset(y, vec2(180, 180)), translate(vec2(236, num)))      
      num = num - minus
  elif xy[2] == '4':    
    for i in 1..4:
      let y = intToStr(i)          
      image.fillText(font.typeset(y, vec2(180, 180)), translate(vec2(236, num)))      
      num = num - minus
  elif xy[2] == '3':    
    for i in 1..3:
      let y = intToStr(i)          
      image.fillText(font.typeset(y, vec2(180, 180)), translate(vec2(236, num)))      
      num = num - minus
  elif xy[2] == '2':    
    for i in 1..2:
      let y = intToStr(i)          
      image.fillText(font.typeset(y, vec2(180, 180)), translate(vec2(236, num)))      
      num = num - minus
  elif xy[2] == '1':    
    image.fillText(font.typeset("1", vec2(180, 180)), translate(vec2(236, 102)))

  #writes x and y on the x and y axis
  image.fillText(font.typeset("x", vec2(180, 180)), translate(vec2(496, 260)))
  image.fillText(font.typeset("y", vec2(180, 180)), translate(vec2(236, 8)))

######################################################
#Draws rectangle given two vertices
proc drawRectangle(x1, y1, x2, y2: float)=  
  let rectPath = newPath()
  let p1Path = Path()
  let p2Path = Path()
  let
    rex = x1
    rey = y1
    rew = x2-x1
    reh = y2-y1
    clockwise = true 

  #creates the first vertex used
  p1Path.ellipse(x1, y1, 3.0, 3.0)
  let p1Image = newImage(511, 511)
  p1Image.fillPath(p1Path, rgb(0, 0, 102))  
  image.draw(p1Image)

  #creates the second vertex used
  p2Path.ellipse(x2, y2, 3.0, 3.0)
  let p2Image = newImage(511, 511)
  p2Image.fillPath(p2Path, rgb(0, 0, 102))  
  image.draw(p2Image)

  #alternative way to draw rectangle
  #let ctx = newContext(image)
  #ctx.fillStyle = rgb(255, 0, 0)
  #ctx.lineWidth = 5
  #ctx.strokeRect(rect(rex, rey, rew, reh))   

  rectPath.rect(rex, rey, rew, reh, clockwise)
  let rectangleImage = newImage(511, 511)
  rectangleImage.strokePath(rectPath, rgb(0, 0, 102))

  image.draw(rectangleImage)

###########################################################
#Draws triangle based on three coordinates (x,y)
proc drawTriangle(x, y, x2, y2, x3, y3: float)=
  let linePath = newPath()
  let lineImage = newImage(511, 511)  

  let
    tx1 = x
    ty1 = y
    tx2 = x2
    ty2 = y2
    tx3 = x3
    ty3 = y3  

  linePath.moveTo(tx1, ty1)
  linePath.lineTo(tx2, ty2)  
  linePath.lineTo(tx3, ty3)  
  linePath.lineTo(tx1, ty1)
  linePath.closePath()  

  lineImage.strokePath(linePath, rgb(0, 0, 102))

  image.draw(lineImage)

######################################
#Converts the vertices inputted from user to graph scale (pixel)
proc convertToPixel(vertex, axes: string): float=
  var xval = 272.0   
  var yval = 240.0  

  let xplus = 16.0
  let xlabels = "abcdefghi"
  let yminus = 16.0 
  let ylabels = "123456789" 

  #Coordinates of x axes in pixels
  if axes == "x":
    for i in 0..8:
      if vertex[0] == xlabels[i]:
        let xnew = xval      
        return xnew
      xval = xval + xplus    
  #cooordinates of y axes in pixels
  else:
    for i in 0..8:
      if vertex[1] == ylabels[i]:
        let ynew = yval
        return ynew      
      yval = yval - yminus

###########################################################
#subpgram that accepts array of strings containing commands
proc processGraphic(arr: seq[string])= 
  drawGrid()
  for i in 0..arr.len-1:
    if arr[i] == "axes":      
      var temp = arr[i+1]
      var xy = $temp    #this should contain x.y  
      drawAxes(xy)
      if arr[i+2] == "stop":
        break  
    elif arr[i] == "rec":      
      var temp = arr[i+1]
      var xy = $temp[0..1]
      var xy2 = $temp[3..4]
      let x1 = convertToPixel(xy, "x")
      let y1 = convertToPixel(xy, "y")
      let x2 = convertToPixel(xy2, "x")
      let y2 = convertToPixel(xy2, "y")
      drawRectangle(x1, y1, x2, y2)
      if arr[i+2] == "stop":  #no need to continue looping
        break 
    elif arr[i] == "tri":      
      var temp = $arr[i+1]
      var xy = $temp[0..1]
      var xy2 = $temp[3..4]
      var xy3 = $temp[6..7]
      let x1 = convertToPixel(xy, "x")
      let y1 = convertToPixel(xy, "y")
      let x2 = convertToPixel(xy2, "x")
      let y2 = convertToPixel(xy2, "y")
      let x3 = convertToPixel(xy3, "x")
      let y3 = convertToPixel(xy3, "y") 
      drawTriangle(x1, y1, x2, y2, x3, y3)
      if arr[i+2] == "stop":  #no need to continue looping
        break
    elif arr[i] == "cir":      
      var temp = arr[i+1]
      var xy = $temp[0..1]
      var xy2 = $temp[3..4]
      let x1 = convertToPixel(xy, "x")
      let y1 = convertToPixel(xy, "y")
      let x2 = convertToPixel(xy2, "x")
      let y2 = convertToPixel(xy2, "y")
      drawCircle(x1, y1, x2, y2)  
      if arr[i+2] == "stop":  #no need to continue looping
        break
           
  image.writeFile("graphic.png") 


##################testing all the procedures#####################
#var
  #arrTesting:   seq[string] 

#arrTesting = @["go", "rec", "c6.f3", "cir", "d2.d5", "tri", "c9.a6.e6","axes", "i9", "stop"]
#processGraphic(arrTesting)
