#include "OpenGP/GL/Eigen.h"
#include "OpenGP/GL/glfw_helpers.h"
#include "Mesh/Mesh.h"
#include <OpenGP/GL/Application.h>
#include <fstream>

const int width=512, height=512;
#define POINTSIZE 10.0f

const char* line_vshader =
#include "line_vshader.glsl"
;
const char* line_fshader =
#include "line_fshader.glsl"
;

using namespace OpenGP;

typedef Eigen::Transform<float,3,Eigen::Affine> Transform;

const int SUN_ROT_PERIOD = 30;        
const int BIKE_ROT_PERIOD = 2;
const int WHEEL_ROT_PERIOD = 1;
const int MOON_ROT_PERIOD = 9;
const int EARTH_ORBITAL_PERIOD = 10; 
const int SPEED_FACTOR = 1;
    
Mesh sun;
Mesh background;
Mesh moon;
Mesh bike;
Mesh wheel1;
Mesh wheel2;

void init();
std::unique_ptr<Shader> lineShader;
std::unique_ptr<GPUMesh> line;
std::vector<Vec2> controlPoints;

//Read in control points from file
void update() {
    std::ifstream file;
    file.open("../mouse/controls.txt");
    std::string input;
    //load values from file to control points
    for (int i = 0; i < 4; i++) {
        file >> input;
        controlPoints[i].x() = atof(input.c_str());
        file >> input;
        controlPoints[i].y() = atof(input.c_str());
    }
    file.close();
}

void display(){

    //read control points
    update();

    glClear(GL_COLOR_BUFFER_BIT);
    float time_s = glfwGetTime();

    float freq = M_PI*time_s*SPEED_FACTOR;

    // **** Sun transform
    Transform sun_M = Transform::Identity();
    //Set op sun cycle in sky
    float x_sun_orbit = 1*std::cos(-freq/EARTH_ORBITAL_PERIOD);
    float y_sun_orbit = 1*std::sin(-freq/EARTH_ORBITAL_PERIOD);
    //move sun
    sun_M *= Eigen::Translation3f(x_sun_orbit, y_sun_orbit, 0.0);
    //rotate sun
    sun_M *= Eigen::AngleAxisf(freq/SUN_ROT_PERIOD, Eigen::Vector3f::UnitZ());
    //scale_t: make the sun become bigger and smaller over the time!
    float scale_t = 0.01*std::sin(freq);
    sun_M *= Eigen::AlignedScaling3f(0.2 +scale_t, 0.2 +scale_t, 1.0);

    // **** Bike transform
    Transform bike_M = Transform::Identity();
    //Calculate position along bezier curve
    float time_b = (fmod(freq/4,M_PI))/M_PI;
    Vec2 bpoint = std::powf(1-time_b, 3)*controlPoints[0]+3*std::powf(1-time_b, 2)*time_b*controlPoints[1]+3*(1-time_b)*std::powf(time_b, 2)*controlPoints[2]+std::powf(time_b, 3)*controlPoints[3];
    //Move bike along curve
    bike_M *= Eigen::Translation3f(bpoint.x(), bpoint.y(), 0.0);
    //Rotate bike
    bike_M *= Eigen::AngleAxisf(freq/BIKE_ROT_PERIOD, Eigen::Vector3f::UnitZ());
    //Save bike location before it is scaled
    Transform preScaleBike = bike_M;
    //Scale down bike
    bike_M *= Eigen::AlignedScaling3f(0.2, 0.12, 1.0);

    // **** Transform for bikes two wheels, take the position of the bike
    Transform wheel1_M = preScaleBike;
    Transform wheel2_M = preScaleBike;
    //Move the wheels to wheel positions on bike
    wheel1_M *= Eigen::Translation3f(-0.12, -0.06, 0.0);
    wheel2_M *= Eigen::Translation3f(0.12, -0.06, 0.0);
    //Rotate wheels
    wheel1_M *= Eigen::AngleAxisf(-freq*2/WHEEL_ROT_PERIOD, Eigen::Vector3f::UnitZ());
    wheel2_M *= Eigen::AngleAxisf(-freq*2/WHEEL_ROT_PERIOD, Eigen::Vector3f::UnitZ());
    //Scale down wheels
    wheel1_M *= Eigen::AlignedScaling3f(0.065, 0.065, 1.0);
    wheel2_M *= Eigen::AlignedScaling3f(0.065, 0.065, 1.0);



    // **** background transform
    Transform background_M = Transform::Identity();

    // **** Moon transform
    Transform moon_M = Transform::Identity();
    //find moon cycle
    float x_moon_orbit = -(1*std::cos(-freq/EARTH_ORBITAL_PERIOD));
    float y_moon_orbit = -(1*std::sin(-freq/EARTH_ORBITAL_PERIOD));
    //move moon
    moon_M *= Eigen::Translation3f(x_moon_orbit, y_moon_orbit, 0.0);
    // Make the moon spining according to MOON_ROT_PERIOD
    moon_M *= Eigen::AngleAxisf(-freq/MOON_ROT_PERIOD, Eigen::Vector3f::UnitZ());
    // Make the picture of moon smaller and grow and shrink with scale_t
    moon_M *= Eigen::AlignedScaling3f(0.1 +scale_t, 0.1 +scale_t, 1.0);

    // draw all parts of the scene

    //draw sun and moon cycle behind everything
    sun.draw(sun_M.matrix());
    moon.draw(moon_M.matrix());

    //background in the middle
    background.draw(background_M.matrix());

    //draw the bike on top of everything else
    bike.draw(bike_M.matrix());
    wheel1.draw(wheel1_M.matrix());
    wheel2.draw(wheel2_M.matrix());
}


