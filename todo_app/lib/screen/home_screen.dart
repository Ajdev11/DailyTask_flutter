import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../modal/task.dart';

class Project1 extends StatefulWidget {
  const Project1({Key? key}) : super(key: key);

  @override
  _Project1State createState() => _Project1State();
}

class _Project1State extends State<Project1> {
  late TextEditingController _taskController;
  List<Task> _tasks = [];
  List<bool> _taskDone = [];

  void _getTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? task = prefs.getString('task');
    List list = (task == null) ? [] : json.decode(task);
    _tasks = list.map((e) => Task.fromMap(json.decode(e))).toList();
    _taskDone = List.generate(_tasks.length, (index) => false);
    setState(() {});
  }

  void updatePendingTaskList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Task> pendingList = [];
    for (var i = 0; i < _tasks.length; i++) {
      if (!_taskDone[i]) {
        pendingList.add(_tasks[i]);
      }
    }
    var pendingListEncoded = List.generate(
      pendingList.length,
      (i) => json.encode(pendingList[i].toMap()),
    );
    prefs.setString('task', json.encode(pendingListEncoded));
    _getTasks();
  }

  @override
  void initState() {
    super.initState();
    _taskController = TextEditingController();
    _getTasks();
  }

  @override
  void dispose() {
    _taskController.dispose();
    super.dispose();
  }

  void saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Task t = Task.fromString(_taskController.text);
    String? task = prefs.getString('task');
    List list = (task == null) ? [] : json.decode(task);
    list.add(json.encode(t.toMap()));
    prefs.setString('task', json.encode(list));
    _taskController.text = '';
    Navigator.of(context).pop();
    _getTasks();

    // Print saved items
    print('Saved items:');
    for (var item in list) {
      print(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Task Application',
          textAlign: TextAlign.center,
          style: GoogleFonts.roboto(fontSize: 20.0, color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: updatePendingTaskList,
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setString('task', json.encode([]));
              _getTasks();
            },
          ),
        ],
        backgroundColor: Colors.black,
        toolbarHeight: 40.0,
        centerTitle: true,
      ),
      body: _tasks.isEmpty
          ? const Center(
              child: Text('No task added yet'),
            )
          : Column(
              children: _tasks.map((e) {
                int index = _tasks.indexOf(e);
                return Container(
                  height: 50.0,
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 5.0,
                  ),
                  padding: const EdgeInsets.only(left: 10.0),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(
                      color: Colors.black,
                      width: 0.5,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        e.task,
                        style: GoogleFonts.montserrat(),
                      ),
                      Checkbox(
                        value: _taskDone[index],
                        onChanged: (bool? value) {
                          setState(() {
                            _taskDone[index] = value ?? false;
                          });
                        },
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.blue[200],
        onPressed: () => showModalBottomSheet(
          context: context,
          builder: (BuildContext context) => Container(
            padding: const EdgeInsets.all(10.0),
            height: 500.0,
            color: Colors.blue,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Add Task',
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: const Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const Divider(thickness: 1.2, color: Colors.white),
                const SizedBox(height: 20.0),
                TextField(
                  controller: _taskController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Enter Task',
                    hintStyle: GoogleFonts.roboto(),
                  ),
                ),
                const SizedBox(height: 20.0),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                          ),
                          child: Text(
                            'RESET',
                            style: GoogleFonts.roboto(color: Colors.blue),
                          ),
                          onPressed: () => _taskController.text = '',
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey,
                          ),
                          child: Text(
                            'ADD',
                            style: GoogleFonts.roboto(color: Colors.white),
                          ),
                          onPressed: () => saveData(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
