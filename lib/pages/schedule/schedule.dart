import 'package:calenurse_app/components/select/primary_select.dart';
import 'package:calenurse_app/services/api.dart';
import 'package:flutter/material.dart';
import 'package:calenurse_app/components/card/schedule_card_nurse.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:calenurse_app/store/auth.dart';
import 'package:calenurse_app/components/navigation_bar/navigation_bar.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  String turn = 'Libre';
  DateTime? datePicked;

  final dateCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authStore = Provider.of<AuthStore>(context);

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
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      bottomNavigationBar: const RocioNavigationBar(
        selectedIndex: 1,
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 20, left: 24, right: 24, bottom: 20),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              PrimarySelect(
                  value: turn,
                  items: const ['Libre', 'Mañana', 'Tarde', 'Noche'],
                  onChanged: (value) {
                    setState(() {
                      turn = value!;
                    });
                  }),
              const SizedBox(height: 24),
              TextFormField(
                controller: dateCtrl,
                decoration: InputDecoration(
                    labelText: 'Fecha',
                    filled: true,
                    fillColor: const Color(0xFFE9F3FF),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 20.0,
                    ),
                    hintStyle: const TextStyle(color: Colors.grey),
                    suffixIcon: const Icon(
                      Icons.calendar_month,
                      color: Colors.lightBlue,
                    )),
                onTap: () => _pickDateDialog(),
                readOnly: true,
              ),
              const SizedBox(height: 96.0),
              SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                child: FloatingActionButton.extended(
                  heroTag: UniqueKey(),
                  backgroundColor: const Color(0xff4894FE),
                  elevation: 0,
                  onPressed: () {
                    Api api = Api();
                    var turnDict = {
                      'Libre': 'free',
                      'Mañana': 'day',
                      'Tarde': 'evening',
                      'Noche': 'night',
                    };
                    api.post("/shift/desired", {
                      "shift": turnDict[turn],
                      "date": DateFormat('yyyy-MM-dd').format(
                          DateFormat('dd/MM/yyyy').parse(dateCtrl.text)),
                      "nurse_id": authStore.user.id
                    }).then((value) => {
                          if (value.statusCode == 201)
                            {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Turno enviado correctamente'),
                                  backgroundColor: Color(0xff4894FE),
                                ),
                              ),
                            }
                          else
                            {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'Error al crear horario, recuerda que solo puedes solicitar 1 turno por dia'),
                                  backgroundColor: Colors.red,
                                ),
                              ),
                            }
                        });
                  },
                  label: const Text('Enviar turno',
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
      ),
    );
  }

  void _pickDateDialog() {
    DateTime now = DateTime.now();
    DateTime startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    DateTime endOfWeek = startOfWeek.add(const Duration(days: 6));
    showDatePicker(
            context: context,
            initialDate: now,
            firstDate: startOfWeek,
            lastDate: endOfWeek)
        .then((pickedDate) {
      //then usually do the future job
      if (pickedDate != null) {
        setState(() {
          //for rebuilding the ui
          datePicked = pickedDate;
          dateCtrl.text = DateFormat('dd/MM/yyyy').format(datePicked!);
        });
      } else {
        return;
      }
    });
  }
}
