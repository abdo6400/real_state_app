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
  final bool available;
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
      required this.available,
      required this.rentType
      });
  @override
  List<Object?> get props => [];
}


