import 'package:flutter/material.dart';

class RecipeDetailPage extends StatelessWidget {
  final Map<String, dynamic> receita;

  const RecipeDetailPage({super.key, required this.receita});

  @override
  Widget build(BuildContext context) {
    final nome = receita['receita'] ?? 'Receita';
    final imagemUrl = receita['link_imagem'];
    final ingredientes = receita['ingredientes'] ?? 'Sem ingredientes';
    final preparo = receita['modo_preparo'] ?? 'Sem modo de preparo';

    return Scaffold(
      appBar: AppBar(
        title: Text(nome),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (imagemUrl != null && imagemUrl.toString().startsWith('http'))
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  imagemUrl,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                  errorBuilder:
                      (context, error, stackTrace) =>
                          const Icon(Icons.broken_image, size: 100),
                ),
              )
            else
              const Icon(Icons.image_not_supported, size: 100),
            const SizedBox(height: 16),
            const Text(
              'Ingredientes:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(ingredientes),
            const SizedBox(height: 16),
            const Text(
              'Modo de Preparo:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(preparo),
          ],
        ),
      ),
    );
  }
}
