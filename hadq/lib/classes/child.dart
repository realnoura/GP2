class Child {
  String userName;
  String email;
  String password;
  int age;
  int points = 0;

  Child({
    required this.userName,
    required this.email,
    required this.password,
    required this.age,
  });

  // void register({});

  bool cameraPermission() {
    // ask user first
    return true;
  }

  void login(userName, password) {
    //checking userName and pssword
  }

  void editAccount(userName, email, age, password) {
    // edit info in dataBase
  }

  Child viewAccount() {
    return Child(userName: userName, email: email, password: password, age: age);
  }

  void resetPassword(){
    // send a new pssword to the user an update his password
  }
}
