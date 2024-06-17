import 'package:flutter/material.dart';
import 'package:mindsync/page/loginpage.dart';
import 'package:mindsync/page/register_screen.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Color.fromARGB(101, 62, 149, 136),
              Color.fromARGB(100, 182, 225, 171),
              Color.fromARGB(98, 48, 224, 4),
            ])),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 60,
              ),
              Image.asset(
                'assets/images/logomh.png',
                height: 180,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 355,
                height: 300,
                color: Colors.white.withOpacity(0.35),
                child: Column(
                  children: [
                    Text(
                      "Take a Slow,",
                      style: TextStyle(fontSize: 25, fontFamily: 'Epilogue'),
                    ),
                    Text(
                      "Reset Your Mind",
                      style: TextStyle(fontSize: 25),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                      child: Container(
                        width: 300,
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          gradient: const LinearGradient(colors: [
                            Color.fromARGB(101, 62, 149, 136),
                            Color.fromARGB(100, 182, 225, 171),
                            Color.fromARGB(98, 48, 224, 4),
                          ]),
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                              color: Color.fromARGB(255, 119, 152, 102),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterScreen()));
                      },
                      child: Container(
                        width: 300,
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          gradient: const LinearGradient(colors: [
                            Color.fromARGB(101, 62, 149, 136),
                            Color.fromARGB(100, 182, 225, 171),
                            Color.fromARGB(98, 48, 224, 4),
                          ]),
                        ),
                        child: const Text(
                          'Register',
                          style: TextStyle(
                              color: Color.fromARGB(255, 119, 152, 102),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
