# SURI

## SURI is the mobile application used together with a coffee borer beetle detection device. 

This mobile application assist the user in checking the progress of the detection in the coffee field. The mobile application enables the user to do the following:

* Review the result of the detection
* Receive notification regarding the progress of the detection
* Export a CSV file of the obtained data

## How to Use the Project

Ensure that Flutter is already installed on your computer.

1. Clone the project
```
git clone https://github.com/Tristaaaaan/suri
```

2. Open the project on your preferred IDE and add dependencies:
```
flutter pub get
```

3. Run the project:

* Open an Android emulator.
  
* Run the following command to build and run the project in development mode:
```
flutter build apk --debug --flavor development -t lib/main_development.dart
```

* To create a release version of the application run the command:
```
flutter build apk release --flavor production -t lib/main_production.dart
```

* To get the AAB of the project, run the command:
```
flutter build appbundle --flavor production -t lib/main_production.dart
```

## Technology Tools

* Dart
* Flutter
* Firebase

## Contact

For inquiries:

* Email: markristanfabellar.pro@gmail.com
* GitHub: [Tristaaaaan](https://github.com/Tristaaaaan)

