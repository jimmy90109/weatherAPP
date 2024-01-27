import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fetch_result.g.dart';

@riverpod
Future<Map<String, dynamic>> weather(WeatherRef ref, String city) async {
  final dio = Dio();

  final response = await dio.get(
      'https://opendata.cwa.gov.tw/api/v1/rest/datastore/F-C0032-001?Authorization=CWA-19F1C9DA-AE2A-4302-BD5D-25A74F245B6A&format=JSON&locationName=$city');
  // print(response.toString());
  final map = jsonDecode(response.toString()) as Map<String, dynamic>;
  return map;
}
