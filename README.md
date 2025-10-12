
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
   
2. **Open in Godot**

   * Launch **Godot 4.x Project Manager**
   * Click **“Import”**
   * Navigate to the cloned folder
   * Select **`project.godot`**
   * Click **“Open”**

✅ The project should now open with all assets, scripts, and scenes loaded.

---

## 🗂️ Scene Structure

```
Scenes/
 ┣ GameWorld.tscn       → main game logic (player, enemies, manager)
 ┣ StartScreen.tscn     → intro screen with START button
 ┣ QuizScreen.tscn      → question/answer gameplay
 ┗ GameOverScreen.tscn  → end screen after failure or success
```

---

## 🧠 Core Scripts

| Script | Description |
|--------|--------------|
| **player.gd** | Controls player movement (`a` / `d` keys) and prevents the professor from moving outside the road area. |
| **enemy.gd** | Handles the main enemy’s downward movement and collision with the wall; triggers Game Over when reaching the base. |
| **enemy2.gd** | Similar to `enemy.gd`, but includes smooth tween-based animation for more natural motion. |
| **gamemanager.gd** | Central script that manages scene transitions (Start → Quiz → GameOver), game states, and reset logic. |
| **gameoverscreen.gd** | Controls the Game Over screen UI, including restart and quit button functionality. |
| **gameworld.gd** | Manages the main game scene, coordinating player, enemies, and game manager interactions. |
| **quizscreen.gd** | Displays command-line quiz questions and checks answers; correct answers trigger attacks, wrong ones advance enemies. |
| **startscreen.gd** | Handles the Start Screen’s background image and Start button, transitioning to the quiz scene when pressed. |


---

## 🎨 Assets

* Custom **Start Screen Illustration** (blue-sky, green hills, terminal computer)
* **Stone-style barrier texture** for visual boundaries
* Placeholder sprites for professor and computer enemies
* Clean minimal UI with bright colors and clear text

---

## 🧑‍🎓 Learning Goal

This project combines **software engineering** principles with **educational game design**, emphasizing:

* Modular and maintainable Godot scene structure
* Team-based Git version control
* Integrating art and programming in game development
* Teaching Linux command-line concepts through gameplay

---

## 🧩 Contributors

| Name                  | Role                                                    |
| --------------------- | ------------------------------------------------------- |
| **Katy Kochte**       | Project Lead • UI design • Gameplay programming         |
| **Kohlby Vierthaler** | Game art direction • Theme and environment design       |
| **Ivy Swenson**       | Gameplay programming • Movement systems • Documentation |

---

## 🚀 Future Plans

1. Add randomized questions and scoring system
2. Introduce win/lose animations and sound effects
3. Expand quiz bank to include more commands (`mkdir`, `touch`, `cat`, etc.)
4. Add background music and dynamic sound effects
5. Improve overall visual polish and user feedback

---

## 🏫 Course Information

* **Course:** CS 471 — Senior Capstone I
* **Instructor:** Glenn G. Chappell
* **Institution:** University of Alaska Fairbanks

---

