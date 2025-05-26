import 'package:flutter/material.dart';
import 'package:receitanamao/common/constants/app_colors.dart';
import 'package:receitanamao/common/constants/widgets/third_buttom.dart';
import 'package:receitanamao/features/pages/ingredients_page.dart';
import 'package:receitanamao/features/pages/support_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFFF9E2C), Color(0xFFFF9925), Color(0xFFFF941F)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Receita Na Mão",
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: SizedBox(
        width: 240,
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFFFA726),
                      Color(0xFFFF9800),
                      Color(0xFFFB8C00),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Text(
                  'Receita Na Mão',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home, color: AppColors.orange),
                title: const Text('Início'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.help, color: AppColors.orange),
                title: const Text('Ajuda'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SupportPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24, top: 8),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            Text(
              "Bem-vindo(a)!",
              style: TextStyle(
                fontSize: 28,
                color: AppColors.orange,
                fontFamily: "OpenSanst",
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Image.asset(
              'assets/Image/chefe_corpo.png',
              height: 500,
              width: 500,
            ),
            const SizedBox(height: 32),
            ThirdButtom(
              text: "Buscar Receitas",
              icon: const Icon(Icons.search, color: AppColors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => IngredientsPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
