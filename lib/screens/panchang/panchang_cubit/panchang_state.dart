part of 'panchang_cubit.dart';

@immutable
abstract class PanchangState {}

class PanchangInitial extends PanchangState {}

class AstroLoading extends PanchangState {}

class PanchangLoaded extends PanchangState {}

class PanchangError extends PanchangState {}
