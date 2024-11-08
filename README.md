# Task-4-Reading-Contacts-and-Displaying-in-a-Custom-ListView-with-Search-Filter-

Contacts App
This Flutter app displays contacts from the user's device in a custom ListView with a real-time search filter. It allows users to search through their contacts by name and displays each contact with relevant details in a clean, user-friendly interface.

Features
Contact Access & Display: Requests permission to access contacts and loads them into the app if permission is granted.
Real-Time Search Filter: Provides a search bar to filter contacts by name in real-time.
Custom ListView Design: Each contact entry is displayed with a circular avatar, name, and phone number, styled for readability.
User-Friendly UI: A consistent teal color scheme and modern design enhance the overall user experience.
Dependencies
contacts_service (version ^0.6.2): Provides access to device contacts.
permission_handler (version ^10.2.0): Manages runtime permissions for contacts access.
To add these dependencies, include the following in pubspec.yaml:

yaml
Copy code
dependencies:
  flutter:
    sdk: flutter
  contacts_service: ^0.6.2
  permission_handler: ^10.2.0
Getting Started
Prerequisites
Flutter SDK: Ensure that Flutter is installed and configured on your machine.
Device Permissions: The app requires permission to access device contacts. Permissions are requested on app startup.
Installation
Clone the Repository:
bash
Copy code
git clone https://github.com/your-username/contacts-app.git
Navigate to the Project Directory:
bash
Copy code
cd contacts-app
Install Dependencies:
bash
Copy code
flutter pub get
Running the App
Start the app on an emulator or a physical device:
bash
Copy code
flutter run
If running on Android, you may need to grant permissions manually from the device settings if permissions are initially denied.
Usage
On app startup, grant contacts access permission when prompted.
Use the search bar at the top to filter contacts by name.
Tap on any contact entry to view additional details or add further functionality if desired.
Additional Notes
Error Handling: If contacts permission is permanently denied, the app notifies the user. Re-enable permissions in device settings to proceed.
Custom Styling: The teal color scheme and consistent padding enhance the app’s aesthetic. Modify as needed in ThemeData.
Future Enhancements
Consider adding:

Detailed Contact View: Tap to view the full contact details.
Sorting Options: Add dropdown sorting by alphabetical order or other criteria.
