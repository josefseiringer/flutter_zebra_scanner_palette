import 'package:flutter/material.dart';
import '../mock/mockservice.dart';
import '../constants.dart';

typedef StringValue = String Function(String);

class DropDownUser extends StatelessWidget {
  final StringValue onChangeUser;

  const DropDownUser({
    super.key,
    required this.onChangeUser,
  });

  @override
  Widget build(BuildContext context) {
    return _displayUserDropDown();
  }

  DropdownButtonFormField _displayUserDropDown() {
    var list = MockService.getMockUserList;
    // ignore: prefer_typing_uninitialized_variables
    var selectedValue;
    return DropdownButtonFormField(
      decoration: kInputDecorationDropDownMenue,
      itemHeight: 80,
      value: selectedValue,
      items: list.map((item) {
        return DropdownMenuItem(
          value: item.szUserName,
          child: Text(item.szUserName,
              style: TextStyle(letterSpacing: 2, fontSize: kFontSizeDouble)),
        );
      }).toList(),
      onChanged: (value) => onChangeUser(value),
    );
  }
}
