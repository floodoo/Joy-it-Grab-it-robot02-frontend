# Joy-it-Grab-it-robot02
An app to control the [GRAB-IT Robot 02](https://joy-it.net/de/products/Robot02) with my [flask server](https://github.com/floodoo/Joy-it-Grab-it-robot02-backend)

## Installation

### Install the flask server
Follow the [flask server installation instructions](https://github.com/floodoo/Joy-it-Grab-it-robot02-backend)

### Select your API endpoint
Select your API endpoint in the settings page.

<img src="https://github.com/floodoo/Joy-it-Grab-it-robot02-frontend/blob/main/assets/images/settings_page_change_api_endpoint.png?raw=true" width="300">

### Control your servos
You can control the servos via 6 sliders by moving them left or right

<img src="https://github.com/floodoo/Joy-it-Grab-it-robot02-frontend/blob/main/assets/images/slider_page_slider.png?raw=true" width="300">

### Play, reset and Settings
With the play button on the left you can run the learned movement. With the reset button in the middle you set all servos to position 0. This allows you to reset every servo. And the settings button on the right is pretty self-explanatory.

<img src="https://github.com/floodoo/Joy-it-Grab-it-robot02-frontend/blob/main/assets/images/slider_page_buttons.png?raw=true" width="300">

### Teach the robot
With this Button you can teach the robot a movement. The robot will learn the movement and save it. To teach the robot, you have to press the button and then change one or more slider positions. After that you press the button again and it's saved. To reset the learned movement, press the reset button.

<img src="https://github.com/floodoo/Joy-it-Grab-it-robot02-frontend/blob/main/assets/images/settings_teaching.png?raw=true" width="300">

## Customize the app
### Add or remove slider
You can increase or decrease the number of sliders by editing the `itemCount` number in the [home.screen.dart](lib/ui/screens/home/home.screen.dart) file.