import 'package:flutter/material.dart';
import 'package:mindsync/Doctor/ReportShow.dart';
import 'package:mindsync/model/patient_model.dart';
import 'package:mindsync/page/PatientPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Map<String, String> patientCredentials = {
    'Patient1': 'pass1',
    'Patient2': 'pass2',
    'Patient3': 'pass3',
    'User': 'user',
    'patient': 'password',
  };
  final List<Patient> patients = [
    Patient(name: "Patient1", age: 20, password: "pass1"),
    Patient(name: "Patient2", age: 20, password: "pass2")
  ];

  Map<String, String> doctorCredentials = {
    'Sandhiya': 'doc',
    'Arjun': 'doc',
    'Ram Kumar': 'doc',
  };

  String errorMessage = '';

  Future<void> _login(BuildContext context) async {
    String username = usernameController.text;
    String password = passwordController.text;

    // Check if username exists in the local list
    if (patientCredentials.containsKey(username)) {
      // Check if password matches
      if (patientCredentials[username] == password) {
        // Successful login
        setState(() {
          errorMessage = '';
        });
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    PatientPage(patient_name: usernameController.text)),
            (route) => false);
      } else {
        // Incorrect password
        setState(() {
          errorMessage = 'Incorrect password';
        });
      }
    } else if (doctorCredentials.containsKey(username)) {
      if (doctorCredentials[username] == password) {
        //Navigate to doctor screen
        final prefs = await SharedPreferences.getInstance();
        final List<String>? loadedUserList = prefs.getStringList('UserList');
        final List<String>? loadedBotList = prefs.getStringList('BotList');

        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ChatAnalysisPage(UserList: loadedUserList ?? [])),
            (route) => false);
      } else {
        // Incorrect password
        setState(() {
          errorMessage = 'Incorrect password';
        });
      }
    } else {
      // Username not found
      setState(() {
        errorMessage = 'Username not found';
      });
    }
  }

  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Center(
  //       child: SingleChildScrollView(
  //         padding: const EdgeInsets.all(20.0),
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: [
  //             Icon(
  //               //icon_image
  //               Icons.health_and_safety,
  //               size: 80,
  //               color: Theme.of(context).primaryColor,
  //             ),
  //             const SizedBox(height: 20),
  //             Text(
  //               'Login', //motto
  //               style: TextStyle(
  //                 fontSize: 28,
  //                 fontWeight: FontWeight.bold,
  //                 color: Theme.of(context).primaryColor,
  //               ),
  //             ),
  //             const SizedBox(height: 30),
  //             TextField(
  //               //login email/username
  //               // Use clear labels and placeholders
  //               controller: usernameController,
  //               decoration: InputDecoration(
  //                 labelText: 'Username',
  //                 filled: true,
  //                 fillColor: Colors.white.withOpacity(0.8),
  //                 prefixIcon:
  //                     const Icon(Icons.person_outline, color: Colors.grey),
  //                 border: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(30),
  //                   borderSide: BorderSide.none,
  //                 ),
  //               ),
  //             ),
  //             const SizedBox(height: 20), //password
  //             TextField(
  //               controller: passwordController,
  //               obscureText: true,
  //               decoration: InputDecoration(
  //                 labelText: 'Password',
  //                 filled: true,
  //                 fillColor: Colors.white.withOpacity(0.8),
  //                 prefixIcon:
  //                     const Icon(Icons.lock_outline, color: Colors.grey),
  //                 border: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(30),
  //                   borderSide: BorderSide.none,
  //                 ),
  //               ),
  //             ),
  //             const SizedBox(height: 20),
  //             ElevatedButton(
  //               onPressed: () => _login(context),
  //               child: const Text(
  //                 //button
  //                 'LOGIN',
  //                 style: TextStyle(color: Colors.black, fontSize: 17),
  //               ),
  //               style: ElevatedButton.styleFrom(
  //                 backgroundColor: Theme.of(context).primaryColor,
  //                 shape: RoundedRectangleBorder(
  //                   borderRadius: BorderRadius.circular(30),
  //                 ),
  //                 padding:
  //                     const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
  //               ),
  //             ),
  //             const SizedBox(height: 10),
  //             Text(
  //               errorMessage,
  //               style: const TextStyle(
  //                 color: Colors.red,
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Color.fromARGB(101, 62, 149, 136),
                Color.fromARGB(100, 182, 225, 171),
                Color.fromARGB(98, 48, 224, 4),
              ])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Image.asset(
                "assets/images/logomh.png",
                height: 180,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Speak Up, Reach Out, End the Doubts !!',
                style: TextStyle(
                    color: Color.fromARGB(255, 103, 142, 93), fontSize: 15),
              ),
              const SizedBox(height: 15),
              Container(
                width: 355,
                height: 300,
                color: Colors.white.withOpacity(0.35),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Welcome!",
                      style: TextStyle(
                          color: Color.fromARGB(255, 103, 142, 93),
                          fontSize: 25),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: 300,
                      child: TextField(
                        controller: usernameController,
                        decoration: const InputDecoration(
                            hintText: "Username",
                            suffixIcon: Icon(Icons.mail_outline_outlined)),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: 300,
                      child: TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                            hintText: "Password",
                            suffixIcon: Icon(Icons.remove_red_eye_outlined)),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Row(
                      children: [SizedBox(width: 28), Text('Forget Password?')],
                    ),
                    const SizedBox(height: 30),
                    GestureDetector(
                      onTap: () => _login(context),
                      child: Container(
                        width: 300,
                        height: 30,
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
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      errorMessage,
                      style: const TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
