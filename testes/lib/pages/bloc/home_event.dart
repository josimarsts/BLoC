import 'package:equatable/equatable.dart';

class HomeEvent extends Equatable{
  @override
  List<Object?> get props => [];
}
//Evento lista carregada
class HomeFetchList extends HomeEvent {}

//Evento erro ao carregar lista
class HomeFetchListWithError extends HomeEvent {}

//Evento lista vazia
class HomeFetchListWithEmptyList extends HomeEvent {}