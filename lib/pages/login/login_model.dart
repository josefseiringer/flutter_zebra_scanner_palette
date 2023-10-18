class LoginUser {
  final String szUserName;
  final String szPassword;
  final String szLocation;
  LoginUser({
    this.szUserName = '',
    this.szPassword = '',
    this.szLocation = '',
  });

  LoginUser copyWith({
    String? szUserName,
    String? szPassword,
    String? szLocation,
  }) {
    return LoginUser(
      szUserName: szUserName ?? this.szUserName,
      szPassword: szPassword ?? this.szPassword,
      szLocation: szLocation ?? this.szLocation,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': szUserName,
      'password': szPassword,
      'location': szLocation,
    };
  }

  factory LoginUser.fromMap(Map<String, dynamic> map) {
    return LoginUser(
      szUserName: map['name'] ?? '',
      szPassword: map['password'] ?? '',
      szLocation: map['location'] ?? '',
    );
  }

  //factory LoginUser.fromJson(String source) => LoginUser.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'LoginUser(szUserName: $szUserName, szPassword: $szPassword, szLocation: $szLocation)';

  // @override
  // bool operator ==(covariant LoginUser other) {
  //   if (identical(this, other)) return true;

  //   return
  //     other.szUserName == szUserName &&
  //     other.szPassword == szPassword;
  // }
}
