import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mi Hogar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: const Color.fromARGB(255, 255, 255, 255),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Text(
              'MI HOGAR',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 44, 193, 219),
              ),
            ),
          ),
          SizedBox(height: 20),
          ServiceCard(
            icon: Icons.power_settings_new,
            state: 'No definida',
            availability: 'Disponible: 900g',
            nextRound: 'Próxima ronda: Lun 🐱',
            thumbsUp: true,
          ),
          SizedBox(height: 20),
          ServiceCard(
            icon: Icons.power_settings_new,
            state: 'Lun 8:40pm',
            availability: 'Disponible: 480g',
            nextRound: 'Próxima ronda: 🕒',
            thumbsUp: true,
          ),
          SizedBox(height: 20),
          ServiceCard(
            icon: Icons.power_settings_new,
            state: 'No disponible',
            availability: 'Disponible: 0g',
            nextRound: 'Próxima ronda: No definida',
            thumbsUp: false,
          ),
        ],
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final IconData icon;
  final String state;
  final String availability;
  final String nextRound;
  final bool thumbsUp;

  const ServiceCard({
    required this.icon,
    required this.state,
    required this.availability,
    required this.nextRound,
    required this.thumbsUp,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(icon, color: Colors.blue),
                Text(state),
              ],
            ),
            SizedBox(height: 8),
            Text(availability),
            SizedBox(height: 8),
            Text(nextRound),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  thumbsUp ? Icons.thumb_up : Icons.thumb_down,
                  color: thumbsUp ? Colors.green : Colors.red,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
