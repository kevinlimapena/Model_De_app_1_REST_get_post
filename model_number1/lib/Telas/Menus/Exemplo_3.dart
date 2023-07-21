import 'package:flutter/material.dart';
import '../../Apis(Rest)/rest.dart';

class Exemplo3 extends StatefulWidget {
  const Exemplo3({Key? key}) : super(key: key);

  @override
  State<Exemplo3> createState() => _Exemplo3State();
}



class _Exemplo3State extends State<Exemplo3> {
  final TextEditingController _cepController = TextEditingController();
  String _address = '';

  void _fetchAddress() async {
    String address = await CEPService.getAddress(_cepController.text);
    setState(() {
      _address = address;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consulta de CEP'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              controller: _cepController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'CEP',
                hintText: 'Digite o CEP e pressione Enter',
              ),
              onSubmitted: (_) => _fetchAddress(),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _fetchAddress,
              child: Text('Consultar Endereço'),
            ),
            SizedBox(height: 16),
            Text(_address),
          ],
        ),
      ),
    );
  }
}
