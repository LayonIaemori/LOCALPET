class User {
  String email;
  String password;

  User({required this.email, required this.password});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'email': email,
      'password': password,
    };
    return map;
  }
}
