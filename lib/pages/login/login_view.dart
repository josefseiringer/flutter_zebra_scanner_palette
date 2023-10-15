import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_controller.dart';
import '../../utils/drope_down_user.dart';
import '../../utils/my_text_button.dart';
import '../../utils/my_text_field.dart';
import '../../constants.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);
  static const namedRoute = '/login-page';

  @override
  Widget build(BuildContext context) {
    var lCtrl = controller;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Login to Palett App'),
      ),
      body: SafeArea(
        child: ListView(
          padding: kPaddingAll,
          children: <Widget>[
            Center(
              child: DropDownUser(
                onChangeUser: lCtrl.szLoginUser,
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: MyTextField(
                bObscureText: true,
                hintText: 'Password',
                myController: lCtrl.passwordController.value,
                mnTextfieldHeight: 50.0,
                myTextInputType: TextInputType.visiblePassword,
                suffixIcon: const Icon(Icons.password),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: MyTextButton(
                onTab: () => lCtrl.loginScanner(),
                labelText: 'Login',
                buttonWidth: screenWidth,
                buttonHeight: 50.0,
                buttonColor: Colors.blue.shade600,
                buttonLabelColor: Colors.grey.shade300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
