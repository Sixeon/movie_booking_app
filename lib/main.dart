
import 'package:dont_book_my_show/homescreen.dart';
import 'package:dont_book_my_show/login.dart';
import 'package:dont_book_my_show/movie_info_description.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(const MyApp());
}
void kal() async {
    final dio = Dio();
    final response = await dio.get('');
    print(response.data);
  }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = false;

    return GetMaterialApp(
      title: 'Movie booking app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        scaffoldBackgroundColor: Colors.black12,
          brightness: isDark ? Brightness.dark : Brightness.light,

        useMaterial3: true,
      ),
      home: HomePage1(),
      debugShowCheckedModeBanner: false,
    );
  }
}
