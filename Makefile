LWD = $(shell pwd)
OBJ_DIR = $(LWD)/obj
SRC_DIR = $(LWD)/src
DATA_DIR = $(LWD)/data
BIN_DIR = $(LWD)/bin
INCLUDE_DIR = $(LWD)/include 
TEST_DIR = $(LWD)/test 

CC = gcc
CFLAGS = -g -Wall -I$(INCLUDE_DIR)

LIB_OBJ = $(OBJ_DIR)/algo_lib.o 
UTIL_OBJ = $(OBJ_DIR)/data_utilities.o

TEST_OBJS = $(OBJ_DIR)/test.o $(LIB_OBJ) $(UTIL_OBJ)

OBJS1 = $(OBJ_DIR)/algo1_test.o $(LIB_OBJ) $(UTIL_OBJ) 
OBJS2 = $(OBJ_DIR)/algo2_test.o $(LIB_OBJ) $(UTIL_OBJ)
OBJS3 = $(OBJ_DIR)/algo3_test.o $(LIB_OBJ) $(UTIL_OBJ)
OBJS4 = $(OBJ_DIR)/algo4_test.o $(LIB_OBJ) $(UTIL_OBJ)
OBJS5 = $(OBJ_DIR)/algo5_test.o $(LIB_OBJ) $(UTIL_OBJ)
OBJS6 = $(OBJ_DIR)/algo6_test.o $(LIB_OBJ) $(UTIL_OBJ)


test: $(BIN_DIR)/test
1: $(BIN_DIR)/algo1_test 
2: $(BIN_DIR)/algo2_test
3: $(BIN_DIR)/algo3_test
4: $(BIN_DIR)/algo4_test
5: $(BIN_DIR)/algo5_test
6: $(BIN_DIR)/algo6_test
PQ : priorityQueueTest

all: 1 2 3 4 5 6 test

$(LIB_OBJ):
	cd $(OBJ_DIR); $(CC) $(CFLAGS) -c $(SRC_DIR)/algo_lib.c; cd $(LWD)

$(UTIL_OBJ):
	cd $(OBJ_DIR); $(CC) $(CFLAGS) -c $(SRC_DIR)/data_utilities.c; cd $(LWD)

$(BIN_DIR)/test: $(TEST_OBJS) $(SRC_DIR)/test.c 
	$(CC) -o $(BIN_DIR)/test $(TEST_OBJS)
$(OBJ_DIR)/test.o:
	cd $(OBJ_DIR); $(CC) $(CFLAGS) -c $(SRC_DIR)/test.c; cd $(LWD)

$(BIN_DIR)/algo6_test: $(OBJS6) $(SRC_DIR)/algo6_test.c 
	$(CC) -o $(BIN_DIR)/algo6_test $(OBJS6)
$(OBJ_DIR)/algo6_test.o:
	cd $(OBJ_DIR); $(CC) $(CFLAGS) -c $(SRC_DIR)/algo6_test.c; cd $(LWD)

$(BIN_DIR)/algo5_test: $(OBJS5) $(SRC_DIR)/algo5_test.c 
	$(CC) -o $(BIN_DIR)/algo5_test $(OBJS5)
$(OBJ_DIR)/algo5_test.o:
	cd $(OBJ_DIR); $(CC) $(CFLAGS) -c $(SRC_DIR)/algo5_test.c; cd $(LWD)

$(BIN_DIR)/algo4_test: $(OBJS4) $(SRC_DIR)/algo4_test.c 
	$(CC) -o $(BIN_DIR)/algo4_test $(OBJS4)

$(OBJ_DIR)/algo4_test.o:
	cd $(OBJ_DIR); $(CC) $(CFLAGS) -c $(SRC_DIR)/algo4_test.c; cd $(LWD)


$(BIN_DIR)/algo1_test: $(OBJS1) $(SRC_DIR)/algo1_test.c 
	$(CC) -o $(BIN_DIR)/algo1_test $(OBJS1)
$(OBJ_DIR)/algo1_test.o:
	cd $(OBJ_DIR); $(CC) $(CFLAGS) -c $(SRC_DIR)/algo1_test.c; cd $(LWD)

$(BIN_DIR)/algo2_test: $(OBJS2) $(SRC_DIR)/algo1_test.c 
	$(CC) -o $(BIN_DIR)/algo2_test $(OBJS2)
$(OBJ_DIR)/algo2_test.o:
	cd $(OBJ_DIR); $(CC) $(CFLAGS) -c $(SRC_DIR)/algo2_test.c; cd $(LWD)

$(BIN_DIR)/algo3_test: $(OBJS3) $(SRC_DIR)/algo3_test.c 
	$(CC) -o $(BIN_DIR)/algo3_test $(OBJS3)
$(OBJ_DIR)/algo3_test.o:
	cd $(OBJ_DIR); $(CC) $(CFLAGS) -c $(SRC_DIR)/algo3_test.c; cd $(LWD)


priorityQueueTest: data_utilities.o
	$(CC)  -g -I./include -o $(BIN_DIR)/priorityQueueTest  $(SRC_DIR)/priorityQueue.c test/priorityQueueTest.c $(OBJ_DIR)/data_utilities.o

data_utilities.o:
	$(CC)  -g -c -I./include -o $(OBJ_DIR)/data_utilities.o $(SRC_DIR)/data_utilities.c

$(SRC_DIR)/.c.o:
	cd $(OBJ_DIR); $(CC) $(CFLAGS) -c $(SRC_DIR/$<; cd $(LWD)

$(OBJ_DIR)/.c.o:
	cd $(OBJ_DIR); $(CC) $(CFLAGS) -c $(SRC_DIR)/$<; cd $(LWD)

clean:
	rm -f $(BIN)/algo*_test $(OBJ_DIR)/*.o $(OBJ_DIR)/*.s $(OBJ_DIR)/*.i core
