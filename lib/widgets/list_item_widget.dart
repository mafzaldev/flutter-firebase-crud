import 'package:firebase_crud/widgets/person_form.dart';
import 'package:flutter/material.dart';
import '../person_model.dart';
import '../api_service.dart';

class ListItem extends StatelessWidget {
  final Person person;

  const ListItem({Key? key, required this.person}) : super(key: key);

  updatePersonCallback(id, name, email, mobile, gender) {
    updatePerson(
        id: id, name: name, email: email, mobile: mobile, gender: gender);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            children: [
              ListTile(
                leading: person.gender == "male"
                    ? const Icon(
                        Icons.man,
                        size: 35,
                        color: Colors.blue,
                      )
                    : const Icon(
                        Icons.woman,
                        size: 35,
                        color: Colors.pink,
                      ),
                title: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(person.name,
                      style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 18.0)),
                ),
                subtitle: Text("${person.email} | ${person.mobile}",
                    style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 15.0)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PersonForm(
                                    id: person.id,
                                    name: person.name,
                                    email: person.email,
                                    mobile: person.mobile,
                                    gender: person.gender,
                                    callback: updatePersonCallback,
                                  )));
                    },
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () async {
                      deletePerson(id: person.id);

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text("Person deleted successfully!")),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
