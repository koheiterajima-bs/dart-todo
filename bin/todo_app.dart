import 'dart:io';
import '../lib/services/todo_service.dart';

void main() {
    final todoService = TodoService();
    bool running = true;

    print('TODOアプリへようこそ！');

    while (running) {
        print('\n1: Todoを追加');
        print('2: Todoリストを表示');
        print('3: Todoを完了/未完了に切り替える');
        print('4: Todoを削除');
        print('5: アプリを終了');
        stdout.write('選択してください');
        var input = stdin.readLineSync();

        switch (input) {
            case '1':
                stdout.write('Todoのタイトルを入力してください: ');
                var title = stdin.readLineSync();
                if (title != null && title.isNotEmpty) {
                    todoService.addTodo(title);
                    print('Todoが追加されました');
                } else {
                    print('無効なタイトルです');
                }
                break;
            case '2':
                var todos = todoService.getTodos();
                if (todos.isEmpty) {
                    print('Todoリストは空です');
                } else {
                    for (int i = 0; i < todos.length; i++) {
                        print('${i + 1}: ${todos[i].title} [${todos[i].isCompleted ? "完了" : "未完了"}]');
                    }
                }
                break;
            case '3':
                stdout.write('完了/未完了を切り替えるTodo番号を入力してください: ');
                var index = int.tryParse(stdin.readLineSync() ?? '');
                if (index != null) {
                    todoService.toggleComplete(index - 1);
                    print('Todoの完了状態が切り替えられました');
                } else {
                    print('無効な番号です');
                }
                break;
            case '4':
                stdout.write('削除するTodo番号を入力してください: ');
                var index = int.tryParse(stdin.readLineSync() ?? '');
                if (index != null) {
                    todoService.removeTodoAt(index - 1);
                    print('Todoが削除されました');
                } else {
                    print('無効な番号です');
                }
                break;
            case '5':
                print('アプリを終了します...');
                running = false;
                break;
            default:
                print('無効な選択です');
                break;
        }
    }
}