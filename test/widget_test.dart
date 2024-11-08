// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:todolist/logotela.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:todolist/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Criação da instância de flutterLocalNotificationsPlugin
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    // Inicialização das configurações de notificações (do jeito que você fez no main)
    AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon'); // Defina seu ícone aqui

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );

    // Inicialize o flutterLocalNotificationsPlugin
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);

    // Passe o flutterLocalNotificationsPlugin para o MyApp
    await tester.pumpWidget(MyApp(
        flutterLocalNotificationsPlugin: flutterLocalNotificationsPlugin));

    // Verifique se o widget foi carregado corretamente
    expect(find.byType(Logotela), findsOneWidget); // Exemplo de teste de widget
  });
}
