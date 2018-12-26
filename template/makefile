CXX = 	g++

CXXFLAGS =	-O2 -g -Wall

OBJS =	main.o <++>

LIBS =

TARGET =	executable

$(TARGET):	$(OBJS)
	$(CXX) -o $(TARGET) $(OBJS) $(LIBS)

all:	$(TARGET)

main.o: main.cpp <++>
		$(CXX) $(CXXFLAGS) -c main.cpp

clean:
	rm -f $(OBJS) $(TARGET)
