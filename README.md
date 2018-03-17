# CSC 305 Introduction to Computer Graphics - Spring 2018

## Assignment 3

## Scott Goerzen
###V00844662

For this assignment, a animation and a editable bezier curve window were created.

The animation is of a mountain scene, with the sun and moon cycling in the background.
There is also for the main animation a motorcycle jumping across the scene following a 
bezier curve. The motorcycle also has spinning tires as the second level transformation
heirarchy. 

The mouse capture window simply shows four control points and then the bezier curve drawn 
between them. The Control points are connected in pairs and is standard for the bezier curve
points. Each point can be clicked on and moved around with the scene showing the resulting
curve as it moves. 

The mouse capture window also writes the control points to a file from which the animation
reads them, so as when both are run together, the animation changes in realtime to 
follow the changes made to the curve in the mouse capture window.

The advanced features I implemented include:

    - Textured quads with alpha-blending
    - Code quality
    - Git repository -> https://github.com/ScottGoerzen/CSC305A3
    - Animation saved as a mp4 with screen capture
    - Software documentation

For the code quality, not sure exactly what is meant, but It is fairly organized into functions
looks fairly clean.

Also not sure if the github link will work since it is a private repository, but I can
give access if needed.

