import 'package:calenurse_app/components/text_field/primary_text_field.dart';
import 'package:calenurse_app/store/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScheduleCardNurse extends StatefulWidget {
  const ScheduleCardNurse({super.key});

  @override
  State<ScheduleCardNurse> createState() => _ScheduleCardNurseState();
}

class _ScheduleCardNurseState extends State<ScheduleCardNurse> {
  @override
  Widget build(BuildContext context) {
    final authStore = Provider.of<AuthStore>(context);

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
                const Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.schedule_outlined,
                          color: Color(0xFF4894FE),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Tarde",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF3F4448))),
                            Text("12/05/2023",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF3F4448))),
                            Text("12:00 - 8:00",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF3F4448)))
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          shape: const BeveledRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20))),
                          context: context,
                          builder: (context) => Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 32),
                            height: MediaQuery.of(context).size.height / 2,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Turnos',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff264A7D)),
                                ),
                                const SizedBox(height: 32),
                                PrimaryTextField(
                                    controller: TextEditingController(
                                        text: authStore.user.name),
                                    labelText: 'Nombre',
                                    hintText: ''),
                                const SizedBox(height: 16),
                                PrimaryTextField(
                                  controller: TextEditingController(
                                      text: '13/05/2023 - 00:00-08:00'),
                                  labelText: 'Nuevo turno',
                                  hintText: '',
                                  numeric: true,
                                ),
                                const SizedBox(height: 16),
                                PrimaryTextField(
                                  controller: TextEditingController(
                                      text: 'Jorge Rojas'),
                                  labelText: 'Suplente',
                                  hintText: '',
                                  numeric: true,
                                ),
                                const Spacer(),
                                SizedBox(
                                  width: double.maxFinite,
                                  child: FloatingActionButton.extended(
                                    heroTag: UniqueKey(),
                                    backgroundColor: const Color(0xff4894FE),
                                    elevation: 0,
                                    onPressed: () {},
                                    label: const Text('Guardar cambio',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'Poppins',
                                            fontSize: 16)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      child: const Icon(
                        Icons.edit_outlined,
                        color: Color(0xFF4894FE),
                      ),
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
