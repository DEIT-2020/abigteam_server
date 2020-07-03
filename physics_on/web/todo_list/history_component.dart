import 'package:angular/angular.dart';
import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_components/angular_components.dart';
import 'dart:math';
import 'dart:html';
import'dart:convert' as convert;
import 'routes.dart';
import 'package:angular_router/angular_router.dart';
import 'route_paths.dart';
import 'package:http/http.dart' as http;
// AngularDart info: https://angulardart.dev
// Components info: https://angulardart.dev/components

@Component(
  selector: 'my-history',
  styleUrls: ['package:angular_components/app_layout/layout.scss.css','history_component.css'],
  templateUrl: 'history_component.html',
  directives: [
              HistoryComponent,
              materialInputDirectives,
              MaterialButtonComponent,
              routerDirectives,
              ],
  exports: [RoutePaths, Routes],
)
class HistoryComponent {
  // Nothing here yet. All logic is in TodoListComponent.
  String name='';
  int i;
  UListElement wordList;
  String showcontent='';
void report(){
    var historyList=querySelector('historylist');
    //var contentbody=querySelector('content_body');
    //wordList = querySelector('#historyList') as UListElement;
    var path = 'http://localhost:8888/report/$name';
    var httpRequest = HttpRequest();
    httpRequest
    ..open('GET',path)
    ..onLoadEnd.listen((e){
      if(httpRequest.status==200){
      final jsonResponse = convert.jsonDecode(httpRequest.response);
      if(name==jsonResponse[0]['username']){
        showcontent=jsonResponse.toString();
      }
      }
      })
    ..send('');
    }
}
