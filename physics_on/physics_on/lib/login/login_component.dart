import 'package:angular/angular.dart';
import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_components/angular_components.dart';
import 'dart:math';
import 'dart:html';
import 'package:physics_on/src/todo_list/routes.dart';
import 'package:angular_router/angular_router.dart';
import 'package:physics_on/src/todo_list/route_paths.dart';
// AngularDart info: https://angulardart.dev
// Components info: https://angulardart.dev/components

@Component(
  selector: 'my-login',
  styleUrls: ['package:angular_components/app_layout/layout.scss.css','login_component.css'],
  templateUrl: 'login_component.html',
  directives: [
              LoginComponent,
              materialInputDirectives,
              MaterialButtonComponent,
              routerDirectives,
              ],
  exports: [RoutePaths, Routes],
)
class LoginComponent {
  // Nothing here yet. All logic is in TodoListComponent.
}

