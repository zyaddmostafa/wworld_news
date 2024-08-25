part of 'getnews_cubit.dart';

@immutable
sealed class GetnewsState {}

final class GetnewsInitial extends GetnewsState {}

final class Getnewssucsses extends GetnewsState {
  final List<ArticleModel> article;

  Getnewssucsses({required this.article});
}

final class Getnewsisloading extends GetnewsState {}

final class Getnewsfailur extends GetnewsState {
  final String erorrmessage;

  Getnewsfailur({required this.erorrmessage});
}
