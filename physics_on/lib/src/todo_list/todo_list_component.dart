library global;
import 'dart:async';
import 'dart:html';
import'dart:convert';
import 'dart:html_common';
import 'dart:svg';
import 'dart:web_gl';
import 'dart:math';


import 'package:angular_components/utils/color/color.dart';
import 'package:angular_components/utils/color/material.dart';
import 'package:angular/angular.dart';
import 'package:angular_components/material_expansionpanel/material_expansionpanel.dart';
import 'package:angular_components/material_expansionpanel/material_expansionpanel_auto_dismiss.dart';
import 'package:angular_components/material_expansionpanel/material_expansionpanel_set.dart';
import 'package:angular_components/material_chips/material_chip.dart';
import 'package:angular_components/material_chips/material_chips.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_components/app_layout/material_persistent_drawer.dart';
import 'package:angular_components/content/deferred_content.dart';
import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_components/material_icon/material_icon.dart';
import 'package:angular_components/material_list/material_list.dart';
import 'package:angular_components/material_list/material_list_item.dart';
import 'package:angular_components/material_toggle/material_toggle.dart';


import 'todo_list_service.dart';


@Component(
  selector: 'todo-list',
  styleUrls: ['package:angular_components/app_layout/layout.scss.css','todo_list_component.css'],
  templateUrl: 'todo_list_component.html',
  directives: [
    MaterialCheckboxComponent,
    MaterialFabComponent,
    MaterialIconComponent,
    materialInputDirectives,
    NgFor,
    NgIf,
    NgModel,
    DeferredContentDirective,
    MaterialButtonComponent,
    MaterialPersistentDrawerDirective,
    MaterialToggleComponent,
    MaterialListComponent,
    MaterialListItemComponent,
    CanvasRenderingContext2D,
    MaterialChipComponent,
    MaterialChipsComponent,
    displayNameRendererDirective,
    materialNumberInputDirectives,
    MaterialPercentInputDirective,
  ],
  providers: [ClassProvider(TodoListService)],
)

class TodoListComponent implements OnInit {
  final TodoListService todoListService;
  String myvar="huoguo";
  List<String> items = [];
  String newTodo = '';
  final chips = <Chip>[];
  num value = 0;
  num decimalValue1=0;
  num decimalValue2 =0;
  num R=0;
  num r=20;
  bool valueequal=false;
  bool aisin=false;
  TodoListComponent(this.todoListService);

