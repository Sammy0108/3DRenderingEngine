CC =  g++
BIN = ./bin
SRC = ./src
OBJ = ./obj
OUT = $(BIN)/engine
OBJS = $(OBJ)/window.o $(OBJ)/main.o
SRCS = $(SRC)/window.cpp $(SRC)/main.cpp
LIBS = -lGL -lGLEW -lglfw

all: $(OUT)

$(OUT): $(OBJS)
	$(CC) $^ $(LIBS) -o $(OUT) 

$(OBJ)/%.o: $(SRC)/%.cpp
	$(CC) -c $< -o $@
