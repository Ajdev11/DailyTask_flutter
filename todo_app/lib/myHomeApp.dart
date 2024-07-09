

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class MyHomeApp extends StatefulWidget {
//   const MyHomeApp({super.key});

//   @override
//   State<MyHomeApp> createState() => _MyHomeAppState();
// }

// class _MyHomeAppState extends State<MyHomeApp> {
//   String? quote;

//   @override
//   void initState() {
//     super.initState();
//     fetchKanyeQuote();
//   }

//   Future<String?> getKanye() async {
//     try {
//       var response = await http.get(Uri.parse('https://api.kanye.rest'));
//       if (response.statusCode == 200) {
//         var result = json.decode(response.body);
//         return result['quote'];
//       } else {
//         print('Failed to load quote');
//         return null;
//       }
//     } catch (e) {
//       print('Error: $e');
//       return null;
//     }
//   }

//   void fetchKanyeQuote() {
//     getKanye().then((value) {
//       setState(() {
//         quote = value;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Mobile Development is fun'),
//         backgroundColor: Colors.red,
//       ),
//       body: Center(
//         child: quote == null
//             ? CircularProgressIndicator()
//             : Text(quote!, style: TextStyle(fontSize: 20.0)),
//       ),
//     );
//   }
// }


// persistent bottomsheet
// import 'package:flutter/material.dart';

// class MyHomeApp extends StatefulWidget {
//   const MyHomeApp({super.key});

//   @override
//   State<MyHomeApp> createState() => _MyHomeAppState();
// }

// class _MyHomeAppState extends State<MyHomeApp> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       appBar: AppBar(
//         title: const Text('Mobile Development is fun'),
//         backgroundColor: Colors.red,
//       ),
//       body: Center(
//         child: ElevatedButton(
//           child: const Text('Persistent Modal'),
//           onPressed: () {
//             _scaffoldKey.currentState?.showBottomSheet(
//               (BuildContext context) {
//                 return Container(
//                   height: 400.0,
//                   color: Colors.amber[200],
//                   child: Center(
//                     child: Text('This is a persistent bottom sheet'),
//                   ),
//                 );
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }



//Modal Bottom
// import 'package:flutter/material.dart';

// class MyHomeApp extends StatefulWidget {
//   const MyHomeApp({super.key});

//   @override
//   State<MyHomeApp> createState() => _MyHomeAppState();
// }

// class _MyHomeAppState extends State<MyHomeApp> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Mobile Development is fun'),
//         backgroundColor: Colors.red,
//       ),
//       body: Center(
//         child: ElevatedButton(
//           child: const Text('Show me Modal'),
//           onPressed: () {
//             showModalBottomSheet(
//               context: context,
//               builder: (BuildContext context) {
//                 return Container(
//                   height: 400.0,
//                   color: Colors.amber[100],
//                   child: Center(
//                     child: Text('This is a modal bottom sheet'),
//                   ),
//                 );
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';
// import 'screen2.dart';

// class MyHomeApp extends StatefulWidget {
//   const MyHomeApp({super.key});

//   @override
//   State<MyHomeApp> createState() => _MyHomeAppState();
// }

// class _MyHomeAppState extends State<MyHomeApp> {
//   // pass the argument here to the other screen
//   final String message = "Hello Moses Ogunsemore";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Mobile Development is fun'),
//         backgroundColor: Colors.red,
//       ),
//       body: Center(
//         child: OutlinedButton(
//           child: const Text('Login'),
//           onPressed: () {
//             Navigator.of(context).push(
//               MaterialPageRoute(
//                   builder: (context) => Screen2(message: message)),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';
// import 'screen2.dart';

// class MyHomeApp extends StatefulWidget {
//   const MyHomeApp({super.key});

//   @override
//   State<MyHomeApp> createState() => _MyHomeAppState();
// }

// class _MyHomeAppState extends State<MyHomeApp> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Mobile Development is fun'),
//         backgroundColor: Colors.red,
//       ),
//       body: Center(
//         child: OutlinedButton(
//           child: Text('Login'),
//           onPressed: () {
//             Navigator.of(context).push(
//               MaterialPageRoute(builder: (context) => Screen2()),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }




// import 'package:flutter/material.dart';

// class MyHomeApp extends StatefulWidget {
//   const MyHomeApp({super.key});

//   @override
//   State<MyHomeApp> createState() => _MyHomeAppState();
// }

