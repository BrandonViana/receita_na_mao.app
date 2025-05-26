import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:receitanamao/common/constants/app_colors.dart';

import 'package:receitanamao/features/pages/first_page.dart';

class SupportPage extends StatefulWidget {
  const SupportPage({super.key});

  @override
  State<SupportPage> createState() => _SupportPageState();
  
}
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _telefoneController = TextEditingController();
  final _descricaoController = TextEditingController();

  OutlineInputBorder getOrangeBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.orange, width: 2),
    );
  }

  void _enviarFormulario() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context as BuildContext).showSnackBar(
        const SnackBar(
          content: Text("Formulário enviado com sucesso!"),
          backgroundColor: AppColors.orange,
        ),
      );
      _formKey.currentState!.reset();
    }
  }

class _SupportPageState extends State<SupportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.orange,
        title: const Text(
          "Ajuda",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: AppColors.orange),
              child: Text(
                'Receita Na Mão',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: AppColors.orange),
              title: const Text('Início'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => FirstPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.help, color: AppColors.orange),
              title: const Text('Ajuda'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SupportPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: _nomeController,
                  decoration: InputDecoration(
                    labelText: "Nome",
                    border: getOrangeBorder(),
                    enabledBorder: getOrangeBorder(),
                    focusedBorder: getOrangeBorder(),
                  ),
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Informe seu nome' : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: getOrangeBorder(),
                    enabledBorder: getOrangeBorder(),
                    focusedBorder: getOrangeBorder(),
                  ),
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Informe seu e-mail' : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _telefoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: "Telefone",
                    border: getOrangeBorder(),
                    enabledBorder: getOrangeBorder(),
                    focusedBorder: getOrangeBorder(),
                  ),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Informe seu telefone'
                      : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _descricaoController,
                  maxLines: 8,
                  maxLength: 1500,
                  decoration: InputDecoration(
                    labelText: "Descrição",
                    alignLabelWithHint: true,
                    border: getOrangeBorder(),
                    enabledBorder: getOrangeBorder(),
                    focusedBorder: getOrangeBorder(),
                  ),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Descreva sua dúvida ou problema'
                      : null,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _enviarFormulario,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.orange,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Enviar",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}