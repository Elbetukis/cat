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
                // Añadir contorno negro
                shadows: [
                  Shadow(
                    color: Colors.black,
                    offset: Offset(1, 1),
                    blurRadius: 2,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          ServiceCard(
            icon: Icons.power_settings_new,
            state: 'No definida',
            availability: 'Disponible: 900g',
            nextRound: 'Próxima ronda: Lun 🕒',
            thumbsUp: true,
            iconSize: 60,
          ),
          SizedBox(height: 20),
          ServiceCard(
            icon: Icons.power_settings_new,
            state: 'Lun 8:40pm',
            availability: 'Disponible: 480g',
            nextRound: 'Próxima ronda: Lun 8:40🕒',
            thumbsUp: true,
            iconSize: 60,
          ),
          SizedBox(height: 20),
          ServiceCard(
            icon: Icons.power_settings_new,
            state: 'No disponible',
            availability: 'Disponible: 0g',
            nextRound: 'Próxima ronda: No definida',
            thumbsUp: false,
            iconSize: 60,
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
  final double iconSize;

  const ServiceCard({
    required this.icon,
    required this.state,
    required this.availability,
    required this.nextRound,
    required this.thumbsUp,
    this.iconSize = 40,
  });

  @override
  Widget build(BuildContext context) {
    // Divide el texto de "Próxima ronda" en encabezado y horario
    List<String> nextRoundParts = nextRound.split(': ');
    String nextRoundHeader = nextRoundParts[0];
    String nextRoundTime = nextRoundParts.length > 1 ? nextRoundParts[1] : '';

    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Modificación de la fila de disponibilidad para incluir el ícono y el texto del gato
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Icon(icon, color: Colors.blue, size: iconSize),
                    Text(
                      state == 'No definida' ? 'Apagado' : 'Encendido',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: Icon(Icons.settings),
                      onPressed: () {
                        print('Configurando servicio...');
                      },
                    ),
                    Row(
                      children: [
                        Text(
                          'Disponible: ',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          availability.split(': ')[1],
                          style: TextStyle(
                            fontSize: 22,
                            color: Color.fromARGB(255, 63, 209, 148),
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                color: Colors.black,
                                offset: Offset(1, 1),
                                blurRadius: 2,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),
            // Separación de "Próxima ronda:" y horario
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nextRoundHeader + ':',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      nextRoundTime,
                      style: TextStyle(
                        fontSize: 22,
                        color: Color.fromARGB(255, 63, 209, 148),
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            color: Colors.black,
                            offset: Offset(1, 1),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '🐱 Gato',
                      style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 20,
                        shadows: [
                          Shadow(
                            color: Colors.black,
                            offset: Offset(1, 1),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
