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
  String name=''; 
  var test='';
  /*Future isuser() async{
    //var denglu=document.getElementById('denglu');
    var url='http://localhost:8888/user/$name';
    final response = await http.get(url);
    //print('Response status: ${response.statusCode}');
    //print('Response body: ${response.body}');
    //print(await http.read('http://localhost:8888/user/$name'));
    if(response.statusCode==200){
      //var jsonResponse = convert.jsonDecode(response.body);
      //if(name==jsonResponse['username']){
        window.location.href='../#/heroes';
      }
     
    //}
     //else{
       // window.location.href='../#/dashboard';
      //}
      
}*/
void isuser() {
  var path = 'http://localhost:8888/user/$name';
  var httpRequest = HttpRequest();
  //var failure=document.getElementById('failure');
  httpRequest
    ..open('GET', path)
    ..onLoadEnd.listen((e){
    if (httpRequest.status == 200) {
    final jsonResponse =convert.jsonDecode(httpRequest.response);
    //test=jsonResponse.toString();
    if(name==jsonResponse[0]['username']){
     window.alert('登陆成功');
     window.location.href='../#/heroes';}
    }
    })
    ..send('');
  }
 
   
    //name=(httpRequest.status).toString();
  
  

/*void requestComplete(HttpRequest request) {
  if (request.status == 200) {
    window.location.href='../#/heroes';
  }
  else{
    window.location.href='../#/dashboard';
  }
}*/
/*void requestComplete(HttpRequest request) {
  if (request.status == 200) {
    final portmanteaux =convert.jsonDecode(request.response);
    if(portmanteaux=='"ok"'){
      window.location.href='../#/heroes';
    }
    else{
      window.location.href='../#/dashboard';
    }
    }
  }*/
}