
import 'package:flutter/material.dart';


class ApplicationsPage extends StatelessWidget {
  final List<Map<String, String>> applications = [
    {
      'title': 'Software Engineer',
      'company': 'XYZ Company',
      'status': 'Under Review',
    },
    {
      'title': 'Graphic Designer',
      'company': 'ABC Agency',
      'status': 'Accepted',
    },
    {
      'title': 'Product Manager',
      'company': 'Tech Solutions',
      'status': 'Rejected',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Applications'),
      ),
      body: ListView.builder(
        itemCount: applications.length,
        itemBuilder: (context, index) {
          final application = applications[index];
          return Card(
            child: ListTile(
              leading: Icon(Icons.description),
              title: Text(application['title']!),
              subtitle: Text('${application['company']} - Status: ${application['status']}'),
              trailing: Icon(
                application['status'] == 'Accepted' ? Icons.check_circle : Icons.info,
                color: application['status'] == 'Accepted' ? Colors.green : Colors.grey,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ApplicationDetailsPage(application: application),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class ApplicationDetailsPage extends StatelessWidget {
  final Map<String, String> application;

  ApplicationDetailsPage({required this.application});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(application['title']!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              application['title']!,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Company: ${application['company']}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Status: ${application['status']}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'Details about the application can be shown here.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

