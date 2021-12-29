# Joy-it-Grab-it-robot02
An app that controls the [GRAB-IT Robot 02](https://joy-it.net/de/products/Robot02) with my [flask server](https://github.com/floodoo/Joy-it-Grab-it-robot02-backend).

## Installation

### Install my python flask server
Follow the [server installation guide](https://github.com/floodoo/Joy-it-Grab-it-robot02-backend).

### App installation
#### Android
Go to the [installation](installation_files/Joy-it-Grab-it-robot02.apk) folder and send the apk to your android phone. After that install the APK and launch it.

#### iOS
Unfortunately I can not build an iOS app, because the device must have a developer certificate. But you can do it. You have to install Flutter and then connect your phone to your computer/laptop. After that you can run the code and flutter is going to build the app on your device. One disadvantage is that if you don't have a developer certificate, you can only use the app when your phone is connected to your computer/laptop.

### Select your API endpoint
Select your API endpoint in the settings page.

<img src="https://github.com/floodoo/Joy-it-Grab-it-robot02-frontend/blob/main/assets/images/settings_page_change_api_endpoint.png?raw=true" width="300">

## How to use the app
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

#### Reset teaching
With the "Reset teaching" button you can reset the learned sequence. So you can start over.

#### Example sequence
With the "Example sequence" button you can see an example sequence, which is already learned. It moves a tiny object from the right to the left side. [Example video](https://youtu.be/DA7x8Jc-tic?t=34).

<img src="https://github.com/floodoo/Joy-it-Grab-it-robot02-frontend/blob/main/assets/images/settings_teaching.png?raw=true" width="300">

## Customize the app
### Add or remove slider
You can increase or decrease the number of sliders by editing the `itemCount` number in the [home.screen.dart](lib/ui/screens/home/home.screen.dart) file.
