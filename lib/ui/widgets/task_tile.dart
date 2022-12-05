import 'package:flutter/material.dart';
import 'package:todo/models/task.dart';
import 'package:todo/ui/size_config.dart';
import 'package:todo/ui/theme.dart';

class TaskTile extends StatelessWidget {
  const TaskTile(this.task, {Key? key}) : super(key: key);

  final Task task;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.orientation == Orientation.landscape
          ? SizeConfig.screenWidth / 2
          : SizeConfig.screenWidth,
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(
              SizeConfig.orientation == Orientation.landscape ? 4 : 20)),
      margin: EdgeInsets.only(bottom: getProportionateScreenHeight(12)),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: getColor(task.color),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12.0),
                    Text(
                      task.title!,
                      style: txtStyle1,
                    ),
                    const SizedBox(height: 6.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.access_alarm_outlined,
                          color: Colors.grey[100],
                          size: 18,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          '${task.startTime} - ${task.endTime}',
                          style: txtStyle1.copyWith(
                              color: Colors.grey[200], fontSize: 12),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6.0),
                    Text(
                      task.note!,
                      style: txtStyle2,
                      softWrap: true,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.visible,
                    ),
                  ],
                ),
              ),
            ),
            RotatedBox(
              quarterTurns: 3,
              child: Text(task.isCompleted == 0 ? 'Todo' : 'Completed',
                  style: txtStyle1.copyWith(fontSize: 13)),
            ),
          ],
        ),
      ),
    );
  }

  Color getColor(int? color) {
    switch (color) {
      case 0:
        return primaryClr;

      case 1:
        return pinkClr;

      case 2:
        return orangeClr;
      default:
        return primaryClr;
    }
  }
}
