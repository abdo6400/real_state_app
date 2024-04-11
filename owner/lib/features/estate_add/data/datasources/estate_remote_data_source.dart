import 'package:owner/config/database/api/api_consumer.dart';
import 'package:owner/core/utils/commons.dart';

import '../../../../config/database/api/end_points.dart';
import '../models/category_moder.dart';
import '../models/property_model_params.dart';

abstract class EstateRemoteDataSource {
  Future<String> addEstate({required PropertyModelParams property});

  Future<List<CategoryModel>> getCategories();
}

class EstateRemoteDataSourceImpl extends EstateRemoteDataSource {
  final ApiConsumer _apiConsumer;

  EstateRemoteDataSourceImpl({required ApiConsumer apiConsumer})
      : _apiConsumer = apiConsumer;
  @override
  Future<String> addEstate({required PropertyModelParams property}) async {
    final Map<String, dynamic> body = {
      "image": await multipartConvertImage(image: property.subImages[0]),
      "title": property.title,
      "description": property.description,
      "features": property.features,
      "facilities": property.facilities,
      "numberOfRooms": property.numberOfRooms,
      "price": property.price,
      "type": property.type,
      "category": property.categoryId,
      "location": property.location,
      "rent_period": property.rentType
    };

    final response = await _apiConsumer.post(EndPoints.addProperty,
        body: body, files: property.subImages, name: "property_images");

    return response["message"];
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    final response = await _apiConsumer.get(
      EndPoints.getCategories,
    );
    return List<CategoryModel>.from(response["results"]["categories"]
        .map((e) => CategoryModel.fromJson(e)));
  }
}
