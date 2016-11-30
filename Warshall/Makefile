LWD = $(shell pwd)
OBJ_DIR = $(LWD)/obj
SRC_DIR = $(LWD)/src
BIN_DIR = $(LWD)/bin
COMMON_DIR = $(LWD)/common
INCLUDE_DIR = $(LWD)/inc
TEST_DIR = $(LWD)/test 

INCLUDE_OPTS = -I./inc/  -I$(COMMON_DIR)/inc
CC = gcc

CFLAGS = -g -Wall -B $(SRC_DIR) -B $(OBJ_DIR)

OBJS = $(OBJ_DIR)/main.o $(OBJ_DIR)/warshall.o 
COMMON_OBJS = $(OBJ_DIR)/heapSort.o $(OBJ_DIR)/directedGraph.o $(OBJ_DIR)/dataStructs.o $(OBJ_DIR)/utils.o

all: ./bin/warshall 

./bin/warshall: mkdir_obj make_common
	cd $(SRC_DIR); make -B all; cd $(LWD); $(CC) -I$(INC_DIR) -I$(COMMON_DIR) $(CFLAGS) -o ./bin/warshall $(OBJS) $(COMMON_OBJS)

mkdir_obj:
	mkdir -p obj

make_common: 
	cd $(COMMON_DIR); make -B all; cp ./obj/*.o $(OBJ_DIR); cd $(LWD)


	
test4:  ./bin/warshall
	./bin/warshall ./testcases/graph4.txt
	
test5:  ./bin/warshall
	./bin/warshall ./testcases/graph5.txt
	
clean:
	rm -f ./bin/warshall $(OBJ_DIR)/*.o core
	cd $(COMMON_DIR); make clean; cd $(LWD)
