import 'dart:convert';

import 'package:meta/meta.dart';

class Weather {
  final int idalbum;
  final int postID;
  final String title;
  final String urlBig;
  final String urlsmall;

  Weather({
    required this.idalbum,
    required this.postID,
    required this.title,
    required this.urlBig,
    required this.urlsmall,
  });

  Weather copyWith({
    int? idalbum,
    int? postID,
    String? title,
    String? urlBig,
    String? urlsmall,
  }) {
    return Weather(
      idalbum: idalbum ?? this.idalbum,
      postID: postID ?? this.postID,
      title: title ?? this.title,
      urlBig: urlBig ?? this.urlBig,
      urlsmall: urlsmall ?? this.urlsmall,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idalbum': idalbum,
      'postID': postID,
      'title': title,
      'urlBig': urlBig,
      'urlsmall': urlsmall,
    };
  }

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      idalbum: map['idalbum']?.toInt() ?? 0,
      postID: map['postID']?.toInt() ?? 0,
      title: map['title'] ?? '',
      urlBig: map['urlBig'] ?? '',
      urlsmall: map['urlsmall'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Weather.fromJson(String source) => Weather.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Weather(idalbum: $idalbum, postID: $postID, title: $title, urlBig: $urlBig, urlsmall: $urlsmall)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Weather &&
      other.idalbum == idalbum &&
      other.postID == postID &&
      other.title == title &&
      other.urlBig == urlBig &&
      other.urlsmall == urlsmall;
  }

  @override
  int get hashCode {
    return idalbum.hashCode ^
      postID.hashCode ^
      title.hashCode ^
      urlBig.hashCode ^
      urlsmall.hashCode;
  }
}
