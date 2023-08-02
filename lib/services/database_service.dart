import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:resimob/models/user.dart';

class DatabaseService with ChangeNotifier {
  final String? uid;

  DatabaseService({this.uid});
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');
  Map<String, dynamic> _documentSnapshot = {};
  Map<String, dynamic> get userData =>
      {'firstName': _documentSnapshot['firstName']};
  Future updateUserData(ResiUser user) async {
    return await userCollection.doc(uid).set(user.toMap());
  }

  Future<QuerySnapshot> gettingUserData() async {
    QuerySnapshot snapshot =
        await userCollection.where('uid', isEqualTo: uid).get();
    return snapshot;
  }

  Future<Map<String, dynamic>> getUserData() async {
    final snapshot = await userCollection.doc(uid).get();
    final data = snapshot.data() as Map<String, dynamic>;

    return data;
  }
}
