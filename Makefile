BUILD_DIR ?= .
INSTALL_DIR ?= .

STRIP ?= strip

#OPTIONS  = -DSQLITE_OMIT_TRIGGER
#OPTIONS += -DSQLITE_OMIT_WALL

CFLAGS = -Os $(OPTIONS)
VPATH = $(BUILD_DIR)

all: libsqlite3.a

libsqlite3.a:	sqlite3.h sqlite3.c
	mkdir -p $(BUILD_DIR)
	$(CC) $(CFLAGS) -c sqlite3.c -o$(BUILD_DIR)/sqlite3.o
	$(AR) r $(BUILD_DIR)/libsqlite3.a $(BUILD_DIR)/sqlite3.o
	#$(STRIP) $(BUILD_DIR)/libsqlite3.a

sqlite3: shell.c sqlite3.c
	mkdir -p $(BUILD_DIR)
	$(CC) -o $(BUILD_DIR)/sqlite3 shell.c sqlite3.c -lpthread -ldl

.PHONY: strip
strip: libsqlite3.a sqlite3
	$(STRIP) $(BUILD_DIR)/libsqlite3.a
	$(STRIP) $(BUILD_DIR)/sqlite3

.PHONY: install
install: libsqlite3.a
	#mkdir -p $(INSTALL_DIR)/bin
	#cp $(BUILD_DIR)/sqlite3 $(INSTALL_DIR)/bin/
	mkdir -p $(INSTALL_DIR)/lib
	cp $(BUILD_DIR)/libsqlite3.a $(INSTALL_DIR)/lib/
	mkdir -p $(INSTALL_DIR)/include
	cp sqlite3.h $(INSTALL_DIR)/include/

.PHONY: clean
clean:
	rm -f $(BUILD_DIR)/libsqlite3.a
	rm -f $(BUILD_DIR)/sqlite3.o
	rm -f $(BUILD_DIR)/sqlite3
	
.PHONY: distclean
distclean: clean
	rm -rf $(INSTALL_DIR)/bin
	rm -rf $(INSTALL_DIR)/lib
	rm -rf $(INSTALL_DIR)/include

