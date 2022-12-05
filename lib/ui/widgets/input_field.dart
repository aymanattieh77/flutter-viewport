import 'package:flutter/material.dart';
import 'package:todo/ui/size_config.dart';
import 'package:todo/ui/theme.dart';

class InputField extends StatelessWidget {
  const InputField(
      {Key? key,
      required this.label,
      required this.hint,
      this.controller,
      this.child})
      : super(key: key);

  final String label;
  final String hint;
  final TextEditingController? controller;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SizedBox(
      child: Container(
        margin: const EdgeInsets.only(left: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: titleStyle,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              width: SizeConfig.screenWidth,
              height: 45,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      readOnly: child != null ? true : false,
                      autofocus: false,
                      controller: controller,
                      decoration: InputDecoration(
                        hintText: hint,
                        hintStyle: subTitleStyle,
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                    ),
                  )),
                  child ?? Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
