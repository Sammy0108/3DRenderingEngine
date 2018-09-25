CC =  g++
CFLAGS = -I. -c
LFLAGS = -lGL -lGLEW -lglfw

BDIR = ./bin

ifeq ($(OS), Windows_NT)
	
	OUT = $(BDIR)/engine.exe
	LFLAGS += -lopengl32

else 
	
	OUT = $(BDIR)/engine

endif

SDIR = ./src
SRC = $(wildcard $(SDIR)/*.cpp)

ODIR = ./obj
OBJ = $(patsubst $(SDIR)/%.cpp, $(ODIR)/%.o, $(SRC))

DEP = $(wildcard $(SDIR)/*.h)

.PHONY: all

all: $(OUT)

$(OUT): $(OBJ)
	$(CC) $^ $(LFLAGS) -o $@

$(ODIR)/%.o: $(SDIR)/%.cpp $(DEP)
	$(CC) $(CFLAGS) $< -o $@