  @override
  Future<Null> ngOnInit() async {
    items = await todoListService.getTodoList();
  }
  void add() {
    items.add(newTodo);
    newTodo = '';
  }
  void changeNewTodoValue(){
    newTodo="新的newToDo";
  }
  void removechip(){
    var chip=document.getElementById('injecttips');
    chip.style.opacity=0.toString();
    }
  String remove(int index) => items.removeAt(index);
  void increaseValue() {
    value += 1;
    if(valueequal==true){
      decimalValue1=value;
    }
    if(aisin==true){
      decimalValue2 =value/r;
    }
  }
  void feedback(){
    var trueanswer=document.getElementById('trueanswer');
    var falseanswer=document.getElementById('falseanswer');
    if(R!=20||aisin==false||valueequal==false){
      falseanswer.style.opacity=100.toString();
      trueanswer.style.opacity=0.toString();
    }
    else{
      trueanswer.style.opacity=100.toString();
      falseanswer.style.opacity=0.toString();
    }
  }
      void move(String id){
        Element drag = querySelector(id); 
        
        drag.onDragStart.listen((event){
        //final startPos =(event.target as Element).getBoundingClientRect(); 
        final data=jsonEncode({
        'id':drag.id,
        'x':event.client.x  -  drag.offsetLeft,
        'y':event.client.y  -  drag.offsetTop
         }); 
         event.dataTransfer.setData('text',data); 

        }); 
 
        Element dropTarget = querySelector('#content_body'); 
        dropTarget.onDragOver.listen((event){
        event.preventDefault(); 
        dropTarget.classes.add('droptarget'); 
        }); 
 
        dropTarget.onDragLeave.listen((event){
        event.preventDefault(); 
        dropTarget.classes.remove('droptarget'); 
        }); 
 
        dropTarget.onDrop.listen((event){
        event.preventDefault(); 
        final data = jsonDecode(event.dataTransfer.getData('text')) ; 
        final dragelement = document.getElementById(data ['id']);
        dropTarget.append(dragelement);
        dragelement.style.position = 'absolute';
        dragelement.style.left =(event.client.x  -  data ['x']).toString()+'px';
        dragelement.style.top =(event.client.y  -  data ['y']).toString()+'px'; 
        dropTarget.classes.remove('droptarget');
        }); 
      }
      void inject(){ 
        CanvasElement canvas=document.getElementById('mycanvas');
        canvas.width=window.innerWidth;
        canvas.height=window.innerHeight;
        CanvasRenderingContext2D context=canvas.getContext('2d');
        var injecttips=document.getElementById('injecttips');
        injecttips.style.opacity=100.toString();
        var dianchizuconnect=false;
        var dingzhidianzuconnect=false;
        var kaiguanconnect=false;
        var vconnect=false;
        var aconnect=false;
        aisin=false;
        //var startpoint=document.getElementById(id);
        var dianchizu=document.getElementById('dianchizu');
        var dingzhidianzu=document.getElementById('dingzhidianzu');
        var kaiguan=document.getElementById('kaiguan');
        var v=document.getElementById('V');
        var a=document.getElementById('A');
        //var contentbody=document.getElementById('content_body');
        
        MouseEvent e; 
         
        //var startpoint1=document.getElementById('E1');
        
        //var endpoint1=document.getElementById('E2');
        dianchizu.onClick.listen((e){
         var startpoint=document.getElementById('dianchizu');
         dingzhidianzu.onDoubleClick.listen((e){ 
          if(dianchizuconnect==false){
            
          context.strokeStyle = 'red';
          context.lineWidth = 5;
           context.shadowOffsetX=4;
          context.shadowOffsetY=4;
          context.shadowBlur=3;
          context.shadowColor='rgba(0,0,0,0.2)';
          var x=startpoint.offsetLeft+125;
          var y=startpoint.offsetTop-20;
          context.beginPath();
          // 起点
          context.moveTo(x,y);
          // 终点
          var end_x1=dingzhidianzu.offsetLeft+125;
          var end_y1=dingzhidianzu.offsetTop-20;
          context.quadraticCurveTo(end_x1,(end_y1+y)/2,end_x1,end_y1);
          //context.lineTo(end_x1, end_y1);
          //context.closePath();
          context.stroke();
          ;
          dianchizuconnect=true;}
        });
        
        a.onDoubleClick.listen((e){ 
          if(dianchizuconnect==false){
           
          context.strokeStyle = 'red';
          context.lineWidth = 5;
           context.shadowOffsetX=4;
          context.shadowOffsetY=4;
          context.shadowBlur=3;
          context.shadowColor='rgba(0,0,0,0.2)';
          var x=startpoint.offsetLeft+125;
          var y=startpoint.offsetTop-20;
          context.beginPath();
          // 起点
          context.moveTo(x,y);
          // 终点
          var end_x1=a.offsetLeft+125;
          var end_y1=a.offsetTop-20;
          context.quadraticCurveTo(end_x1,(end_y1+y)/2,end_x1,end_y1);
          //context.lineTo(end_x1, end_y1);
         //context.closePath();
          context.stroke();
          aisin=true;
          dianchizuconnect=true;}
          });
          
          kaiguan.onDoubleClick.listen((e){ 
          if(dianchizuconnect==false){
          
          context.strokeStyle = 'red';
          context.lineWidth = 5;
           context.shadowOffsetX=4;
          context.shadowOffsetY=4;
          context.shadowBlur=3;
          context.shadowColor='rgba(0,0,0,0.2)';
          var x=startpoint.offsetLeft+125;
          var y=startpoint.offsetTop-20;
          context.beginPath();
          // 起点
          context.moveTo(x,y);
          // 终点
          var end_x1=kaiguan.offsetLeft+125;
          var end_y1=kaiguan.offsetTop-20;
          context.quadraticCurveTo(end_x1,(end_y1+y)/2,end_x1,end_y1);
          //context.lineTo(end_x1, end_y1);
          //context.closePath();
          context.stroke();
          
          dianchizuconnect=true;}
          });
        });
        v.onClick.listen((e){
          var startpoint=document.getElementById('V');
          dianchizu.onDoubleClick.listen((e){ 
          if(vconnect==false){
           
          context.strokeStyle = 'red';
          context.lineWidth = 5;
           context.shadowOffsetX=4;
          context.shadowOffsetY=4;
          context.shadowBlur=3;
          context.shadowColor='rgba(0,0,0,0.2)';
          var x=startpoint.offsetLeft+10;
          var y=startpoint.offsetTop-20;
          context.beginPath();
          // 起点
          context.moveTo(x,y);
          // 终点
          var end_x1=dianchizu.offsetLeft+10;
          var end_y1=dianchizu.offsetTop-20;
          context.quadraticCurveTo(end_x1,(end_y1+y)/2,end_x1,end_y1);
          //context.lineTo(end_x1, end_y1);
          //context.closePath();
          context.stroke();
          context.beginPath();
          context.moveTo(x+125,y);
          //context.lineTo(end_x1+125, end_y1);
          context.quadraticCurveTo(end_x1,(end_y1+y)/2,end_x1+125,end_y1);
          //context.closePath();
          context.stroke();
          valueequal=true;
          vconnect=true;
          }
          //context.fillStyle='blue';
          //context.beginPath();
          //context.arc(x,y,5,0,2*pi);
          //context.arc(end_x1,end_y1,5,0,2*pi);
          //context.fill();
        });
        
        
         dingzhidianzu.onDoubleClick.listen((e){ 
          if(vconnect==false){
           
          context.strokeStyle = 'red';
          context.lineWidth = 5;
           context.shadowOffsetX=4;
          context.shadowOffsetY=4;
          context.shadowBlur=3;
          context.shadowColor='rgba(0,0,0,0.2)';
          var x=startpoint.offsetLeft+10;
          var y=startpoint.offsetTop-20;
          context.beginPath();
          // 起点
          context.moveTo(x,y);
          // 终点
          var end_x1=dingzhidianzu.offsetLeft+10;
          var end_y1=dingzhidianzu.offsetTop-20;
          context.quadraticCurveTo(end_x1,(end_y1+y)/2,end_x1,end_y1);
          //context.lineTo(end_x1, end_y1);
          //context.closePath();
          context.stroke();
          context.beginPath();
          context.moveTo(x+105,y);
          context.quadraticCurveTo(end_x1,(end_y1+y)/2,end_x1+125,end_y1);
          //context.lineTo(end_x1+125, end_y1);
          //context.closePath();
          context.stroke();
          valueequal=true;
          vconnect=true;}
        });
        
        a.onDoubleClick.listen((e){ 
          if(vconnect==false){
          
          context.strokeStyle = 'red';
          context.lineWidth = 5;
           context.shadowOffsetX=4;
          context.shadowOffsetY=4;
          context.shadowBlur=3;
          context.shadowColor='rgba(0,0,0,0.2)';
          var x=startpoint.offsetLeft+10;
          var y=startpoint.offsetTop-20;
          context.beginPath();
          // 起点
          context.moveTo(x,y);
          // 终点
          var end_x1=a.offsetLeft+10;
          var end_y1=a.offsetTop-20;
          context.quadraticCurveTo(end_x1,(end_y1+y)/2,end_x1,end_y1);
          //context.lineTo(end_x1, end_y1);
          //context.closePath();
          context.stroke();
          context.beginPath();
          context.moveTo(x+105,y);
          context.quadraticCurveTo(end_x1,(end_y1+y)/2,end_x1+125,end_y1);
          //context.lineTo(end_x1+125, end_y1);
          //context.closePath();
          context.stroke();
          value=0;
          valueequal=false;
          aisin=true;
          vconnect=true;}
          });
          
          kaiguan.onDoubleClick.listen((e){ 
            if(vconnect==false){
             
          context.strokeStyle = 'red';
          context.lineWidth = 5;
           context.shadowOffsetX=4;
          context.shadowOffsetY=4;
          context.shadowBlur=3;
          context.shadowColor='rgba(0,0,0,0.2)';
          var x=startpoint.offsetLeft+10;
          var y=startpoint.offsetTop-20;
          context.beginPath();
          // 起点
          context.moveTo(x,y);
          // 终点
          var end_x1=kaiguan.offsetLeft+10;
          var end_y1=kaiguan.offsetTop-20;
          context.quadraticCurveTo(end_x1,(end_y1+y)/2,end_x1,end_y1);
          //context.lineTo(end_x1, end_y1);
          //context.closePath();
          context.stroke();
          context.beginPath();
          context.moveTo(x+105,y);
          context.quadraticCurveTo(end_x1,(end_y1+y)/2,end_x1+125,end_y1);
          //context.lineTo(end_x1+125, end_y1);
          //context.closePath();
          context.stroke();
          decimalValue1=0;
          valueequal=false;
          vconnect=true;}
          });
        });
        dingzhidianzu.onClick.listen((e){
          var startpoint=document.getElementById('dingzhidianzu');
        dianchizu.onDoubleClick.listen((e){  
          if(dingzhidianzuconnect==false){
           
          context.strokeStyle = 'red';
          context.lineWidth = 5;
           context.shadowOffsetX=4;
          context.shadowOffsetY=4;
          context.shadowBlur=3;
          context.shadowColor='rgba(0,0,0,0.2)';
          var x=startpoint.offsetLeft;
          var y=startpoint.offsetTop-20;
          context.beginPath();
          // 起点
          context.moveTo(x,y);
          // 终点
          var end_x1=dianchizu.offsetLeft;
          var end_y1=dianchizu.offsetTop-20;
          context.quadraticCurveTo(end_x1,(end_y1+y)/2,end_x1,end_y1);
          //context.lineTo(end_x1, end_y1);
          //context.closePath();
          context.stroke();
          
          dingzhidianzuconnect=true;}
          
          //context.fillStyle='blue';
          //context.beginPath();
          //context.arc(x,y,5,0,2*pi);
          //context.arc(end_x1,end_y1,5,0,2*pi);
          //context.fill();
        });
        a.onDoubleClick.listen((e){ 
          if(dingzhidianzuconnect==false){
           
          context.strokeStyle = 'red';
          context.lineWidth = 5;
           context.shadowOffsetX=4;
          context.shadowOffsetY=4;
          context.shadowBlur=3;
          context.shadowColor='rgba(0,0,0,0.2)';
          var x=startpoint.offsetLeft;
          var y=startpoint.offsetTop-20;
          context.beginPath();
          // 起点
          context.moveTo(x,y);
          // 终点
          var end_x1=a.offsetLeft+125;
          var end_y1=a.offsetTop-20;
          context.quadraticCurveTo(end_x1,(end_y1+y)/2,end_x1,end_y1);
          //context.lineTo(end_x1, end_y1);
          //context.closePath();
          context.stroke();
          aisin=true;
          dingzhidianzuconnect=true;}
          });
          
          kaiguan.onDoubleClick.listen((e){ 
          if(dingzhidianzuconnect==false){
            
          context.strokeStyle = 'red';
          context.lineWidth = 5;
           context.shadowOffsetX=4;
          context.shadowOffsetY=4;
          context.shadowBlur=3;
          context.shadowColor='rgba(0,0,0,0.2)';
          var x=startpoint.offsetLeft;
          var y=startpoint.offsetTop-20;
          context.beginPath();
          // 起点
          context.moveTo(x,y);
          // 终点
          var end_x1=kaiguan.offsetLeft+125;
          var end_y1=kaiguan.offsetTop-20;
          context.quadraticCurveTo(end_x1,(end_y1+y)/2,end_x1,end_y1);
          //context.lineTo(end_x1, end_y1);
          //context.closePath();
          context.stroke();
          
          dingzhidianzuconnect=true;}
          });
        });
        a.onClick.listen((e){
          var startpoint=document.getElementById('A');
        dianchizu.onDoubleClick.listen((e){  
          if(aconnect==false){
           
          context.strokeStyle = 'red';
          context.lineWidth = 5;
           context.shadowOffsetX=4;
          context.shadowOffsetY=4;
          context.shadowBlur=3;
          context.shadowColor='rgba(0,0,0,0.2)';
          var x=startpoint.offsetLeft;
          var y=startpoint.offsetTop-20;
          context.beginPath();
          // 起点
          context.moveTo(x,y);
          // 终点
          var end_x1=dianchizu.offsetLeft;
          var end_y1=dianchizu.offsetTop-20;
          context.quadraticCurveTo(end_x1,(end_y1+y)/2,end_x1,end_y1);
          //context.lineTo(end_x1, end_y1);
          //context.closePath();
          context.stroke();
          
          aconnect=true;}
          
          //context.fillStyle='blue';
          //context.beginPath();
          //context.arc(x,y,5,0,2*pi);
          //context.arc(end_x1,end_y1,5,0,2*pi);
          //context.fill();
        });
        
         
        
         dingzhidianzu.onDoubleClick.listen((e){ 
          if(aconnect==false){
            
          context.strokeStyle = 'red';
          context.lineWidth = 5;
           context.shadowOffsetX=4;
          context.shadowOffsetY=4;
          context.shadowBlur=3;
          context.shadowColor='rgba(0,0,0,0.2)';
          var x=startpoint.offsetLeft;
          var y=startpoint.offsetTop-20;
          context.beginPath();
          // 起点
          context.moveTo(x,y);
          // 终点
          var end_x1=dingzhidianzu.offsetLeft+125;
          var end_y1=dingzhidianzu.offsetTop-20;
          context.quadraticCurveTo(end_x1,(end_y1+y)/2,end_x1,end_y1);
          //context.lineTo(end_x1, end_y1);
          //context.closePath();
          context.stroke();
          
          aconnect=true;}
        });
        
          
          kaiguan.onDoubleClick.listen((e){ 
          if(aconnect==false){
            
          context.strokeStyle = 'red';
          context.lineWidth = 5;
           context.shadowOffsetX=4;
          context.shadowOffsetY=4;
          context.shadowBlur=3;
          context.shadowColor='rgba(0,0,0,0.2)';
          var x=startpoint.offsetLeft;
          var y=startpoint.offsetTop-20;
          context.beginPath();
          // 起点
          context.moveTo(x,y);
          // 终点
          var end_x1=kaiguan.offsetLeft+125;
          var end_y1=kaiguan.offsetTop-20;
          context.quadraticCurveTo(end_x1,(end_y1+y)/2,end_x1,end_y1);
          //context.lineTo(end_x1, end_y1);
          //context.closePath();
          context.stroke();
          
          aconnect=true;}
          });
        });
        kaiguan.onClick.listen((e){
          var startpoint=document.getElementById('kaiguan');
        dianchizu.onDoubleClick.listen((e){  
          if(kaiguanconnect==false){
           
          context.strokeStyle = 'red';
          context.lineWidth = 5;
           context.shadowOffsetX=4;
          context.shadowOffsetY=4;
          context.shadowBlur=3;
          context.shadowColor='rgba(0,0,0,0.2)';
          var x=startpoint.offsetLeft;
          var y=startpoint.offsetTop-20;
          context.beginPath();
          // 起点
          context.moveTo(x,y);
          // 终点
          var end_x1=dianchizu.offsetLeft;
          var end_y1=dianchizu.offsetTop-20;
          context.quadraticCurveTo(end_x1,(end_y1+y)/2,end_x1,end_y1);
          //context.lineTo(end_x1, end_y1);
          //context.closePath();
          context.stroke();
          
          kaiguanconnect=true;}
          
          //context.fillStyle='blue';
          //context.beginPath();
          //context.arc(x,y,5,0,2*pi);
          //context.arc(end_x1,end_y1,5,0,2*pi);
          //context.fill();
        });
        
         
        
         dingzhidianzu.onDoubleClick.listen((e){ 
          if(kaiguanconnect==false){
            
          context.strokeStyle = 'red';
          context.lineWidth = 5;
           context.shadowOffsetX=4;
          context.shadowOffsetY=4;
          context.shadowBlur=3;
          context.shadowColor='rgba(0,0,0,0.2)';
          var x=startpoint.offsetLeft;
          var y=startpoint.offsetTop-20;
          context.beginPath();
          // 起点
          context.moveTo(x,y);
          // 终点
          var end_x1=dingzhidianzu.offsetLeft+125;
          var end_y1=dingzhidianzu.offsetTop-20;
         context.quadraticCurveTo(end_x1,(end_y1+y)/2,end_x1,end_y1);
          //context.lineTo(end_x1, end_y1);
          //context.closePath();
          context.stroke();
          
          kaiguanconnect=true;}
        });
        
        a.onDoubleClick.listen((e){ 
          if(kaiguanconnect==false){
           
          context.strokeStyle = 'red';
          context.lineWidth = 5;
          context.shadowOffsetX=4;
          context.shadowOffsetY=4;
          context.shadowBlur=3;
          context.shadowColor='rgba(0,0,0,0.2)';
          var x=startpoint.offsetLeft;
          var y=startpoint.offsetTop-20;
          context.beginPath();
          // 起点
          context.moveTo(x,y);
          // 终点
          var end_x1=a.offsetLeft+125;
          var end_y1=a.offsetTop-20;
          context.quadraticCurveTo(end_x1,(end_y1+y)/2,end_x1,end_y1);
          //context.lineTo(end_x1, end_y1);
          //context.closePath();
          context.stroke();
          aisin=true;
          kaiguanconnect=true;}
          });
        });
}
void producereport(){
  var report=document.getElementById('baogao');
  report.style.opacity=100.toString();
  if(valueequal==true){
    decimalValue1=value;
  }
  if(aisin==true){
    decimalValue2=value/r;
  }
}
void closereport(){
  var report=document.getElementById('baogao');
  var trueanswer=document.getElementById('trueanswer');
  var falseanswer=document.getElementById('falseanswer');
  value=5;
  decimalValue1=0;
  decimalValue2=0;
  report.style.opacity=0.toString();
  trueanswer.style.opacity=0.toString();
  falseanswer.style.opacity=0.toString();
}
}
class Chip implements HasUIDisplayName {
  @override
  final String uiDisplayName;
  const Chip(this.uiDisplayName);
}
