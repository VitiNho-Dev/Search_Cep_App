import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:search_cep_app/search_cep/app/bloc/bloc_package/search_cep_bloc_pkg.dart';
import 'package:search_cep_app/search_cep/app/bloc/search_cep_bloc.dart';
import 'package:search_cep_app/search_cep/app/bloc/search_cep_event.dart';
import 'package:search_cep_app/search_cep/app/bloc/search_cep_state.dart';

class CepPage extends StatefulWidget {
  const CepPage({Key? key}) : super(key: key);

  @override
  State<CepPage> createState() => _CepPageState();
}

class _CepPageState extends State<CepPage> {
  final _textController = TextEditingController();
  final _searchCepBloc = Modular.get<SearchCepBloc>();
  final _searchCepBlocPkg = Modular.get<SearchCepBlocPkg>();

  @override
  void initState() {
    super.initState();
    _searchCepBloc.stream;
    _searchCepBlocPkg;
  }

  @override
  void dispose() {
    _searchCepBloc.dispose();
    _searchCepBlocPkg.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Cep'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 32,
              ),
              const Text(
                'Pesquise um Cep',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                controller: _textController,
              ),
              const SizedBox(
                height: 16,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // _searchCepBloc.searchCep
                    //     .add(GetCepEvent(cep: _textController.text));
                    _searchCepBlocPkg
                        .add(GetCepEvent(cep: _textController.text));
                  },
                  child: const Text('Buscar'),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              BlocBuilder<SearchCepBlocPkg, SearchCepState>(
                bloc: _searchCepBlocPkg,
                builder: (context, state) {
                  // final state = snapshot.data;
                  if (state is SearchCepLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is SearchCepError) {
                    return Text('Falhou erro: ${state.message}');
                  }
                  if (state is SearchCepSuccess) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Cidade: ${state.cepModel.localidade}'),
                        Text('Bairro: ${state.cepModel.bairro}'),
                        Text('Logradouro: ${state.cepModel.logradouro}'),
                        Text('Cep: ${state.cepModel.cep}'),
                      ],
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
