import 'package:flutter/material.dart';

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final List<String> _todoItems = [];
  final List<String> _todoHora =  [];

  // Controlador para o input de texto

  void _showAddTaskDialog() {
    String newTask = "";
    String newHour = "";

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Adicionar Tarefa"),
        content: Column(
          children:[
            TextField(
              autofocus: true,
              decoration: const InputDecoration(hintText: "Digite a nova tarefa"),
              onChanged: (value) {
                newTask = value;
              },
            ),
            const SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.datetime,  
              decoration: const InputDecoration(hintText: "Informe o horário da Tarefa"),
              onChanged: (values) {
                newHour = values;
              },
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
              if (newTask.isNotEmpty) {
                setState(() {
                  _todoItems.add(newTask);
                  _todoHora.add(newHour); // Adiciona a nova tarefa à lista
                });
              }
              Navigator.of(context).pop(); // Fecha o diálogo
            },
            child: const Text("Adicionar"),
          ),
        ],
      ),
    );
  }

  void _addTodoItem(String task,String hour) {
    if (task.isNotEmpty) {
      setState(() {
        _todoItems.add(task);
        _todoItems.add(hour);
      }); // Limpa o campo de texto após adicionar
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
          backgroundColor: const Color.fromARGB(248, 23, 0, 233),
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
                          color: Colors.blueAccent), 
                      borderRadius: BorderRadius.circular(8.0), // Define as bordas arredondadas
                    ),
                    child: ListTile(
                      title: Column(
                        children: [
                      Text(_todoItems[index]),
                      Text(_todoHora[index]),
                      ]
                      )
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
          backgroundColor: const Color.fromARGB(240, 3, 3, 248),
          child: const Icon(
            Icons.add,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ));
  }
}
