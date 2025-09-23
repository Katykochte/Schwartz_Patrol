#pragma once
#include <iostream>
#include <vector>
#include <string>
#include <fstream>

class GameMap {

public:
    GameMap();
    bool move_Player(char dir);
    friend std::ifstream& operator>>(std::ifstream& input_stream, GameMap& board);
    friend std::ostream& operator<<(std::ostream& output_stream, const GameMap& board);
    static constexpr auto CLEAR_SCREEN{"\x1B[2J"};
    static constexpr auto RESET_CURSOR{"\x1B[H"};

private: 
    std::vector<std::string> data;
    int width;
    int height;

};