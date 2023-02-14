//class UserAPI
import 'package:call_api/model/user.dart';
import 'package:http/http.dart' as http;

class UserApi {
  //fetchUsers()
  static Future<List<User>?> fetchUser() async {
    const url = 'https://randomuser.me/api/?results=100';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
  }
}
