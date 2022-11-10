import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remindmi/app/modules/home/widget/manage_card.dart';
import 'package:toggle_switch/toggle_switch.dart';


class AccessibilityPage extends StatefulWidget {
  @override
  _AccessibilityPageState createState() => _AccessibilityPageState();
}

class _AccessibilityPageState extends State<AccessibilityPage> {

  bool val1 = true;
  bool val2 = false;

  onChangeFunctionBT(bool newValue1) {
    setState(() {
      val1 = newValue1;
    });
  }

  onChangeFunctionTTS(bool newValue2) {
    setState(() {
      val2 = newValue2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              accSwitch('Bold text', val1, onChangeFunctionBT),
              accSwitch('Text-to-speech', val2, onChangeFunctionTTS)
            ],
          ),
        )
    );


  }

  Widget accSwitch(String text, bool val, Function onChangeMethod) {
    return Padding(
        padding: const EdgeInsets.only(top: 22.0, left: 16.0, right: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text, style: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
              fontWeight: FontWeight.w600
            )),
            Spacer(),
            CupertinoSwitch(
                trackColor: Colors.grey,
                activeColor: Colors.blue,
                value: val,
                onChanged: (newValue) {
                  onChangeMethod(newValue);
                }
            )
          ],
        ),
    );
  }

}