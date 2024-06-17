import 'package:flutter/material.dart';
import 'package:mindsync/model/question_model.dart';
import 'package:mindsync/screen/TalkBot.dart';
import 'package:mindsync/widget/BottomNavigaton.dart';
import 'package:mindsync/widget/question_w2.dart';

class Test4 extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _TestState createState() => _TestState();
}

class _TestState extends State<Test4> {
  final PageController _pageController = PageController();
  List<Question> questions = [
    Question(
        "Question 1: Do you often worry about people you care about abandoning you or leaving you?",
        0),
    Question(
        "Question 2: Do your relationships with family and friends often seem very intense and unstable?",
        0),
    Question(
        "Question 3:Do you frequently experience changes in how you see yourself (e.g., your identity, goals, values)?",
        0),
    Question(
        "Question 4: Do you engage in impulsive behaviors that could be self-damaging (e.g., spending sprees, reckless driving, substance abuse, binge eating)?",
        0),
    Question(
        "Question 5: Have you ever engaged in self-harming behaviors, such as cutting or burning yourself?",
        0),
    Question(
        "Question 6: Do you experience sudden and intense changes in your mood (e.g., intense episodes of sadness, irritability, or anxiety)?",
        0),
    Question(
        "Question 7: Do you often feel empty or like you are lacking purpose or meaning in your life?",
        0),
    Question(
        "Question 8: Do you have episodes of intense anger or difficulty controlling your anger?",
        0),
    Question(
        "Question 9: Do you sometimes feel paranoid or experience severe dissociation (feeling disconnected from yourself or reality), especially during stress?",
        0),
    Question(
        "Question 10: Do you often feel as if you don’t know who you are or struggle with a sense of self-identity?",
        0),
  ];

  double totalScore = 0;
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: grad,
      bottomNavigationBar: NaviBar(
        currindex: 0,
      ),
      // appBar: AppBar(
      //   title: Text(
      //     'Test',
      //     style: TextStyle(
      //       fontSize: 25,
      //       // color: Theme.of(context).primaryColor,
      //     ),
      //   ),
      //   backgroundColor: Colors.blue[300],
      // ),
      body: Container(
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 125, 112, 161)),
        child: PageView.builder(
          controller: _pageController,
          itemCount: questions.length,
          onPageChanged: (index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          itemBuilder: (context, index) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  QuestionWidget1(
                    question: questions[currentPageIndex],
                    onOptionSelected: (score) {
                      setState(() {
                        questions[currentPageIndex].score = score;
                        totalScore = questions
                            .map((question) => question.score)
                            .reduce((a, b) => a + b);

                        if (currentPageIndex < questions.length - 1) {
                          currentPageIndex++;
                          _pageController.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        } else {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const TalkToBot()),
                              (route) => false);
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text(
                                  'Mental Health Score',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                content: Text(
                                  'Score: $totalScore/10',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Close'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      });
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
