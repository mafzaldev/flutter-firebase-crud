// import 'package:flutter/material.dart';

// class UpdateRecord extends StatefulWidget {
//   const UpdateRecord(
//       {super.key,
//       required this.name,
//       required this.email,
//       required this.mobile,
//       required this.gender});

//   final String name, email, mobile, gender;

//   @override
//   UpdateRecordState createState() {
//     // ignore: no_logic_in_create_state
//     return UpdateRecordState();
//   }
// }

// class UpdateRecordState extends State<UpdateRecord> {
//   final _formKey = GlobalKey<FormState>();
//   final nameController = TextEditingController();
//   final emailController = TextEditingController();
//   final mobileController = TextEditingController();
//   String gender = "male";

//   @override
//   void initState() {
//     super.initState();
//     nameController.text = widget.name;
//     emailController.text = widget.email;
//     mobileController.text = widget.mobile;

//     setState(() {
//       gender = widget.gender;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("PCC Services")),
//       body: Form(
//         key: _formKey,
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 32.0),
//           child: Material(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text("Update Record",
//                     style:
//                         TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 TextFormField(
//                   controller: nameController,
//                   readOnly: true,
//                   onTap: () {
//                     FocusScope.of(context).requestFocus(FocusNode());
//                   },
//                   decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(15.0),
//                       ),
//                       disabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(15.0),
//                       ),
//                       filled: true,
//                       labelText: "Id",
//                       hintStyle:
//                           TextStyle(fontSize: 14, color: Colors.grey[800]),
//                       fillColor: Colors.white70),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter some text';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 TextFormField(
//                   controller: emailController,
//                   decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(15.0),
//                       ),
//                       filled: true,
//                       labelText: "Title",
//                       hintStyle:
//                           TextStyle(fontSize: 14, color: Colors.grey[800]),
//                       fillColor: Colors.white70),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter some text';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 SizedBox(
//                   height: 120.0,
//                   child: TextFormField(
//                     controller: descriptionController,
//                     decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(15.0),
//                         ),
//                         filled: true,
//                         labelText: "Description",
//                         hintStyle:
//                             TextStyle(fontSize: 14, color: Colors.grey[800]),
//                         fillColor: Colors.white70),
//                     maxLines: 100,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter some text';
//                       }
//                       return null;
//                     },
//                   ),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text('Status'),
//                     Switch(
//                       value: status,
//                       onChanged: (bool value) {
//                         setState(() {
//                           status = value;
//                         });
//                       },
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 50.0,
//                   width: 320.0,
//                   child: ElevatedButton(
//                     onPressed: () async {
//                       if (_formKey.currentState!.validate()) {
//                         Future<String> updateResponse = updateService(
//                             idController.text,
//                             titleController.text,
//                             descriptionController.text,
//                             status ? "Active" : "Inactive");
//                         String response = await updateResponse;

//                         // ignore: use_build_context_synchronously
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(content: Text(response)),
//                         );
//                       }
//                       idController.clear();
//                       titleController.clear();
//                       descriptionController.clear();
//                       Navigator.pop(context);
//                     },
//                     style: ElevatedButton.styleFrom(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10.0),
//                       ),
//                     ),
//                     child: const Text('Update',
//                         style: TextStyle(
//                           fontFamily: 'Poppins',
//                           fontSize: 18,
//                           color: Colors.white,
//                           fontWeight: FontWeight.w400,
//                         )),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