int main(int, char**){
    //start animation
    glfwInitWindowSize(height, width);
    glfwMakeWindow("Assignment 3");
    glfwDisplayFunc(display);
    init();
    glfwMainLoop();

    return EXIT_SUCCESS;
}

void init(){
    glClearColor(1.0f,1.0f,1.0f, 1.0 );

    // Enable alpha blending so texture backgroudns remain transparent
    glEnable (GL_BLEND); glBlendFunc (GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);

    //Init all the meshes
    sun.init();
    background.init();
    moon.init();
    bike.init();
    wheel1.init();
    wheel2.init();


    glClearColor(1,1,1, /*solid*/1.0 );

    //Set up start control points
    controlPoints = std::vector<Vec2>();
    controlPoints.push_back(Vec2(-0.7f,-0.2f));
    controlPoints.push_back(Vec2(-0.7f, 1.0f));
    controlPoints.push_back(Vec2( 0.3f, 0.5f));
    controlPoints.push_back(Vec2( 0.7f, 0.0f));

    //Init meshes as quads
    std::vector<OpenGP::Vec3> quadVert;
    quadVert.push_back(OpenGP::Vec3(-1.0f, -1.0f, 0.0f));
    quadVert.push_back(OpenGP::Vec3(1.0f, -1.0f, 0.0f));
    quadVert.push_back(OpenGP::Vec3(1.0f, 1.0f, 0.0f));
    quadVert.push_back(OpenGP::Vec3(-1.0f, 1.0f, 0.0f));
    std::vector<unsigned> quadInd;
    quadInd.push_back(0);
    quadInd.push_back(1);
    quadInd.push_back(2);
    quadInd.push_back(0);
    quadInd.push_back(2);
    quadInd.push_back(3);
    sun.loadVertices(quadVert, quadInd);
    background.loadVertices(quadVert, quadInd);
    moon.loadVertices(quadVert, quadInd);
    bike.loadVertices(quadVert, quadInd);
    wheel1.loadVertices(quadVert, quadInd);
    wheel2.loadVertices(quadVert, quadInd);

    //Load tex coords
    std::vector<OpenGP::Vec2> quadTCoord;
    quadTCoord.push_back(OpenGP::Vec2(0.0f, 0.0f));
    quadTCoord.push_back(OpenGP::Vec2(1.0f, 0.0f));
    quadTCoord.push_back(OpenGP::Vec2(1.0f, 1.0f));
    quadTCoord.push_back(OpenGP::Vec2(0.0f, 1.0f));
    sun.loadTexCoords(quadTCoord);
    background.loadTexCoords(quadTCoord);
    moon.loadTexCoords(quadTCoord);
    bike.loadTexCoords(quadTCoord);
    wheel1.loadTexCoords(quadTCoord);
    wheel2.loadTexCoords(quadTCoord);

    //Load textures
    sun.loadTextures("sun.png");
    moon.loadTextures("moon.png");
    background.loadTextures("back.png");
    bike.loadTextures("Ninja.png");
    wheel1.loadTextures("tire.png");
    wheel2.loadTextures("tire.png");
}
