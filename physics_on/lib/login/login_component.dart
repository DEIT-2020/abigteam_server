import 'package:angular/angular.dart';
import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_components/angular_components.dart';
import 'dart:math';
import 'dart:html';
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
              ],
)
class LoginComponent {
  // Nothing here yet. All logic is in TodoListComponent.
}

