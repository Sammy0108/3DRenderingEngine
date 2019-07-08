#include "window.h"

Window::Window(int width, int height, const std::string& title)
{
	glfwWindowHint(GLFW_RED_BITS, 8);
	glfwWindowHint(GLFW_BLUE_BITS, 8);
	glfwWindowHint(GLFW_GREEN_BITS, 8);
	glfwWindowHint(GLFW_ALPHA_BITS, 8);
	glfwWindowHint(GLFW_DEPTH_BITS, 8);

	glfwWindowHint(GLFW_RESIZABLE, GL_TRUE);
	glfwWindowHint(GLFW_DOUBLEBUFFER, GL_TRUE);

	_handle = glfwCreateWindow(width, height, title.c_str(), NULL, NULL);
	glfwMakeContextCurrent(_handle);

	if(glewInit() != GLEW_OK)
	{
		std::cerr << "GLEW failed to initialize" << std::endl;
		throw GLEW_ERR;
	}

	std::cout << "OpenGL version: " << glGetString(GL_VERSION) << std::endl;

	glEnable(GL_DEPTH_TEST);
	glEnable(GL_CULL_FACE);
	glFrontFace(GL_CCW);
	glCullFace(GL_BACK);
}

void Window::setClearColor(float r, float g, float b, float a)
{
	glClearColor(r, g, b, a);
}

void Window::clear()
{
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
}

void Window::update()
{
	glfwPollEvents();
	glfwSwapBuffers(_handle);
}

int Window::getWidth()
{
	int w, h;
	glfwGetWindowSize(_handle, &w, &h);

	return w;
}

int Window::getHeight()
{
	int w, h;
	glfwGetWindowSize(_handle, &w, &h);

	return h;
}

bool Window::isClosed()
{
	return (bool)glfwWindowShouldClose(_handle);
}

Window::~Window()
{
	glfwDestroyWindow(_handle);
}
