import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:search_cep_app/search_cep/data/mappers/cep_mapper.dart';

import '../../domain/models/cep_model.dart';

class CepDatasource {
  Future<CepModel> fetch(String cep) async {
    try {
      final response = await http.get(
        Uri.parse('https://viacep.com.br/ws/$cep/json/'),
      );
      final cepModel = CepMapper.fromJson(jsonDecode(response.body));
      return cepModel;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
