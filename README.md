# dog_breeds app

## Getting Started

- Ensure you have Flutter SDK installed on you machine. If not follow the [Flutter docs](https://docs.flutter.dev/get-started/install) to install Flutter SDK 
  to your specific operating system.
- Clone the project from [github](https://github.com/kibzsam/dog_breed.git) into a folder in your computer
- Navigate to the root of the project folder ie (cd project-name)
- Run flutter pub get command to install all dependencies
- Run either of this build runner commands to generate the necessary files
  
  flutter pub run build_runner build --delete-conflicting-outputs
  # OR
  flutter pub run build_runner watch --delete-conflicting-outputs
  
- If all runs well and there are no errors, then we are ready to build the app
- Open emulator of your choice ie Android or IOS emulator. You can also use your mobile phone to build but only on android devices
- Run flutter run command inside the root of project directory
- The app should build successfully.

# Please Note 
  Note that before loading the app, ensure that you are connect to a good internet connection
  Whenever the app is opened, it might take a couple of seconds to load all the dog breeds data together with all thumbnails for each breed
    This is mainly because 2 endpoints are being queried to fetch all dog breeds data and images ie
  - https://dog.ceo/api/breeds/list/all
  - https://dog.ceo/api/breed/breadname/images
  

  




- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
