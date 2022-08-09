import 'package:search_cep_app/search_cep/domain/models/cep_model.dart';

abstract class SearchCepState {}

class SearchCepInitial implements SearchCepState {}

class SearchCepSuccess implements SearchCepState {
  final CepModel cepModel;

  SearchCepSuccess({required this.cepModel});
}

class SearchCepLoading implements SearchCepState {}

class SearchCepError implements SearchCepState {
  final String message;

  const SearchCepError({required this.message});
}
