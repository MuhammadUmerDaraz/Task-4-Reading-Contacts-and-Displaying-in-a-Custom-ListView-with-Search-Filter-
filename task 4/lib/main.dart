import 'package:flutter/material.dart';

import 'package:contacts_service/contacts_service.dart';

import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(ContactsApp());
}

class ContactsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Contacts',
      theme: ThemeData(
        primaryColor: Color(0xff36c7ff), // Custom color as primary color
        textTheme: TextTheme(
          bodyMedium: TextStyle(fontSize: 16, color: Colors.grey[800]),
          titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ContactsListScreen(),
    );
  }
}

class ContactsListScreen extends StatefulWidget {
  @override
  _ContactsListScreenState createState() => _ContactsListScreenState();
}

class _ContactsListScreenState extends State<ContactsListScreen> {
  List<Contact> _contacts = [];

  List<Contact> _filteredContacts = [];

  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _requestPermission();

    _searchController.addListener(_filterContacts);
  }

  Future<void> _requestPermission() async {
    if (await Permission.contacts.request().isGranted) {
      _fetchContacts();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Contacts permission is required to proceed')),
      );
    }
  }

  Future<void> _fetchContacts() async {
    Iterable<Contact> contacts = await ContactsService.getContacts();

    setState(() {
      _contacts = contacts.toList();

      _filteredContacts = _contacts;
    });
  }

  void _filterContacts() {
    setState(() {
      _filteredContacts = _contacts.where((contact) {
        return contact.displayName!
            .toLowerCase()
            .contains(_searchController.text.toLowerCase());
      }).toList();
    });
  }

  Widget _buildContactListTile(Contact contact) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 6.0, horizontal: 10.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: EdgeInsets.all(10),
        leading: CircleAvatar(
          backgroundColor: Colors.teal,
          radius: 25,
          child: Text(
            contact.displayName != null && contact.displayName!.isNotEmpty
                ? contact.displayName![0].toUpperCase()
                : '?',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        title: Text(
          contact.displayName ?? 'No Name',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Text(
          contact.phones!.isNotEmpty
              ? contact.phones!.first.value!
              : 'No number',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        trailing: Icon(Icons.phone, color: Colors.teal),
        onTap: () {
          // Optional: Additional tap functionality
        },
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
        centerTitle: true,
        elevation: 4,
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search Contacts',
                labelStyle: TextStyle(color: Colors.grey[600]),
                prefixIcon: Icon(Icons.search, color: Colors.teal),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.teal),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.teal, width: 1.5),
                ),
              ),
              cursorColor: Colors.teal,
            ),
          ),
          Expanded(
            child: _filteredContacts.isNotEmpty
                ? ListView.builder(
                    itemCount: _filteredContacts.length,
                    itemBuilder: (context, index) {
                      return _buildContactListTile(_filteredContacts[index]);
                    },
                  )
                : Center(
                    child: Text(
                      'No contacts found',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
