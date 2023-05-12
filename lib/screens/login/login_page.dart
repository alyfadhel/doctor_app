import 'package:doctor_master/layout/doctor_screen.dart';
import 'package:doctor_master/screens/forget_password/forgot_password_page.dart';
import 'package:doctor_master/screens/registration/registration_page.dart';
import 'package:doctor_master/shared/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginHomePage extends StatefulWidget {
  const LoginHomePage({super.key});

  @override
  _LoginHomePageState createState() => _LoginHomePageState();
}

class _LoginHomePageState extends State<LoginHomePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _Username = TextEditingController();
  final TextEditingController _PasswordController = TextEditingController();
  bool _isLoading = false;
  final String _errorMessage = '';

  void _submit() {
    if (_formKey.currentState!.validate()) {
      DioHelper.postData(url: 'http://160.20.146.238/api?action=login', data: {
        'username': _Username.text,
        'password': _PasswordController.text,
      }).then((value) {
        print("success");
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LayoutScreen()));
      }).catchError((error) {
        setState(() {
          _isLoading = true;
          print("error");
        });
        print(error.toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[200],
        title: const Padding(
          padding: EdgeInsets.only(right: 30),
          child: Text('Login', style: TextStyle(color: Colors.white)),
        ),
        centerTitle: true,
        shadowColor: Colors.grey,
        elevation: 0.0,
        leadingWidth: 100,
        toolbarTextStyle: const TextTheme(
          titleLarge: TextStyle(
            // headline6 is used for setting title's theme
            color: Colors.black87,
            fontSize: 30,
            locale: Locale.fromSubtags(),
          ),
        ).bodyMedium,
        titleTextStyle: const TextTheme(
          titleLarge: TextStyle(
            // headline6 is used for setting title's theme
            color: Colors.black87,
            fontSize: 20,
            locale: Locale.fromSubtags(),
          ),
        ).titleLarge, // default is 56
      ),
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: const EdgeInsets.all(10.0),
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.deepOrange[100]!.withOpacity(0.5),
                        spreadRadius: 7,
                        blurRadius: 10,
                        offset: const Offset(4, 4),
                      ),
                    ],
                    image: const DecorationImage(
                      image: AssetImage("assets/images/img_2.png"),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _Username,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.red[200]),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: const BorderSide(
                          color: Colors.black,
                        )),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    label: const Text(
                      'Username',
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _PasswordController,
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.red[200]),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: const BorderSide(
                          color: Colors.black,
                        )),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    label: const Text(
                      '*******',
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty && value.length <= 6) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ForgotPasswordPage(),
                        ),
                      );
                    },
                    child: const Text(
                      'Forgot password?',
                      style: TextStyle(
                        color: Colors.black, // set the color to blue
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.red[200],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  onPressed: _submit,
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                if (_isLoading)
                  const Center(
                    child: CircularProgressIndicator(),
                  )
                else if (_errorMessage.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      _errorMessage,
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const RegisterPage(),
                      ),
                    );
                  },
                  child: const Text(
                    'Don\'t have an account? Sign Up',
                    style: TextStyle(
                      color: Colors.black, // set the color to red
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 50, end: 50),
                  child: Container(
                    // decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(
                    //       20.0,
                    //     ),
                    //     color: Theme.of(context).scaffoldBackgroundColor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.grey)),
                          child: IconButton(
                            icon: const Icon(
                              FontAwesomeIcons.facebook,
                              size: 30,
                              color: Colors.blue,
                            ),
                            onPressed: () {
                              // handle Facebook button press
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.grey)),
                          child: IconButton(
                            icon: const Icon(
                              FontAwesomeIcons.twitter,
                              size: 30,
                              color: Colors.lightBlueAccent,
                            ),
                            onPressed: () {
                              // handle Twitter button press
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.grey)),
                          child: IconButton(
                            icon: Icon(
                              FontAwesomeIcons.google,
                              size: 30,
                              color: Colors.red[200],
                            ),
                            onPressed: () {
                              // handle Google button press
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'categories_screen.dart';
import 'forgot_password_page.dart';
import 'registration_page.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  late String _email;
  late String _password;
  Dio _dio = Dio();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'How are you today !',
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold , color: Colors.teal),
            ),
            SizedBox(height: 20),
            CircleAvatar(
              radius: 154,
              backgroundImage: AssetImage('assets/images/1.jpg'),
            ),
            SizedBox(height: 40),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter your email',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _email = value!;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    obscureText: !_showPassword,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _showPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _showPassword = !_showPassword;
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _password = value!;
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        try {
                          // Send a POST request to the API endpoint to authenticate the user
                          Response response = await _dio.post(
                            'https://api.example.com/authenticate',
                            data: {
                              'email': _email,
                              'password': _password,
                            },
                          );
                          // If the API returns a success status code, navigate to the categories screen
                          if (response.statusCode == 200) {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => CategoriesScreen(),
                              ),
                            );
                          }
                        } catch (e) {
                          // If the API returns an error status code, show an error message to the user
                          final snackBar = SnackBar(
                            content: Text('Invalid email or password'),
                            backgroundColor: Colors.red,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      }
                    },
                    child: Text('Login'),
                  ),
                  SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ForgotPasswordPage(),
                        ),
                      );
                    },
                    child: Text('Forgot password?'),
                  ),
                  SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>  RegisterPage
    (),
                        ),
                      );
                    },
                    child: Text('Create an account'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

*/

/*import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:new_project/common/theme_helper.dart';
import 'package:new_project/screens/category_second__screen.dart';

import 'forgot_password_page.dart';
import 'categories_screen.dart';
import 'registration_page.dart';
import 'intro_screen.dart';
import '../widgets/header_widget.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';


class LoginPage extends StatefulWidget{
  static const screenRoute = '/';
  const LoginPage({Key? key}): super(key:key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{

  double _headerHeight = 250;
  Key _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.white,
      body:

      SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _headerHeight,
              child:  DoubleCircleMask(),
            ),
            SafeArea(
              child: Container( 
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 10),// This will be the login form
                child: Column(
                  children: [
                    Text(
                      'How are you today !',
                      style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Sign in your account',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 30.0),
                    Form(
                      key: _formKey,
                        child: Column(
                          children: [
                            Container(
                              child: TextField(
                                decoration: ThemeHelper().textInputDecoration('User Name', 'Enter your user name'),
                              ),
                              decoration: ThemeHelper().inputBoxDecorationShaddow(),
                            ),
                            SizedBox(height: 30.0),
                            Container(
                              child: TextField(
                                obscureText: true,
                                decoration: ThemeHelper().textInputDecoration('Password', 'Enter your password'),
                              ),
                              decoration: ThemeHelper().inputBoxDecorationShaddow(),
                            ),
                            SizedBox(height: 15.0),
                            Container(
                              margin: EdgeInsets.fromLTRB(10,0,10,20),
                              alignment: Alignment.topRight,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push( context, MaterialPageRoute( builder: (context) => ForgotPasswordPage()), );
                                },
                                child: Text( "Forgot your password?", style: TextStyle( color: Colors.grey, ),
                                ),
                              ),
                            ),
                            Container(
                              decoration: ThemeHelper().buttonBoxDecoration(context),
                              child: ElevatedButton(
                                style: ThemeHelper().buttonStyle(),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                                  child: Text('Sign In'.toUpperCase(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                                ),
                                onPressed: (){
                                  //After successful login we will redirect to profile page. Let's create profile page now
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CategoriesScreen()));
                                },
                              ),
                            ),

                            Container(
                              margin: EdgeInsets.fromLTRB(10,20,10,20),
                              //child: Text('Don\'t have an account? Create'),
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(text: "Don\'t have an account? "),
                                    TextSpan(
                                      text: 'Create',
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationPage()));
                                        },

                                      style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).accentColor),
                                    ),
                                  ]
                                )
                              ),


                            ),
                          ],
                        )
                    ),
                  ],
                )
              ),


            ),

          ],

        ),
      ),


    );
  }
}*/
