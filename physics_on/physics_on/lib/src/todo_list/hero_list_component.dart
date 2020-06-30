import 'package:angular/angular.dart';
import 'todo_list_component.dart';
import 'todo_list_service.dart';
import 'dart:math';
import 'dart:html';
// AngularDart info: https://angulardart.dev
// Components info: https://angulardart.dev/components

@Component(
  selector: 'my-heroes',
  styleUrls: ['hero_list_component.css'],
  templateUrl: 'hero_list_component.html',
  directives: [TodoListComponent],
)
class HeroListComponent {
  // Nothing here yet. All logic is in TodoListComponent.
  final TodoListService todoListService;

  HeroListComponent(this.todoListService);
}

