import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cat/main.dart'; // Reemplaza 'cat' con el nombre de tu proyecto

void main() {
  testWidgets('Interfaz de usuario básica', (WidgetTester tester) async {
    // Construye nuestra aplicación y activa un frame.
    await tester.pumpWidget(MyApp());

    // Verifica que los elementos de texto estén presentes.
    expect(find.text('Habitación'), findsOneWidget);
    expect(find.text('Alimento'), findsOneWidget);
    expect(find.text('Gato'), findsOneWidget);
    expect(find.text('Confirmar'), findsOneWidget);

    // Verifica que no haya detalles adicionales presentes.
    expect(find.text('Por favor, ingrese información sobre su habitación.'),
        findsOneWidget);
    expect(
        find.text('Por favor, ingrese información sobre la comida de su gato.'),
        findsOneWidget);
    expect(find.text('Por favor, ingrese información sobre su gato.'),
        findsOneWidget);

    // Verifica que los elementos interactivos (como los botones) sean accesibles.
    expect(find.byType(ElevatedButton), findsOneWidget);
  });
}
