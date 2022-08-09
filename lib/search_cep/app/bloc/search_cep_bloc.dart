import 'dart:async';

import 'package:search_cep_app/search_cep/app/bloc/search_cep_event.dart';
import 'package:search_cep_app/search_cep/app/bloc/search_cep_state.dart';
import 'package:search_cep_app/search_cep/domain/repositories/cep_repository.dart';

class SearchCepBloc {
  final CepRepository _cepRepository;

  SearchCepBloc(this._cepRepository);

  final _streamController = StreamController<SearchCepEvent>.broadcast();

  Sink<SearchCepEvent> get searchCep => _streamController.sink;
  Stream<SearchCepState> get stream =>
      _streamController.stream.asyncExpand(_searchCep);

  Stream<SearchCepState> _searchCep(SearchCepEvent getCepEvent) async* {
    yield SearchCepLoading();
    try {
      final cepModel = await _cepRepository.getCep(getCepEvent.cep);
      yield SearchCepSuccess(cepModel: cepModel);
    } catch (e) {
      yield SearchCepError(message: e.toString());
    }
  }

  void dispose() {
    _streamController.close();
  }
}
