import 'package:flutter/material.dart';
import '../api/api_service.dart';
import 'recipe_detail_page.dart';

class IngredientsPage extends StatefulWidget {
  const IngredientsPage({super.key});

  @override
  State<IngredientsPage> createState() => _IngredientsPageState();
}

class _IngredientsPageState extends State<IngredientsPage> {
  List<Map<String, dynamic>> receitas = [];
  bool carregando = false;

  @override
  void initState() {
    super.initState();
    carregarTodasReceitas();
  }

  Future<void> carregarTodasReceitas() async {
    setState(() => carregando = true);
    try {
      final resultado = await ApiService.buscarTodasReceitas();
      if (!mounted) return;
      setState(() {
        receitas = resultado;
      });
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Erro ao carregar receitas')),
        );
      }
    } finally {
      if (mounted) setState(() => carregando = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Receitas'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body:
          carregando
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                itemCount: receitas.length,
                itemBuilder: (context, index) {
                  final receita = receitas[index];
                  return ListTile(
                    title: Text(receita['receita'] ?? 'Sem nome'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => RecipeDetailPage(receita: receita),
                        ),
                      );
                    },
                  );
                },
              ),
    );
  }
}
