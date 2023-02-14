class UserDob {
  final DateTime date;
  final int age;

  //contructor
  UserDob({
    required this.date,
    required this.age,
  });

  //fromtoJson
  factory UserDob.fromMap(Map<String, dynamic> json) {
    return UserDob(
      age: json['age'],
      date: DateTime.parse(json['date']),
    );
  }
}
