import 'package:flutter/material.dart';

class ClintType extends StatefulWidget {
  const ClintType({super.key});

  @override
  State<ClintType> createState() => _ClintTypeState();
}

String groupValue = 'صاحب الرخصه';

class _ClintTypeState extends State<ClintType> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: RadioListTile<String>(
            title: Text(
              'المالك',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            // fillColor:WidgetStateProperty.all(Colors.orange) ,
            activeColor: Colors.orange,
            value: 'صاحب الرخصه',
            groupValue: groupValue,
            onChanged: (value) {
              setState(() {
                groupValue = value!;
                print(value);
              });
            },
          ),
        ),
        Expanded(
          child: RadioListTile<String>(
            title: Text(
              'الوكيل',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            activeColor: Colors.orange,
            value: 'الوكيل',
            groupValue: groupValue,
            onChanged: (value) {
              setState(() {
                groupValue = value!;
              });
            },
          ),
        ),
      ],
    );
  }
}
