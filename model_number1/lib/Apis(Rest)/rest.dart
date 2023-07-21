import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List> pegarUsuarios() async{
  var Url = Uri.parse('https://servicodados.ibge.gov.br/api/v2/censos/nomes');
  var response = await http.get(Url);
  if (response.statusCode == 200){
    return jsonDecode(utf8.decode(response.bodyBytes  ));  
} else{
  throw Exception('Deu erro');
}

 }


class PostService {
  Future<void> enviarPost(String texto) async {
    try {
      // Simulação do envio do post para uma URL fictícia
      String apiUrl = 'https://api.example.com/posts';
      Map<String, String> headers = {'Content-Type': 'application/json'};
      String requestBody = '{"text": "$texto"}';

      var response = await http.post(Uri.parse(apiUrl),
          headers: headers, body: requestBody);

      if (response.statusCode == 200) {
        // Post enviado com sucesso
        print('Post enviado: $texto');
      } else {
        // Tratamento de erros aqui, se necessário
        print('Erro ao enviar o post. Código de status: ${response.statusCode}');
      }
    } catch (e) {
      // Tratamento de erros aqui, se necessário
      print('Erro ao enviar o post: $e');
    }
  }
}
 

class CEPService {
  static Future<String> getAddress(String cep) async {
    cep = cep.replaceAll('-', '');
    String apiUrl = 'https://viacep.com.br/ws/$cep/json/';

    http.Response response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      return "Endereço: ${data['logradouro']}, ${data['bairro']}, ${data['localidade']} - ${data['uf']}";
    } else {
      return 'Endereço não encontrado.';
    }
  }
}

class WeatherService {
  static const String apiKey = 'd342b70bc2f0c8edde95af85a134168a'; 

  static Future<Map<String, dynamic>> getWeatherByCity(String city) async {
    String apiUrl =
        'http://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey';

    http.Response response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Falha ao buscar dados de previsão do tempo.');
    }
  }
}

