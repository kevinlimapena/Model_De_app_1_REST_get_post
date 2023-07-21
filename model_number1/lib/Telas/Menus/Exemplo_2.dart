import 'package:flutter/material.dart';
import '../../Apis(Rest)/rest.dart';


class Exemplo2 extends StatefulWidget {
  const Exemplo2({Key? key}) : super(key: key);

  @override
  State<Exemplo2> createState() => _Exemplo2State();
}

class _Exemplo2State extends State<Exemplo2> {
  bool _isLoading = false;
  final TextEditingController _postController = TextEditingController();
  final PostService _postService = PostService();

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Post Enviado'),
          content: const Text('Seu post foi enviado com sucesso!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Fechar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exemplo de post'),
      ),
      body: SizedBox(
        child: Column(
          children: [
            Padding(  
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _postController,
                decoration: const InputDecoration(
                  labelText: 'Post',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _isLoading
                  ? null
                  : () async {
                      setState(() {
                        _isLoading = true;
                      });
                      await _postService.enviarPost(_postController.text);
                      setState(() {
                        _isLoading = false;
                      });

                      // Exibe o Dialog após o envio
                      _showSuccessDialog();
                    },
              child: _isLoading
                  ? const CircularProgressIndicator()
                  : const Text('Enviar'),
            ),
          ],
        ),
      ),
    );
  }
}