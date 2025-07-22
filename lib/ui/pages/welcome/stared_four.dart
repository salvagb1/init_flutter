import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:init_flutter/ui/pages/auth/create_account.dart';

class StaredFour extends StatefulWidget {
  const StaredFour({super.key});

  @override
  State<StaredFour> createState() => _StaredFourState();
}

class _StaredFourState extends State<StaredFour> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 455,
              child: const Image(
                image: AssetImage('assets/images/sleepquality.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Improve Sleep',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          'Quality',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    child: Text(
                      "Improve the quality of your sleep with us, good quality sleep can bring a good mood in the morning",
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xff56575a),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 95,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff98BAFE),
        onPressed: () {
          context.go('/createAccount');
        },
        child: SvgPicture.asset('assets/icons/arrow_right.svg'),
      ),
    );
  }
}
