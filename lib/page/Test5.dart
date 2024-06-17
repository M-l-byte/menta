import 'package:flutter/material.dart';
import 'package:mindsync/model/question_model.dart';
import 'package:mindsync/screen/TalkBot.dart';
import 'package:mindsync/widget/BottomNavigaton.dart';
import 'package:mindsync/widget/q4.dart';

class Test5 extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test5> {
  final PageController _pageController = PageController();
  List<Question> questions = [
    Question("Question 1: I feel tense or 'keyed up' much of the time ", 0),
    Question("Question 2: I have difficulty falling or staying asleep.", 0),
    Question("Question 3: I feel hopeless about the future.", 0),
    Question(
        "Question 4: I have lost interest in activities I used to enjoy.", 0),
    Question(
        "Question 5: I feel irritable or angry without a clear reason.", 0),
    Question("Question 6: I have outbursts of anger that I later regret", 0),
    Question(
        "Question 7:I have unwanted thoughts or memories of traumatic events.",
        0),
    Question(
        "Question 8: I experience flashbacks, where it feels like the trauma is happening again",
        0),
    Question(
        "Question 9: I avoid people, places, or activities that remind me of traumatic events.",
        0),
    Question(
        "Question 10: I feel emotionally numb or detached from others.", 0),
    Question(
        "Question 11: I feel like I'm watching myself from outside my body.",
        0),
    Question(
        "Question 12: I have trouble remembering important parts of the trauma.",
        0),
    Question("Question 13: I have concerns about my sexual functioning.", 0),
    Question(
        "Question 14: I feel anxious or fearful about sexual activities", 0),
    Question("Question 15: I engage in risky or harmful sexual behaviors.", 0),
    Question(
        "Question 16: I use sex as a way to cope with negative emotions.", 0),
    Question("Question 17: I feel like I don't know who I am.", 0),
    Question("Question 18: I have a very negative view of myself.", 0),
    Question(
        "Question 19: I engage in self-destructive behaviors to reduce tension.",
        0),
    Question(
        "Question 20: I use substances like alcohol or drugs to cope with stress.",
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
                  QuestionWidget4(
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
                                  'Score: $totalScore/20',
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
