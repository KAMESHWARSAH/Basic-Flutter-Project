import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
void main() {
  runApp(MaterialApp(
    home: MyAPI(),
  ));
}

class MyAPI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAPIState();
  }
}

class MyAPIState extends State<MyAPI> {
  String getData = "";
  List getList=[];


  Future fetchData() async {
    //http.Response response;
    // response = await http.get("http://91weblessons.com/demo/api/mobile/api1.php");
    var url = Uri.parse('http://sc.nectarinfotel.com/rest/V1/getimagedata');
    http.Response response = await http.get(url,headers: {
      'Authorization':
      'Bearer 8i3z1gvmhiz90g6e7r5khuy54ohh4z8n',
    },);
    if (response.statusCode == 200) {
      setState(() {
        //getData = response.body;
        getList=json.decode(response.body);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Hello My API UI"),

        ),
        body: ListView.builder(
          itemCount: getList==null?0: getList.length,
          itemBuilder: (BuildContext context, int index){
            return Container(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Card(
//child: Image.network('https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg'),
                      child: Container(

                        child: Text(getList[index].toString(), style: TextStyle(

                          fontSize: 20,
                        ),),

                        padding: EdgeInsets.all(20),
                      ),
                    )
                  ],
                ),
              ),
            );
          },

        )
    );
  }
}
