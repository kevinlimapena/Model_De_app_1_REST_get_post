import 'package:flutter/material.dart';

class menuPage extends StatefulWidget {
  const menuPage({super.key});

  @override
  State<menuPage> createState() => _menuPageState();
}

class _menuPageState extends State<menuPage> {
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader
            (
              currentAccountPicture: ClipRRect
              (
                borderRadius: BorderRadius.circular(40),
                child: Image.network('https://i.postimg.cc/7ZDXgPtg/icone-2.png'),
              ), accountEmail: Text('Usuário:'), accountName: Text('ID do Usuário:'),
            ),
            ListTile
            (
              leading: const Icon(Icons.home),
              title: const Text('Inicio'),
              subtitle: const Text('tela de inicio'),
              onTap: () {
                Navigator.of(context).pushNamed('/menu');
              },
            ),
              ListTile
              (
                leading: const Icon(Icons.exit_to_app),
                title: const Text('Logout'),
                subtitle: const Text('Sair'),
                onTap: () {
                  Navigator.of(context).pushNamed('/');
                },
              ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Menu'),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/Ex1');
                    },
                    child: const Text('Exemplo Get'),
                  ),
                ),
              const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/Ex2');
                    },
                    child: const Text('Exemplo Post'),
                  ),
                ),
              const SizedBox(height: 10),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/Ex3');
                    },
                    child: const Text('Exemplo Cep'),
                  ),
                ),
              const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/Ex4');
                    },
                    child: const Text('Exemplo API clima'),
                  ),
                ),
              const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/');
                    },
                    child: const Text('Logout'),
                  ),
                ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}