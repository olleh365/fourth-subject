import 'package:flutter/material.dart';
import 'package:dio/dio.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});
  @override
  WeatherScreenState createState() => WeatherScreenState();
}

class WeatherScreenState extends State<WeatherScreen> {
  String weatherData = '';
  bool isLoading = false;
  final _dio = Dio();

  void fetchWeather() async {
    setState(() {
      isLoading = true;
    });
    try {
      var response = await _dio.get('https://api.openweathermap.org/data/2.5/weather?lat=37.5511543&lon=126.9727751&appid=fe8f9cb8d0946ab928eea3124790e656');

      weatherData = response.data.toString();
    } catch (e) {
      setState(() {
        weatherData = '예외 발생: $e';
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fourth Subject App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if(isLoading)
              const CircularProgressIndicator()
            else
              Text(weatherData),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: fetchWeather,
              child: const Text('날씨 호출'),
            ),
          ],
        ),
      ),
    );
  }
}