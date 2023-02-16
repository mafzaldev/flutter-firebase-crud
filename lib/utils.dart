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
