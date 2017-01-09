LWD = $(shell pwd)
OBJ_DIR = $(LWD)/obj
SRC_DIR = $(LWD)/src
DATA_DIR = $(LWD)/data
BIN_DIR = $(LWD)/bin
INCLUDE_DIR = $(LWD)/include
COMMON_DIR = $(LWD)/common
TEST_DIR = $(LWD)/test

CC = gcc
CFLAGS = -g -Wall -I$(INCLUDE_DIR) -I$(COMMON_DIR)/include 

COMMON_OBJS = $(COMMON_DIR)/obj/DFA.o $(COMMON_DIR)/obj/Heap.o $(COMMON_DIR)/obj/DirectedGraph.o $(COMMON_DIR)/obj/Matrix.o $(COMMON_DIR)/obj/Queue.o  $(COMMON_DIR)/obj/Utilities.o

all: dijkstra_sssp_test matrixMultiply_test priorityQueue_test DFA_test

common: $(COMMON_OBJS)
	cd $(COMMON_DIR); make ; cd $(LWD)

matrixMultiply_test: common
	cd $(OBJ_DIR); $(CC) $(CFLAGS) -o $(BIN_DIR)/matrixMultiply_test $(TEST_DIR)/matrixMultiply_test.c $(COMMON_OBJS); cd $(LWD)

priorityQueue_test: common
	cd $(OBJ_DIR); $(CC) $(CFLAGS) -o $(BIN_DIR)/priorityQueue_test $(TEST_DIR)/priorityQueue_test.c $(COMMON_OBJS); cd $(LWD)

dijkstra_sssp_test: common
	cd $(OBJ_DIR); $(CC) $(CFLAGS) -o $(BIN_DIR)/dijkstra_sssp_test $(SRC_DIR)/dijkstra_sssp.c $(TEST_DIR)/dijkstra_sssp_test.c $(COMMON_OBJS); cd $(LWD)

DFA_test: common
	cd $(OBJ_DIR); $(CC) $(CFLAGS) -o $(BIN_DIR)/DFA_test $(TEST_DIR)/DFA_test.c $(COMMON_OBJS); cd $(LWD)



clean:
	rm -f $(BIN)/algo*_test $(OBJ_DIR)/*.o $(OBJ_DIR)/*.s $(OBJ_DIR)/*.i core
