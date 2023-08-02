import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:resimob/models/user.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  Future updateUserData(ResiUser user) async {
    return await userCollection.doc(uid).set(user.toMap());
  }

  Future<QuerySnapshot> gettingUserData() async {
    QuerySnapshot snapshot =
        await userCollection.where('uid', isEqualTo: uid).get();
    return snapshot;
  }
}
