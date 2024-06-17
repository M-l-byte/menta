import 'package:flutter/material.dart';
import 'package:mindsync/data/mood_data.dart';
import 'package:mindsync/journal/journal.dart';
import 'package:mindsync/meditate/pages/homie.dart';
import 'package:mindsync/page/typesTest.dart';
import 'package:mindsync/widget/BottomNavigaton.dart';

class PatientPage extends StatefulWidget {
  const PatientPage({super.key, required this.patient_name});
  final String patient_name;

  @override
  State<PatientPage> createState() => _PatientPageState();
}

class _PatientPageState extends State<PatientPage> {
  final ValueNotifier<String> _notifier =
      ValueNotifier<String>(MoodData.calm.name);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NaviBar(
        currindex: 0,
      ),
      // body: Container(
      //   decoration: const BoxDecoration(
      //     gradient: LinearGradient(
      //       begin: Alignment.topCenter,
      //       end: Alignment.bottomCenter,
      //       colors: [
      //         Color.fromARGB(211, 136, 220, 140),

      //         // Colors.teal,
      //         Color.fromARGB(255, 59, 212, 177),
      //         // Color(0xFF4DB6AC),
      //       ],
      //     ),
      //   ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 70),
            Row(
              children: [
                SizedBox(
                  height: 60,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(120),
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Hello Again!!",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "We wish you have a good day",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        color: Colors.indigo.withOpacity(.6),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                const Icon(
                  Icons.more_vert_rounded,
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 150,
              child: ValueListenableBuilder<String>(
                  valueListenable: _notifier,
                  builder: (context, value, _) {
                    return ListView.builder(
                      itemCount: MoodData.moods.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        var mood = MoodData.moods[index];
                        return GestureDetector(
                          onTap: () {
                            if (value != mood.name) {
                              _notifier.value = mood.name;
                            }
                          },
                          child: Column(
                            children: [
                              AnimatedContainer(
                                curve: Curves.fastEaseInToSlowEaseOut,
                                duration: const Duration(milliseconds: 500),
                                height: 70,
                                width: 70,
                                padding: EdgeInsets.all(
                                    value == mood.name ? 15 : 10),
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 7.5, vertical: 10),
                                decoration: ShapeDecoration(
                                  color: value == mood.name
                                      ? Colors.indigo
                                      : Theme.of(context)
                                          .colorScheme
                                          .background,
                                  // color: Colors.indigo,
                                  shape: value == mood.name
                                      ? const StarBorder(
                                          pointRounding: .8,
                                          points: 4,
                                          innerRadiusRatio: .75,
                                        )
                                      : const CircleBorder(
                                          eccentricity: 1,
                                          side: BorderSide(
                                            color: Colors.indigo,
                                            width: 2,
                                          ),
                                        ),
                                ),
                                child: Image.asset(
                                  mood.icon,
                                  color: value == mood.name
                                      ? Colors.white
                                      : Colors.indigo,
                                ),
                              ),
                              Text(
                                mood.name,
                                style: TextStyle(
                                  color: Colors.indigo,
                                  fontWeight: value == mood.name
                                      ? FontWeight.w900
                                      : FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }),
            ),
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Stack(
                children: [
                  Container(
                    height: 220,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.indigo.shade300,
                        border: Border.all(color: Colors.indigo.shade300)),
                  ),
                  Positioned.fill(
                    top: 35,
                    left: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Ready to start\nyour first session?",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        const SizedBox(height: 10),
                        // Text(
                        //   "Meditation 5-10 min",
                        //   style: TextStyle(
                        //     color: Colors.white.withOpacity(.8),
                        //   ),
                        // ),
                        SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          width: 140,
                          child: FilledButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.indigo,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => NavigationPage()),
                                );
                              },
                              child: const Text("START")),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Container(
                    width: 500,
                    height: 80,
                    child: ElevatedButton(
                      child: Text("Add your journals"),
                      onPressed: () => {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Journal()))
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 500,
                    height: 80,
                    child: ElevatedButton(
                      child: Text("Let's Meditate"),
                      onPressed: () => {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Homie()))
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      ////////
    );
  }
}
