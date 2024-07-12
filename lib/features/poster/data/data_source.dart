import 'models/poster_model.dart';

abstract class PosterDataSource{
  Future<dynamic> addPoster(PosterModel posterModel);
  Future<dynamic> getPosters();
}