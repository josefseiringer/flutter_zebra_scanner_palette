
class LoginUser {
  final String szUserName;
  final String szPassword;
  LoginUser({
    this.szUserName = '',
    this.szPassword = '',
  });

  LoginUser copyWith({
    String? szUserName,
    String? szPassword,
  }) {
    return LoginUser(
      szUserName: szUserName ?? this.szUserName,
      szPassword: szPassword ?? this.szPassword,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'szUserName': szUserName,
      'szPassword': szPassword,
    };
  }

  factory LoginUser.fromMap(Map<String, dynamic> map) {
    return LoginUser(
      szUserName: map['szUserName'] as String,
      szPassword: map['szPassword'] as String,
    );
  }

  //factory LoginUser.fromJson(String source) => LoginUser.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LoginUser(szUserName: $szUserName, szPassword: $szPassword)';

  // @override
  // bool operator ==(covariant LoginUser other) {
  //   if (identical(this, other)) return true;
  
  //   return 
  //     other.szUserName == szUserName &&
  //     other.szPassword == szPassword;
  // }
}
