import 'package:equatable/equatable.dart';

class DestinationEntity extends Equatable {
  final String? destinationId;
  final String name;
  final String location;
  final String picture;
  final String price;

  const DestinationEntity({
    this.destinationId,
    required this.name,
    required this.location,
    required this.picture,
    required this.price,
  });

  factory DestinationEntity.fromJson(Map<String, dynamic> json) =>
      DestinationEntity(
        destinationId: json["destinationId"],
        name: json["name"],
        location: json["location"],
        picture: json["picture"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "destinationId": destinationId,
        "name": name,
        "location": location,
        "picture": picture,
        "price": price,
      };

  @override
  List<Object?> get props => [destinationId, name, location, picture, price];
}
