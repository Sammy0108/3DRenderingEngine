CC =  g++
CFLAGS = -c
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

.PHONY: all test

all: $(OUT) test

$(OUT): $(OBJ)
	$(CC) $^ $(LFLAGS) -o $@

$(ODIR)/%.o: $(SDIR)/%.cpp $(DEP)
	$(CC) $(CFLAGS) $< -o $@

test: $(OUT)
	$(OUT)
