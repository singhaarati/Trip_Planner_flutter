import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/booking_entity.dart';

part 'booking_api_model.g.dart';

final bookingApiModelProvider = Provider<BookingApiModel>(
  (ref) => const BookingApiModel.empty(),
);

@JsonSerializable()
class BookingApiModel extends Equatable {
  @JsonKey(name: 'id')
  final String? bookingId;
  final String fullname;
  final String email;
  final String date;
  final String time;
  final String people;

  const BookingApiModel(
      {required this.bookingId,
      required this.fullname,
      required this.email,
      required this.date,
      required this.time,
      required this.people});

  const BookingApiModel.empty()
      : bookingId = '',
        fullname = '',
        email = '',
        date = '',
        time = '',
        people = '';

  Map<String, dynamic> toJson() => _$BookingApiModelToJson(this);

  factory BookingApiModel.fromJson(Map<String, dynamic> json) =>
      _$BookingApiModelFromJson(json);

  // Convert API Object to Entity
  BookingEntity toEntity() => BookingEntity(
        bookingId: bookingId,
        fullname: fullname,
        email: email,
        date: date,
        time: time,
        people: people,
      );

  // Convert Entity to API Object
  BookingApiModel fromEntity(BookingEntity entity) => BookingApiModel(
        bookingId: entity.bookingId ?? '',
        fullname: entity.fullname,
        email: entity.email,
        date: entity.date,
        time: entity.time,
        people: entity.people,
      );

  //convert API List to Entity List
  List<BookingEntity> toEntityList(List<BookingApiModel> models) =>
      models.map((model) => model.toEntity()).toList();

  @override
  List<Object?> get props => [bookingId, fullname, email, date, time, people];
}
