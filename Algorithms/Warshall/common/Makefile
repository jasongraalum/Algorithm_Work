LWD = $(shell pwd)
OBJ_DIR = $(LWD)/obj
SRC_DIR = $(LWD)/src
INCLUDE_DIR = $(LWD)/inc

INCLUDE_OPTS = -I./inc/ 
CC = gcc

CFLAGS = -g -Wall -B $(SRC_DIR) -B $(OBJ_DIR)

COMMON_OBJS = $(OBJ_DIR)/heapSort.o $(OBJ_DIR)/directedGraph.o $(OBJ_DIR)/dataStructs.o $(OBJ_DIR)/utils.o

all:  
	cd ./src; make -B all;  cd $(LWD)

mkdir_obj:
	mkdir -p obj

clean:
	rm -f $(OBJ_DIR)/*.o
