import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:init_flutter/ui/pages/dashboard/navigatorbtn/activity_btn.dart';
import 'package:init_flutter/ui/pages/dashboard/navigatorbtn/home_btn.dart';
import 'package:init_flutter/ui/pages/dashboard/navigatorbtn/profile_btn.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentTab = 0;
  final List<Widget> screens = [
    const HomeBtn(),
    const ActivityBtn(),
    const ProfileBtn(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const HomeBtn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      floatingActionButton: FloatingActionButton(
        child: SvgPicture.asset('assets/icons/activity.svg'),
        // backgroundColor: const Color(0xff92A3FD),
        onPressed: () {
          setState(() {
            currentScreen = const ActivityBtn();
            currentTab = 1;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = const HomeBtn();
                        currentTab = 0;
                      });
                    },
                    child: SvgPicture.asset(
                      'assets/icons/home3.svg',
                      color: currentTab == 0
                          ? const Color(0xffC58BF2)
                          : const Color(0xffADA4A5),
                    ),
                  ),
                  // MaterialButton(
                  //   minWidth: 40,
                  //   onPressed: () {
                  //     setState(() {
                  //       currentScreen = const ActivityBtn();
                  //       currentTab = 2;
                  //     });
                  //   },
                  //   child: SvgPicture.asset(
                  //     'assets/icons/activity.svg',
                  //     color: currentTab == 2
                  //         ? const Color(0xffC58BF2)
                  //         : const Color(0xffADA4A5),
                  //   ),
                  // ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 50,
                    onPressed: () {
                      setState(() {
                        currentScreen = const ProfileBtn();
                        currentTab = 2;
                      });
                    },
                    child: SvgPicture.asset(
                      'assets/icons/profile.svg',
                      color: currentTab == 2
                          ? const Color(0xffC58BF2)
                          : const Color(0xffADA4A5),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
