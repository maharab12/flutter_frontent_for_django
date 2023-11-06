import 'package:flutter/material.dart';

class TodoContainer extends StatelessWidget {
  final int id;
  final String title;
  final String desc;
  final bool isDone;

  const TodoContainer({
    required this.id, 
    required this.title,
    required this.desc,
    required this.isDone,
    Key? key, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(10),
    child: Container(
      
      width: double.infinity,
      height: 150,
      decoration: const BoxDecoration(
        color: Colors.pinkAccent,
        borderRadius: BorderRadius.all(Radius.circular(4))
      ),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),
          ),
          const SizedBox(height: 5),
          Text(title,style: const TextStyle(fontSize: 20,color: Colors.white))

        ],
      ) ,
    ),
    );
  }
}
