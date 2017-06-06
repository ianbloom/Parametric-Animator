# Parametric-Animator
Processing pplication that animates parametric equations according to user input.

The Control-P5 library was used to skin the buttons and process user input.

This application produces parametric equations of the form:
  x = cos((a+A)t)^e - cos((b+B)t)^f
  y = sin((c+C)t)^g - sin((d+D)t)^h
  
Users can control the values of {a,b,c,d,e,f,g,h} to produce different shapes.
Users can control how many t values the program renders, determining the length of the line.

Lastly, the parametric equations are animated by modifying {A,B,C,D} over time, and users can control this rate of change as well.

As a basic guideline, modifying A and B will cause the equation to translate along the x-axis and modifying C and D will cause the equation to translate along the y-axis

Have Fun!
