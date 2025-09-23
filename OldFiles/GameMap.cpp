#include <iostream>
#include <vector>
#include <string>
#include <fstream>
#include "GameMap.hpp"

GameMap::GameMap()
    : data{}, width{10}, height{10}
{

}

bool GameMap::move_Player(char dir) {

    int x;
    int y;
    for (int i=0; i<height; i+=1) { // find current position
        std::string cur_Line = data[i];
        for (int j=0; j<width; j+=1) {
            char index = cur_Line[j];
            if (index == 'A') { // found current position
                x = j;
                y = i; // set x & y as player position
            }
        }
    }

    char next{};

    if (dir == 'i') { // move up
        next = data[y-1][x];
        if (next==' ') { // only move if allowed
            data[y-1][x] = 'A'; // move player to new spot
            data[y][x] = ' '; // update last spot
        } else if (next == 'Z') { // exit found
            data[y-1][x] = 'A';
            data[y][x] = ' ';
            return true; // game won
        }
    } else if (dir == 'j') { // move left
        next = data[y][x-1];
        if (next==' ') {
            data[y][x-1] = 'A';
            data[y][x] = ' ';
        }
    } else if (dir == 'k') { // move down
        next = data[y+1][x];
        if (next==' ') { 
            data[y+1][x] = 'A';
            data[y][x] = ' ';
        }
    } else if (dir == 'l') { // move right
        next = data[y][x+1];
        if (next==' ') {
            data[y][x+1] = 'A';
            data[y][x] = ' ';
        }
    }
    return false; // game not won
} 

std::ifstream& operator>>(std::ifstream& input_stream, GameMap& board)
{
    std::string cur_Line;
    while (getline(input_stream, cur_Line)) {
        board.data.push_back(cur_Line);
    } // read each line in file as a string and add to map vector

    return input_stream;
    
}

std::ostream& operator<<(std::ostream& output_stream, const GameMap& board) 
{
    std::string cur_Line;
    output_stream << GameMap::CLEAR_SCREEN << GameMap::RESET_CURSOR;
    for (long unsigned int i=0; i<board.data.size(); i+=1) {
        cur_Line = board.data[i]; 
        output_stream << cur_Line << "\n";
    } // read each line/element in the vector and print it out;
    return output_stream;

}