import 'package:user_api/model/user.dart';
import 'package:dio/dio.dart';

const baseurl = "https://jsonplaceholder.typicode.com";
final dio = Dio(
  BaseOptions(
    baseUrl: baseurl,
  ),
);

Future<List<User>> getUsers() async {
  await Future.delayed(const Duration(seconds: 5));
  final response = await dio.get("/users");
  final data = response.data as List<dynamic>;
  return data.map((e) {
    return User.fromJson(e);
  }).toList();
}
