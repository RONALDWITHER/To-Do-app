import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:todolist/logotela.dart';

// Declarando o flutterLocalNotificationsPlugin globalmente
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Configurando as notificações
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings(
          'app_icon'); // Substitua 'app_icon' pelo nome do ícone da sua aplicação

  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );

  // Inicializando o flutterLocalNotificationsPlugin
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  runApp(
      MyApp(flutterLocalNotificationsPlugin: flutterLocalNotificationsPlugin));
}

class MyApp extends StatelessWidget {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  // Passando flutterLocalNotificationsPlugin como parâmetro exigido no construtor
  const MyApp({super.key, required this.flutterLocalNotificationsPlugin});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Logotela(),
    );
  }
}
