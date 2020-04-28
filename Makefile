#Author: Rudy Faile (@rfaile313)
#Description: A simple Makefile that incorporates
#+Raylib on OS: Windows && Platform: Desktop

#What you need to do:
#1. Git clone Raylib https://github.com/raysan5/raylib.git
#2. Compile Raylib and Build the Raylib Library: https://github.com/raysan5/raylib/wiki/Working-on-Windows 
#3. Change RAYLIB_PATH below to point to your top level raylib directory

#Protect clean
.PHONY: all clean

#!!SUPER IMPORTANT THAT THIS IS CORRECT!!#
RAYLIB_PATH = C:/raylib/raylib

#PROJECT_NAME determines your program's exectuable
PROJECT_NAME = my_cool_raylib_game
COMPILER = gcc

#multiple include paths (-I. -I[path] -I[path)
INCLUDE_PATHS = -I. -I$(RAYLIB_PATH)/src -I$(RAYLIB_PATH)/src/external
#library paths (multiple... "-L. -L"" -L"")
LDFLAGS = -L. -L$(RAYLIB_PATH)/src -L$(RAYLIB_PATH)/src/external
#library inclusion (lwinmm required for timer res)
LDLIBS = -lraylib -lopengl32 -lgdi32 -lwinmm
#define default make program (on windows this is usually mingw32-make)
MAKE = mingw32-make

#Compiler flags for reference
#  -O1                  defines optimization level
#  -g                   include debug information on compilation
#  -Wall                turns on most, but not all, compiler warnings
#  -std=c99             defines C language mode (standard C from 1999 revision)
#  -Wno-missing-braces  ignore invalid warning (GCC bug 53119)

CFLAGS += -O1 -Wall -std=c99 -Wno-missing-braces
#add raylib data / -Wl, --subsystem, windows hides the console window
CFLAGS += $(RAYLIB_PATH)/src/raylib.rc.data -Wl,--subsystem,windows
#source files - you will need to add more ad your project expands
OBJS = main.c

all:
	$(COMPILER) $(OBJS) -o $(PROJECT_NAME) $(CFLAGS) $(INCLUDE_PATHS) $(LDFLAGS) $(LDLIBS)

clean:
	del *.o *.exe /s
	@echo Cleaning done