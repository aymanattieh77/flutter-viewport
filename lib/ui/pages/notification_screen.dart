import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/ui/theme.dart';

// ignore: must_be_immutable
class NotificationScreen extends StatefulWidget {
  NotificationScreen({Key? key, required this.payload}) : super(key: key);
  String payload;
  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  String _payload = '';

  @override
  void initState() {
    super.initState();
    _payload = widget.payload;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10.0),
            columnWtihText(),
            const SizedBox(height: 10.0),
            containerWithDetail(),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }

  AppBar myAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back)),
      title: Text(_payload.toString().split('|')[0]),
      centerTitle: true,
      elevation: 0.0,
      backgroundColor: bluishClr,
      toolbarTextStyle: TextStyle(
        color: Theme.of(context).primaryColor,
      ),
    );
  }

  Column columnWtihText() {
    return Column(
      children: [
        Text(
          'Hello Ayman',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w900,
            color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'You Have a new Reminder',
          style: TextStyle(
            color: Get.isDarkMode ? Colors.white : darkGreyClr,
            fontWeight: FontWeight.w300,
            fontSize: 18,
          ),
        ),
      ],
    );
  }

  Expanded containerWithDetail() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        margin: const EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: primaryClr,
        ),
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            rowWithText(Icons.text_format, 'Title'),
            const SizedBox(height: 10),
            textSimple(0),
            const SizedBox(height: 20),
            rowWithText(Icons.description, 'Description'),
            const SizedBox(height: 10),
            textSimple(1),
            const SizedBox(height: 20),
            rowWithText(Icons.date_range, 'Date'),
            const SizedBox(height: 10),
            textSimple(2),
            const SizedBox(height: 20),
          ],
        )),
      ),
    );
  }

  Text textSimple(index) {
    return Text(
      _payload.toString().split('|')[index],
      style: const TextStyle(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  Row rowWithText(icon, text) {
    return Row(
      children: [
        Icon(
          icon,
          size: 30,
          color: Colors.white,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ],
    );
  }
}
