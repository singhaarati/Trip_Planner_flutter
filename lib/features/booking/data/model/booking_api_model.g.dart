// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingApiModel _$BookingApiModelFromJson(Map<String, dynamic> json) =>
    BookingApiModel(
      bookingId: json['id'] as String?,
      fullname: json['fullname'] as String,
      email: json['email'] as String,
      date: json['date'] as String,
      time: json['time'] as String,
      people: json['people'] as String,
    );

Map<String, dynamic> _$BookingApiModelToJson(BookingApiModel instance) =>
    <String, dynamic>{
      'id': instance.bookingId,
      'fullname': instance.fullname,
      'email': instance.email,
      'date': instance.date,
      'time': instance.time,
      'people': instance.people,
    };
