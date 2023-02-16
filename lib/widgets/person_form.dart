import 'package:flutter/material.dart';
import '../utils.dart';

class PersonForm extends StatefulWidget {
  PersonForm(
      {super.key,
      required this.id,
      required this.name,
      required this.email,
      required this.mobile,
      required this.gender,
      required this.callback,
      required this.buttonText});

  final String id, name, email, mobile, gender, buttonText;
  void Function(String, String, String, String, String) callback;

  @override
  PersonFormState createState() {
    return PersonFormState();
  }
}

class PersonFormState extends State<PersonForm> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  String gender = "male", id = "";

  @override
  void initState() {
    super.initState();
    nameController.text = widget.name;
    emailController.text = widget.email;
    mobileController.text = widget.mobile;

    setState(() {
      gender = widget.gender;
      id = widget.id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Firebase Integration")),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Material(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Create Record",
                    style:
                        TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      filled: true,
                      labelText: "Name",
                      hintText: "John Doe",
                      hintStyle:
                          TextStyle(fontSize: 14, color: Colors.grey[800]),
                      fillColor: Colors.white70),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      filled: true,
                      labelText: "Email",
                      hintText: "johndoe@gmail.com",
                      hintStyle:
                          TextStyle(fontSize: 14, color: Colors.grey[800]),
                      fillColor: Colors.white70),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !FormValidation.isEmail(value)) {
                      return 'Please enter valid email address';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: mobileController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      filled: true,
                      labelText: "Mobile",
                      hintText: "923001234567",
                      hintStyle:
                          TextStyle(fontSize: 14, color: Colors.grey[800]),
                      fillColor: Colors.white70),
                  maxLength: 12,
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !FormValidation.isMobileNumber(value)) {
                      return 'Please enter valid mobile number';
                    }
                    return null;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Radio(
                          value: "male",
                          groupValue: gender,
                          onChanged: (value) {
                            setState(() {
                              gender = value.toString();
                            });
                          },
                        ),
                        const Text('Male'),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: "female",
                          groupValue: gender,
                          onChanged: (value) {
                            setState(() {
                              gender = value.toString();
                            });
                          },
                        ),
                        const Text('Female'),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50.0,
                  width: 320.0,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        widget.callback(
                            id,
                            nameController.text,
                            emailController.text,
                            mobileController.text,
                            gender);

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(
                                  "Person ${widget.buttonText == "Create" ? "created" : "updated"} successfully!")),
                        );
                        nameController.clear();
                        emailController.clear();
                        mobileController.clear();
                        Navigator.pop(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Text(widget.buttonText,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        )),
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
