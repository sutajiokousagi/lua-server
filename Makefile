SOURCES=fcgi-wrapper.c file.c lua.c
OBJECTS=$(SOURCES:.c=.o)
EXEC=lua-fastcgi-server
MY_CFLAGS += -Wall -Werror -O0 -g -DPROJECT_DIR=\"/www/luaed/projects\" -fPIC

MY_LIBS += -lfcgi -lpthread -llua -lm -ldl -Wl,-E

all: $(OBJECTS)
	$(CC) $(LIBS) $(LDFLAGS) $(OBJECTS) $(MY_LIBS) -o $(EXEC)

clean:
	rm -f $(EXEC) $(OBJECTS)

.c.o:
	$(CC) -c $(CFLAGS) $(MY_CFLAGS) $< -o $@

install: all
	install -d $(PREFIX)/bin
	install -m0755 $(EXEC) $(PREFIX)/bin/$(EXEC)
