import 'package:bloc/bloc.dart';
import 'package:search_cep_app/search_cep/app/bloc/search_cep_event.dart';
import 'package:search_cep_app/search_cep/app/bloc/search_cep_state.dart';
import 'package:search_cep_app/search_cep/domain/repositories/cep_repository.dart';

class SearchCepBlocPkg extends Bloc<SearchCepEvent, SearchCepState> {
  final CepRepository _cepRepository;

  SearchCepBlocPkg(this._cepRepository) : super(SearchCepInitial()) {
    on<GetCepEvent>((event, emit) async {
      emit(SearchCepLoading());
      try {
        final cepModel = await _cepRepository.getCep(event.cep);
        emit(SearchCepSuccess(cepModel: cepModel));
      } catch (e) {
        emit(SearchCepError(
          message: e.toString(),
        ));
      }
    });
  }
}
