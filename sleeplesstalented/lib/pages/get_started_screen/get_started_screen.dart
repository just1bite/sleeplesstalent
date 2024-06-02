import 'package:flutter/material.dart';
import 'package:sleeplesstalented/pages/register_screen/register_screen.dart'; // Import RegisterScreen
import 'package:sleeplesstalented/pages/login_screen/login_screen.dart'; // Import LoginScreen

class GetStartedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/GetStarted.png'),
            SizedBox(height: 20),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'FIND YOUR\n',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: 'DREAM JOB\n',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 214, 17),
                    ),
                  ),
                  TextSpan(
                    text: 'HERE!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              'EXPLORE ALL THE MOST EXCITING JOB ROLES BASED ON YOUR ACTIVE TIME',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Add logic to navigate to Sign In screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(
                    255, 19, 1, 96), // Change primary with backgroundColor
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: Text(
                'SIGN IN',
                style: TextStyle(
                    color: Colors.white), // Change onPrimary with this
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Navigate to RegisterScreen when the button is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(
                    255, 214, 205, 254), // Change primary with backgroundColor
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: Text(
                'SIGN UP',
                style: TextStyle(
                    color: Colors.black), // Change onPrimary with this
              ),
            ),
          ],
        ),
      ),
    );
  }
}
