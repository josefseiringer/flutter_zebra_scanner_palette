import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_controller.dart';
import '../../utils/drope_down_user.dart';
import '../../utils/my_text_button.dart';
import '../../utils/my_text_field.dart';
import '../../constants.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  static const namedRoute = '/login-page';

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    //var screenHeight = MediaQuery.of(context).size.height;
    var lCtrl = LoginController.to;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Login to Palett App'),
        ),
        body: Obx(
          () => lCtrl.bIsLoading.isTrue
              ? const Center(child: CircularProgressIndicator())
              : Center(
                  child: Container(
                    width: screenWidth - 100,
                    height: 210,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        width: 2.0,
                        color: Colors.grey.shade500,
                      ),
                      color: Colors.grey.shade100,
                    ),
                    child: ListView(
                      padding: kPaddingAll,
                      children: <Widget>[
                        Center(
                          child: DropDownUser(
                            onChangeUser: lCtrl.szLoginUser.call,
                            loginUsers: lCtrl.asyncLoginUsers,
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
                            borderRadius: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
