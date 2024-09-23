import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'book_mark_state.dart';

class BookMarkCubit extends Cubit<BookMarkState> {
  BookMarkCubit() : super(BookMarkInitial());
  final Stream<QuerySnapshot> _usersavednews =
      FirebaseFirestore.instance.collection('user saved articles').snapshots();
  void userSavedNews() {}
}
