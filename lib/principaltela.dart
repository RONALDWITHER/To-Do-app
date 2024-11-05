import 'package:flutter/material.dart';

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final List<String> _todoItems = [];

  // Controlador para o input de texto
  final TextEditingController _textController = TextEditingController();

  void _addTodoItem(String task) {
    if (task.isNotEmpty) {
      setState(() {
        _todoItems.add(task);
      });
      _textController.clear(); // Limpa o campo de texto após adicionar
    }
  }

  void _removeTodoItem(int index) {
    setState(() {
      _todoItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(248, 23, 0, 233),
        title: Image.asset(
          'assets/logo.png',
          width: 60,
          height: 60,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: const InputDecoration(
                      labelText: 'Escreva a tarefa.',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () => _addTodoItem(_textController.text),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _todoItems.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 4.0, horizontal: 8.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.blueAccent), // Define a cor da borda
                    borderRadius: BorderRadius.circular(
                        8.0), // Define as bordas arredondadas
                  ),
                  child: ListTile(
                    title: Text(_todoItems[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => _removeTodoItem(index),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
