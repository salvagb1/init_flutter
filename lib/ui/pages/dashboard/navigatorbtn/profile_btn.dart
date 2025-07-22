import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:init_flutter/shared/providers/auth_provider.dart';
import 'package:init_flutter/ui/components/custom_info_button.dart';
import 'package:init_flutter/ui/pages/dashboard/home.dart';

class ProfileBtn extends ConsumerStatefulWidget {
  const ProfileBtn({Key? key}) : super(key: key);

  @override
  ConsumerState<ProfileBtn> createState() => _ProfileBtnState();
}

class _ProfileBtnState extends ConsumerState<ProfileBtn> {
  bool _switch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                ),
            icon: SvgPicture.asset('assets/icons/backnavs.svg')),
        title: const Text(
          'Profile',
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
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/latest_pic.jpg')),
                const SizedBox(width: 10),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Stefani Wong",
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Losea fat Program',
                        style: TextStyle(
                          color: Color(0xff7B6F72),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 35,
                    width: 95,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xff9DCEFF),
                          Color(0xff92A3FD),
                        ],
                      ),
                    ),
                    child: const Center(
                      child: Text('Edit', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                CustomInfoButton(value: '180cm', label: 'Height'),
                SizedBox(width: 10),
                CustomInfoButton(value: '75kg', label: 'Weight'),
                SizedBox(width: 10),
                CustomInfoButton(value: '22', label: 'BMI'),
              ],
            ),
            const SizedBox(height: 30),
            _buildSection('Account', [
              _buildRow('assets/icons/profile2.svg', 'Personal Data'),
              _buildRow('assets/icons/achievement.svg', 'Achievement'),
              _buildRow('assets/icons/graph.svg', 'Activity History'),
              _buildRow('assets/icons/workout.svg', 'Workout Progress'),
            ]),
            const SizedBox(height: 15),
            _buildSection('Notification', [
              Row(
                children: [
                  SvgPicture.asset('assets/icons/notification3.svg',
                      color: const Color(0xff92A3FD)),
                  const SizedBox(width: 10),
                  const Expanded(child: Text("Pop-up Notification")),
                  Switch(
                    value: _switch,
                    onChanged: (value) {
                      setState(() {
                        _switch = value;
                      });
                    },
                    activeColor: const Color(0xffC58BF2),
                  ),
                ],
              ),
            ]),
            const SizedBox(height: 15),
            _buildSection('Other', [
              _buildRow('assets/icons/message2.svg', 'Contact Us'),
              _buildRow('assets/icons/done.svg', 'Privacy Policy'),
              _buildRow('assets/icons/setting.svg', 'Settings'),

              // ✅ LOG OUT button funcional
              Row(
                children: [
                  SvgPicture.asset('assets/icons/login.svg',
                      color: const Color(0xff92A3FD)),
                  const SizedBox(width: 10),
                  const Expanded(child: Text("Log out")),
                  IconButton(
                    onPressed: () {
                      ref.read(authProvider.notifier).logout();
                      context.go('/login');
                    },
                    icon: SvgPicture.asset('assets/icons/arrow.svg'),
                  ),
                ],
              ),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(String icon, String title) {
    return Row(
      children: [
        SvgPicture.asset(icon, color: const Color(0xff92A3FD)),
        const SizedBox(width: 10),
        Expanded(child: Text(title)),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset('assets/icons/arrow.svg'),
        ),
      ],
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: const [BoxShadow(color: Color(0xffF7F8F8), blurRadius: 10)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
          const SizedBox(height: 10),
          ...children,
        ],
      ),
    );
  }
}
