import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:flutter_todos/models/todo_model.dart';

class TodoListState extends Equatable {
  final List<TodoModel> todos;
  const TodoListState({
    required this.todos,
  });

  factory TodoListState.initial() {
    return TodoListState(todos: [
      TodoModel(id: '1', desc: 'Cleaning the room.', completed: false),
      TodoModel(id: '2', desc: 'Washing the dish.', completed: true),
      TodoModel(id: '3', desc: 'Doing homework.', completed: false),
    ]);
  }

  @override
  List<Object> get props => [todos];

  TodoListState copyWith({
    List<TodoModel>? todos,
  }) {
    return TodoListState(
      todos: todos ?? this.todos,
    );
  }
}

class TodoList with ChangeNotifier {
  TodoListState _state = TodoListState.initial();
  TodoListState get state => _state;

  void addTodo(String todoDesc) {
    final newTodo = TodoModel(desc: todoDesc);
    final newTodos = [...state.todos, newTodo];

    _state = _state.copyWith(todos: newTodos);
    debugPrint(_state.toString());
    notifyListeners();
  }

  void editTodo(String id, String todoDesc) {
    final newTodos = _state.todos.map((TodoModel todoModel) {
      if (todoModel.id == id) {
        return TodoModel(id: id, desc: todoDesc, completed: todoModel.completed);
      }
      return todoModel;
    }).toList();

    _state = _state.copyWith(todos: newTodos);
    notifyListeners();
  }

  void toggleTodo(String id) {
    final newTodos = _state.todos.map((TodoModel todoModel) {
      if (todoModel.id == id) {
        debugPrint('toggleTodo id 선택했어 : $id');
        return TodoModel(id: id, desc: todoModel.desc, completed: todoModel.completed);
      }
      return todoModel;
    }).toList();

    _state = _state.copyWith(todos: newTodos);
    debugPrint('toggleTodo id : $id');
    debugPrint(_state.todos.toString());
    notifyListeners();
  }

  void removeTodo(TodoModel todoModel) {
    final newTodos = _state.todos.where((element) => element.id != todoModel.id).toList();

    _state = _state.copyWith(todos: newTodos);
    notifyListeners();
  }
}
