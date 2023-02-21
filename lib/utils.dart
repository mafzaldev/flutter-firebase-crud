class FormValidation {
  static final RegExp _email = RegExp(
    r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+',
  );

  static final RegExp _mobile = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');

  static bool isEmail(String email) {
    return _email.hasMatch(email);
  }

  static bool isMobileNumber(String mobile) {
    return _mobile.hasMatch(mobile);
  }
}

toggleDrawer(scaffoldKey) async {
  if (scaffoldKey.currentState!.isDrawerOpen) {
    scaffoldKey.currentState?.openEndDrawer();
  } else {
    scaffoldKey.currentState?.openDrawer();
  }
}

class Data {
  static List readData = [
    "Create function named readData() in your Flutter app.",
    "Initialize a Cloud Firestore instance in that function app.You can do this by calling the instance() method on the Cloud Firestore class.",
    "Extract the data from the QuerySnapshot object by mapping the data to your data model and converting to a list, as shown below:",
    """FirebaseFirestore.instance
    .collection('collection name')
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((doc) => Person.fromJson(doc.data())).toList());""",
    "Handle any errors that may occur."
  ];

  static List createData = [
    "Create function named createData(data) in your Flutter app.",
    "Pass the data values as an argument to the function.",
    "Initialize a Cloud Firestore instance in that function app. You can do this by calling the instance() method on the Cloud Firestore class, as shown below:",
    "final docUser = FirebaseFirestore.instance.collection('collection name').doc();",
    "Create a data object to insert into the database.",
    "Call the set() method on the reference with the data object(from the parameters) as the argument.",
    "Handle any errors that may occur."
  ];

  static List updateData = [
    "Create function named updateData(data) in your Flutter app.",
    "Pass the data values as an argument to the function.",
    "Initialize a Cloud Firestore instance in that function app, and pass the document id as an argument. You can do this by calling the instance() method on the Cloud Firestore class, as shown below:",
    """final docUser = FirebaseFirestore.instance.collection('collection name').doc('document id');
    """,
    "Create a data object to update into the database.",
    "Call the update() method on the reference with the data object(from the parameters) as the argument.",
    "Handle any errors that may occur."
  ];

  static List deleteData = [
    "Create function named deleteData('document id') in your Flutter app.",
    "Pass the data values as an argument to the function.",
    "Initialize a Cloud Firestore instance in that function app, and pass the document id as an argument. You can do this by calling the instance() method on the Cloud Firestore class, as shown below:",
    """final docUser = FirebaseFirestore.instance.collection('collection name').doc('document id');
    """,
    "Call the delete() method on the reference to delete the document.",
    "Handle any errors that may occur."
  ];
}
