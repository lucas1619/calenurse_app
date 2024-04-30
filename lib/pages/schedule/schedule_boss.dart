import 'package:calenurse_app/pages/schedule/schedule_boss_req_tab.dart';
import 'package:calenurse_app/pages/schedule/schedule_boss_so_tab.dart';
import 'package:flutter/material.dart';

import 'package:calenurse_app/components/navigation_bar/navigation_bar.dart';

class ScheduleBossPage extends StatefulWidget {
  const ScheduleBossPage({super.key});
  static const route = '/schedule_boss';

  @override
  State<ScheduleBossPage> createState() => _ScheduleBossPageState();
}

class _ScheduleBossPageState extends State<ScheduleBossPage> {
  @override
  Widget build(BuildContext context) {
    // final authStore = Provider.of<AuthStore>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Horario',
            style: TextStyle(
              color: Color(0xFF264A7D),
              fontSize: 20,
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins',
            ),
          ),
          centerTitle: true,
        ),
        bottomNavigationBar: const RocioNavigationBar(
          selectedIndex: 1,
        ),
        body: const DefaultTabController(
          length: 2,
          child: Column(
            children: [
              TabBar(
                tabs: [
                  Tab(text: 'Requerimientos'),
                  Tab(text: 'Solicitudes'),
                ],
                labelPadding: EdgeInsets.all(0),
                labelColor: Color(0xff4894FE),
                unselectedLabelColor: Color(0xff8696BB),
                indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(width: 4),
                    insets: EdgeInsets.symmetric(horizontal: 73)),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    ScheduleBossRequerimentTab(),
                    ScheduleBossSolsTab(),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
