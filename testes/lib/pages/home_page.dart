import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testes/pages/bloc/home_bloc.dart';
import 'package:testes/pages/bloc/home_state.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exemplo BLoC'),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        bloc: null,
        builder: (context, state) {
          //Retorna lista
          if(state is HomeLoadedState) {
            return ListView.builder(
              itemCount: 50,
              itemBuilder: (context, index){
                return ListTile(
                  title: Text('Item $index'),
                );
              }
            );
          }
          //Retorna caso erro ao carregar lista
          if(state is HomeErrorState) {
            return Center(
                child: Text(state.message),
            );
          }
          //Retorna caso lista esteja vazia
          if(state is HomeEmptyListState) {
            return const Center(
              child: Text('Não há dados disponíveis.'),
            );
          }
          return const Center(child: CircularProgressIndicator(),);
        },
      )
    );
  }
}