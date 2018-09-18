CC =  g++
BIN = ./bin
SRC = ./src
OBJ = ./obj
EXE = $(BIN)/test.exe
OBJS = $(OBJ)/window.o $(OBJ)/main.o
SRCS = $(SRC)/window.cpp $(SRC)/main.cpp
LIBS = -lGL -lGLEW -lglfw

all: $(EXE)

$(EXE): $(OBJS)
	$(CC) $^ $(LIBS) -o ../$(EXE) 

$(OBJ)/%.o: $(SRC)/%.cpp
	$(CC) -c $<
