## https://cboard.cprogramming.com/tech-board/82071-mingw-linking-gui-program.html
# https://www.vbforums.com/showthread.php?548775-RESOLVED-GradientFill-vs-GdiGradientFill-(GDI32)
# https://github.com/TransmissionZero/MinGW-Win32-Application/blob/master/Makefile
# https://stackoverflow.com/questions/24483173/error-undefined-reference-while-linking-in-mingw
## excerpt:
# I do not know. This is why it is best to use gcc or g++ for linking and not ld. 
# I did a Google search and I did not find a solution to this problem. 
# In fact, every resource I found said link with gcc or g++. – 
# Benilda Key
#  CommentedJun 30, 2014 at 20:48

CC = gcc

LD = ld

LIBPATH   = -L"/c/programs/mingw/mingw/lib" \
			-L"/c/programs/mingw/mingw/lib/gcc/mingw32/4.7.2"
 
# LIBS = -lstdc++ -lmingw32 -lgcc -lmsvcrt
LIBS = -lmingw32 -lgcc -lmsvcrt -lcrtdll -luser32 -lkernel32 -lgdi32 -lmsimg32
			
# LIBS = -lcrtdll
 
OBJS      = main.o #\
			# c:/programs/mingw/mingw/lib/crt1.o \
			# c:/programs/mingw/mingw/lib/gcc/mingw32/4.7.2/crtbegin.o \
			# c:/programs/mingw/mingw/lib/gcc/mingw32/4.7.2/crtend.o
# -std=c89 
LDFLAGS   = $(LIBPATH) $(LIBS)
# LDFLAGS   = -s --subsystem windows $(LIBPATH) $(LIBS)
#LDFLAGS   = -c --subsystem windows $(LIBPATH) $(LIBS)

CXXFLAGS= -c -D _WIN32_WINNT=0x0500 -D WINVER=0x0500 -I/c/programs/mingw/mingw/include

all: hello 
hello: main.o
	$(CC) main.o -o hello.exe $(LDFLAGS) 
main.o: main.c
	$(CC) $(CXXFLAGS) main.c
clean:
	rm -rfv hello.exe *o