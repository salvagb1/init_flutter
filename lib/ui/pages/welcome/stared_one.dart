import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:init_flutter/ui/pages/welcome/stared_two.dart';

class StaredOne extends StatefulWidget {
  const StaredOne({super.key});

  @override
  State<StaredOne> createState() => _StaredOneState();
}

class _StaredOneState extends State<StaredOne> {
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
                image: AssetImage('assets/images/yourgoal.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SizedBox(
                    child: Text(
                      'Track Your Goal',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    child: Text(
                      "Don't worry if you have trouble determining your goals, We can help you determine your goals and track your goals",
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xff56575a),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 115,
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
          context.go('/staredTwo');
        },
        child: SvgPicture.asset('assets/icons/arrow_right.svg'),
      ),
    );
  }
}
