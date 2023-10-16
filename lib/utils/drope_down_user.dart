import 'package:flutter/material.dart';
import '../mock/mockservice.dart';
import '../constants.dart';
import '../pages/login/login_model.dart';

typedef StringValue = String Function(String);

class DropDownUser extends StatelessWidget {
  final StringValue onChangeUser;

  const DropDownUser({
    super.key,
    required this.onChangeUser,
  });

  Future<List<LoginUser>> _loadUserListAsync() async {
    return await MockService.getMockUserList;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _loadUserListAsync(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        return _displayUserDropDown(snapshot.data);
      },
    );
  }

  DropdownButtonFormField _displayUserDropDown(dynamic asyncLoginUserList) {
    List<LoginUser> list = asyncLoginUserList;
    // ignore: prefer_typing_uninitialized_variables
    var selectedValue;
    return DropdownButtonFormField(
      decoration: kInputDecorationDropDownMenue,
      itemHeight: 80,
      value: selectedValue,
      items: list.map(
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
