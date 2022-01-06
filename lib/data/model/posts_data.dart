// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:flutter_cubit_bloc_tutorial/data/model/posts.dart';

class PostsData {
  final int total_posts;
  final int total_pages;
  final List posts;
  PostsData({
    required this.total_posts,
    required this.total_pages,
    required this.posts,
  });

  PostsData copyWith({
    int? total_posts,
    int? total_pages,
    List? posts,
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
      'posts': posts,
    };
  }

  factory PostsData.fromMap(Map<String, dynamic> map) {
    return PostsData(
      total_posts: map['total_posts']?.toInt() ?? 0,
      total_pages: map['total_pages']?.toInt() ?? 0,
      posts: List.from(map['posts']),
    );
  }

  String toJson() => json.encode(toMap());

  factory PostsData.fromJson(String source) => PostsData.fromMap(json.decode(source));

  @override
  String toString() => 'PostsData(total_posts: $total_posts, total_pages: $total_pages, posts: $posts)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is PostsData &&
      other.total_posts == total_posts &&
      other.total_pages == total_pages &&
      listEquals(other.posts, posts);
  }

  @override
  int get hashCode => total_posts.hashCode ^ total_pages.hashCode ^ posts.hashCode;
}
