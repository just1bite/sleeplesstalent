import 'package:flutter/material.dart';

class SavedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Jobs'),
      ),
      body: ListView(
        children: [
          JobCard(
            title: 'Unifam Management Trainee - Information System & Techn...',
            company: 'PT United Family Food (Jakarta)',
            location: 'Jakarta',
            daysAgo: '5d ago',
          ),
          JobCard(
            title: 'IT JAVA Programmer (Junior)',
            company: 'PT Hitachi eBworx Indonesia',
            location: 'Central Jakarta, Jakarta',
            daysAgo: '4d ago',
          ),
          JobCard(
            title: 'IT Developer',
            company: 'PT Sinergi Wahana Gemilang',
            location: 'Jakarta',
            daysAgo: '1d ago',
          ),
          JobCard(
            title: 'PHP Developer - IT Solutions Industry - Jakarta - WFO',
            company: 'PT. PERSOLKELLY Recruitment Indonesia',
            location: 'Jakarta',
            daysAgo: '1d ago',
          ),
        ],
      ),
    );
  }
}

class JobCard extends StatefulWidget {
  final String title;
  final String company;
  final String location;
  final String daysAgo;

  JobCard({
    required this.title,
    required this.company,
    required this.location,
    required this.daysAgo,
  });

  @override
  _JobCardState createState() => _JobCardState();
}

class _JobCardState extends State<JobCard> {
  bool isBookmarked = false;

  void _toggleBookmark() {
    setState(() {
      isBookmarked = !isBookmarked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          widget.title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.company),
            Text(widget.location),
            Text(widget.daysAgo),
          ],
        ),
        trailing: IconButton(
          icon: Icon(
            Icons.bookmark,
            color: isBookmarked ? Color.fromARGB(255, 19, 1, 96) : Colors.grey,
          ),
          onPressed: _toggleBookmark,
        ),
      ),
    );
  }
}
