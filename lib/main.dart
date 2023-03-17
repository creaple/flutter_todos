import 'package:flutter/material.dart';
import 'package:flutter_todos/providers/active_todo_count_state.dart';
import 'package:flutter_todos/providers/filtered_todo_state.dart';
import 'package:flutter_todos/providers/todo_filter_state.dart';
import 'package:flutter_todos/providers/todo_list_state.dart';
import 'package:flutter_todos/providers/todo_search_state.dart';
import 'package:provider/provider.dart';

import 'pages/todos_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TodoFilter>(
          create: (context) => TodoFilter(),
        ),
        ChangeNotifierProvider<TodoSearch>(
          create: (context) => TodoSearch(),
        ),
        ChangeNotifierProvider<TodoList>(
          create: (context) => TodoList(),
        ),
        ChangeNotifierProxyProvider<TodoList, ActiveTodoCount>(
          create: (context) => ActiveTodoCount(),
          update: (context, todoList, activeTodoCount) => activeTodoCount!..update(todoList),
        ),
        ChangeNotifierProxyProvider3<TodoFilter, TodoSearch, TodoList, FilteredTodos>(
          create: (context) => FilteredTodos(),
          update: (context, todoFilter, todoSearch, todoList, FilteredTodos? filteredTodos) => filteredTodos!..update(todoFilter, todoSearch, todoList),
        ),
      ],
      child: MaterialApp(
        title: 'TODOS',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const TodosPage(),
      ),
    );
  }
}
