import 'package:equatable/equatable.dart';

class BookingEntity extends Equatable {
  final String? bookingId;
  final String fullname;
  final String email;
  final String date;
  final String time;
  final String people;

  const BookingEntity(
      {this.bookingId,
      required this.fullname,
      required this.email,
      required this.date,
      required this.time,
      required this.people});

  factory BookingEntity.fromJson(Map<String, dynamic> json) => BookingEntity(
        bookingId: json["bookingId"],
        fullname: json["fullname"],
        email: json["email"],
        date: json["date"],
        time: json["time"],
        people: json["people"],
      );

  Map<String, dynamic> toJson() => {
        "bookingId": bookingId,
        "fullname": fullname,
        "email": email,
        "date": date,
        "time": time,
        "people": people,
      };

  @override
  List<Object?> get props => [bookingId, fullname, email, date, time, people];
}
