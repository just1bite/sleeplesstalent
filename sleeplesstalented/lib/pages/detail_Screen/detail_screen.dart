import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DetailScreen(),
    );
  }
}

class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? fullName;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    User? user = _auth.currentUser;
    if (user != null) {
      setState(() {
        fullName = user.displayName ??
            'User'; // Assuming the user's display name is set
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileHeader(fullName: fullName),
            AboutMeSection(),
            WorkExperienceSection(),
            EducationSection(),
            SkillsSection(),
            SocialMediaSection(),
            ResumeSection(),
          ],
        ),
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  final String? fullName;

  ProfileHeader({this.fullName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.deepPurple, Colors.deepPurpleAccent],
        ),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/profile_picture.png'),
          ),
          SizedBox(height: 10),
          Text(
            fullName ?? 'User',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          Text(
            'Jakarta Selatan, Indonesia',
            style: TextStyle(color: Colors.white70, fontSize: 16),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '120k Followers',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(width: 10),
              Text(
                '23k Following',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {},
            child: Text('Edit Profile'),
          ),
        ],
      ),
    );
  }
}

class AboutMeSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      title: 'About me',
      child: Text(
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lectus id commodo egestas metus interdum dolor.',
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}

class WorkExperienceSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      title: 'Work experience',
      child: ListTile(
        title: Text('Manager'),
        subtitle: Text('Amazon Inc\nJan 2015 - Feb 2022 · 5 Years'),
      ),
    );
  }
}

class EducationSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      title: 'Education',
      child: ListTile(
        title: Text('Information Technology'),
        subtitle: Text('University of Oxford\nSep 2010 - Aug 2013 · 5 Years'),
      ),
    );
  }
}

class SkillsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      title: 'Skill',
      child: Wrap(
        spacing: 8.0,
        children: [
          Chip(label: Text('Leadership')),
          Chip(label: Text('Teamwork')),
          Chip(label: Text('Visioner')),
          Chip(label: Text('Target oriented')),
          Chip(label: Text('Consistent')),
          // Add more chips as needed
        ],
      ),
    );
  }
}

class SocialMediaSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      title: 'Media Sosial',
      child: Column(
        children: [
          ListTile(
            leading: Icon(FontAwesomeIcons.facebook),
            title: Text('@fuahari'),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.instagram),
            title: Text('@fuahari'),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.twitter),
            title: Text('@fuahari'),
          ),
        ],
      ),
    );
  }
}

class ResumeSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      title: 'Resume',
      child: ListTile(
        leading: Icon(Icons.picture_as_pdf),
        title: Text('Fahri Ramadhan - CV - IT Supp'),
        subtitle: Text('867 Kb · 14 Feb 2022 at 11:30 am'),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            // Handle delete action
          },
        ),
      ),
    );
  }
}

class SectionContainer extends StatelessWidget {
  final String title;
  final Widget child;

  SectionContainer({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          child,
        ],
      ),
    );
  }
}
