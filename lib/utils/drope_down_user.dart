import 'package:flutter/material.dart';
import '../constants.dart';
import '../pages/login/login_model.dart';

typedef StringValue = String Function(String);

class DropDownUser extends StatelessWidget {
  final StringValue onChangeUser;
  final List<LoginUser> loginUsers;

  const DropDownUser({
    super.key,
    required this.onChangeUser,
    required this.loginUsers,
  });

  @override
  Widget build(BuildContext context) {
    return _displayUserDropDown();
  }

  DropdownButtonFormField _displayUserDropDown() {
    // ignore: prefer_typing_uninitialized_variables
    var selectedValue;
    return DropdownButtonFormField(
      decoration: kInputDecorationDropDownMenue,
      itemHeight: 80,
      value: selectedValue,
      items: loginUsers.map(
        (item) {
          return DropdownMenuItem(
            value: item.szUserName,
            child: Text(
              item.szUserName,
              style: TextStyle(letterSpacing: 2, fontSize: kFontSizeDouble),
            ),
          );
        },
      ).toList(),
      onChanged: (value) => onChangeUser(value),
    );
  }
}
