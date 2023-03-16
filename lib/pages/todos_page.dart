import 'package:flutter/material.dart';

class TodosPage extends StatefulWidget {
  const TodosPage({super.key});

  @override
  State<TodosPage> createState() => _TodosPageState();
}

class _TodosPageState extends State<TodosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Title',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Expanded(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      const Text('NO'),
                      Column(
                        children: const [Text('Name'), Text('Descriptions')],
                      )
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
