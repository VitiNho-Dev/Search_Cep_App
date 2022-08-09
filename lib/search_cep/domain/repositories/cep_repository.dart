import 'package:search_cep_app/search_cep/data/datasources/cep_datasource.dart';
import 'package:search_cep_app/search_cep/domain/models/cep_model.dart';

class CepRepository {
  final CepDatasource _cepDatasource;

  CepRepository(this._cepDatasource);

  Future<CepModel> getCep(String cep) async {
    try {
      final cepModel = await _cepDatasource.fetch(cep);
      return cepModel;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
