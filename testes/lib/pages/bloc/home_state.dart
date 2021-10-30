import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class HomeState extends Equatable{
  @override
  List<Object?> get props => [];
}

//Para carregando a lista
class HomeLoadingState extends HomeState {}

//Para erro ao carregar a lista
class HomeErrorState extends HomeState {
  final String message;

  HomeErrorState({required this.message});
}
//Para lista carregada
class HomeLoadedState extends HomeState {
  final List<String> list;

  HomeLoadedState({required this.list});
}

//Para lita vazia
class HomeEmptyListState extends HomeState {}