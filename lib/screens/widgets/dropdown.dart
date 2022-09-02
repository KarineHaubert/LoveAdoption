import 'package:flutter/material.dart';
import 'package:loveadoption/screens/widgets/text.dart';

class DropDownString extends StatelessWidget {
  final List list;
  final ValueChanged<dynamic> onChanged;
  final dynamic value;
  final Widget hint;

  const DropDownString({Key key, this.list, this.onChanged, this.value, this.hint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      decoration: BoxDecoration(
          color: Color(0xFFF807F7F), borderRadius: BorderRadius.circular(60)),
      child: DropdownButton(
          dropdownColor: Color(0xFFF807F7F),
          items: list
              .map((value) => DropdownMenuItem(
                    child: TextWidget(
                      text: value,
                      color: Colors.white,
                      fontSize: 17,
                    ),
                    value: value,
                  ))
              .toList(),
          onChanged: onChanged,
          value: value,
          isExpanded: false,
          iconEnabledColor: Colors.white,
          underline: SizedBox(),
          hint: hint),
    );
  }
}
