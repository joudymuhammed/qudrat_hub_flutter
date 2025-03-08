import 'package:flutter/material.dart';

class JobDetailsPage extends StatelessWidget {
  final Map<String, String> job;

  JobDetailsPage({required this.job});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(job['title']!),
        backgroundColor: Colors.blueGrey[100],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(job['title']!, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Company: ${job['company']}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Location: ${job['location']}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            Text(job['description']!, style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Apply action
              },
              child: Text('Apply Now'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
            ),
          ],
        ),
      ),
    );
  }
}