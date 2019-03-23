FLAGS 	= -std=c++11
OBJS	= lex.yy.o parser.o
OUTPUT	= translator.sh

all: $(OBJS)
	g++ -o $(OUTPUT) $(OBJS)

lex.yy.o: scanner.l
	flex -i scanner.l
	g++ $(FLAGS) -c lex.yy.c

parser.o: parser.cpp parser.h
	g++ $(FLAGS) -c parser.cpp
	
clean:
	rm -f $(OBJS) $(OUTPUT) lex.yy.c 
