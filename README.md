<div align='center'>
   <h1>Flappy Bird Processing Project</h1>
</div>

<div align="center">
   <img src="https://github.com/ngabroger/UAS_Grafika_Komputer/assets/106647794/c73cc53d-1bdb-4d7e-8382-5bbe2a680e68" alt="Animation" style="width:300px;     height:500px;">
</div>

## Overview

This repository contains the collaborative efforts of the team to create a Flappy Bird game using the Processing programming language. The project members are:

- **2207412033 Daffa Putra Setyatama**
- **2207412036 Roger Martua Osman Simanjuntak**
- **2207412041 Muhamad Faried**
- **2207412047 Teuku Muhammad Erlangga Pratama**
- **2207412049 Syah Rafi Elyusufi Abighaly**

## Project Description

This project aims to recreate the classic Flappy Bird game using Processing, a flexible software sketchbook and a language for learning how to code within the context of the visual arts. The game will feature the iconic flappy bird navigating through obstacles, and players will control the bird's movement to avoid collisions.

## How to Run the Game

Follow these steps to run the Flappy Bird game on your local machine:

1. **Install Processing:** Ensure that Processing is installed on your machine. You can download it from [processing.org](https://processing.org/download/).

2. **Clone the Repository:** Clone this GitHub repository to your local machine using the following command:

   ```bash
   git clone https://github.com/ngabroger/UAS_Grafika_Komputer.git

3. **open and execute the main files** Please ensure that you open the FlappyBird.pde files, because that is the file you wanna make sure to be opened and executed.

4. **Don't forget to have fun** don't forget to having the best time of your life.


## Explanation of The Code Itself


FlappyBird.pde : The code implements a simple version of the Flappy Bird game using the Processing programming language and utilizes the Minim library for sound effects. Here's a concise explanation of each part of the code:

1. **Setup (void setup()):**
   - Sets up the canvas with dimensions 500x800 pixels.
   - Initializes Background and Background2 objects for the game background.
   - Loads fonts for text and initializes other variables.
   - Loads bird, pillar, and background images.
   - Initializes the Minim object and loads sound samples for game sound effects.
   - Initializes bird, pillar, cloud objects, and other variables.

2. **Draw (void draw()):**
   - Draws the background, grass, clouds, and calls methods to update and draw game elements.
   - Checks game conditions such as collisions and calls methods to handle bird death.
   - Displays the score if the game ends.
   - Shows the intro screen or game-over screen with an option to restart the game.
   - Sets a waiting time before resetting the game after a game over.

3. **Function drawTextWithShadow():**
   - Function to display text with a shadow effect.

4. **Function reset():**
   - Function to reset the game, where the game status is set to end, and values are reset to initial conditions.

5. **Function birdDied():**
   - Function called when the bird dies.
   - Sets a waiting time before resetting the game after the bird's death.

6. **Functions mousePressed() and keyPressed():**
   - Functions called when the player clicks the mouse or presses a key.
   - Triggers the bird's jump and sets the intro status to false.
   - If the game has not ended, these functions call the birdDied() function to reset the game.

7. **Function stop():**
   - Function to stop playing sounds using the Minim library when the application is stopped.

In summary, this code encompasses the basic logic of the Flappy Bird game, including the display, player interaction, score handling, and sound effects.




Background.pde: The code defines two classes, `Background` and `Background2`, to handle background images in a Processing sketch. Here's a brief explanation:

1. **Background Class:**
   - The `Background` class is designed to manage the background image of the game.
   - It has a member variable `backgroundImage` of type `PImage` to store the loaded image.
   - The class has a constructor that takes a file path (`imagePath`) as a parameter, loads the image using `loadImage()`, and assigns it to the `backgroundImage`.
   - The `draw()` method is responsible for rendering the background image using the `image()` function, stretching it to cover the entire canvas (`width` and `height`).

2. **Background2 Class:**
   - The `Background2` class is similar to the `Background` class and is designed for a potentially different background image.
   - It also has a member variable `backgroundImage` of type `PImage` to store the loaded image.
   - The class has a constructor that takes a file path (`imagePath`) as a parameter, loads the image using `loadImage()`, and assigns it to the `backgroundImage`.
   - The `draw()` method is responsible for rendering the background image using the `image()` function, stretching it to cover the entire canvas (`width` and `height`).

In summary, these classes encapsulate the functionality to load and display background images in a Processing sketch. They allow for flexibility in using different background images by creating separate instances of `Background` or `Background2` and initializing them with the desired image file paths.




bird.pde: The code defines a class named `bird` in a Processing sketch that represents the player-controlled bird character in the Flappy Bird game. Here's a concise explanation:

1. **Class bird:**
   - **Properties:**
     - `float xPos, yPos, ySpeed`: Variables to store the bird's x and y positions, and vertical speed.
     - `int currentFrame`: Keeps track of the current frame for animating the bird.
     - `boolean hitSoundPlayed, punchSoundPlayed`: Flags to ensure that sound effects are played only once on specific conditions.

   - **Constructor:**
     - Initializes the bird's initial position (`xPos`, `yPos`).
     - It loads the bird animation frames (assumed to be stored in the `frames` array, which is not provided in the code).

   - **Method drawBird():**
     - Animates the bird by displaying frames with a specified frame delay.
     - Uses the `image()` function to draw the current frame of the bird animation.

   - **Method jump():**
     - Handles the bird's jump behavior by modifying its vertical speed (`ySpeed`) when triggered.

   - **Method drag():**
     - Simulates the effect of gravity on the bird by incrementing its vertical speed (`ySpeed`).

   - **Method move():**
     - Updates the bird's position based on its vertical speed (`ySpeed`).
     - Adjusts the x position of each pillar to create the illusion of the bird moving forward.

   - **Method checkCollisions():**
     - Checks for collisions with the ground and pillars.
     - If the bird falls below the screen, it triggers the game over and plays a hit sound.
     - If the bird collides with a pillar, it triggers the game over and plays a punch sound.

In summary, the `bird` class encapsulates the logic for controlling the bird's movement, animation, and collision detection within the Flappy Bird game.




cloud.pde: The code defines a class named `Cloud` in a Processing sketch, which represents a cloud object that moves horizontally across the screen. Here's a concise explanation:

1. **Class Cloud:**
   - **Properties:**
     - `PImage cloudImage`: Stores the image of the cloud.
     - `float x, y, size`: Variables to store the cloud's x and y positions, and its size.
     - `float speed`: Specifies the speed at which the cloud moves horizontally.

   - **Constructor:**
     - Initializes the cloud's properties, such as its image, initial position (`x`, `y`), and size.
     - The image path is passed as a parameter to load the cloud image.

   - **Method update():**
     - Updates the cloud's position by decrementing its x-coordinate (`x`) based on its speed.
     - If the cloud moves completely off the left side of the screen, it reappears on the right side, giving the impression of continuous movement.
     - Additionally, it randomizes the vertical position (`y`) of the cloud within a specified range to create variation.

   - **Method draw():**
     - Renders the cloud on the screen using the `image()` function.
     - The cloud's image is drawn at its current position (`x`, `y`) with the specified size.

In summary, the `Cloud` class encapsulates the behavior of a moving cloud in the game. It handles updating the cloud's position and drawing it on the screen, providing visual elements that enhance the game's atmosphere.




pillar.pde: The code defines a class named `pillar` in a Processing sketch, representing the pillars or pipes that the bird must navigate through in the Flappy Bird game. Here's a concise explanation:

1. **Class pillar:**
   - **Properties:**
     - `float xPos, opening`: Variables to store the x-position of the pillar and the vertical opening (gap) between the upper and lower parts of the pillar.
     - `boolean cashed`: A flag to track whether the pillar has been "cashed" (passed by the bird).

   - **Constructor:**
     - Initializes the pillar's x-position (`xPos`) based on its index `i` and sets the initial random opening (`opening`) for the bird to navigate through.

   - **Method drawPillar():**
     - Uses the `image()` function to draw the upper and lower parts of the pillar on the screen.
     - The upper part is drawn with a flipped matrix (scaled vertically by -1) to create the opening between the two parts.
     - The lower part is drawn below the opening.

   - **Method checkPosition():**
     - Checks if the pillar has moved off the left side of the screen (`xPos < 0`).
     - If so, repositions the pillar to the right side of the screen, randomizes a new opening, and resets the `cashed` flag.
     - Checks if the bird has passed through the pillar (when `xPos < 250` and the pillar hasn't been cashed yet).
     - If true, increments the score, triggers a point sound effect, and sets the `cashed` flag to true.

In summary, the `pillar` class manages the position, drawing, and scoring logic for the pillars in the Flappy Bird game. The pillars move horizontally, and when the bird successfully passes through a pillar, the score is incremented, and a sound effect is played.