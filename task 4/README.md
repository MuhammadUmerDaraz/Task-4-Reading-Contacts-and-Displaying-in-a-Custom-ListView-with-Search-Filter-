Contacts App with Real-Time Search
This Flutter app demonstrates how to access and display contacts from a device in a custom ListView with a real-time search filter. The app is designed to provide a seamless user experience, featuring a clean UI and smooth search functionality.

Purpose
The purpose of this app is to:

Fetch contacts from the device using permissions.
Display contacts in a ListView with custom styling.
Enable real-time search filtering of contacts by name.
Requirements
Flutter SDK: Ensure you have Flutter installed on your system.
Permissions: The app requests permission to access contacts from the device. You will need to allow this permission for the app to function correctly.
Dependencies
Add the following dependencies in your pubspec.yaml file:

dependencies:
  flutter:
    sdk: flutter
  contacts_service: ^0.6.2
  permission_handler: ^10.2.0

  These packages are essential for accessing device contacts and handling permissions.

Getting Started
Installation
Clone the Repository:
git clone https://github.com/your-username/contacts-app.git

Navigate to the Project Directory:
cd contacts-app

Install Dependencies:
flutter pub get

Running the App
Open an Emulator or Connect a Physical Device.
Run the App:
flutter run

Grant Permissions when prompted to allow the app to access your contacts.
Features
Real-Time Search: Type in the search bar to filter contacts instantly.
Custom ListView Design: Displays each contact with a circular avatar, name, and phone number.
User-Friendly UI: Styled with a consistent color scheme and modern UI elements.
Additional Notes
If permissions are denied, the app will notify you to enable them for full functionality.
Customize the color scheme or add additional contact features as desired.
Future Enhancements
Consider implementing:

Sorting: Allow contacts to be sorted alphabetically.
Detailed View: Tap on a contact to view full details.
