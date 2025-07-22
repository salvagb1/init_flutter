import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:init_flutter/ui/components/activity_card.dart';
import 'package:init_flutter/ui/components/weekly_progress_bar.dart';
import 'package:init_flutter/ui/pages/dashboard/home.dart';

List<ActivityPerson> _notifications = [
  ActivityPerson('assets/images/latest_pic.jpg', "Drinking 300ml Water",
      "About 3 minutes ago"),
  ActivityPerson('assets/images/Ellipse2.jpg', "Eat Snack (Fibra)",
      "About 10 minutes ago"),
];

class ActivityBtn extends StatefulWidget {
  const ActivityBtn({Key? key}) : super(key: key);

  @override
  State<ActivityBtn> createState() => _ActivityBtnState();
}

class _ActivityBtnState extends State<ActivityBtn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomePage())),
            icon: SvgPicture.asset('assets/icons/backnavs.svg')),
        title: const Text(
          'Activity Tracker',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w900,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/icons/detailnavs.svg'))
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: const <BoxShadow>[
                  BoxShadow(
                    color: Color(0xffF7F8F8),
                    blurRadius: 10.0,
                  ),
                ],
                color: const Color(0xffE2E7FF),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Today Target",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          margin: const EdgeInsets.only(),
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.5),
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xff9DCEFF),
                                Color(0xff92A3FD),
                              ],
                            ),
                          ),
                          child: SvgPicture.asset('assets/icons/morepush.svg'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Flexible(
                        child: ActivityCard(
                          imagePath: 'assets/images/cupima.jpg',
                          title: '8L',
                          subtitle: 'Water Intake',
                        ),
                      ),
                      SizedBox(width: 15),
                      Flexible(
                        child: ActivityCard(
                          imagePath: 'assets/images/boots.jpg',
                          title: '2400',
                          subtitle: 'Foot Steps',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Activity Progress",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.only(),
                    height: 30,
                    width: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xff9DCEFF),
                          Color(0xff92A3FD),
                        ],
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Weekliy',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 5),
                        SvgPicture.asset('assets/icons/down.svg'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: const <BoxShadow>[
                  BoxShadow(
                    color: Color(0xffF7F8F8),
                    blurRadius: 10.0,
                  ),
                ],
                color: Colors.white,
              ),
              child:const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  WeeklyProgressBar(
                    dayLabel: 'Sun',
                    totalHeight: 150,
                    progressHeight: 40,
                    progressColor: Color(0xff92A3FD),
                  ),
                  WeeklyProgressBar(
                    dayLabel: 'Mon',
                    totalHeight: 150,
                    progressHeight: 60,
                    progressColor: Color(0xffC58BF2),
                  ),
                  WeeklyProgressBar(
                    dayLabel: 'Tue',
                    totalHeight: 150,
                    progressHeight: 90,
                    progressColor: Color(0xff92A3FD),
                  ),
                  WeeklyProgressBar(
                    dayLabel: 'Wed',
                    totalHeight: 150,
                    progressHeight: 50,
                    progressColor: Color(0xffC58BF2),
                  ),
                  WeeklyProgressBar(
                    dayLabel: 'Thu',
                    totalHeight: 150,
                    progressHeight: 110,
                    progressColor: Color(0xff92A3FD),
                  ),
                  WeeklyProgressBar(
                    dayLabel: 'Fri',
                    totalHeight: 150,
                    progressHeight: 70,
                    progressColor: Color(0xffC58BF2),
                  ),
                  WeeklyProgressBar(
                    dayLabel: 'Sat',
                    totalHeight: 150,
                    progressHeight: 100,
                    progressColor: Color(0xff92A3FD),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Latest Activity",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: const Text(
                    'See More',
                    style: TextStyle(color: Color(0xffADA4A5)),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ListView.builder(
              padding: const EdgeInsets.only(
                right: 0,
                left: 0,
              ),
              shrinkWrap: true,
              itemCount: _notifications.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {},
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(_notifications[index].photo),
                  ),
                  title: Text(
                    _notifications[index].title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: Text(_notifications[index].description),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_vert),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ActivityPerson {
  late String photo;
  late String title;
  late String description;

  ActivityPerson(this.photo, this.title, this.description);
}
