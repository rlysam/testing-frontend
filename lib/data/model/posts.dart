// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:meta/meta.dart';

class Post {
  final String post_id;
  final String user_id;
  final String title;
  final String first_name;
  final String last_name;
  final String type; //delivery|request
  final String points;
  final String location;
  final String destination;
  final String quantity; // ! minsan NULL (PERO nakalagay sa database CREATE TABLE "NOT NULL")
  final String rate;
  final String time_posted;
  final String delivery_time;
  final String date;
  final String tags;
  final String image_location;
  final String status;
//   Unique to pahiram:
  final String participant_id;
  final String participant_first_name;
  final String participant_last_name;
  final String item;
  final String item_id;
  final String rent_due;

  Post({
    required this.post_id,
    required this.user_id,
    required this.title,
    required this.first_name,
    required this.last_name,
    required this.type,
    required this.points,
    required this.location,
    required this.destination,
    required this.quantity,
    required this.rate,
    required this.time_posted,
    required this.delivery_time,
    required this.date,
    required this.tags,
    required this.image_location,
    required this.status,
    required this.participant_id,
    required this.participant_first_name,
    required this.participant_last_name,
    required this.item,
    required this.item_id,
    required this.rent_due,
  });

  Post copyWith({
    String? post_id,
    String? user_id,
    String? title,
    String? first_name,
    String? last_name,
    String? type,
    String? points,
    String? location,
    String? destination,
    String? quantity,
    String? rate,
    String? time_posted,
    String? delivery_time,
    String? date,
    String? tags,
    String? image_location,
    String? status,
    String? participant_id,
    String? participant_first_name,
    String? participant_last_name,
    String? item,
    String? item_id,
    String? rent_due,
  }) {
    return Post(
      post_id: post_id ?? this.post_id,
      user_id: user_id ?? this.user_id,
      title: title ?? this.title,
      first_name: first_name ?? this.first_name,
      last_name: last_name ?? this.last_name,
      type: type ?? this.type,
      points: points ?? this.points,
      location: location ?? this.location,
      destination: destination ?? this.destination,
      quantity: quantity ?? this.quantity,
      rate: rate ?? this.rate,
      time_posted: time_posted ?? this.time_posted,
      delivery_time: delivery_time ?? this.delivery_time,
      date: date ?? this.date,
      tags: tags ?? this.tags,
      image_location: image_location ?? this.image_location,
      status: status ?? this.status,
      participant_id: participant_id ?? this.participant_id,
      participant_first_name: participant_first_name ?? this.participant_first_name,
      participant_last_name: participant_last_name ?? this.participant_last_name,
      item: item ?? this.item,
      item_id: item_id ?? this.item_id,
      rent_due: rent_due ?? this.rent_due,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'post_id': post_id,
      'user_id': user_id,
      'title': title,
      'first_name': first_name,
      'last_name': last_name,
      'type': type,
      'points': points,
      'location': location,
      'destination': destination,
      'quantity': quantity,
      'rate': rate,
      'time_posted': time_posted,
      'delivery_time': delivery_time,
      'date': date,
      'tags': tags,
      'image_location': image_location,
      'status': status,
      'participant_id': participant_id,
      'participant_first_name': participant_first_name,
      'participant_last_name': participant_last_name,
      'item': item,
      'item_id': item_id,
      'rent_due': rent_due,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      post_id: map['post_id'] ?? '',
      user_id: map['user_id'] ?? '',
      title: map['title'] ?? '',
      first_name: map['first_name'] ?? '',
      last_name: map['last_name'] ?? '',
      type: map['type'] ?? '',
      points: map['points'] ?? '',
      location: map['location'] ?? '',
      destination: map['destination'] ?? '',
      quantity: map['quantity'] ?? '',
      rate: map['rate'] ?? '',
      time_posted: map['time_posted'] ?? '',
      delivery_time: map['delivery_time'] ?? '',
      date: map['date'] ?? '',
      tags: map['tags'] ?? '',
      image_location: map['image_location'] ?? '',
      status: map['status'] ?? '',
      participant_id: map['participant_id'] ?? '',
      participant_first_name: map['participant_first_name'] ?? '',
      participant_last_name: map['participant_last_name'] ?? '',
      item: map['item'] ?? '',
      item_id: map['item_id'] ?? '',
      rent_due: map['rent_due'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) => Post.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Weather(post_id: $post_id, user_id: $user_id, title: $title, first_name: $first_name, last_name: $last_name, type: $type, points: $points, location: $location, destination: $destination, quantity: $quantity, rate: $rate, time_posted: $time_posted, delivery_time: $delivery_time, date: $date, tags: $tags, image_location: $image_location, status: $status, participant_id: $participant_id, participant_first_name: $participant_first_name, participant_last_name: $participant_last_name, item: $item, item_id: $item_id, rent_due: $rent_due)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Post &&
      other.post_id == post_id &&
      other.user_id == user_id &&
      other.title == title &&
      other.first_name == first_name &&
      other.last_name == last_name &&
      other.type == type &&
      other.points == points &&
      other.location == location &&
      other.destination == destination &&
      other.quantity == quantity &&
      other.rate == rate &&
      other.time_posted == time_posted &&
      other.delivery_time == delivery_time &&
      other.date == date &&
      other.tags == tags &&
      other.image_location == image_location &&
      other.status == status &&
      other.participant_id == participant_id &&
      other.participant_first_name == participant_first_name &&
      other.participant_last_name == participant_last_name &&
      other.item == item &&
      other.item_id == item_id &&
      other.rent_due == rent_due;
  }

  @override
  int get hashCode {
    return post_id.hashCode ^
      user_id.hashCode ^
      title.hashCode ^
      first_name.hashCode ^
      last_name.hashCode ^
      type.hashCode ^
      points.hashCode ^
      location.hashCode ^
      destination.hashCode ^
      quantity.hashCode ^
      rate.hashCode ^
      time_posted.hashCode ^
      delivery_time.hashCode ^
      date.hashCode ^
      tags.hashCode ^
      image_location.hashCode ^
      status.hashCode ^
      participant_id.hashCode ^
      participant_first_name.hashCode ^
      participant_last_name.hashCode ^
      item.hashCode ^
      item_id.hashCode ^
      rent_due.hashCode;
  }
}
