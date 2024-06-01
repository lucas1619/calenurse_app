import 'package:calenurse_app/components/select/primary_select.dart';
import 'package:calenurse_app/components/text_field/primary_text_field.dart';
import 'package:calenurse_app/domain/area/area_nurse.dart';
import 'package:calenurse_app/domain/shift/shift_enum.dart';
import 'package:calenurse_app/services/area_service.dart';
import 'package:calenurse_app/store/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calenurse_app/domain/shift/generated_shift.dart';

class ScheduleCardNurse extends StatefulWidget {
  final GeneratedShift shift;

  const ScheduleCardNurse({Key? key, required this.shift}) : super(key: key);

  @override
  State<ScheduleCardNurse> createState() => _ScheduleCardNurseState();
}

class _ScheduleCardNurseState extends State<ScheduleCardNurse> {
  List<AreaNurse> substituteNurses = [AreaNurse(id: '', name: '')];
  AreaNurse substitute = AreaNurse(id: '', name: '');
  late AuthStore authStore;
  late AreaService areaService;

  @override
  void initState() {
    super.initState();
    authStore = Provider.of<AuthStore>(context, listen: false);
    areaService = AreaService();
    fetchSubstituteNurses();
  }

  void fetchSubstituteNurses() {
    areaService
        .getAllUsersFromArea(authStore.user.areaId, authStore.user.id)
        .then((value) {
      setState(() {
        substituteNurses = value;
        if (value.isNotEmpty) {
          substitute = value[0];
        }
      });
    });
  }

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
                        const Icon(
                          Icons.schedule_outlined,
                          color: Color(0xFF4894FE),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              translateShiftToSpanish(widget.shift.shift),
                              style: const TextStyle(
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF3F4448),
                              ),
                            ),
                            Text(
                              widget.shift.date.toString(),
                              style: const TextStyle(
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                color: Color(0xFF3F4448),
                              ),
                            ),
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
                              topRight: Radius.circular(20),
                            ),
                          ),
                          context: context,
                          builder: (context) => SubstituteBottomSheet(
                            substituteNurses: substituteNurses,
                            onSubstituteChanged: (value) {
                              setState(() {
                                substitute = value;
                              });
                            },
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

class SubstituteBottomSheet extends StatefulWidget {
  final List<AreaNurse> substituteNurses;
  final Function(AreaNurse) onSubstituteChanged;

  const SubstituteBottomSheet({
    Key? key,
    required this.substituteNurses,
    required this.onSubstituteChanged,
  }) : super(key: key);

  @override
  _SubstituteBottomSheetState createState() => _SubstituteBottomSheetState();
}

class _SubstituteBottomSheetState extends State<SubstituteBottomSheet> {
  late AreaNurse selectedSubstitute;

  @override
  void initState() {
    super.initState();
    selectedSubstitute = widget.substituteNurses.isNotEmpty
        ? widget.substituteNurses[0]
        : AreaNurse(id: '', name: '');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      height: MediaQuery.of(context).size.height / 2,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Solicitar Cambio',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color(0xff264A7D),
            ),
          ),
          const SizedBox(height: 32),
          PrimarySelect(
            value: selectedSubstitute,
            items: widget.substituteNurses,
            onChanged: (value) {
              setState(() {
                selectedSubstitute = value!;
                widget.onSubstituteChanged(value);
              });
            },
          ),
          const SizedBox(height: 16),
          PrimarySelect(
            value: selectedSubstitute,
            items: widget.substituteNurses,
            onChanged: (value) {
              setState(() {
                selectedSubstitute = value!;
                widget.onSubstituteChanged(value);
              });
            },
          ),
          const Spacer(),
          SizedBox(
            width: double.maxFinite,
            child: FloatingActionButton.extended(
              heroTag: UniqueKey(),
              backgroundColor: const Color(0xff4894FE),
              elevation: 0,
              onPressed: () {},
              label: const Text(
                'Solicitar',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Poppins',
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
