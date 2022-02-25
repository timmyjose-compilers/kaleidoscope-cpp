SRC_DIR := src
INC_DIR := include
OBJ_DIR := obj
BIN_DIR := bin

SRC := $(wildcard $(SRC_DIR)/*.cpp)
OBJ := $(SRC:$(SRC_DIR)/%.cpp=$(OBJ_DIR)/%.o)
EXE := $(BIN_DIR)/toy

CXX := clang++
CPPFLAGS := -I$(INC_DIR) -MMD -MP
CXXFLAGS := -Wall -Werror -Wextra -pedantic -std=c++2a -g -O2
CXXFLAGS += $(llvm-config --cxxflags)

LDFLAGS := $(llvm-config --ldflags)
LDLIBS := $(llvm-config --system-libs --libs all)


.PHONY: all clean

all: $(EXE)

$(EXE): $(OBJ) | $(BIN_DIR)
	$(CXX) $(LDFLAGS) $^ $(LDLIBS) -o $@

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp | $(OBJ_DIR)
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -c $< -o $@

$(BIN_DIR) $(OBJ_DIR):
	mkdir -p $@

clean:
	rm -rf $(OBJ_DIR) $(BIN_DIR)

-include $(OBJ:.o=.d)