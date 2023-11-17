import 'dart:convert';

//IMPORTANTE! Necessário adicionar o pacote http ao projeto Flutter para fazer chamadas HTTP. Adicione a seguintes linhas ao seu pubspec.yaml:
// flutter:
//     sdk: flutter
//   http: ^0.13.3  # Verifique a versão mais recente no pub.dev
import 'package:http/http.dart' as http;

class OpenAIService {
  static Future<String> chamarAPIOpenAI(String mensagem) async {
    try {
      var url = Uri.parse('https://api.openai.com/v1/chat/completions');
      var response = await http.post(
        url,
        headers: {
          //Adicione sua chave de API para o app funcionar
          'Authorization': 'Bearer CHAVE_API_OPENAI',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'model': 'gpt-3.5-turbo',
          'messages': [
            {
              'role': 'system',
              'content': 'Você é um chatbot de Inteligência Artificial Chamado Apetrus AI, responde a todos de forma simpática e educada, com 3 linhas de resposta'
            },
            {
              'role': 'user',
              'content': mensagem
            }
          ],
        }),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(utf8.decode(response.bodyBytes));
        return data['choices'][0]['message']['content'];
      } else {
        print('Erro ${response.statusCode}: ${response.body}');
        return 'Erro: Falha ao obter resposta da OpenAI. Código de status: ${response.statusCode}';
      }
    } catch (e, stackTrace) {
      print('Erro de Exceção: ${e.toString()}');
      print('StackTrace: $stackTrace');
      return 'Erro de Exceção: ${e.toString()}';
    }
  }
}
