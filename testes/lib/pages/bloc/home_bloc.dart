import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testes/pages/bloc/home_event.dart';
import 'package:testes/pages/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(HomeState initialState) : super(HomeLoadingState());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    var state;

    switch (event.runtimeType) {
      case HomeFetchList:
        state = _fethList().asStream();
        break;
      case HomeFetchListWithError:
        state = _fethListWithError().asStream();
        break;
      case HomeFetchListWithEmptyList:
        state = _fethListWithEmptyList().asStream();
        break;
    }

    yield* await state;
  }

  //Método lista carregada
  Future<HomeState> _fethList() async {
    var list = await Future.delayed(
      const Duration(seconds: 3),
      () => <String>[
        'Item 1',
      ],
    );
    return HomeLoadedState(list: list);
  }

  //Método erro ao carregar lista
  Future<HomeState> _fethListWithError() async {
    return await Future.delayed(const Duration(seconds: 3),
        () => HomeErrorState(message: 'Não foi possível carregar os dados'));
  }

  //Método lista vazia
  Future<HomeState> _fethListWithEmptyList() async {
    return await Future.delayed(
      const Duration(seconds: 3),
      () => HomeEmptyListState(),
    );
  }
}
