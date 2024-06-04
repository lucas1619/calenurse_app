import 'package:calenurse_app/components/select/primary_select.dart';
import 'package:calenurse_app/domain/area/area_nurse.dart';
import 'package:calenurse_app/domain/shift/shift_enum.dart';
import 'package:calenurse_app/services/area_service.dart';
import 'package:calenurse_app/services/shift_service.dart';
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
  List<GeneratedShift> shiftsFromSelectedUser = [];

  AreaNurse substitute = AreaNurse(id: '', name: '');
  late AuthStore authStore;
  late AreaService areaService;

  @override
  void initState() {
    super.initState();
    authStore = Provider.of<AuthStore>(context, listen: false);
    areaService = AreaService();
    fetchSubstituteNurses(initial: true);
  }

  Future<void> fetchSubstituteNurses({bool initial = false}) async {
    var value = await areaService.getAllUsersFromArea(
        authStore.user.areaId, authStore.user.id);
    setState(() {
      substituteNurses = value;
    });
    if (value.isNotEmpty) {
      substitute = value[0];
      if (initial) {
        await fetchShiftsFromSelectedUser(value[0].id);
      }
    }
  }

  Future<void> fetchShiftsFromSelectedUser(String nurseId) async {
    ShiftService shiftService = ShiftService();
    List<GeneratedShift> result = await shiftService.getAssignedShiftsFromDate(
        nurseId, widget.shift.date);
    setState(() {
      shiftsFromSelectedUser = result;
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
                            shiftsFromSelectedUser: shiftsFromSelectedUser,
                            shift: widget.shift,
                            onSubstituteChanged: (value) {
                              fetchShiftsFromSelectedUser(value.id);
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
  final List<GeneratedShift> shiftsFromSelectedUser;
  final Function(AreaNurse) onSubstituteChanged;
  final GeneratedShift shift;

  const SubstituteBottomSheet(
      {Key? key,
      required this.substituteNurses,
      required this.onSubstituteChanged,
      required this.shiftsFromSelectedUser,
      required this.shift})
      : super(key: key);

  @override
  _SubstituteBottomSheetState createState() => _SubstituteBottomSheetState();
}

class _SubstituteBottomSheetState extends State<SubstituteBottomSheet> {
  late AreaNurse selectedSubstitute;
  late GeneratedShift selectedTargetShift;

  Future<void> onPressButton(BuildContext context) async {
    ShiftService shiftService = ShiftService();
    bool response = await shiftService.postShiftExchange(
        widget.shift.id, selectedTargetShift.id);
    if (response) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              'Solicitud enviada exitosamente, contacte con su jefe de area.'),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Ocurrio un error, intentelo nuevamente'),
          backgroundColor: Colors.red,
        ),
      );
    }
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    selectedSubstitute = widget.substituteNurses.isNotEmpty
        ? widget.substituteNurses[0]
        : AreaNurse(id: '', name: '');
    selectedTargetShift = widget.shiftsFromSelectedUser.isNotEmpty
        ? widget.shiftsFromSelectedUser[0]
        : GeneratedShift(id: '', date: DateTime.now(), shift: ShiftEnum.day);
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
            'Solicitar intercambio de horario',
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
            value: selectedTargetShift,
            items: widget.shiftsFromSelectedUser,
            onChanged: (value) {
              setState(() {
                selectedTargetShift = value!;
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
              onPressed: () {
                onPressButton(context);
              },
              label: const Text(
                'Solicitar intercambio',
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
