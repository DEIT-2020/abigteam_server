# physicson

A web app that uses [AngularDart](https://angulardart.dev) and
[AngularDart Components](https://angulardart.dev/components).

Created from templates made available by Stagehand under a BSD-style
[license](https://github.com/dart-lang/stagehand/blob/master/LICENSE).
Element drag = querySelector('#daoxian'); 
 drag.onDragStart.listen((event){
 //final startPos =(event.target as Element).getBoundingClientRect(); 
 final data=jsonEncode({
'id':(event.target as Element).id,
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
 final drag = document.getElementById(data ['id']);
 (event.target as Element).append(drag);
  drag.style 
  ..position = 'absolute'
  ..left ='${event.client.x  -  data ['x']} px'
  ..top ='${event.client.y  -  data ['y ']} px'; 
  dropTarget.classes.remove('droptarget'); 
 }); 
 }