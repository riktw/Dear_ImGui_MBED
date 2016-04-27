// ImGui - standalone example application for Glfw + OpenGL 2, using fixed pipeline
// If you are new to ImGui, see examples/README.txt and documentation at the top of imgui.cpp.

#include <string>
#include <iostream>
#include <cstdio>
#include <stdio.h>
#include <unistd.h>
#include <iomanip> 
#include <sstream>
#include <GLFW/glfw3.h>

#include "imgui.h"
#include "imgui_impl_glfw.h"
#include "imgui_internal.h"

#include "serial.h"

#include "test.h"

using std::string;
using std::exception;
using std::cout;
using std::cerr;
using std::endl;
using std::vector;

bool showtestwindow = 0;
int tint, tintold = 0.0;
char buf[255];
int i2;

serial::Serial my_serial("/dev/ttyACM0", 115200, serial::Timeout::simpleTimeout(1000));

static void error_callback(int error, const char* description)
{
    fprintf(stderr, "Error %d: %s\n", error, description);
}

void ShowTestGui(bool * P_opened)
{
	ImGui::Text("Hello world");
	
	if(ImGui::Button("OK"))
	{
		showtestwindow = !showtestwindow;
	}
	
	ImGui::Text("LEDs:");
	static bool led[8] = {false};
	ImGui::Checkbox("##LED1", &led[0]); ImGui::SameLine();
	ImGui::Checkbox("##LED2", &led[1]); ImGui::SameLine();
	ImGui::Checkbox("##LED3", &led[2]); ImGui::SameLine();
	ImGui::Checkbox("##LED4", &led[3]); ImGui::SameLine();
	ImGui::Checkbox("##LED5", &led[4]); ImGui::SameLine();
	ImGui::Checkbox("##LED6", &led[5]); ImGui::SameLine();
	ImGui::Checkbox("##LED7", &led[6]); ImGui::SameLine();
	ImGui::Checkbox("##LED8", &led[7]);
	
	static int ledsold;
	int leds = led[0] + (led[1] << 1) + (led[2] << 2) + (led[3] << 3)  + (led[4] << 4) + (led[5] << 5) + (led[6] << 6) + (led[7] << 7);
	if(ledsold != leds)
	{
		ledsold = leds;
		string test_string;
		test_string = "L";
		for(int i = 0; i < 8; i++)
		{
			if(led[i] == true)
				test_string += "1";
			else
				test_string += "0";
		}
		test_string += "\n";
		size_t bytes_wrote = my_serial.write(test_string);
		cout << "Bytes wrote: " << bytes_wrote << endl;
	}
	
	ImGui::Text("Inputs:");
	static bool input[8] = {false};
	ImGui::Checkbox("##I1", &input[0]); ImGui::SameLine();
	ImGui::Checkbox("##I2", &input[1]); ImGui::SameLine();
	ImGui::Checkbox("##I3", &input[2]); ImGui::SameLine();
	ImGui::Checkbox("##I4", &input[3]); ImGui::SameLine();
	ImGui::Checkbox("##I5", &input[4]); ImGui::SameLine();
	ImGui::Checkbox("##I6", &input[5]); ImGui::SameLine();
	ImGui::Checkbox("##I7", &input[6]); ImGui::SameLine();
	ImGui::Checkbox("##I8", &input[7]);
	
	ImGui::Text("ADCs:");
	
	string buffer;
	static int counter;
	static float adc1arr[100];
	static float adc2arr[100];
	int count = my_serial.readline(buffer, 100, "\n");
	if((count >= 1) && (buffer[0] == 'A'))
	{
		adc1arr[counter] = ((buffer[1]-48) * 10) + (buffer[2]-48);
		adc2arr[counter] = ((buffer[3]-48) * 10) + (buffer[4]-48);
		counter++;
		if(counter >= 100)
			counter = 0;
	}
	else if((count >= 1) && (buffer[0] == 'I'))
	{
		input[0] = buffer[1] - 48;
		input[1] = buffer[2] - 48;
		input[2] = buffer[3] - 48;
		input[3] = buffer[4] - 48;
		input[4] = buffer[5] - 48;
		input[5] = buffer[6] - 48;
		input[6] = buffer[7] - 48;
		input[7] = buffer[8] - 48;
	}
	

	ImGui::PlotLines("Sine", adc1arr, IM_ARRAYSIZE(adc1arr), 0, NULL, 0, 100, ImVec2(0,120));
	ImGui::SameLine();
	static int adc1speed = 1;
	const char* items[] = {"100Khz", "10Khz", "1Khz", "100Hz"};
	ImGui::Combo("Speed##1", &adc1speed, items, IM_ARRAYSIZE(items));

	ImGui::PlotLines("Cosine", adc2arr, IM_ARRAYSIZE(adc2arr), 0, NULL, 0, 100, ImVec2(0,120));
	ImGui::SameLine();
	static int adc2speed = 1;
	ImGui::Combo("Speed##2", &adc2speed, items, IM_ARRAYSIZE(items));
	
	ImGui::Text("DACs:");
	ImGui::SliderInt("DAC value", &tint, 0, 100);
	if(tintold != tint)
	{
		tintold = tint;
		float tfloat = (float)tint/100.0;
		if(tfloat > 1.0)
			tfloat = 1.0;
		string dacstring = "D";
		std::ostringstream buff;
		buff << std::setprecision(2) << tfloat;
		dacstring += buff.str();
		dacstring += "\n";
		size_t bytes_wrote = my_serial.write(dacstring);
		cout << "Bytes wrote: " << bytes_wrote << endl;
	}
	
	
	
	if(ImGui::CollapsingHeader("Help"))
	{
		ImGui::ShowUserGuide();
	}
	
	if(showtestwindow)
	{
		ImGui::ShowTestWindow(&showtestwindow); 
	}
}

int main(int, char**)
{
    // Setup window
    glfwSetErrorCallback(error_callback);
    if (!glfwInit())
        return 1;
    GLFWwindow* window = glfwCreateWindow(1280, 720, "ImGui OpenGL2 example", NULL, NULL);
    glfwMakeContextCurrent(window);

    // Setup ImGui binding
    ImGui_ImplGlfw_Init(window, true);
	
	ImVec4 clear_color = ImColor(114, 144, 154);

	bool showtestgui = 0;
    // Main loop
    while (!glfwWindowShouldClose(window))
    {
        glfwPollEvents();
        ImGui_ImplGlfw_NewFrame();
		
		ShowTestGui(&showtestgui);

        // Rendering
        int display_w, display_h;
        glfwGetFramebufferSize(window, &display_w, &display_h);
        glViewport(0, 0, display_w, display_h);
        glClearColor(clear_color.x, clear_color.y, clear_color.z, clear_color.w);
        glClear(GL_COLOR_BUFFER_BIT);
        ImGui::Render();
        glfwSwapBuffers(window);
    }

    // Cleanup
    ImGui_ImplGlfw_Shutdown();
    glfwTerminate();

    return 0;
}