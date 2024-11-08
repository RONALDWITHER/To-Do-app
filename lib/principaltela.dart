import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final List<String> _todoItems = [];
  final List<String> _todoHora = [];
  TimeOfDay? selectedTime;

  // Função para mostrar a notificação no horário específico
  Future<void> showNotification(String taskName, DateTime scheduledTime) async {
    // Configuração e exibição da notificação
  }

  void _showAddTaskDialog() {
    String newTask = "";
    selectedTime = null; // Reseta o horário selecionado

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Adicionar Tarefa"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              autofocus: true,
              decoration:
                  const InputDecoration(hintText: "Digite a nova tarefa"),
              onChanged: (value) {
                newTask = value;
              },
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(selectedTime == null
                    ? "Escolha o horário"
                    : selectedTime!.format(context)),
                IconButton(
                  icon: Icon(Icons.access_time),
                  onPressed: () async {
                    final TimeOfDay? picked = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (picked != null) {
                      setState(() {
                        selectedTime = picked;
                      });
                    }
                  },
                ),
              ],
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Fecha o diálogo
            },
            child: const Text("Cancelar"),
          ),
          TextButton(
            onPressed: () {
              if (newTask.isNotEmpty && selectedTime != null) {
                setState(() {
                  _todoItems.add(newTask);
                  _todoHora.add(selectedTime!
                      .format(context)); // Adiciona a hora formatada
                });

                // Converte TimeOfDay para DateTime para agendar a notificação
                final now = DateTime.now();
                final taskTime = DateTime(
                  now.year,
                  now.month,
                  now.day,
                  selectedTime!.hour,
                  selectedTime!.minute,
                );

                showNotification(newTask, taskTime);
              }
              Navigator.of(context).pop(); // Fecha o diálogo
            },
            child: const Text("Adicionar"),
          ),
        ],
      ),
    );
  }

  void _removeTodoItem(int index) {
    setState(() {
      _todoItems.removeAt(index);
      _todoHora.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(248, 23, 0, 233),
        title: Image.asset(
          'assets/logo.png',
          width: 60,
          height: 60,
        ),
      ),
      body: Column(children: [
        Expanded(
          child: ListView.builder(
            itemCount: _todoItems.length,
            itemBuilder: (context, index) {
              return Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(
                      8.0), // Define as bordas arredondadas
                ),
                child: ListTile(
                  title: Text(_todoItems[index]),
                  subtitle: Text("Horário: ${_todoHora[index]}"),
                  trailing: IconButton(
                      onPressed: () => _removeTodoItem(index),
                      icon: Icon(Icons.delete_outline_sharp)),
                ),
              );
            },
          ),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTaskDialog,
        tooltip: 'Adicionar Tarefa',
        child: const Icon(
          Icons.add,
          color: Color.fromARGB(248, 249, 249, 252),
        ),
        backgroundColor: Color.fromARGB(244, 1, 1, 255),
      ),
    );
  }
}
