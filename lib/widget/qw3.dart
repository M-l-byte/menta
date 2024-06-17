import 'package:flutter/material.dart';
import 'package:mindsync/model/question_model.dart';

class QuestionWidget3 extends StatefulWidget {
  final Question question;
  final Function(double) onOptionSelected;

  QuestionWidget3({required this.question, required this.onOptionSelected});

  @override
  _QuestionWidgetState createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget3> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              widget.question.text,
              style: const TextStyle(
                  fontSize: 16.8,
                  color: Colors.white,
                  fontWeight: FontWeight.w700),
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  widget.onOptionSelected(1);
                  setState(() {
                    widget.question.selectedOption =
                        'Not at all'; // Update the selected option
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      widget.question.selectedOption == 'Not at all'
                          ? Colors.green
                          : Colors.grey[300],
                ),
                child: const Text('Not at all',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.w600)),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  widget.onOptionSelected(0.5);
                  setState(() {
                    widget.question.selectedOption = 'Several days';
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      widget.question.selectedOption == 'Several days'
                          ? Colors.green
                          : Colors.grey[300],
                ),
                child: const Text('Several days',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.w600)),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  widget.onOptionSelected(0.25);
                  setState(() {
                    widget.question.selectedOption =
                        'More than half the days'; // Update the selected option
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: widget.question.selectedOption ==
                          'More than half the days'
                      ? Colors.green
                      : Colors.grey[300],
                ),
                child: const Text('More than half the days',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.w600)),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  widget.onOptionSelected(0);
                  setState(() {
                    widget.question.selectedOption =
                        ' Nearly every day'; // Update the selected option
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      widget.question.selectedOption == ' Nearly every day'
                          ? Colors.green
                          : Colors.grey[300],
                ),
                child: const Text(' Nearly every day',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.w600)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
//Not at all - 0, Several days - 0.25, More than half day - 0.5, Nearly everyday - 1