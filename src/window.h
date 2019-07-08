#ifndef WINDOW_H
#define WINDOW_H

#include <iostream>

#include <GL/glew.h>
#include <GLFW/glfw3.h>

#include "error.h"

class Window
{
public:
	Window(int, int, const std::string&);
	void setClearColor(float, float, float, float);
	void clear();
	void update();
	int getWidth();
	int getHeight();
	bool isClosed();
	~Window();

private:
	GLFWwindow* _handle;
};

#endif