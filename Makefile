CXX      = g++
CXXFLAGS = -c -Wall -Wextra -Wfloat-equal -Wundef -Wcast-align -Wwrite-strings -Wlogical-op -Wmissing-declarations -Wredundant-decls -Wshadow -Woverloaded-virtual -std=c++11
OBJS     = lex.yy.o parser.o
OUT      = translator

all: $(OBJS)
	$(CXX) $(OBJS) -o $(OUT)

debug: CXXFLAGS += -ggdb
debug: all

lex.yy.o: scanner.l
	flex -i $<
	$(CXX) $(CXXFLAGS) lex.yy.c

parser.o: parser.cpp parser.h
	$(CXX) $(CXXFLAGS) $<

clean:
	rm -f $(OBJS) $(OUT) lex.yy.c 
