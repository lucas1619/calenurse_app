import 'package:calenurse_app/pages/home/home_boss.dart';
import 'package:calenurse_app/pages/schedule/schedule_boss.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:calenurse_app/store/auth.dart';

class RocioNavigationBar extends StatefulWidget {
  final int selectedIndex;

  const RocioNavigationBar({
    super.key,
    required this.selectedIndex,
  });

  @override
  RocioNavigationBarState createState() => RocioNavigationBarState();
}

class RocioNavigationBarState extends State<RocioNavigationBar> {
  @override
  Widget build(BuildContext context) {
    final authStore = Provider.of<AuthStore>(context);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: GNav(
            backgroundColor: Colors.white,
            color: const Color(0xFF8696BB),
            gap: 5,
            activeColor: const Color(0xFF63B4FF),
            iconSize: 24,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            tabBackgroundColor: const Color(0xFFE5F5FF),
            tabs: const [
              GButton(
                icon: Icons.home_outlined,
                text: 'Home',
              ),
              GButton(
                icon: Icons.calendar_month_outlined,
                text: 'Schedule',
              ),
              // GButton(
              //   icon: Icons.notifications_none_outlined,
              //   text: 'Notifications',
              // ),
              GButton(
                icon: Icons.person_outline,
                text: 'Profile',
              )
            ],
            selectedIndex: widget.selectedIndex,
            onTabChange: (index) {
              setState(() {
                if (index == 0) {
                  if (authStore.user.type == 'Enfermera') {
                    Navigator.pushNamed(context, '/home');
                  } else {
                    Navigator.pushNamed(context, HomeBossPage.route);
                  }
                } else if (index == 1) {
                  if (authStore.user.type == 'Enfermera') {
                    Navigator.pushNamed(context, '/schedule');
                  } else {
                    Navigator.pushNamed(context, ScheduleBossPage.route);
                  }
                } 
                // else if (index == 2) {
                //   Navigator.pushNamed(context, '/notifications');
                // } 
                else if (index == 2) {
                  Navigator.pushNamed(context, '/profile');
                }
              });
            },
          ),
        ),
      ),
    );
  }
}
