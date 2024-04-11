import 'dart:convert';

import '../../../../config/database/api/api_consumer.dart';
import '../../../../config/database/api/end_points.dart';
import '../../../../core/models/property_model.dart';
import '../models/category_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<CategoryModel>> getCategories();
  Future<List<PropertyModel>> getTopLocations();
  Future<List<OwnerModel>> getTopOwners();
  Future<List<PropertyModel>> getNearbyLocations({List<double>? location});
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiConsumer _apiConsumer;

  HomeRemoteDataSourceImpl({required ApiConsumer apiConsumer})
      : _apiConsumer = apiConsumer;
  @override
  Future<List<CategoryModel>> getCategories() async {
    final response = await _apiConsumer.get(
      EndPoints.getCategories,
    );
    return List<CategoryModel>.from(response["results"]["categories"]
        .map((e) => CategoryModel.fromJson(e)));
  }

  @override
  Future<List<PropertyModel>> getNearbyLocations(
      {List<double>? location}) async {
    final response = await _apiConsumer.get(EndPoints.getNearbyLocations,
        queryParameters: {"location": jsonEncode(location)});
    return List<PropertyModel>.from(response["results"]["properties"]
        .map((e) => PropertyModel.fromJson(e)));
  }

  @override
  Future<List<PropertyModel>> getTopLocations() async {
    final response = await _apiConsumer.get(
      EndPoints.getTopLocations,
    );
    return List<PropertyModel>.from(response["results"]["properties"]
        .map((e) => PropertyModel.fromJson(e)));
  }

  @override
  Future<List<OwnerModel>> getTopOwners() async {
    final response = await _apiConsumer.get(
      EndPoints.getTopOwners,
    );
    return List<OwnerModel>.from(
        response["results"]["owners"].map((e) => OwnerModel.fromJson(e)));
  }
}
