import 'dart:convert';

import 'package:complexapis/reusableRow.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Models/UserModel.dart';
class Examples extends StatelessWidget {
   Examples({Key? key}) : super(key: key);

  List<UserModel> userList = [];
  Future<List<UserModel>> getUserApi()async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      for(Map i in data){
        userList.add(UserModel.fromJson(i));
      }
      return userList;
    }else{

      return userList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('complex Apis'),
      centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
            future: getUserApi(),
                builder: (context, AsyncSnapshot< List<UserModel>> snapshot) {
                  if(!snapshot.hasData){
                    return CircularProgressIndicator();

                  }else{
                    return ListView.builder(
                        itemCount: userList.length ,
                        itemBuilder: (context, index){
                          return Card(
                            child: Column(
                              children: [
                                ReuseableRow(title: 'Name', value: snapshot.data![index].name.toString()),
                                ReuseableRow(title: 'Username', value: snapshot.data![index].username.toString()),
                                ReuseableRow(title: 'Email', value: snapshot.data![index].email.toString()),
                              ],

                            ),
                          );
                        }
                    );
                  }

                }),
          )
        ],
      ),
    );
  }
}
