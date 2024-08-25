part of 'savednews_cubit.dart';

@immutable
sealed class SavednewsState {}

final class SavednewsInitial extends SavednewsState {}

final class Savednewsloaded extends SavednewsState {}

final class Savednewsnodata extends SavednewsState {}
