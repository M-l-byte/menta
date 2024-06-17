import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindsync/page/register_page.dart';

class getStarted extends StatelessWidget {
  const getStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/gt1.avif"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 250),
              const Text(
                'Therapy & Care',
                style: TextStyle(
                    fontSize: 30, color: Color.fromARGB(255, 87, 82, 65)),
              ),
              const SizedBox(height: 10),
              const Text(
                'We help Proffesional therapist',
                style: TextStyle(
                    fontSize: 15, color: Color.fromARGB(255, 87, 82, 65)),
              ),
              const Text(
                'and  patients find each other',
                style: TextStyle(
                    fontSize: 15, color: Color.fromARGB(255, 87, 82, 65)),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                  onPressed: () {
                    Get.to(RegisterPage());
                  },
                  child: Text("Get Started"))
            ],
          ),
        ),
      ),
    );
  }
}