// class _MyHomeAppState extends State<MyHomeApp> {
//   List<int> dummy = [1, 2, 3, 4, 5, 6];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Mobile Development is fun'),
//         backgroundColor: Colors.red,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: GridView.builder(
//           scrollDirection: Axis.vertical,
//           reverse: false,
//           controller: ScrollController(),
//           physics: const AlwaysScrollableScrollPhysics(),
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2, // Number of columns in the grid
//             mainAxisSpacing: 10.0, // Vertical spacing between items
//             crossAxisSpacing: 10.0, // Horizontal spacing between items
//           ),
//           itemCount: dummy.length,
//           itemBuilder: (context, index) {
//             return Container(
//               height: 100.0,
//               width: 100.0,
//               color: Colors.blue[300],
//               alignment: Alignment.center,
//               child: Text(
//                 '${dummy[index]}',
//                 style: TextStyle(color: Colors.black, fontSize: 20.0),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';

// class MyHomeApp extends StatefulWidget {
//   const MyHomeApp({super.key});

//   @override
//   State<MyHomeApp> createState() => _MyHomeAppState();
// }

// class _MyHomeAppState extends State<MyHomeApp> {
//   late TextEditingController _usernameController;
//   late TextEditingController _passwordController;

//   @override
//   void initState() {
//     super.initState();
//     _usernameController = TextEditingController();
//     _passwordController = TextEditingController();
//   }

