part of 'book_mark_cubit.dart';

@immutable
sealed class BookMarkState {}

final class BookMarkInitial extends BookMarkState {}

final class BookMarkSuccess extends BookMarkState {}
