import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  final String name;
  final String email;

  SecondScreen({required this.name, required this.email});

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final _phoneController = TextEditingController();

  // Validation for phone number (should only contain digits and be 10 characters)
  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number field cannot be empty';
    }
    if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
      return 'Enter a valid 10-digit phone number';
    }
    return null;
  }

  // Submit the form
  void _submit() {
    if (_validatePhone(_phoneController.text) == null) {
      // If all validations pass, show a success message
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Success'),
            content: Text('Name: ${widget.name}\nEmail: ${widget.email}\nPhone: ${_phoneController.text}'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Close'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Screen')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Phone number input field
            TextFormField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: 'Phone Number'),
              validator: _validatePhone,
            ),
            SizedBox(height: 20),
            // Submit button
            ElevatedButton(
              onPressed: _submit,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}