class User {
  String email;
  String? username;
  String fullName;

  User({
    required this.email,
    this.username,
    required this.fullName,
  });
    Map<String, dynamic> toJson() => {
        'email': email,
        'username': username,
        'fullName': fullName,
      };
  factory User.fromJson(Map<dynamic, dynamic> map) {
    return User(
      email: map['email'],
      username: map['username'],
      fullName: map['fullName'],
    );
  }
}
