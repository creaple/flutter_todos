import 'package:uuid/uuid.dart';

Uuid uuid = const Uuid();

class TodoModel {
  final String id;
  final String desc;
  final bool completed;
  TodoModel({
    String? id,
    required this.desc,
    required this.completed,
  }) : id = id ?? uuid.v4();
}
