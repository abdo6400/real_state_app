import '../../../../config/database/api/api_consumer.dart';
import '../../../../config/database/api/end_points.dart';
import '../../../../core/models/property_model.dart';

abstract class FavoriteRemoteDataSource {
  Future<List<PropertyModel>> getWishList();
  Future<List<PropertyModel>> editWishList(String id, bool delete);
}

class FavoriteRemoteDataSourceImpl extends FavoriteRemoteDataSource {
  final ApiConsumer _apiConsumer;

  FavoriteRemoteDataSourceImpl({required ApiConsumer apiConsumer})
      : _apiConsumer = apiConsumer;
  @override
  Future<List<PropertyModel>> editWishList(String id, bool delete) async {
    var response;
    if (delete) {
      response = await _apiConsumer.post("${EndPoints.favorites}/$id");
    } else {
      response = await _apiConsumer.delete("${EndPoints.favorites}/$id");
    }

    return List<PropertyModel>.from(
        response["results"]["favorites"].map((x) => PropertyModel.fromJson(x)));
  }

  @override
  Future<List<PropertyModel>> getWishList() async {
    final response = await _apiConsumer.get(EndPoints.favorites);

    return List<PropertyModel>.from(
        response["results"]["favorites"].map((x) => PropertyModel.fromJson(x)));
  }
}
