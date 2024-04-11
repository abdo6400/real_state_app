import 'package:image_picker/image_picker.dart';

class PropertyModelParams {
  final List<XFile> subImages;
  final String title;
  final String description;
  final String categoryId;
  final String location;
  final String type;
  final String price;
  final String? rentType;
  final List<String> features;
  final int numberOfRooms;
  final List<String> facilities;

  PropertyModelParams(
      {required this.subImages,
      required this.title,
      required this.description,
      required this.categoryId,
      required this.location,
      required this.type,
      required this.price,
      required this.rentType,
      required this.features,
      required this.numberOfRooms,
      required this.facilities});
}
