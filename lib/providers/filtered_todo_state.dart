import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todos/providers/todo_filter_state.dart';
import 'package:flutter_todos/providers/todo_list_state.dart';
import 'package:flutter_todos/providers/todo_search_state.dart';

import '../models/todo_model.dart';

class FilteredTodosState extends Equatable {
  final List<TodoModel> filteredTodos;
  const FilteredTodosState({
    required this.filteredTodos,
  });

  factory FilteredTodosState.initial() {
    return const FilteredTodosState(filteredTodos: []);
  }

  @override
  List<Object> get props => [filteredTodos];

  @override
  String toString() => 'FilteredTodoState(filteredTodos: $filteredTodos)';

  FilteredTodosState copyWith({
    List<TodoModel>? filteredTodos,
  }) {
    return FilteredTodosState(
      filteredTodos: filteredTodos ?? this.filteredTodos,
    );
  }
}

class FilteredTodos with ChangeNotifier {
  FilteredTodosState _state = FilteredTodosState.initial();
  FilteredTodosState get state => _state;

  void update(TodoFilter todoFilter, TodoSearch todoSearch, TodoList todoList) {
    List<TodoModel> filteredTodos;

    switch (todoFilter.state.filter) {
      case Filter.active:
        filteredTodos = todoList.state.todos.where((TodoModel todoModel) => !todoModel.completed).toList();
        break;
      case Filter.completed:
        filteredTodos = todoList.state.todos
            .where(
              (TodoModel todoModel) => todoModel.completed,
            )
            .toList();
        break;
      case Filter.all:
        filteredTodos = todoList.state.todos;
        break;
    }

    if (todoSearch.state.searchTerm.isNotEmpty) {
      filteredTodos = filteredTodos
          .where(
            (TodoModel todoModel) => todoModel.desc.toLowerCase().contains(todoSearch.state.searchTerm),
          )
          .toList();
    }

    _state = _state.copyWith(filteredTodos: filteredTodos);
    notifyListeners();
  }
}
