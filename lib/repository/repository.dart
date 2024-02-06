import 'package:get/get.dart';
import '../models/gif.dart';

class GifRepository extends GetConnect {
  // Método para buscar a lista de Gif
  Future<List<GifModel>?> findAll() async { 
    try {
      final response = await get(
        'https://api.giphy.com/v2/emoji',
        query: {
          'api_key': 'SQqpahzeOdvXJEWEtTVcZ056HVUbdmwC',
          'limit': '25',
          'offset': '0'
        },
      );

      if (response.statusCode == 200) {
        // Retorna a lista de objetos GifModel
        final data = response.body['data'] as List?;
        if (data != null) {
          final gifList = data
            .map((json) => GifModel(
              id: json['id'],
              url: json['images']['original']['url'],
            ))
            .toList();
          return gifList;
        } else {
          throw Exception('Nenhum dado encontrado na resposta da API.');
        }
      } else {
        // Se houver erro na solicitação, lança uma exceção com a mensagem de erro
        throw Exception('Erro ${response.statusCode}: ${response.statusText}');
      }
    } catch (e) {
      // Se ocorrer um erro durante a solicitação, lança uma exceção com o erro
      throw Exception('Erro ao buscar dados da API: $e');
    }
  }
}
