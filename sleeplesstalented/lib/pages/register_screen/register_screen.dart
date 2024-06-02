import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sleeplesstalented/pages/login_screen/login_screen.dart';
import 'package:loading_overlay/loading_overlay.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var _passwordVisible = false;
  final _formKey = GlobalKey<FormState>();
  late String? name;
  late String? email;
  late String? password;
  late bool _isLoading = false;
  bool _isChecked = false;

  Future<void> registerSubmit() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email!,
          password: password!,
        );
        // Update the display name
        await userCredential.user?.updateDisplayName(name);

        setState(() {
          _isLoading = false;
        });

        final snackBar = SnackBar(
          content: const Text('Data Berhasil Disimpan'),
          backgroundColor: Colors.green,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      } on FirebaseAuthException catch (e) {
        setState(() {
          _isLoading = false;
        });

        String message;
        if (e.code == 'email-already-in-use') {
          message = 'Email already in use';
        } else if (e.code == 'weak-password') {
          message = 'Password is too weak';
        } else {
          message = 'Registration failed. Please try again';
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
                    SizedBox(height: 6.0),
                    Text(
                      'Create an Account',
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
                          validator: (String? nameValue) {
                            if (nameValue!.isEmpty) {
                              return "Enter your full name";
                            }
                            name = nameValue;
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "Enter your full name",
                            labelText: "Name",
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
                          validator: (String? emailValue) {
                            if (emailValue!.isEmpty) {
                              return "Enter email";
                            }
                            email = emailValue;
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "Enter your email",
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
                            hintText: "Enter your password",
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
                      onPressed: registerSubmit,
                      child: Text('SIGN UP'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 19, 1, 96),
                        padding:
                            EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                        textStyle: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'You dont have an account yet? ',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Color.fromARGB(255, 13, 1, 64),
                            ),
                          ),
                          TextSpan(
                            text: 'Sign in',
                            style: TextStyle(
                              color: Colors.orange,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()),
                                );
                                print("Sign in clicked");
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
