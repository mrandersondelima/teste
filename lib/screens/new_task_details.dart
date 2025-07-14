import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hora_do_foco/controllers/new_task_controller.dart';
import 'package:hora_do_foco/controllers/page_view_controller.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:intl/intl.dart';

class NewTaskDetails extends StatelessWidget {
  NewTaskDetails({super.key});

  final _pageViewController = Get.find<PageViewController>();
  final _newTaskController = Get.find<NewTaskController>();

  bool _isDateSwitched = false;
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
        heightFactor: 0.95,
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton.icon(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.blue,
                      size: 15,
                      weight: 5,
                    ),
                    onPressed: () {
                      _pageViewController.pageViewController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    style:
                        TextButton.styleFrom(padding: const EdgeInsets.all(0)),
                    label: const Text(
                      "Nova Tarefa",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  const Text(
                    "Detalhes",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: null,
                    style:
                        TextButton.styleFrom(padding: const EdgeInsets.all(0)),
                    child: const Text(
                      "Adicionar",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Obx(
                  () => ListView(
                    children: [
                      ExpansionTile(
                        enabled: false,
                        controller:
                            _newTaskController.expansionDateTileController,
                        collapsedShape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                        ),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                        ),
                        collapsedBackgroundColor: const Color(0xFF515151),
                        backgroundColor: const Color(0xFF515151),
                        dense: true,
                        leading: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.red),
                          height: 30,
                          width: 30,
                          child: const Icon(
                            Icons.date_range,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        title: Obx(() {
                          if (_newTaskController.isDateSwitched) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,                              
                              children: [
                                const Text(
                                  'Data',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                    DateFormat(
                                            "EEEE, d 'de' MMMM 'de' y", "pt_BR")
                                        .format(
                                            _newTaskController.selectedDate),
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.blue,
                                    )),
                              ],
                            );
                          } else {
                            return const Text(
                                  'Data',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                );
                          }
                        }),
                        trailing: Switch(
                          thumbIcon: MaterialStateProperty.all(
                              const Icon(Icons.circle, color: Colors.white)),
                          value: _newTaskController.isDateSwitched,
                          onChanged: (value) {
                            _newTaskController.isDateSwitched = value;
                            if (value) {
                              _newTaskController.expansionDateTileController
                                  .expand();
                            } else {
                              _newTaskController.expansionDateTileController
                                  .collapse();
                            }
                          },
                          activeColor: const Color(0xFF00ff4c),
                          inactiveThumbColor: Colors.white,
                          thumbColor: MaterialStateProperty.all(Colors.white),
                          inactiveTrackColor: Colors.grey,
                        ),
                        children: [
                          Obx(
                            () => SizedBox(
                              width: 330,                              
                              child: DatePicker(
                                minDate: DateTime.now()
                                    .subtract(const Duration(days: 30)),
                                maxDate: DateTime(2100, 12, 31),
                                daysOfTheWeekTextStyle: TextStyle(
                                    color: Colors.white.withAlpha(150),
                                    fontSize: 10),
                                leadingDateTextStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                highlightColor: Colors.blue,
                                selectedCellDecoration: _selectedCellDecoration(
                                    _newTaskController.selectedDate),
                                selectedCellTextStyle: _selectedCellTextStyle(
                                    _newTaskController.selectedDate),
                                slidersColor: Colors.blue,
                                enabledCellsTextStyle: const TextStyle(
                                    color: Colors.white, fontSize: 20),
                                currentDateTextStyle: const TextStyle(
                                    color: Colors.blue,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                                currentDateDecoration: const BoxDecoration(
                                  color: Colors.transparent,
                                  shape: BoxShape.rectangle,
                                ),
                                padding: const EdgeInsets.all(0),
                                onDateSelected: (value) {
                                  // Handle selected date
                                  _newTaskController.selectedDate = value;
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }

  BoxDecoration _selectedCellDecoration(DateTime selectedDate) {
    DateTime actualDate =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    if (selectedDate == actualDate) {
      return const BoxDecoration(
        color: Colors.blue,
        shape: BoxShape.circle,
      );
    } else {
      return BoxDecoration(
        color: Colors.blue.withAlpha(50),
        shape: BoxShape.circle,
      );
    }
  }

  TextStyle _selectedCellTextStyle(DateTime selectedDate) {
    DateTime actualDate =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    if (selectedDate == actualDate) {
      return const TextStyle(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold);
    } else {
      return const TextStyle(
          color: Colors.blue, fontSize: 20, fontWeight: FontWeight.bold);
    }
  }
}
