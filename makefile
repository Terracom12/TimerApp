TARGET    := Timer

CXX       := g++
CXX_FLAGS := -std=c++17 -ggdb

BUILD_DIR := bin
SRC_DIR   := src

SOURCES   := $(wildcard $(SRC_DIR)/*.cpp)
OBJS      := $(subst $(SRC_DIR),$(BUILD_DIR),$(subst .cpp,.o,$(SOURCES)))

INC_DIRS  := include libs/glfw/include libs/glad/include
INC_FLAGS := $(addprefix -I,$(INC_DIRS))

LIBS := GL X11 pthread Xi dl Xrandr m glfw
LIB_FlAGS := $(addprefix -l,$(LIBS))



all: $(BUILD_DIR)/$(TARGET)

$(BUILD_DIR)/$(TARGET): $(OBJS)
	$(CXX) $(OBJS) $(LIB_FlAGS) -o $@

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp
	$(CXX) $(INC_FLAGS) $(CXX_FLAGS) -c $< -o $@

.PHONY: clean
clean:
	rm -r $(BUILD_DIR)/*