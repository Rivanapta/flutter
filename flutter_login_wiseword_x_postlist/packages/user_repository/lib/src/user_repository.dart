import 'dart:async';

import 'package:dio/dio.dart';
import 'package:user_repository/src/models/models.dart';

class UserRepository {
  User? _user;
  String? _lastToken;
  final String baseUrl = 'http://localhost:8080';
  final Dio dio = Dio();

  Future<User?> getUser(String token) async {
    if (_user != null && _lastToken == token) return _user;
  
    try {
      final response = await dio.get(
        '$baseUrl/account/my',
        options: Options(
          headers: {'Authorization': token},
        ),
      );

      print(response);
      if (response.statusCode == 200 && response.data != null) {
        var responseData = response.data;
        if (responseData != null) {
          _user = User.fromJson(responseData);
          _lastToken = token;
          print('User retrieved: ${_user?.name}'); // Log user yang berhasil diambil
          return _user;
        } else {
          throw Exception('No user data found');
        }
      } else {
        throw Exception('Failed to get user with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error retrieving user: $e'); // Log error saat pengambilan user gagal
      return null;
    }
  }
}
