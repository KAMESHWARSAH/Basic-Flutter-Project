import 'package:flutter/material.dart';
import 'package:http/http.dart';
void main(){
  (MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class  Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    getApiData() async  {
      var url = Uri.parse('http://sc.nectarinfotel.com/rest/V1/getimagedata');
      Response response=await get(url);
      print(response);
    }
    return Scaffold(
    body: Center(
    child: Column(
      children: [
        Text('texsd'),
       TextButton(
         onPressed: (){
           getApiData();
         },
         child: Text(
             'Call APIfsfsdfsd'
         ),
       )
      ],
    ),
      ),
    );
  }
}
