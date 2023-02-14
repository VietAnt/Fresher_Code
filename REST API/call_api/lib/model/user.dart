//User
import 'package:call_api/model/user_dob.dart';
import 'package:call_api/model/user_location.dart';
import 'package:call_api/model/user_name.dart';
import 'package:call_api/model/user_picture.dart';

class User {
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String nat;
  final UserName name;
  final UserDob dob;
  final UserPicture picture;
  final UserLocation location;

  //Contructor
  User({
    required this.gender,
    required this.email,
    required this.phone,
    required this.cell,
    required this.nat,
    required this.name,
    required this.dob,
    required this.location,
    required this.picture,
  });

  factory User.fromJson(Map<String, dynamic> e) {
    final name = UserName.fromMap(e['name']);
    final dob = UserDob.fromMap(e['dob']);
    final location = UserLocation.fromMap(e['location']);
    final picture = UserPicture.fromMap(e['picture']);

    return User(
      gender: e['gender'],
      email: e['gender'],
      phone: e['phone'],
      cell: e['cell'],
      nat: e['nat'],
      name: name,
      dob: dob,
      location: location,
      picture: picture,
    );
  }

  //fullName
  String get fullName {
    return '${name.title} ${name.first} ${name.last}';
  }
}
