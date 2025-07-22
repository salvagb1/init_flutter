import 'package:flutter/material.dart';
import 'package:init_flutter/ui/components/card_what.dart';
import 'package:init_flutter/ui/pages/auth/login.dart';

class WhatGoal extends StatefulWidget {
  const WhatGoal({super.key});

  @override
  State<WhatGoal> createState() => _WhatGoalState();
}

class _WhatGoalState extends State<WhatGoal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            const SizedBox(
              child: Text(
                'What is your goal?',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              child: Text(
                'It willhelp us choose a best',
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
            ),
            const SizedBox(
              child: Text(
                'programfor you',
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
            ),
            Container(
              color: Colors.white,
              height: 500,
              child: ListView(
                padding: const EdgeInsets.all(10),
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  CardWhat('assets/icons/yougoal1.svg'),
                  CardWhat('assets/icons/yougoal2.svg'),
                  CardWhat('assets/icons/yougoal3.svg'),
                ],
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 55,
              child: ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    )),
                child: const Text(
                  'Confirm',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(const Color(0xff98BAFE)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25))),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
