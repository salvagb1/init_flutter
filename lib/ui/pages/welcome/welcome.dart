import 'package:flutter/material.dart';
import 'package:init_flutter/ui/pages/dashboard/home.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            const SizedBox(
              child: Image(image: AssetImage('assets/images/welcome.jpg')),
            ),
            SizedBox(
              height: 30,
            ),
            const SizedBox(
              child: Text(
                "Welcome, stefani",
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              child: Text(
                "You are all set now, let's reach your",
                style: TextStyle(fontSize: 14, color: Color(0xff56575a)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              child: Text(
                "goals together with us",
                style: TextStyle(fontSize: 14, color: Color(0xff56575a)),
              ),
            ),
            const Expanded(child: SizedBox()),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 55,
              child: ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomePage())),
                child: const Text(
                  'To Home',
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
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
