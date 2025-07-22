import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:init_flutter/ui/pages/dashboard/home.dart';

class AppBarcom extends StatelessWidget implements PreferredSizeWidget {
  const AppBarcom({
    Key? key,
    required this.titletext,
    this.toolbarHeight,
    this.bottom,
  }) : super(key: key);
  final String titletext;
  final double? toolbarHeight;
  final PreferredSizeWidget? bottom;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: toolbarHeight,
      leading: IconButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        ),
        icon: SvgPicture.asset('assets/icons/backnavs.svg'),
      ),
      title: Text(
        titletext,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w900,
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset('assets/icons/detailnavs.svg'),
        )
      ],
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