//   @override
//   void dispose() {
//     _usernameController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Mobile Development is fun'),
//         backgroundColor: Colors.red,
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextField(
//                 controller: _usernameController,
//                 autofocus: true,
//                 enabled: true,
//                 enableInteractiveSelection: true,
//                 enableSuggestions: true,
//                 keyboardType: TextInputType.text,
//                 obscureText: false,
//                 textDirection: TextDirection.ltr,
//                 decoration: InputDecoration(
//                   filled: true,
//                   fillColor: Colors.grey[200],
//                   hintText: 'Enter your Username',
//                   hintStyle: TextStyle(color: Colors.grey),
//                   labelText: 'Username',
//                   labelStyle: TextStyle(color: Colors.black),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                     borderSide: BorderSide.none,
//                   ),
//                   icon: Icon(Icons.person, color: Colors.black),
//                   contentPadding:
//                       EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
//                 ),
//               ),
//               SizedBox(height: 20.0),
//               TextField(
//                 controller: _passwordController,
//                 enabled: true,
//                 enableInteractiveSelection: true,
//                 enableSuggestions: true,
//                 keyboardType: TextInputType.visiblePassword,
//                 obscureText: true,
//                 textDirection: TextDirection.ltr,
//                 decoration: InputDecoration(
//                   filled: true,
//                   fillColor: Colors.grey[200],
//                   hintText: 'Enter your Password',
//                   hintStyle: TextStyle(color: Colors.grey),
//                   labelText: 'Password',
//                   labelStyle: TextStyle(color: Colors.black),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                     borderSide: BorderSide.none,
//                   ),
//                   icon: Icon(Icons.lock, color: Colors.black),
//                   contentPadding:
//                       EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           print('Username: ${_usernameController.text}');
//           print('Password: ${_passwordController.text}');
//         },
//         child: const Icon(Icons.add),
//         tooltip: 'Add',
//         backgroundColor: Colors.grey,
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';

// class MyHomeApp extends StatefulWidget {
//   const MyHomeApp({super.key});

//   @override
//   State<MyHomeApp> createState() => _MyHomeAppState();
// }

// class _MyHomeAppState extends State<MyHomeApp> {
//   late TextEditingController _textController;

//   @override
//   void initState() {
//     super.initState();
//     _textController = TextEditingController();
//   }

//   @override
//   void dispose() {
//     _textController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Mobile Development is fun'),
//         backgroundColor: Colors.red,
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: TextField(
//             controller: _textController,
//             autofocus: true,
//             enabled: true,
//             enableInteractiveSelection: true,
//             enableSuggestions: true,
//             keyboardType: TextInputType.visiblePassword,
//             obscureText: false,
//             textDirection: TextDirection.ltr,
//             decoration: InputDecoration(
//               filled: true,
//               fillColor: Colors.grey[200],
//               hintText: 'Enter your Password',
//               hintStyle: TextStyle(color: Colors.grey),
//               labelText: 'Password',
//               labelStyle: TextStyle(color: Colors.red),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10.0),
//                 borderSide: BorderSide.none,
//               ),
//               icon: Icon(Icons.key, color: Colors.red),
//               contentPadding:
//                   EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
//             ),
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           print(_textController.text); // Print the input text
//         },
//         child: const Icon(Icons.add),
//         tooltip: 'Add',
//         backgroundColor: Colors.grey,
//       ),
//     );
//   }
// }



// class _MyHomeAppState extends State<MyHomeApp> {
//   late TextEditingController _textController;

//   @override
//   void initState() {
//     super.initState();
//     _textController = TextEditingController();
//   }

//   @override
//   void dispose() {
//     _textController.dispose();
//     super.dispose();
//   }

//       body: Center(
//         child: TextField(
//           autofocus: true,
//           controller: _textController,
//           enabled: true,
//           enableInteractiveSelection: true,
//           enableSuggestions: true,
//           keyboardType: TextInputType.emailAddress,
//           obscureText: false,
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           print(_textController
//               .text); // Access the text property to print the input text
//         },
//         child: const Icon(Icons.add),
//         tooltip: 'Add',
//         backgroundColor: Colors.grey,
//       ),
//     );
//   }
// }

// inbuilt method
//   var count = 0;
//       body: Center(
//         child: Text(
//           '$count',
//           style: TextStyle(fontSize: 20.0),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           print('FAB IS PRESSED');
//           setState(() {
//             count++;
//           });
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }


// dismissible widget --- listview.builder widget
//   List<int> _listItems = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0];
//       body: Center(
//         child: Container(
//           height: 400.0, // Adjusted height to ensure enough space
//           width: double.infinity,
//           child: ListView.builder(
//             itemCount: _listItems.length,
//             itemBuilder: (BuildContext context, int index) {
//               return Dismissible(
//                 key: ValueKey(_listItems[index]),
//                 direction: DismissDirection.endToStart,
//                 onDismissed: (direction) {
//                   setState(() {
//                     _listItems.removeAt(index);
//                   });
//                   print('Dismissed: ${direction.toString()}');
//                 },
//                 background: Container(
//                   color: Colors.green,
//                   alignment: Alignment.centerRight,
//                   height: 15.0,
//                   padding: const EdgeInsets.only(right: 20),
//                   child: Icon(
//                     Icons.delete,
//                     color: Colors.redAccent,
//                     size: 40,
//                   ),
//                 ),
//                 child: Card(
//                   margin: const EdgeInsets.symmetric(
//                     horizontal: 15.0,
//                     vertical: 4.0,
//                   ),
//                   child: ListTile(
//                     title: Text('Count => ${_listItems[index]}'),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }




// dismissible widget --- separator widget
//   List<int> _listItems = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0];
//       body: Container(
//         height: 200.0,
//         width: double.infinity,
//         child: ListView.separated(
//           padding: const EdgeInsets.all(10.0),
//           itemBuilder: (BuildContext context, int index) {
//             return ListTile(
//               title: Text('Count => ${_listItems[index]}'),
//             );
//           },
//           separatorBuilder: (BuildContext context, int index) => Divider(
//             color: Colors.black,
//           ),
//           itemCount: _listItems.length,
//         ),
//       ),
//     );
//   }
// }


//   List<int> _listItems = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0];
//       body: Container(
//         width: double.infinity,
//         child: ListView.builder(
//           itemCount: _listItems.length,
//           itemBuilder: (BuildContext context, int index) {
//             return ListTile(
//               title: Text('Count => ${_listItems[index]}'),
//               subtitle: Text('moses'),
//               leading: Icon(Icons.done),
//               trailing: Icon(Icons.close),
//               onTap: () {
//                 print('Pressed ${_listItems[index]}');
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }



// list view
//   List<int> _listItems = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0];
//       body: Container(
//         height: 200.0,
//         width: double.infinity,
//         child: ListView(
//           scrollDirection: Axis.vertical,
//           children: _listItems.map((e) {
//             return Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Container(
//                 color: Colors.blue, // Background color
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(
//                     'Count: $e',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ),
//             );
//           }).toList(),
//         ),
//       ),
//     );
//   }
// }

// image network
//  body: Center(
//         child: Image.network(
//           'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
//           frameBuilder: (BuildContext context, Widget child, int? frame,
//               bool wasSynchronouslyLoaded) {
//             return Padding(
//               padding: const EdgeInsets.all(40.0),
//               child: child,
//             );
//           },
//           loadingBuilder: (BuildContext context, Widget child,
//               ImageChunkEvent? loadingProgress) {
//             if (loadingProgress == null) return child;
//             return Center(
//               child: CircularProgressIndicator(
//                 value: loadingProgress.expectedTotalBytes != null
//                     ? loadingProgress.cumulativeBytesLoaded /
//                         (loadingProgress.expectedTotalBytes ?? 1)
//                     : null,
//               ),
//             );
//           },
//           errorBuilder:
//               (BuildContext context, Object error, StackTrace? stackTrace) {
//             return Center(
//               child: Text('Error loading image'),
//             );
//           },
//         ),
//       ),

// asset image
    //  body: Container(
    //     height: double.infinity,
    //     width: double.infinity,
    //     child: Image.asset(
    //       'assets/mo.jpg',
    //       fit: BoxFit.cover,
    //       alignment: Alignment.center,FF
    //       repeat: ImageRepeat.repeat,
    //     ),
    //   ),

    // body: Center(
    //   child: Container(
    //     height: 200.0, // Reduced height of the container
    //     width: 400.0,
    //     padding: const EdgeInsets.all(16.0), // Add padding to the container
    //     decoration: BoxDecoration(
    //       color: Colors.white, // Add background color to the container
    //       borderRadius:
    //           BorderRadius.all(Radius.circular(20.0)), // Set border radius
    //     ),
    //     child: Image.asset(
    //       'assets/mo.jpg',
    //       fit: BoxFit.cover, // Adjust the fit of the image
    //     ),
    //   ),
    // ),


  //  body: Center(
  //       child: Container(
  //         padding: const EdgeInsets.all(10.0),
  //         decoration: BoxDecoration(
  //           color: Colors.black,
  //           shape: BoxShape.rectangle,
  //           borderRadius: BorderRadius.circular(8.0),
  //         ),
  //         child: const Text(
  //           'Programmer Moses',
  //           style: TextStyle(color: Colors.white, fontSize: 15.0),
  //         ),
  //       ),
  //     ),
  //     floatingActionButton: FloatingActionButton.extended(
  //       onPressed: () => print('FAB PRESSED'),
  //       label: Text('ADD'),
  //       icon: Icon(Icons.add),
  //       tooltip: 'Tooltip for floatButtons',
  //       backgroundColor: Colors.grey,
  //     ),


    // body: Center(
    //   child: IconButton(
    //     icon: Icon(Icons.add),
    //     onPressed: () => print('i pressed the button'),
    //     color: Colors.green,
    //     iconSize: 50.0,
    //     splashColor: Colors.red,
    //     padding: EdgeInsets.all(20.0),
    //     tooltip: 'This is a demo test button',
    //   ),
    // ),

    // body: Center(
    //   child: OutlinedButton(
    //     child: Icon(Icons.add), // Fixed the instantiation of Icon widget
    //     style: OutlinedButton.styleFrom(
    //         backgroundColor: Colors.cyan, // Set text/icon color
    //         side: BorderSide(
    //           color: Colors.red,
    //           width: 20,
    //           style: BorderStyle.none,
    //         ), // Border color
    //         elevation: 10,
    //         disabledIconColor: Colors.white),
    //     onPressed: () => print('Dart programming language'),
    //   ),
    // ),

    // body: Center(
    //   child: RichText(
    //     text: TextSpan(
    //       text: 'my name is ',
    //       style: TextStyle(
    //         color: Colors.amberAccent,
    //         fontSize: 30,
    //         fontWeight: FontWeight.bold,
    //       ),
    //       children: <TextSpan>[
    //         TextSpan(
    //           text: 'Here',
    //           style: TextStyle(
    //             color: Colors.red,
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // ),

    // body: Center(
    //   child: Text(
    //     'This is a very long text that is supposed to demonstrate the usage of maxLines property in Flutter. It should be truncated after a certain number of lines.',
    //     maxLines: 2,
    //     style: TextStyle(
    //       backgroundColor: Colors.green,
    //       color: Colors.white,
    //       fontWeight: FontWeight.bold,
    //       fontSize: 20,
    //       fontStyle: FontStyle.italic,
    //     ),
    //     textAlign: TextAlign.center, // Optional: centers the text within the Text widget
    //   ),
    // ),
    // );





