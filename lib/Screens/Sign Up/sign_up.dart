import 'dart:convert';

import 'package:dubuz_app/Screens/HomeScreen/home.dart';
import 'package:dubuz_app/Screens/Login%20Screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as https;

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isLoading = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme
          .of(context)
          .accentColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 100,),
            Text(
              'Sign Up',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text('Fill the details & create your account',
                style: TextStyle(color: Colors.grey, fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Form(
                key: globalFormKey,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextFormField(
                        validator: (input) {
                          if (input!.isEmpty) {
                            return 'Please enter username';
                          } else if (!input.contains('_')) {
                            return 'Username should be valid';
                          } else {
                            return null;
                          }
                        },
                        controller: usernameController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.black,
                            ),
                            hintText: 'Username',
                            hintStyle: TextStyle(
                                color: Colors.grey, fontSize: 18)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextFormField(
                        validator: (input) {
                          if (input!.isEmpty) {
                            return 'Please enter phone no.';
                          } else if (!input.contains('0')) {
                            return 'Mobile number should be valid';
                          } else {
                            return null;
                          }
                        },
                        controller: phoneController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.phone,
                              color: Colors.black,
                            ),
                            hintText: 'Mobile No.',
                            hintStyle: TextStyle(
                                color: Colors.grey, fontSize: 18)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextFormField(
                        validator: (input) {
                          if (input!.isEmpty) {
                            return 'Please enter email address';
                          } else if (!input.contains('@')) {
                            return 'Email address should be valid';
                          } else {
                            return null;
                          }
                        },
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: Colors.black,
                            ),
                            hintText: 'Info54@gmail.com',
                            hintStyle: TextStyle(
                                color: Colors.grey, fontSize: 18)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextFormField(
                        validator: (input) {
                          if (input!.isEmpty) {
                            return 'Please enter password';
                          } else {
                            return null;
                          }
                        },
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.lock_open,
                              color: Colors.black,
                            ),
                            hintText: 'Password',
                            hintStyle: TextStyle(
                                color: Colors.grey, fontSize: 18)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextFormField(
                        validator: (input) {
                          if (input!.isEmpty) {
                            return 'Please re-enter password';
                          } else {
                            return null;
                          }
                        },
                        controller: confirmpasswordController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.lock_open,
                              color: Colors.black,
                            ),
                            hintText: 'Confirm Password',
                            hintStyle: TextStyle(
                                color: Colors.grey, fontSize: 18)),
                      ),
                    ),
                  ],
                )
            ),

            SizedBox(height: 50,),
            ElevatedButton(
                onPressed: () async {
                  if (globalFormKey.currentState!.validate()) {
                    globalFormKey.currentState!.save();
                    setState(() {
                      isLoading = true;
                    });
                    register();
                    setState(() {
                      isLoading = false;
                    });
                  } else {
                    ScaffoldMessenger.of(context).
                    showSnackBar(
                        SnackBar(content: Text('Blank field not allowed!')));
                  }
                },
                child: isLoading ? Row(
                  children: [
                    CircularProgressIndicator(color: Colors.white,),
                    SizedBox(width: 20,),
                    Text('Please wait...',
                      style: TextStyle(color: Colors.white, fontSize: 18),)
                  ],
                ) : Text(
                  'SignUp',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1),
                ),
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(200, 50),
                    padding: EdgeInsets.all(10),
                    primary: Theme
                        .of(context)
                        .primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ))),
            SizedBox(
              height: 20,
            ),
            Text(
              'Or Via Social Media',
              style: TextStyle(
                  color: Colors.black45,
                  fontWeight: FontWeight.w500,
                  fontSize: 18),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {},
                    child: Icon(
                      FontAwesomeIcons.facebookF,
                      color: Colors.white,
                      size: 30,
                    ),
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(50, 60),
                        padding: EdgeInsets.all(10),
                        primary: Theme
                            .of(context)
                            .primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ))),
                SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                    onPressed: () {},
                    child: Icon(
                      FontAwesomeIcons.google,
                      color: Colors.white,
                      size: 30,
                    ),
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(50, 60),
                        padding: EdgeInsets.all(10),
                        primary: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ))),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, _loginRoute());
              },
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: RichText(
                    text: TextSpan(
                        text: "Already have an account?",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Login',
                              style: TextStyle(
                                  color: Theme
                                      .of(context)
                                      .primaryColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500))
                        ]),
                  )),
            )
          ],
        ),
      ),
    );
  }

  Future<void> register() async {
    var url = Uri.parse('https://dubuz.com/api/register');
    var response = await https.post(url, body: {
      'email': emailController.text,
      'password': passwordController.text,
      'name': usernameController.text,
      'phone': phoneController.text,
      'password_confirmation': confirmpasswordController.text,
      'term': '1',
      'from': 'app'
    });

    var data = json.decode(response.body);
    if (data['success'] == true) {
      ScaffoldMessenger.of(context).
      showSnackBar(SnackBar(content: Text('${data['message']}')));
      setState(() {
        Navigator.push(context, _signUpRoute());
      });
    } else {
      print('2');
      if (data['data']['email'] != null && data['data']['phone'] == null) {
        ScaffoldMessenger.of(context).
        showSnackBar(SnackBar(content: Text('${data['data']['email']}')));
      }
      else if(data['data']['phone'] != null && data['data']['email'] == null)
      {
        ScaffoldMessenger.of(context).
        showSnackBar(SnackBar(content: Text('${data['data']['phone']}')));
      }
      else if(data['data']['phone'] != null && data['data']['email'] != null){
    ScaffoldMessenger.of(context).
    showSnackBar(SnackBar(content: Text('${data['data']['email']}')));
    ScaffoldMessenger.of(context).
    showSnackBar(SnackBar(content: Text('${data['data']['phone']}')));
    }


  }
  }
  Route _signUpRoute() {
    return PageRouteBuilder(
      transitionDuration: Duration(milliseconds: 500),
      pageBuilder: (context, animation, secondaryAnimation) => const HomePage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // const begin = Offset(0.0, 1.0);
        // const end = Offset.zero;
        //
        // var tween = Tween(begin: begin, end: end);

        animation = CurvedAnimation(parent: animation, curve: Curves.easeInOut);
        return ScaleTransition(
          alignment: Alignment.center,
          scale: animation,
          child: child,
        );
      },
    );
  }
  Route _loginRoute() {
    return PageRouteBuilder(
      transitionDuration: Duration(milliseconds: 500),
      pageBuilder: (context, animation, secondaryAnimation) => Login(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // const begin = Offset(0.0, 1.0);
        // const end = Offset.zero;
        //
        // var tween = Tween(begin: begin, end: end);

        animation = CurvedAnimation(parent: animation, curve: Curves.easeInOut);
        return ScaleTransition(
          alignment: Alignment.center,
          scale: animation,
          child: child,
        );
      },
    );
  }
}
