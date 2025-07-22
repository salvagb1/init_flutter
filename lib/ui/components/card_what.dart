import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class CardWhat extends StatefulWidget {
  CardWhat(this.pathSvg, {Key? key}) : super(key: key);
  String pathSvg = 'assets/icons/yougoal1.svg';

  @override
  State<CardWhat> createState() => _CardWhatState();
}

class _CardWhatState extends State<CardWhat> {
  @override
  Widget build(BuildContext context) {
    final card = Container(
      child: SvgPicture.asset(widget.pathSvg),
      padding: const EdgeInsets.all(30),
      width: 280,
      margin: const EdgeInsets.only(
        top: 48.0,
        left: 15.0,
        right: 15.0,
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black38,
            blurRadius: 10.0,
          ),
        ],
        gradient:
            LinearGradient(colors: [Color(0xff9DCEFF), Color(0xff92A3FD)]),
      ),
    );
    return card;
  }
}
