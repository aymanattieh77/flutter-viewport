// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo/controllers/task_controller.dart';
import 'package:todo/models/task.dart';
import 'package:todo/ui/theme.dart';
import 'package:todo/ui/widgets/button.dart';
import 'package:todo/ui/widgets/input_field.dart';

import '../widgets/my_appbar.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TaskController _taskController = Get.put(TaskController());
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String _startTime = DateFormat('hh:mm a').format(DateTime.now()).toString();
  String _endTime = DateFormat('hh:mm a')
      .format(DateTime.now().add(const Duration(minutes: 15)))
      .toString();
  int _selectedRemind = 5;
  List<int> remindList = [5, 10, 15, 20];
  String _selectedRepeat = 'None';
  List<String> repeatList = ['None', 'Daily', 'Weekly', 'Monthly'];
  int _selectedColor = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: myAppbar(context),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Add Task',
                style: headingStyle,
              ),
              InputField(
                label: 'Title',
                hint: 'Enter title here',
                controller: _titleController,
              ),
              const SizedBox(height: 10.0),
              InputField(
                label: 'Note',
                hint: 'Enter note here',
                controller: _noteController,
              ),
              const SizedBox(height: 10.0),
              InputField(
                label: 'Date',
                hint: DateFormat.yMMMd().format(_selectedDate).toString(),
                child: IconButton(
                    onPressed: () {
                      _datePicker();
                    },
                    icon: const Icon(
                      Icons.date_range,
                    )),
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  Expanded(
                    child: InputField(
                      label: 'Start Time',
                      hint: _startTime,
                      child: IconButton(
                        onPressed: () {
                          _timePicker(true);
                        },
                        icon: Icon(
                          Icons.access_time,
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InputField(
                      label: 'End Time',
                      hint: _endTime,
                      child: IconButton(
                          onPressed: () {
                            _timePicker(false);
                          },
                          icon: Icon(
                            Icons.access_time,
                            color: Get.isDarkMode ? Colors.white : Colors.black,
                          )),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              InputField(
                label: 'Remind',
                hint: '$_selectedRemind minutes early',
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<int>(
                      items: remindList
                          .map<DropdownMenuItem<int>>(
                              (value) => DropdownMenuItem<int>(
                                    value: value,
                                    child: Text('$value'),
                                  ))
                          .toList(),
                      onChanged: (newValue) {
                        setState(() {
                          _selectedRemind = newValue!;
                        });
                      },
                      icon: const Icon(Icons.keyboard_arrow_down),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              InputField(
                label: 'Repeat',
                hint: _selectedRepeat,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      items: repeatList
                          .map<DropdownMenuItem<String>>(
                              (value) => DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  ))
                          .toList(),
                      onChanged: (newValue) {
                        setState(() {
                          _selectedRepeat = newValue!;
                        });
                      },
                      icon: const Icon(Icons.keyboard_arrow_down),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    multiCircles(),
                    MyButton(
                        label: 'Create Task',
                        onTap: () {
                          _valdationTask();
                        })
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _datePicker() async {
    DateTime? datePicked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      currentDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    );
    setState(() {
      _selectedDate = datePicked!;
    });
  }

  _timePicker(bool isTime) async {
    TimeOfDay? timePicked = await showTimePicker(
      context: context,
      initialTime: isTime
          ? TimeOfDay.fromDateTime(DateTime.now())
          : TimeOfDay.fromDateTime(
              DateTime.now().add(const Duration(minutes: 15))),
    );
    // ignore: use_build_context_synchronously
    String formattedTime = timePicked!.format(context);
    if (isTime) {
      setState(() {
        _startTime = formattedTime;
      });
    } else if (!isTime) {
      setState(() {
        _endTime = formattedTime;
      });
    } else {
      // ignore: avoid_print
      return;
    }
  }

  _valdationTask() {
    if (_titleController.text.isNotEmpty && _noteController.text.isNotEmpty) {
      _addTaskToDB();

      Get.back();
    } else if (_titleController.text.isEmpty || _noteController.text.isEmpty) {
      Get.snackbar('required', 'title or note is empty',
          backgroundColor: primaryClr,
          colorText: Colors.white,
          icon: const Icon(
            Icons.warning_amber_sharp,
            color: Colors.white,
          ),
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.only(bottom: 20.0),
          padding: const EdgeInsets.all(2.0));
    } else {
      // ignore: avoid_print
      print('error 22');
    }
  }

  _addTaskToDB() async {
    int value = await _taskController.addTask(
      task: Task(
          title: _titleController.text,
          note: _noteController.text,
          isCompleted: 0,
          date: DateFormat.yMd().format(_selectedDate),
          startTime: _startTime,
          endTime: _endTime,
          color: _selectedColor,
          remind: _selectedRemind,
          repeat: _selectedRepeat),
    );
    // ignore: avoid_print
    print('$value');
  }

  Column multiCircles() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Color',
          style: subHeadingStyle,
        ),
        const SizedBox(height: 6),
        Wrap(
            spacing: 5,
            children: List.generate(
              3,
              (index) => GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedColor = index;
                    // ignore: avoid_print
                    print(_selectedColor);
                  });
                },
                child: CircleAvatar(
                    backgroundColor: index == 0
                        ? primaryClr
                        : index == 1
                            ? pinkClr
                            : orangeClr,
                    radius: 15,
                    child: _selectedColor == index
                        ? const Icon(
                            Icons.done,
                            color: Colors.white,
                          )
                        : null),
              ),
            )),
      ],
    );
  }
}
