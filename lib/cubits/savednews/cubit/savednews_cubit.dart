import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:uworld_news/models/saved_article.dart';

part 'savednews_state.dart';

class SavednewsCubit extends Cubit<SavednewsState> {
  SavednewsCubit() : super(SavednewsInitial());

  savednews({required List<SavedArticle> article, required String email}) {
    for (var i = 0; i < article.length; i++) {
      if (article[i].email == email) {
        emit(Savednewsloaded());
      }
    }
  }
}
