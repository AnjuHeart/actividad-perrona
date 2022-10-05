import 'dart:convert';

class Model {
  final Map<String, dynamic> objetosJson;

  Model._(this.objetosJson);

  factory Model.fromJson({required String jsonString}) {
    JsonDecoder decoder = const JsonDecoder();

    final Map<String, dynamic> jsonObject = decoder.convert(jsonString);

    final Map<String, dynamic> message = jsonObject['message'];
    return Model._(message);
  }
}
