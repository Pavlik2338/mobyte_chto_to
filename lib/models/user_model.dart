class UserModel {
  String id;
  final String userName;
  final String login;
  final String password;
  UserModel(
      {this.id = '', this.userName = '', this.login = '', this.password = ''});
  Map<String, dynamic> toJson() => {
        'email': login,
        'password': password,
        'userName': userName,
      };
  static UserModel fromJson(Map<String, dynamic> json) => UserModel(
      userName: json['userName'],
      login: json['email'],
      password: json['password']);
}
