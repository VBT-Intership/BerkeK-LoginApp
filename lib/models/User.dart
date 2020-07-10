class User{ 

  String username;
  String password;

  User({this.username, this.password});

  factory User.fromJson(Map<String, dynamic> json) => new User (username: json['username'],password: json['password']);
}
