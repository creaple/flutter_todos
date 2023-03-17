import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

Uuid uuid = const Uuid();

class TodoModel extends Equatable {
  final String id;
  final String desc;
  final bool completed;
  TodoModel({
    String? id,
    required this.desc,
    this.completed = false,
  }) : id = id ?? uuid.v4();

  @override
  List<Object> get props => [id, desc, completed];

  @override
  String toString() => 'TodoModel(id: $id, desc: $desc, completed: $completed)';
}

enum Filter { all, active, completed }
