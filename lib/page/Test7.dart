import 'package:flutter/material.dart';
import 'package:mindsync/model/question_model.dart';
import 'package:mindsync/screen/TalkBot.dart';
import 'package:mindsync/widget/BottomNavigaton.dart';
import 'package:mindsync/widget/qw3.dart';

class Test7 extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test7> {
  final PageController _pageController = PageController();
  List<Question> questions = [
    Question("Question 1: Little interest or pleasure in doing things ", 0),
    Question("Question 2: Feeling down, depressed, or hopeless", 0),
    Question(
        "Question 3: Trouble falling or staying asleep, or sleeping too much",
        0),
    Question("Question 4: Feeling tired or having little energy", 0),
    Question("Question 5: Poor appetite or overeating", 0),
    Question(
        "Question 6: Feeling bad about yourself - or that you are a failure or have let yourself or your family down",
        0),
    Question(
        "Question 7: Trouble concentrating on things, such as reading the newspaper or watching television",
        0),
    Question(
        "Question 8: Moving or speaking so slowly that other people could have noticed? Or the opposite - being so fidgety or restless that you have been moving around a lot more than usual",
        0),
    Question(
        "Question 9: Thoughts that you would be better off dead or of hurting yourself in some way",
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
                  QuestionWidget3(
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
                                  'Score: $totalScore/7',
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
