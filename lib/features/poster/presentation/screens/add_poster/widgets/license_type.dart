import 'package:flutter/material.dart';
import 'package:supabase_test/core/app_responsev/app_responsev.dart';

class LicenseType extends StatefulWidget {
  const LicenseType({super.key});

  @override
  State<LicenseType> createState() => _LicenseTypeState();
}

String initialValue = 'ملاكي';
var items = [
  'ملاكي',
  'دراحه ناريه',
  'نقل',
  'حكومه',
  'توك توك',
];

class _LicenseTypeState extends State<LicenseType> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.center,
      child: SizedBox(
        width: AppResponsive.getWidth(context, 2),
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton(
            value: initialValue,
            elevation: 0,
            icon: Icon(Icons.keyboard_arrow_down),
            borderRadius: BorderRadius.circular(10),
            underline: SizedBox.shrink(),
            dropdownColor: Colors.orange,
            hint: SizedBox.shrink(),
            items: items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(
                  items,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: MediaQuery.textScalerOf(context).scale(18),
                  ),
                ),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                initialValue = value!;
              });
            },
          ),
        ),
      ),
    );
  }
}
