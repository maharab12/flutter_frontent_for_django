import 'package:flutter/material.dart';
import 'package:flutter_frontent/Constants/api.dart';
import 'package:flutter_frontent/Models/todo.dart';
import 'package:flutter_frontent/Widgets/app_bar.dart';
import 'package:flutter_frontent/Widgets/todo_container.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Todo> myTodos = [];
  bool isloading = true;

  void fetchData() async {
    try {
      http.Response response = await http.get(Uri.parse(api));
      var data = json.decode(response.body);
      data.forEach((todo) {
        Todo t = Todo(
          id: todo['id'] ?? "",
          title: todo['title'] ?? "",
          desc: todo['desc'] ?? "",
          isDone: todo['isDone'] ?? false,
          date: todo['date'] ?? "",
        );
        myTodos.add(t);
      });
      setState(() {
        isloading = false;
      });
    } catch (e) {
      print("Error is $e");
    }
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(),
        body: isloading
            ? CircularProgressIndicator()
            : ListView(
                children: myTodos.map((e) {
                return TodoContainer(
                  id: 1,
                  title: e.title, // Access 'title' using dot notation
                  desc: e.desc, // Access 'desc' using dot notation
                  isDone: e.isDone, // Access 'isDone' using dot notation
                );
              }).toList()));
  }
}
