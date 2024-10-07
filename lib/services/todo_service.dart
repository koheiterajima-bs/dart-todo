import '../models/todo.dart';

class TodoService {
    List<Todo> _todos = [];

    // Todoを追加する
    void addTodo(String title) {
        _todos.add(Todo(title));
    }

    // Todoを削除する
    void removeTodoAt(int index) {
        if (index >= 0 && index < _todos.length) {
            _todos.removeAt(index);
        }
    }

    // 全てのTodoを取得する
    List<Todo> getTodos() {
        return _todos;
    }

    // 特定のTodoの完了状態をトグルする
    void toggleComplete(int index) {
        if (index >= 0 && index < _todos.length) {
            _todos[index].toggleComplete();
        }
    }
}