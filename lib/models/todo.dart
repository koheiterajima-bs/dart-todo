// クラスの定義
class Todo {
    String title;
    bool isCompleted;

    Todo(this.title, {this.isCompleted = false});

    void toggleComplete() {
        isCompleted = !isCompleted;
    }
}