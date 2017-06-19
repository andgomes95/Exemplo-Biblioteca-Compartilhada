MAINNAME	:= main
OBJDIR      := obj
LIBDIR      := code
INCLUDE_DIR := include
LIB_NAME    := aritmetico
LIB_VERSION := 1

all: dyn
stc: static main
dyn: dynamic way main
#-------------------object--------------------------------
object:
	gcc	-c	$(LIBDIR)/*.c	-fPIC
	mkdir	-p	$(OBJDIR)
	cp	*.o	$(OBJDIR)
	rm	-f	*.o
#--------------static--------------------------------------
static:	object
	ar	-crs	$(OBJDIR)/lib$(LIB_NAME).a	$(OBJDIR)/soma.o	$(OBJDIR)/sub.o	$(OBJDIR)/mul.o	$(OBJDIR)/div.o
#-------------dynamic--------------------------------------
dynamic:	object
	gcc	-shared	-o	$(OBJDIR)/lib$(LIB_NAME).so.$(LIB_VERSION)	$(OBJDIR)/soma.o	$(OBJDIR)/sub.o	$(OBJDIR)/mul.o	$(OBJDIR)/div.o
	ln	-s	lib$(LIB_NAME).so.$(LIB_VERSION)	$(OBJDIR)/lib$(LIB_NAME).so
#------------teste------------------------------------------
teste:
	gcc	-Wall	-c	$(MAINNAME).c
	gcc	-o	$(MAINNAME)	$(MAINNAME).o	-L$(OBJDIR)	-l$(LIB_NAME)
#------------install---------------------------------------------------
install: dynamic
	sudo	cp	$(OBJDIR)/lib$(LIB_NAME).so.$(LIB_VERSION) /usr/lib
	sudo	cp	$(OBJDIR)/lib$(LIB_NAME).so /usr/lib
	sudo	cp	$(LIB_NAME).h /usr/include
#-------------clean----------------------------------------
clean:
	rm	-rf	obj
	rm	-f	$(MAINNAME)
	rm	-f	*.o



