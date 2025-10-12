# 🎮 CS 471 Mini Project: *Schwartz Patrol*

**By Katy Kochte, Kohlby Vierthaler, and Ivy Swenson**

---

## 🧭 Project Overview
**Schwartz Patrol** is a command-line–learning tower-defense game built in **Godot 4**.  
Players defend their base by answering Linux command-line questions correctly — each correct answer allows the player to attack the invading “computer virus” enemies.  

The game combines fun and education, helping players learn basic terminal commands such as `ls`, `cd`, and `pwd` in an interactive way.

---

## ✨ Current Features (as of October 2025)

- 🖥️ **Start Screen**  
  - Cheerful blue-sky theme with terminal icons and Linux command hints (`ls`, `cd`, `pwd`).  
  - Functional “START” button that transitions into gameplay.  

- 🧱 **Independent Scene System**  
  - `StartScreen`, `QuizScreen`, and `GameOverScreen` are now separate `.tscn` files.  
  - Centralized control via `GameManager.gd`.  

- 🧍‍♂️ **Professor Player (Dr. Schwartz!)**  
  - Moves left and right with smooth animation.  
  - Screen boundaries prevent walking off-screen.  

- 💻 **Enemies**  
  - Computer virus enemies that move smoothly downward using tween-based animation.  

- 🏰 **Stone Barriers**  
  - Visual walls on both sides of the road to enhance the game’s look and feel.  

- 🧠 **Quiz Mechanic**  
  - Command-line questions appear on screen.  
  - Correct answers trigger player attacks.  
  - Wrong answers allow enemies to advance toward the base.

---

## ⚙️ How to Open / Import the Project

1. **Clone the Repository**
   ```bash
   git clone https://github.com/Katykochte/Schwartz_Patrol.git
2. **Open in Godot**
   - launch Godot 4.x Project Manager
   - Click Import
   - Navigate to the cloned folder
   - Select project.godot
   - Click Import&Edit
   This project will open with all assets, scripts, and scenes preloaded.
