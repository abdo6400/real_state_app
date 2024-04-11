import '../entities/property.dart';

class PropertyModel extends Property {
  const PropertyModel({
    required super.id,
    required super.title,
    required super.category,
    required super.location,
    required super.image,
    required super.propertyImages,
    required super.type,
    required super.price,
    required super.features,
    required super.facilities,
    required super.ratingsAvg,
    required super.ratingsQuentity,
    required super.description,
    required super.available,
    required super.rentType
  });

  factory PropertyModel.fromJson(Map<String, dynamic> json) => PropertyModel(
        id: json["id"],
        location: List<double>.from(
            json["location"]["coordinates"].map((x) => x?.toDouble())),
        title: json["title"],
        category: json["category"],
        image: json["image"],
        propertyImages:
            List<String>.from(json["property_images"].map((x) => x)),
        type: json["type"],
        price: json["price"].toString(),
        features: List<String>.from(json["features"].map((x) => x)), 
        facilities: List<String>.from(json["facilities"].map((x) => x)),
        ratingsAvg: json["ratingsAvg"].toString(),
        ratingsQuentity: json["ratingsQuentity"].toString(),
        description: json["description"],
        available: json["available"],
        rentType: json["rent_period"]
      );
}
