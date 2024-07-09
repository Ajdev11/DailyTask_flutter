// import 'package:flutter/material.dart';

// class Screen2 extends StatelessWidget {
//   // receive the message here
//   final String message;

//   const Screen2({Key? key, required this.message}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Screen 2'),
//         backgroundColor: Colors.blue,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(message),
//             OutlinedButton(
//               child: const Text('Back'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }




// import 'package:flutter/material.dart';
// import 'package:todo_app/myHomeApp.dart';

// class Screen2 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Screen 2'),
//         backgroundColor: Colors.blue,
//       ),
//       body: Center(
//         child: OutlinedButton(
//           child: Text('Back'),
//           onPressed: () {
//             Navigator.of(context).push(
//               MaterialPageRoute(builder: (context) => MyHomeApp()),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
