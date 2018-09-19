# compiler/flags
CC =  g++
CFLAGS = -I. -c
LFLAGS = -lGL -lGLEW -lglfw

# main output file
BDIR = ./bin
OUT = $(BDIR)/engine

# compiled objects
ODIR = ./obj
OBJ = $(wildcard $(ODIR)/*.o)

# source files
SDIR = ./src
SRC = $(wildcard $(SDIR)/*.cpp)

# dependencies
DEP = $(wildcard $(SDIR)/*.h)

.PHONY: all

all: $(OUT)

$(OUT): $(OBJ)
	$(CC) $^ $(LFLAGS) -o $@

$(ODIR)/%.o: $(SDIR)/%.cpp $(DEP)
	$(CC) $(CFLAGS) $< -o $@
