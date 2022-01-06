import 'dart:math';

import 'package:flutter_cubit_bloc_tutorial/data/model/posts_data.dart';
import 'package:flutter_cubit_bloc_tutorial/data/post_posts_api.dart';

import 'model/posts.dart';

abstract class WeatherRepository {
  /// Throws [NetworkException].
  Future<Post> fetchWeather(int postID);
  Future<PostsData> fetchBulkPost(int pageNumber);
//   ! Note: yung function definition lang sa repository
}

class FakeWeatherRepository implements WeatherRepository {
  @override
  Future<Post> fetchWeather(int postID) async {
    final source = await requestPasabayPostByID(postID);
    return Future.delayed(Duration(seconds: 0), () => Post.fromMap(source));
  }

  @override
  Future<PostsData> fetchBulkPost(int pageNumber) async {
    final source = await requestBulkPost(pageNumber);
    return Future.delayed(Duration(milliseconds: 300), () => PostsData.fromMap(source));
  }
}

class NetworkException implements Exception {}
