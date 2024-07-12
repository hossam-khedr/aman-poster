import '../../data/models/poster_model.dart';

sealed class PosterStates{}
final class InitState extends PosterStates{}
final class ClintTypeChangeState extends PosterStates{}
final class LicenseTypeChangeState extends PosterStates{}
final class PosterLoadingState extends PosterStates{}
final class PosterSuccessState extends PosterStates{}
final class PosterErrorState extends PosterStates{
  String errorMsg;
  PosterErrorState(this.errorMsg);
}
final class GetPostersSuccessState extends PosterStates{
  final List<PosterModel> posters;
  GetPostersSuccessState(this.posters);
}