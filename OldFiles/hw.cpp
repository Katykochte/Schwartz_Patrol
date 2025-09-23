#include <iostream>
#include <istream>
#include "GameMap.hpp"

using std::cout;
using std::cin;
using std::endl;
using std::cerr;
using std::ifstream;

int main (int argc, char** argv) {

    if (argc<2) {
        cerr << "Usage: " << argv[0] << " game/data.txt" << endl;
        return 1;
    }

    GameMap map;
    ifstream mapFile{argv[1]};
    mapFile >> map;

    char input{};
    bool win{false};

    while (input != 'q') {
        cout << map;
        cout << "\nQuit (q) or Move (ijkl): ";
        cin >> input;
        win = map.move_Player(input);
        if (win == true) {
            input = 'q';
            cout << map << endl << "Game won!" << endl;
        }
    }

    return 0;

}