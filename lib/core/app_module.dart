import 'package:flutter_modular/flutter_modular.dart';
import 'package:search_cep_app/search_cep/app/bloc/bloc_package/search_cep_bloc_pkg.dart';
import 'package:search_cep_app/search_cep/app/bloc/search_cep_bloc.dart';
import 'package:search_cep_app/search_cep/app/page/cep_page.dart';
import 'package:search_cep_app/search_cep/data/datasources/cep_datasource.dart';
import 'package:search_cep_app/search_cep/domain/repositories/cep_repository.dart';

import '../search_cep/app/bloc/bloc_package/search_cep_bloc_pkg.dart';
import '../search_cep/app/page/cep_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => CepDatasource()),
        Bind.factory((i) => CepRepository(i())),
        Bind.factory((i) => SearchCepBloc(i())),
        Bind.factory((i) => SearchCepBlocPkg(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const CepPage(),
        ),
      ];
}
