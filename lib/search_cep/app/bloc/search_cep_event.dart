abstract class SearchCepEvent {
  final String cep;

  const SearchCepEvent({required this.cep});
}

class GetCepEvent extends SearchCepEvent {
  const GetCepEvent({required String cep}) : super(cep: cep);
}
