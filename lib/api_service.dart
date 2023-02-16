import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'person_model.dart';

Stream<List<Person>> fetchPersons() => FirebaseFirestore.instance
    .collection('persons')
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((doc) => Person.fromJson(doc.data())).toList());

Future createPerson(
    {required String name,
    required String email,
    required String mobile,
    required String gender}) async {
  final docUser = FirebaseFirestore.instance.collection("persons").doc();

  final person = Person(
    id: docUser.id,
    name: name,
    email: email,
    mobile: mobile,
    gender: gender,
  );

  final json = person.toJson();
  await docUser.set(json);
}

Future updatePerson(
    {required String id,
    required String name,
    required String email,
    required String mobile,
    required String gender}) async {
  final docUser = FirebaseFirestore.instance.collection("persons").doc(id);

  final response = await docUser.update({
    "name": name,
    "email": email,
    "mobile": mobile,
    "gender": gender,
  });

  return response;
}

Future deletePerson({required String id}) async {
  final docUser = FirebaseFirestore.instance.collection("persons").doc(id);
  await docUser.delete();
}
