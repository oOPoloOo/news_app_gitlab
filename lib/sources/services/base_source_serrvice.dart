import 'package:news_app/sources/model/sources_model.dart';

abstract class BaseSourceService {
  Future<List<Sources>?> getSourcesEn(String category);
}
