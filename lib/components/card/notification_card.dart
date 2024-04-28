import 'package:flutter/material.dart';

class NotificationCardNurse extends StatelessWidget {
  final String title;
  final String description;
  final String type;
  const NotificationCardNurse(
      {super.key,
      required this.title,
      required this.description,
      required this.type});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFE9F3FF),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        // widget conditional
                        if (type == 'info')
                          const CircleAvatar(
                            backgroundColor: Color(0xFF4894FE),
                            child:
                                Icon(Icons.alarm_outlined, color: Colors.white),
                          ),
                        if (type == 'success')
                          const CircleAvatar(
                            backgroundColor: Color(0xFF47BC10),
                            child: Icon(Icons.check_circle_outline,
                                color: Colors.white),
                          ),
                        if (type == 'alert')
                          // icon into a circle avatar #
                          const CircleAvatar(
                            backgroundColor: Color(0xFFE9AD12),
                            child:
                                Icon(Icons.error_outline, color: Colors.white),
                          ),
                        const SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(title,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF3F4448),
                                )),
                            Text(description,
                                style: const TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF3F4448)))
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
