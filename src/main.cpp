#include <iostream>

#include <GL/glew.h>
#include <GLFW/glfw3.h>

#include "error.h"
#include "window.h"

int main(int argc, char** argv)
{
	try 
	{
		if(!glfwInit())
		{
			std::cerr << "GLFW failed to initialize" << std::endl;
			throw 1;
		}

		int maj, min, rev;
		glfwGetVersion(&maj, &min, &rev);

		std::cout << "GLFW version: " << maj << "." << min << "." << rev << std::endl;
		
		Window win(800, 600, "TEST");
		win.setClearColor(0.0f, 0.3f, 0.7f, 1.0f);
		
		while(!win.isClosed())
		{
			win.clear();
			win.update();
		}
	}
	catch(unsigned int e)
	{
		return e;
	}
	
	return 0;
}
