import 'dart:convert';

import 'package:http/http.dart' as http;

//Todo: Services
class TodoService {
  //!--fetchTodo--//
  static Future<List?> fetchTodos() async {
    const url = 'http://api.nstack.in/v1/todos?page=1&limit=10';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map;
      final result = json['items'] as List;
      return result;
    } else {
      return null;
    }
  }

  //!--AddTodo--//
  static Future<bool> addTodo(Map body) async {
    const url = 'http://api.nstack.in/v1/todos';
    final uri = Uri.parse(url);
    final response = await http.put(
      uri,
      body: jsonEncode(body),
      headers: {
        'Content-Type': 'applicatiom/json',
      },
    );
    return response.statusCode == 201;
  }

  //!--updateTodo--//
  static Future<bool> updateTodo(String id, Map body) async {
    final url = 'http://api.nstack.in/v1/todos/$id';
    final uri = Uri.parse(url);
    final response = await http.put(
      uri,
      body: jsonEncode(body),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    return response.statusCode == 200;
  }

  //!--deleteById--//
  static Future<bool> deleteById(String id) async {
    final url = 'http://api.nstack.in/v1/todos/$id';
    final uri = Uri.parse(url);
    final response = await http.delete(uri);
    return response.statusCode == 200;
  }
}
