import 'package:flutter/material.dart';

import '../../Component/JobCard.dart';
import '../../Component/JobLists.dart';
import 'JobDetails.dart';



class JobListingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Job Listings'),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        itemCount: jobListings.length,
        itemBuilder: (context, index) {
          final job = jobListings[index];
          return JobCard(job: job, onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => JobDetailsPage(job: job)),
            );
          });
        },
      ),
    );
  }
}
