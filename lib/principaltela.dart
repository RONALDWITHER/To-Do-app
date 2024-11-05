import 'package:flutter/material.dart';

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final List<String> _todoItems = [];

  // Controlador para o input de texto
  final TextEditingController _textController = TextEditingController();

  void _showAddTaskDialog() {
    String newTask = "";

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Adicionar Tarefa"),
        content: TextField(
          autofocus: true,
          decoration: InputDecoration(hintText: "Digite a nova tarefa"),
          onChanged: (value) {
            newTask = value;
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Fecha o diálogo
            },
            child: Text("Cancelar"),
          ),
          TextButton(
            onPressed: () {
              if (newTask.isNotEmpty) {
                setState(() {
                  _todoItems.add(newTask); // Adiciona a nova tarefa à lista
                });
              }
              Navigator.of(context).pop(); // Fecha o diálogo
            },
            child: Text("Adicionar"),
          ),
        ],
      ),
    );
  }

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
        floatingActionButton: FloatingActionButton(
          onPressed: _showAddTaskDialog,
          tooltip: 'Escreva a tarefa',
          backgroundColor: Color.fromARGB(240, 3, 3, 248),
          child: const Icon(
            Icons.add,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ));
  }
}
