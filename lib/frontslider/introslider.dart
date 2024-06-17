import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:mindsync/page/register_page.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});
  List<PageViewModel> getPages() {
    return [
      PageViewModel(
        title: 'Mental Health Programs',
        body:
            'Mental health includes our emotional, psychological, and social well-being.\n It affects how we think, feel, and act \nWe will help you to achieve it through programs ',
        image: Image.asset('assets/images/introimage1.jpeg'),
      ),
      PageViewModel(
        title: 'Virtual Doctor Visits',
        body:
            'You can see your doctor from the comfort of your own bed or sofa. Virtual visits can be easier to fit into your busy schedule \n We help you to schedule appointment with Doctors  ',
        image: Image.asset("assets/images/intro2.png"),
      ),
      PageViewModel(
        title: 'Connecting Peoples',
        body:
            'Connect with doctors,psychologist,Counsellors \n allows you to connect with peoples who have been through the same ',
        image: Image.asset('assets/images/intro3.jpeg'),
      ),
      PageViewModel(
        title: 'Mental Health Education',
        body:
            'Mental health education helps people enhance their social skills which is very important to socialise with different people and learn so many things from them.\n Learning social skills also helps you develop respectful and mutual connections with others. ',
        image: Image.asset('assets/images/int4.jpeg'),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        done: const Icon(Icons.skateboarding_outlined),
        skip: const Text('Skip'),
        next: const Icon(Icons.arrow_forward_ios),
        onDone: () {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => RegisterPage())));
        },
        showNextButton: true,
        showDoneButton: true,
        showSkipButton: false,
        pages: getPages(),
      ),
    );
  }
}
