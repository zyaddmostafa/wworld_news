import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:uworld_news/models/article_model.dart';
import 'package:uworld_news/services/get_news.dart';

part 'getnews_state.dart';

class GetnewsCubit extends Cubit<GetnewsState> {
  GetnewsCubit() : super(GetnewsInitial());

  Future getnews({required String categoryname}) async {
    emit(Getnewsisloading());
    try {
      List<ArticleModel> result =
          await NewsService().getnews(categoryname: categoryname);
      emit(Getnewssucsses(article: result));
    } catch (e) {
      emit(Getnewsfailur(erorrmessage: e.toString()));
    }
  }
}
