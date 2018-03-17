#include <OpenGP/GL/Application.h>
#include <fstream>

using namespace OpenGP;

const int width=512, height=512;
#define POINTSIZE 10.0f

const char* line_vshader =
#include "line_vshader.glsl"
;
const char* line_fshader =
#include "line_fshader.glsl"
;

void init();
std::unique_ptr<Shader> lineShader;
std::unique_ptr<GPUMesh> line;
std::unique_ptr<GPUMesh> line2;
std::vector<Vec2> controlPoints;
std::vector<Vec2> points;
int numParts = 10;


int main(int, char**){

    Application app;
    init();

    // Mouse position and selected point
    Vec2 position = Vec2(0,0);
    Vec2 *selection = nullptr;

    // Display callback
    Window& window = app.create_window([&](Window&){
        glViewport(0,0,width*2,height*2);
        glClear(GL_COLOR_BUFFER_BIT);
        glPointSize(POINTSIZE);

        lineShader->bind();

        // Draw line red
        lineShader->set_uniform("selection", -1);
        line->set_attributes(*lineShader);
        line->set_mode(GL_LINES);
        line->draw();
        line2->set_attributes(*lineShader);
        line2->set_mode(GL_LINE_STRIP);
        line2->draw();

        // Draw points red and selected point blue
        if(selection!=nullptr) lineShader->set_uniform("selection", int(selection-&controlPoints[0]));
        line->set_mode(GL_POINTS);
        line->draw();

        lineShader->unbind();
    });
    window.set_title("Mouse");
    window.set_size(width, height);

    // Mouse movement callback
    window.add_listener<MouseMoveEvent>([&](const MouseMoveEvent &m){
        // Mouse position in clip coordinates
        Vec2 p = 2.0f*(Vec2(m.position.x()/width,-m.position.y()/height) - Vec2(0.5f,-0.5f));
        if( selection && (p-position).norm() > 0.0f) {
            /// TODO: Make selected control points move with cursor
            selection->x() = position.x();
            selection->y() = position.y();
            line->set_vbo<Vec2>("vposition", controlPoints);

            std::vector<unsigned int> indices2;
            float division;
            for (int i = 0; i <= numParts; i++) {
                division = float(i)/float(numParts);
                Vec2 bpoint = std::powf(1-division, 3)*controlPoints[0]+3*std::powf(1-division, 2)*division*controlPoints[1]+3*(1-division)*std::powf(division, 2)*controlPoints[2]+std::powf(division, 3)*controlPoints[3];
                points[i] = bpoint;
            }

            line2->set_vbo<Vec2>("vposition", points);

            std::ofstream file;
            file.open("controls.txt");
            file<<controlPoints[0].x()<<" "<<controlPoints[0].y()<<std::endl;
            file<<controlPoints[1].x()<<" "<<controlPoints[1].y()<<std::endl;
            file<<controlPoints[2].x()<<" "<<controlPoints[2].y()<<std::endl;
            file<<controlPoints[3].x()<<" "<<controlPoints[3].y()<<std::endl;
            file.close();

        }
        position = p;
    });

    // Mouse click callback
    window.add_listener<MouseButtonEvent>([&](const MouseButtonEvent &e){
        // Mouse selection case
        if( e.button == GLFW_MOUSE_BUTTON_LEFT && !e.released) {
            selection = nullptr;
            for(auto&& v : controlPoints) {
                if ( (v-position).norm() < POINTSIZE/std::min(width,height) ) {
                    selection = &v;
                    break;
                }
            }
        }
        // Mouse release case
        if( e.button == GLFW_MOUSE_BUTTON_LEFT && e.released) {
            if(selection) {
                selection->x() = position.x();
                selection->y() = position.y();
                selection = nullptr;
                line->set_vbo<Vec2>("vposition", controlPoints);

                for (int i = 0; i < controlPoints.size(); i++) {
                    std::cout<<controlPoints[i].x()<<","<<controlPoints[i].y()<<std::endl;
                }

                std::vector<unsigned int> indices2;
                float division;
                for (int i = 0; i <= numParts; i++) {
                    division = float(i)/float(numParts);
                    Vec2 bpoint = std::powf(1-division, 3)*controlPoints[0]+3*std::powf(1-division, 2)*division*controlPoints[1]+3*(1-division)*std::powf(division, 2)*controlPoints[2]+std::powf(division, 3)*controlPoints[3];
                    points[i] = bpoint;
                }

                line2->set_vbo<Vec2>("vposition", points);
            }
        }
    });

    return app.run();
}

void init(){
    glClearColor(1,1,1, /*solid*/1.0 );

    lineShader = std::unique_ptr<Shader>(new Shader());
    lineShader->verbose = true;
    lineShader->add_vshader_from_source(line_vshader);
    lineShader->add_fshader_from_source(line_fshader);
    lineShader->link();

    controlPoints = std::vector<Vec2>();
    controlPoints.push_back(Vec2(-0.7f,-0.2f));
    controlPoints.push_back(Vec2(-0.3f, 0.2f));
    controlPoints.push_back(Vec2( 0.3f, 0.5f));
    controlPoints.push_back(Vec2( 0.7f, 0.0f));

    points = std::vector<Vec2>();
    
    std::vector<unsigned int> indices2;
    float division;
    for (int i = 0; i <= numParts; i++) {
        division = float(i)/float(numParts);
        Vec2 bpoint = std::powf(1-division, 3)*controlPoints[0]+3*std::powf(1-division, 2)*division*controlPoints[1]+3*(1-division)*std::powf(division, 2)*controlPoints[2]+std::powf(division, 3)*controlPoints[3];
        points.push_back(bpoint);

        indices2.push_back(i);
    }

    line = std::unique_ptr<GPUMesh>(new GPUMesh());
    line->set_vbo<Vec2>("vposition", controlPoints);
    std::vector<unsigned int> indices = {0,1,2,3};
    line->set_triangles(indices);

    line2 = std::unique_ptr<GPUMesh>(new GPUMesh());
    line2->set_vbo<Vec2>("vposition", points);
    line2->set_triangles(indices2);
}
