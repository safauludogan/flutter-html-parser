import '../feature/home/model/body_building_model.dart';

abstract class IService {
  Future<List<BodyBuildingModel>> fetchData();
}
