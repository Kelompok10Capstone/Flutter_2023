class User {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String password;
  final String token;

  User(
      {required this.id,
      required this.name,
      required this.email,
      required this.phone,
      required this.password,
      required this.token});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['data']['id'],
      name: json['data']['name'],
      email: json['data']['email'],
      phone: json['data']['phone'] ?? '',
      password: json['data']['password'] ?? '',
      token: json['data']['token'],
    );
  }
}
