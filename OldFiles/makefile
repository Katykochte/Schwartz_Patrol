all: hw
	./hw game/data.txt

hw: hw.o GameMap.o
	g++ -std=c++17 -Wall -Wextra hw.o GameMap.o -o hw

hw.o: hw.cpp GameMap.hpp
	g++ -std=c++17 -Wall -Wextra -c hw.cpp

GameMap.o: GameMap.hpp GameMap.cpp
	g++ -std=c++17 -Wall -Wextra -c GameMap.cpp

clean: 
	rm -f hw *.o