import 'package:flutter/material.dart';

class EventDetailsPage extends StatelessWidget {
  final Map<String, String> event;

  EventDetailsPage({required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(event['title']!)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(event['title']!, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text("📅 ${event['date']} - 📍 ${event['location']}", style: TextStyle(color: Colors.grey[700])),
            SizedBox(height: 16),
            Text("Organized by: ${event['organizer'] ?? 'Unknown'}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            if (event['collaborator'] != null)
              Text("In collaboration with: ${event['collaborator']}", style: TextStyle(fontSize: 16, color: Colors.grey[600])),
            SizedBox(height: 16),
            Text(event['description'] ?? "No description available."),
            SizedBox(height: 20),
            RegistrationForm(),
          ],
        ),
      ),
    );
  }
}

// **Step 2: Registration Form Widget**
class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  String name = "";
  String email = "";

  void submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Registered successfully!")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: "Full Name"),
            validator: (value) => value!.isEmpty ? "Enter your name" : null,
            onSaved: (value) => name = value!,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: "Email"),
            validator: (value) => value!.isEmpty ? "Enter your email" : null,
            onSaved: (value) => email = value!,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: submitForm,
            child: Text("Register"),
          ),
        ],
      ),
    );
  }
}
