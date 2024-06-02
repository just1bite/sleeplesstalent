import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sleeplesstalented/pages/register_screen/register_screen.dart';
import 'package:sleeplesstalented/main_app/main_screen.dart';
import 'package:loading_overlay/loading_overlay.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var _passwordVisible = false;
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  late String? email;
  late String? password;
  late bool _isLoading = false;
  bool _isChecked = false;

  Future<void> loginSubmit() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email!,
          password: password!,
        );
        // Retrieve the display name

        setState(() {
          _isLoading = false;
        });

        final snackBar = SnackBar(
          content: const Text('Login Berhasil'),
          backgroundColor: Colors.green,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MainScreen()),
        );
      } on FirebaseAuthException catch (e) {
        setState(() {
          _isLoading = false;
        });

        String message;
        if (e.code == 'user-not-found') {
          message = 'User not found';
        } else if (e.code == 'wrong-password') {
          message = 'Wrong password';
        } else {
          message = 'Login failed. Please try again';
        }

        final snackBar = SnackBar(
          content: Text(message),
          backgroundColor: Colors.red,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: LoadingOverlay(
        isLoading: _isLoading,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome Back',
                      style: TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'For signing in and being contacted by employers.',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Color.fromARGB(255, 82, 75, 107),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 32),
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: 10),
                        child: TextFormField(
                          validator: (String? emailValue) {
                            if (emailValue!.isEmpty) {
                              return "Enter email";
                            }
                            email = emailValue;
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "Masukan email anda",
                            labelText: "Email",
                            hintStyle: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: 10),
                        child: TextFormField(
                          validator: (String? passwordValue) {
                            if (passwordValue!.isEmpty) {
                              return "Enter password";
                            }
                            password = passwordValue;
                            return null;
                          },
                          obscureText: !_passwordVisible,
                          decoration: InputDecoration(
                            hintText: "Masukan password anda",
                            hintStyle: TextStyle(color: Colors.black),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Theme.of(context).primaryColorDark,
                              ),
                              onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            ),
                            labelText: "Password",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      children: [
                        Checkbox(
                          value: _isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              _isChecked = value!;
                            });
                          },
                          activeColor: Color.fromARGB(255, 214, 205, 254),
                        ),
                        Text('Remember me'),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        loginSubmit();
                      },
                      child: Text('SIGN IN'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 19, 1, 96),
                        padding:
                            EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                        textStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Don\'t have an account? ',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Color.fromARGB(255, 13, 1, 64),
                            ),
                          ),
                          TextSpan(
                            text: 'Sign up',
                            style: TextStyle(
                              color: Colors.orange,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterScreen()),
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
