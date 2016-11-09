LWD = $(shell pwd)
OBJ_DIR = $(LWD)/obj
SRC_DIR = $(LWD)/src
DATA_DIR = $(LWD)/data
BIN_DIR = $(LWD)/bin
INCLUDE_DIR = $(LWD)/include 

CC = gcc
CFLAGS = -save-temps -g -Wall -I$(INCLUDE_DIR)

LIB_OBJS = $(OBJ_DIR)/algo_lib.o $(OBJ_DIR)/data_utilties.o

TEST_OBJS = $(OBJ_DIR)/test.o $(LIB_OBJS)

OBJS1 = $(OBJ_DIR)/algo1_test.o $(LIB_OBJS) 
OBJS2 = $(OBJ_DIR)/algo2_test.o $(LIB_OBJS) 
OBJS3 = $(OBJ_DIR)/algo3_test.o $(LIB_OBJS) 
OBJS4 = $(OBJ_DIR)/algo4_test.o $(LIB_OBJS) 
OBJS5 = $(OBJ_DIR)/algo5_test.o $(LIB_OBJS) 
OBJS6 = $(OBJ_DIR)/algo6_test.o $(LIB_OBJS) 


test: $(BIN_DIR)/test
1: $(BIN_DIR)/algo1_test 
2: $(BIN_DIR)/algo2_test
3: $(BIN_DIR)/algo3_test
4: $(BIN_DIR)/algo4_test
5: $(BIN_DIR)/algo5_test
6: $(BIN_DIR)/algo6_test

all: 1 2 3 4 5 6

$(BIN_DIR)/test: $(TEST_OBJS) $(SRC_DIR)/test.c 
	$(CC) -o $(BIN_DIR)/test $(TEST_OBJS)
$(OBJ_DIR)/test.o:
	cd $(OBJ_DIR); $(CC) $(CFLAGS) -c $(SRC_DIR)/test.c; cd $(LWD)

$(BIN_DIR)/algo6_test: $(OBJS6) $(SRC_DIR)/algo6_test.c 
	$(CC) -o $(BIN_DIR)/algo6_test $(OBJS6)
$(OBJ_DIR)/algo6.o:
	cd $(OBJ_DIR); $(CC) $(CFLAGS) -c $(SRC_DIR)/algo6.c; cd $(LWD)
$(OBJ_DIR)/algo6_test.o:
	cd $(OBJ_DIR); $(CC) $(CFLAGS) -c $(SRC_DIR)/algo6_test.c; cd $(LWD)


$(BIN_DIR)/algo5_test: $(OBJS5) $(SRC_DIR)/algo5_test.c 
	$(CC) -o $(BIN_DIR)/algo5_test $(OBJS5)

$(OBJ_DIR)/algo5.o:
	cd $(OBJ_DIR); $(CC) $(CFLAGS) -c $(SRC_DIR)/algo5.c; cd $(LWD)

$(OBJ_DIR)/algo5_test.o:
	cd $(OBJ_DIR); $(CC) $(CFLAGS) -c $(SRC_DIR)/algo5_test.c; cd $(LWD)



$(BIN_DIR)/algo4_test: $(OBJS4) $(SRC_DIR)/algo4_test.c 
	$(CC) -o $(BIN_DIR)/algo4_test $(OBJS4)

$(OBJ_DIR)/algo4.o:
	cd $(OBJ_DIR); $(CC) $(CFLAGS) -c $(SRC_DIR)/algo4.c; cd $(LWD)

$(OBJ_DIR)/algo4_test.o:
	cd $(OBJ_DIR); $(CC) $(CFLAGS) -c $(SRC_DIR)/algo4_test.c; cd $(LWD)


$(BIN_DIR)/algo1_test: $(OBJS1) $(SRC_DIR)/algo1_test.c 
	$(CC) -o $(BIN_DIR)/algo1_test $(OBJS1)

$(OBJ_DIR)/algo1.o:
	cd $(OBJ_DIR); $(CC) $(CFLAGS) -c $(SRC_DIR)/algo1.c; cd $(LWD)

$(OBJ_DIR)/algo1_test.o:
	cd $(OBJ_DIR); $(CC) $(CFLAGS) -c $(SRC_DIR)/algo1_test.c; cd $(LWD)

$(BIN_DIR)/algo2_test: $(OBJS2) $(SRC_DIR)/algo1_test.c 
	$(CC) -o $(BIN_DIR)/algo2_test $(OBJS2)

$(OBJ_DIR)/algo2.o:
	cd $(OBJ_DIR); $(CC) $(CFLAGS) -c $(SRC_DIR)/algo2.c; cd $(LWD)

$(OBJ_DIR)/algo2_test.o:
	cd $(OBJ_DIR); $(CC) $(CFLAGS) -c $(SRC_DIR)/algo2_test.c; cd $(LWD)

$(BIN_DIR)/algo3_test: $(OBJS3) $(SRC_DIR)/algo1_test.c 
	$(CC) -o $(BIN_DIR)/algo3_test $(OBJS3)

$(OBJ_DIR)/algo3.o:
	cd $(OBJ_DIR); $(CC) $(CFLAGS) -c $(SRC_DIR)/algo3.c; cd $(LWD)

$(OBJ_DIR)/algo3_test.o:
	cd $(OBJ_DIR); $(CC) $(CFLAGS) -c $(SRC_DIR)/algo3_test.c; cd $(LWD)

$(OBJ_DIR)/data_utilities.o:
	cd $(OBJ_DIR); $(CC) $(CFLAGS) -c $(SRC_DIR)/data_utilities.c; cd $(LWD)

$(OBJ_DIR)/.c.o:
	cd $(OBJ_DIR); $(CC) $(CFLAGS) -c $(SRC_DIR)/$<; cd $(LWD)

clean:
	rm -f $(BIN)/algo*_test $(OBJ_DIR)/*.o $(OBJ_DIR)/*.s $(OBJ_DIR)/*.i core
