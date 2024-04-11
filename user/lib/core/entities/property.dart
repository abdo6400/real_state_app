import 'package:equatable/equatable.dart';

class Property extends Equatable {
  final String id;
  final String title;
  final String category;
  final List<double> location;
  final String image;
  final List<String> propertyImages;
  final String type;
  final String price;
  final List<String> features;
  final List<String> facilities;
  final String ratingsAvg;
  final String ratingsQuentity;
  final String description;
  final Owner owner;
  final String? rentType;
  const Property(
      {required this.id,
      required this.title,
      required this.category,
      required this.location,
      required this.image,
      required this.propertyImages,
      required this.type,
      required this.price,
      required this.features,
      required this.facilities,
      required this.ratingsAvg,
      required this.ratingsQuentity,
      required this.description,
      required this.owner,required  this.rentType});
  @override
  List<Object?> get props => [];
}

class Owner extends Equatable {
  final String logo;
  final String name;
  final String phone;
  final String email;
  final String id;
  const Owner({required this.phone,required this.email, required this.logo, required this.name, required this.id});

  @override
  List<Object?> get props => [];
}
