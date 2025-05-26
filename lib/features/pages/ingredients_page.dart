import 'package:flutter/material.dart';
import '../api/api_service.dart';

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
    );
  }
}
