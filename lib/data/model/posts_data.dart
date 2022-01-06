// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:flutter_cubit_bloc_tutorial/data/model/posts.dart';

class PostsData {
  final String total_posts;
  final String total_pages;
  final List<Post> posts;

  PostsData({
    required this.total_posts,
    required this.total_pages,
    required this.posts,
  });

  PostsData copyWith({
    String? total_posts,
    String? total_pages,
    List<Post>? posts,
  }) {
    return PostsData(
      total_posts: total_posts ?? this.total_posts,
      total_pages: total_pages ?? this.total_pages,
      posts: posts ?? this.posts,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'total_posts': total_posts,
      'total_pages': total_pages,
      'posts': posts.map((x) => x.toMap()).toList(),
    };
  }

  factory PostsData.fromMap(Map<String, dynamic> map) {
    return PostsData(
      total_posts: map['total_posts'] ?? '',
      total_pages: map['total_pages'] ?? '',
      posts: List<Post>.from(map['posts']?.map((x) => Post.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory PostsData.fromJson(String source) =>
      PostsData.fromMap(json.decode(source));

  @override
  String toString() =>
      'PostsData(total_posts: $total_posts, total_pages: $total_pages, posts: $posts)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PostsData &&
        other.total_posts == total_posts &&
        other.total_pages == total_pages &&
        listEquals(other.posts, posts);
  }

  @override
  int get hashCode =>
      total_posts.hashCode ^ total_pages.hashCode ^ posts.hashCode;
}
