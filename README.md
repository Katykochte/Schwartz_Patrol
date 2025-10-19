
# CS 471 Mini Project: *Schwartz Patrol*

**By Katy Kochte, Kohlby Vierthaler, and Ivy Swenson**  
*University of Alaska Fairbanks — CS 471 Senior Capstone I*

---

## Project Overview
**Schwartz Patrol** is a command-line–learning tower-defense game built in **Godot 4.5**.  
Players defend their base by answering Linux command-line questions correctly — each correct answer lets the player attack the “computer virus” enemies advancing toward the base.

The project makes learning essential shell commands (`ls`, `cd`, `pwd`, etc.) engaging through gameplay and visual feedback.

---

## Features
-  **Start Screen** with a bright blue-sky background and Linux command hints (`ls`, `cd`, `pwd`).  
-  **Independent Screen System:** all screens are separated into individual CanvasOverlay nodes, managed by a central `GameManager.gd`.   
-  **Professor Player Model (Dr. Schwartz!)** — can move left/right with boundaries (no longer “walks off screen”).  
-  **Enemy Computers** — move smoothly down toward the base using tween-based animation.  
-  **Quiz Gameplay System** — answering correctly attacks enemies, while wrong answers make them advance.
-  **Help Screen Popup** — help button on the side for if the player forgets commands.
-  **Replay + Exit Buttons** — end of game allows for replaying or exiting to start.

---

## How to Open / Import the Project

1. **Download Godot 4.5**
   https://godotengine.org/download/archive/4.5-stable/
   * Note, Godot is not very backwards compatible, so 4.5 is the only version we guarantee to work. *

2. **Clone the repository**
   ```bash
   git clone https://github.com/Katykochte/Schwartz_Patrol.git
   
3. **Open in Godot**

   * Launch **Godot 4.5 Project Manager**
   * Click **“Import”**
   * Navigate to the cloned folder
   * Select **`project.godot`**
   * Click **“Open”**

The project should open with all assets, scripts, and scenes loaded.

---

## Assets

* Custom **Start Screen Illustration** 
* Custom **Info Screen Illustrations**
* Custom **Game Lost Screen Illustration**
* Custom **Game Won Illustration** 
  

