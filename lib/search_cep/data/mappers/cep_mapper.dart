import 'package:search_cep_app/search_cep/domain/models/cep_model.dart';

class CepMapper {
  static CepModel fromJson(Map<String, dynamic> json) {
    return CepModel(
      cep: json['cep'],
      logradouro: json['logradouro'],
      complemento: json['complemento'],
      bairro: json['bairro'],
      localidade: json['localidade'],
      uf: json['uf'],
      ibge: json['ibge'],
      gia: json['gia'],
      ddd: json['ddd'],
      siafi: json['siafi'],
    );
  }

  Map<String, dynamic> toJson(CepModel cepModel) {
    return {
      'cep': cepModel.cep,
      'logradouro': cepModel.logradouro,
      'complemento': cepModel.complemento,
      'bairro': cepModel.bairro,
      'localidade': cepModel.localidade,
      'uf': cepModel.uf,
      'ibge': cepModel.ibge,
      'gia': cepModel.gia,
      'ddd': cepModel.ddd,
      'siafi': cepModel.siafi,
    };
  }
}
