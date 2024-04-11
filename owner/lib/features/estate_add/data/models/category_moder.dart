import '../../domain/entities/category.dart';

class CategoryModel extends Category {
  CategoryModel({required super.name, required super.image, required super.id});

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      CategoryModel(name: json["type"], image: json["logo"], id: json["id"]);
}
