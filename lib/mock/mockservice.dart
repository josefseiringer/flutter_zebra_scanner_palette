import '../pages/login/login_model.dart';

class MockService {

  static final _loginUser = <LoginUser>[
    LoginUser(
      szUserName: 'ATISTAHO',
      szPassword: '1234',
    ),
    LoginUser(
      szUserName: 'ATISFRITZ',
      szPassword: '1234',
    ),
    LoginUser(
      szUserName: 'ATSEIRJO',
      szPassword: '1234',
    ),
    LoginUser(
      szUserName: 'ATLEHNMA',
      szPassword: '1234',
    ),
  ];

  static List<LoginUser> get getMockUserList {
    return _loginUser;
  }

  static void setMockUserList(String user, String password) {
    var newLoginUser = LoginUser(szUserName: user, szPassword: password);
    _loginUser.add(newLoginUser);
  }
}
