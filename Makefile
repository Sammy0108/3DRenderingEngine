# compiler/flags
CC =  g++
CFLAGS = -I. -c
LFLAGS = -lGL -lGLEW -lglfw

# main output file
BDIR = ./bin
OUT = $(BDIR)/engine

# source files
SDIR = ./src
SRC = $(wildcard $(SDIR)/*.cpp)

# compiled objects
ODIR = ./obj
OBJ = $(patsubst $(SDIR)/%.cpp, $(ODIR)/%.o, $(SRC))

# dependencies
DEP = $(wildcard $(SDIR)/*.h)

.PHONY: all

all: $(OUT)

$(OUT): $(OBJ)
	$(CC) $^ $(LFLAGS) -o $@

$(ODIR)/%.o: $(SDIR)/%.cpp $(DEP)
	$(CC) $(CFLAGS) $< -o $@
