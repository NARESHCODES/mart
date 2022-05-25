// To parse this JSON data, do
//
//     final slideModel = slideModelFromJson(jsonString);

import 'dart:convert';

List<String> slideModelFromJson(String str) =>
    List<String>.from(json.decode(str).map((x) => x));

String slideModelToJson(List<String> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x)));
