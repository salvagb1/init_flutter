import 'package:flutter/material.dart';
import 'package:init_flutter/ui/components/appbar.dart';
import 'package:init_flutter/ui/pages/dashboard/notification/view_notification.dart';

List<ActivityPerson> _notifications = [
  ActivityPerson('assets/images/Ellipse1.jpg', "Hey, it's time for lunch",
      "About 1 minitus ago"),
  ActivityPerson('assets/images/Ellipse2.jpg',
      "Don't miss your lawerbody workout", "About 1 minitus ago"),
  ActivityPerson('assets/images/Ellipse3.jpg',
      "Hey, let's some meals for your b...", "About 1 minitus ago"),
  ActivityPerson('assets/images/Ellipse4.jpg',
      "Congratulations, You have finishied", "About 1 minitus ago"),
  ActivityPerson('assets/images/Ellipse5.jpg', "Hey, it's time for lunch",
      "About 1 minitus ago"),
  ActivityPerson('assets/images/Ellipse6.jpg',
      "Ups, You have missied your Lowerbo", "About 1 minitus ago"),
];

class NotificationFitness extends StatefulWidget {
  const NotificationFitness({Key? key}) : super(key: key);

  @override
  State<NotificationFitness> createState() => _NotificationFitnessState();
}

class _NotificationFitnessState extends State<NotificationFitness> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        child: AppBarcom(titletext: 'Notification'),
        preferredSize: Size.fromHeight(50),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: _notifications.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ListTile(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ViewNotification())),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(_notifications[index].photo),
                  ),
                  title: Text(_notifications[index].title),
                  subtitle: Text(_notifications[index].description),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_vert),
                  ),
                ),
                const Divider(
                  color: Color(0xffDDDADA),
                  thickness: 2,
                )
              ],
            );
          },
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
