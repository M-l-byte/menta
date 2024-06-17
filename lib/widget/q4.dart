import 'package:flutter/material.dart';
import 'package:mindsync/model/question_model.dart';

class QuestionWidget4 extends StatefulWidget {
  final Question question;
  final Function(double) onOptionSelected;

  QuestionWidget4({required this.question, required this.onOptionSelected});

  @override
  _QuestionWidgetState createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget4> {
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
                        'Never'; // Update the selected option
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: widget.question.selectedOption == 'Never'
                      ? Colors.green
                      : Colors.grey[300],
                ),
                child: const Text('Never',
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
                    widget.question.selectedOption = 'Sometimes';
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: widget.question.selectedOption == 'Sometimes'
                      ? Colors.green
                      : Colors.grey[300],
                ),
                child: const Text('Sometimes',
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
                        'Often'; // Update the selected option
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: widget.question.selectedOption == 'Often'
                      ? Colors.green
                      : Colors.grey[300],
                ),
                child: const Text('Often',
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
                        ' Always'; // Update the selected option
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: widget.question.selectedOption == ' Always'
                      ? Colors.green
                      : Colors.grey[300],
                ),
                child: const Text(' Always',
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