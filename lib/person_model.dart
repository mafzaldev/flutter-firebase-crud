class Person {
  final String id;
  final String name;
  final String email;
  final String mobile;
  final String gender;

  Person({
    required this.id,
    required this.name,
    required this.gender,
    required this.email,
    required this.mobile,
  });

  static Person fromJson(json) => Person(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        mobile: json['mobile'],
        gender: json['gender'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "mobile": mobile,
        "gender": gender,
      };
}
