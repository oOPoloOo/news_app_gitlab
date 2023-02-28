import 'package:news_app/sources/model/sources_model.dart';

abstract class BaseSourcesUseCase {
  //Loads Sources from API and saves it to local db.
  Future<void> loadSources();

  //Watche for source  data changes in local db.
  Stream<List<Sources>> watch();
}
