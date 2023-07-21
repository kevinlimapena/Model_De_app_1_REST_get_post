import 'package:flutter/material.dart';
import 'package:model_number1/Apis(Rest)/rest.dart';



class Exemplo4 extends StatefulWidget {
  @override
  Exemplo4State createState() => Exemplo4State();
}

class Exemplo4State extends State<Exemplo4> {
  final TextEditingController _cityController = TextEditingController();
  Map<String, dynamic> _weatherData = {};

  void _fetchWeather() async {
    String city = _cityController.text.trim();
    if (city.isNotEmpty) {
      try {
        Map<String, dynamic> weatherData =
            await WeatherService.getWeatherByCity(city);
        setState(() {
          _weatherData = weatherData;
        });
      } catch (e) {
        setState(() {
          _weatherData = {'error': 'Erro ao buscar dados de previsão do tempo.'};
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Previsão do Tempo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _cityController,
              decoration: InputDecoration(
                labelText: 'Cidade',
                hintText: 'Digite o nome da cidade e pressione Enter',
              ),
              onSubmitted: (_) => _fetchWeather(),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _fetchWeather,
              child: Text('Buscar Previsão'),
            ),
            SizedBox(height: 16),
            _weatherData.containsKey('error')
                ? Text(_weatherData['error'])
                : _weatherData.isEmpty
                    ? Container()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Cidade: ${_weatherData['name']}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Tempo: ${_weatherData['weather'][0]['main']}',
                          ),
                          Text(
                            'Descrição: ${_weatherData['weather'][0]['description']}',
                          ),
                          Text(
                            'Temperatura: ${(_weatherData['main']['temp'] - 273.15).toStringAsFixed(1)}°C',
                          ),
                        ],
                      ),
          ],
        ),
      ),
    );
  }
}
