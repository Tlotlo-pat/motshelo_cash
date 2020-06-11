class User {

  final String uid;
  final String fullName;
  final String email;
  final String cell;
  

  User({ this.uid, this.fullName, this.email ,this.cell});

  User.fromData(Map<String, dynamic> data)
      : uid = data['uid'],
        fullName = data['fullName'],
        email = data['email'],
        cell = data['cell']
  
;toJson() {
    return {
      'uid': uid,
      'fullName': fullName,
      'email': email,
      'cell': cell,
    };
  }
  
}
