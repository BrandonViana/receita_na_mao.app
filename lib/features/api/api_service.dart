import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // Buscar todas as receitas
  static Future<List<Map<String, dynamic>>> buscarTodasReceitas() async {
    final url = Uri.parse('https://api-receitas-pi.vercel.app/receitas/todas');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((e) => Map<String, dynamic>.from(e)).toList();
    } else {
      throw Exception('Falha ao buscar receitas');
    }
  }

  // Buscar receitas por ingredientes
  static Future<List<Map<String, dynamic>>> buscarPorIngredientes(String ingredientes) async {
    final url = Uri.parse(
      'https://api-receitas-pi.vercel.app/receitas/buscar?ingredientes=$ingredientes',
    );
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((e) => Map<String, dynamic>.from(e)).toList();
    } else {
      throw Exception('Erro ao buscar por ingredientes');
    }
  }
}
