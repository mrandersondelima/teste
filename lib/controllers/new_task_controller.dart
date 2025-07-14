import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewTaskController extends GetxController {
  var _taskName = ''.obs;
  var _taskDescription = ''.obs;
  var _taskDate = ''.obs;
  var _taskTime = ''.obs;
  var _taskPriority = 0.obs;
  var _taskStatus = 0.obs;
  final _leftTextHeader = 'Cancelar'.obs;
  final _rightTextHeader = 'Adicionar'.obs;
  final _centerTextHeader = 'Nova Tarefa'.obs;
  final _isDateSwitched = false.obs;
  final _expansionDateTileController = ExpansionTileController().obs;
  final _selectedDate = DateTime.now().obs;
  final _selectedDateFormatted = 'Hoje'.obs;

  String get leftTextHeader => _leftTextHeader.value;
  String get rightTextHeader => _rightTextHeader.value;
  String get centerTextHeader => _centerTextHeader.value;
  bool get isDateSwitched => _isDateSwitched.value;
  ExpansionTileController get expansionDateTileController => _expansionDateTileController.value;
  DateTime get selectedDate => _selectedDate.value;
  String get selectedDateFormatted => _selectedDateFormatted.value;

  set selectedDateFormatted(String value) {
    _selectedDateFormatted.value = value;
    update();
  }

  set leftTextHeader(String value) {
    _leftTextHeader.value = value;
    update();
  }

  set selectedDate(DateTime value) {
    _selectedDate.value = value;
    update();
  }

  set isDateSwitched(bool value) {
    _isDateSwitched.value = value;
    update();
  }

  void setTaskName(String value) {
    _taskName.value = value;
  } 


  bool get isTaskNameValid {
    return _taskName.value.isNotEmpty;
  }

  bool get isTaskDescriptionValid {
    return _taskDescription.value.isNotEmpty;
  }

  bool get isTaskDateValid {
    return _taskDate.value.isNotEmpty;
  }

  bool get isTaskTimeValid {
    return _taskTime.value.isNotEmpty;
  }

  bool get isTaskPriorityValid {
    return _taskPriority.value >= 0 && _taskPriority.value <= 2;
  }

  bool get isTaskStatusValid {
    return _taskStatus.value >= 0 && _taskStatus.value <= 1;
  }

  String? get taskNameErrorMessage {
    return isTaskNameValid ? null : 'O nome da tarefa é obrigatório';
  }

  String? get taskDescriptionErrorMessage {
    return isTaskDescriptionValid ? null : 'A descrição da tarefa é obrigatória';
  }

  String? get taskDateErrorMessage {
    return isTaskDateValid ? null : 'A data da tarefa é obrigatória';
  }

  String? get taskTimeErrorMessage {
    return isTaskTimeValid ? null : 'O horário da tarefa é obrigatório';
  }

  String? get taskPriorityErrorMessage {
    return isTaskPriorityValid ? null : 'A prioridade da tarefa é obrigatória';
  }

  String? get taskStatusErrorMessage {
    return isTaskStatusValid ? null : 'O status da tarefa é obrigatório';
  }

  bool get isFormValid {
    if (isTaskNameValid &&
        isTaskDescriptionValid &&
        isTaskDateValid &&
        isTaskTimeValid &&
        isTaskPriorityValid &&
        isTaskStatusValid) {
      return true;
    }
    return false;
  }
}