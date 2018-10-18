import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

import 'todo_lista_service.dart';

@Component(
  selector: 'todo-lista',
  styleUrls: ['todo_lista_component.css'],
  templateUrl: 'todo_lista_component.html',
  directives: [
    MaterialCheckboxComponent,
    MaterialFabComponent,
    MaterialIconComponent,
    materialInputDirectives,
    NgFor,
    NgIf,
  ],
  providers: [const ClassProvider(TodoListaService)],
)
class TodoListaComponent implements OnInit {
  final TodoListaService todoListaService;

  List<String> items = [];
  String newTodo = '';

  TodoListaComponent(this.todoListaService);

  @override
  Future<Null> ngOnInit() async {
    items = await todoListaService.getTodoList();
  }

  void add() {
    items.add(newTodo);
    newTodo = '';
  }

  String remove(int index) => items.removeAt(index);
}
