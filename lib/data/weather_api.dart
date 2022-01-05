import 'package:flutter_cubit_bloc_tutorial/data/model/weather.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

Future< Map<String,dynamic> > requestPasabayPostByID(int postID) async {
  final response = await http.post(
    // Uri.parse('http://localhost/Team04-BSCS-NS-3A-M/Login/get_user_by_email'),
    Uri.parse('https://jsonplaceholder.typicode.com/photos1'),
    // body: {'post_id': postID.toString()}, //! potaena neto
    body: {},
  );

// conditions for status codes
  print('From API');
  return json.decode(response.body);
}