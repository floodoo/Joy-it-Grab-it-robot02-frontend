# Joy-it-Grab-it-robot02
An app to control the [GRAB-IT Robot 02](https://joy-it.net/de/products/Robot02) with my [flask server](https://github.com/floodoo/Joy-it-Grab-it-robot02-backend).

## Installation

### Install the flask server
Follow the [flask server installation instructions](https://github.com/floodoo/Joy-it-Grab-it-robot02-backend).

### Select your API endpoint
Select your API endpoint in the settings page.

<img src="https://github.com/floodoo/Joy-it-Grab-it-robot02-frontend/blob/main/assets/images/settings_page_change_api_endpoint.png?raw=true" width="300">

### Control your servos
You can control the servos via 6 sliders by moving them to the left or right.

<img src="https://github.com/floodoo/Joy-it-Grab-it-robot02-frontend/blob/main/assets/images/slider_page_slider.png?raw=true" width="300">

### Execute, reset and settings
With the execute button on the left side, you can execute the previously learned sequence. With the reset button in the middle, you reset all sliders and servos to their default position. And the settings button on the right is pretty self-explanatory right?

<img src="https://github.com/floodoo/Joy-it-Grab-it-robot02-frontend/blob/main/assets/images/slider_page_buttons.png?raw=true" width="300">

### Teach the robot
With the "Start teaching" button you can teach the robot a sequence of movements. But how does it work? 
1. First you have to press the "Start teaching" button.
2. Second you have to move the robot to the desired position.
3. Third you have to press the "Stop teaching" button.
   
Then you have saved a part of the sequence. You can repeat this process as often as you like.
If your sequence is finished, you can execute it by pressing the "Execute" button on the home page.

With the "Reset teaching" button you can reset the learned sequence. So you can start over.

With the "Example sequence" button you can see an example sequence, which is already learned. It moves a tiny object from the left to the right side.

<img src="https://github.com/floodoo/Joy-it-Grab-it-robot02-frontend/blob/main/assets/images/settings_teaching.png?raw=true" width="300">

## Customize the app
### Add or remove slider
You can increase or decrease the number of sliders by editing the `itemCount` number in the [home.screen.dart](lib/ui/screens/home/home.screen.dart) file