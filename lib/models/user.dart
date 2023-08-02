class ResiUser {
  String firstName;
  String lastName;
  String room;
  String img;
  String email;
  bool isAdmin;
  String uid;

  ResiUser(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.room,
      required this.img,
      required this.isAdmin,
      required this.uid});
  Map<String, dynamic> toMap() => {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'room': room,
        'img': img,
        'isAdmin': isAdmin,
        'uid': uid,
      };
  factory ResiUser.fromString(Map<String, dynamic> value) => ResiUser(
      firstName: value['firstName'],
      lastName: value['lastName'],
      email: value['email'],
      room: value['room'],
      img: value['img'],
      isAdmin: value['isAdmin'],
      uid: value['uid']);
}
