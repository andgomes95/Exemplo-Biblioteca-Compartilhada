MAINNAME	:= main
OBJDIR      := obj
LIBDIR      := code
INCLUDE_DIR := include
LIB_NAME    := aritmetico
LIB_VERSION := 1

all:	din
est: estatic main
din: dinamic	way	main
#-------------------object--------------------------------
object:
	gcc	-c	$(LIBDIR)/*.c	-fPIC
	mkdir	-p	$(OBJDIR)
	cp	*.o	$(OBJDIR)
	rm	-f	*.o
#--------------estatic--------------------------------------
estatic:	object
	ar	-crs	$(OBJDIR)/lib$(LIB_NAME).a	$(OBJDIR)/soma.o	$(OBJDIR)/sub.o	$(OBJDIR)/mul.o	$(OBJDIR)/div.o
#-------------dinamic--------------------------------------
dinamic:	object
	gcc	-shared	-o	$(OBJDIR)/lib$(LIB_NAME).so.$(LIB_VERSION)	$(OBJDIR)/soma.o	$(OBJDIR)/sub.o	$(OBJDIR)/mul.o	$(OBJDIR)/div.o
	ln	-s	lib$(LIB_NAME).so.$(LIB_VERSION)	$(OBJDIR)/lib$(LIB_NAME).so
#------------main------------------------------------------
main:
	gcc	-c	$(MAINNAME).c	-I$(INCLUDE_DIR)
	gcc	-o	$(MAINNAME)	$(MAINNAME).o	-L$(OBJDIR)	-l$(LIB_NAME)
#------------way------------------------------------------
way:	
	echo	$(LD_LIBRARY_PATH)
	LD_LIBRARY_PATH=$(LD_LIBRARY_PATH):$(pwd)/$(OBJDIR)/
	export LD_LIBRARY_PATH

echo:
		echo	$(LD_LIBRARY_PATH)
#-------------clean----------------------------------------
clean:
	rm	-rf	obj
	rm	-f	$(MAINNAME)
	rm	-f	*.o



