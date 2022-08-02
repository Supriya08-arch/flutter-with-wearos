import 'package:flutter/gestures.dart';
import "package:flutter/material.dart";
import 'package:wear/wear.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../repository/userRepository.dart';
// import '../../../styles/styles.dart';
import 'package:getx/style/style.dart';
import 'dashboardwear.dart';
import 'registerwear.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Guitar Shop',
      initialRoute: '/wearos',
      routes: {
        '/wearos': (context) => const WearOS(),
        '/registerwearos': (context) => const RegisterwearOs(),
        '/dashboardwearos': (context) => const Dashboardwear(),

        // '/addProduct': (context) => const AddProductScreen(),
      }));
}

class WearOS extends StatefulWidget {
  const WearOS({Key? key}) : super(key: key);
  @override
  State<WearOS> createState() => _WearOSState();
}

class _WearOSState extends State<WearOS> {
  final double spacing = 20;
  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController(text: 'admin');
  final _passwordController = TextEditingController(text: 'admin');

  _login() async {
    try {
      UserRepository userRepository = UserRepository();
      bool isLogin = await userRepository.login(
          _usernameController.text, _passwordController.text);

      if (isLogin) {
        _navigateToScreen(true);
      } else {
        _navigateToScreen(false);
      }
    } catch (e) {
      MotionToast.error(
        description: Text("Error : ${e.toString()}"),
      ).show(context);
    }
  }

  _navigateToScreen(bool isLogin) {
    if (isLogin) {
      Navigator.pushNamed(context, '/WearOSdashboard');
    } else {
      Fluttertoast.showToast(
          msg: "Either username or password incorrect",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WatchShape(
      builder: (BuildContext context, WearShape shape, Widget? child) {
        return AmbientMode(
          builder: (context, mode, child) {
            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        const SizedBox(height: 5),
                        const Text.rich(TextSpan(
                          text: 'LOGIN',
                          style: TextStyle(
                            color: mainColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        )),
                        const SizedBox(height: 15),
                        SizedBox(
                          height: 30,
                          child: TextFormField(
                            controller: _usernameController,
                            decoration: InputDecoration(
                              labelText: 'Username',
                              labelStyle: const TextStyle(fontSize: 13),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        SizedBox(
                          height: 30,
                          child: TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: const TextStyle(fontSize: 13),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 3),
                        ElevatedButton(
                          onPressed: () {
                            _login();
                            // Navigator.pushReplacementNamed(context, '/login');
                          },
                          style: ElevatedButton.styleFrom(
                            primary: mainColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            minimumSize: const Size(double.infinity, 27),
                            // padding: const EdgeInsets.all(16),
                          ),
                          child: const Text(
                            'Login',
                          ),
                        ),
                        Text.rich(TextSpan(
                            text: 'Don\'t have an Account?',
                            style: const TextStyle(fontSize: 8),
                            children: [
                              TextSpan(
                                  text: ' Sign Up',
                                  style: const TextStyle(
                                    color: mainColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pushReplacementNamed(
                                          context, '/WearOSregister');
                                    })
                            ]))
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
