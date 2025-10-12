
# 🎮 CS 471 Mini Project: *Schwartz Patrol*

**By Katy Kochte, Kohlby Vierthaler, and Ivy Swenson**  
*University of Alaska Fairbanks — CS 471 Software Engineering*

---

## 🧭 Project Overview
**Schwartz Patrol** is a command-line–learning tower-defense game built in **Godot 4**.  
Players defend their base by answering Linux command-line questions correctly — each correct answer lets the player attack the “computer virus” enemies advancing toward the base.

The project makes learning essential shell commands (`ls`, `cd`, `pwd`, etc.) engaging through gameplay and visual feedback.

---

## ✨ Current Features (as of October 2025)
- 🖥️ **Start Screen** with a bright blue-sky background and Linux command hints (`ls`, `cd`, `pwd`).  
- 🧱 **Independent Scene System:** `StartScreen`, `QuizScreen`, and `GameOverScreen` are separated into individual `.tscn` files, managed by a central `GameManager.gd`.  
- 🎯 **Functional “START” Button** — begins the game by switching to the quiz screen.  
- 🧍‍♂️ **Professor Player Model (Dr. Schwartz!)** — can move left/right with boundaries (no longer “walks off screen”).  
- 💻 **Enemy Computers** — move smoothly down toward the base using tween-based animation.  
- 🪨 **Stone Barriers** — placed visually on both ends of the road for a more complete environment.  
- 🧠 **Quiz Gameplay System** — answering correctly attacks enemies, while wrong answers make them advance.

---

## ⚙️ How to Open / Import the Project

1. **Clone the repository**
   ```bash
   git clone https://github.com/Katykochte/Schwartz_Patrol.git




