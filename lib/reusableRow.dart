import 'package:flutter/material.dart';

class ReuseableRow extends StatelessWidget {
  String title, value;
   ReuseableRow({Key? key,required this.title,required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
          Text(value,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),

        ],
      ),
    );
  }
}
