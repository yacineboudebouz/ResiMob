import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:resimob/models/notification.dart';
import 'package:resimob/models/user.dart';

class DatabaseService with ChangeNotifier {
  final String? uid;

  DatabaseService({this.uid});
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference notificationCollection =
      FirebaseFirestore.instance.collection('notifications');

  Map<String, dynamic> _userData = {};
  Map<String, dynamic> get userData => _userData;
  List<Map<String, dynamic>> _notifications = [];
  List<Map<String, dynamic>> get notifications => _notifications;
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
    final data = snapshot.data();

    _userData = data as Map<String, dynamic>;
    notifyListeners();
    return _userData;
  }

  Future<String> uploadImageToStorage(File imageFile, String imageName) async {
    try {
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage.ref().child('images/$imageName.jpg');

      await ref.putFile(imageFile);

      String imageUrl = await ref.getDownloadURL();

      return imageUrl;
    } catch (e) {
      print('Error uploading image: $e');
      return '';
    }
  }

  Future addNotification(AppNotification notification, File? imageFile) async {
    try {
      String imageUrl = imageFile != null
          ? await uploadImageToStorage(imageFile, notification.title)
          : '';

      FirebaseFirestore firestore = FirebaseFirestore.instance;
      DocumentReference articleReference =
          await notificationCollection.add(notification.toMap());
      articleReference.update({
        'id': articleReference.id,
        'img': imageUrl,
      });
    } catch (e) {
      return e.toString();
    }
  }

  Future<List<Map<String, dynamic>>> getAllNotifications() async {
    List<Map<String, dynamic>> notificationsList = [];
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      QuerySnapshot querySnapshot =
          await firestore.collection('notifications').get();
      for (var documentSnapshot in querySnapshot.docs) {
        Map<String, dynamic> notificationMap =
            documentSnapshot.data() as Map<String, dynamic>;
        notificationsList.add(notificationMap);
      }
    } catch (e) {
      print('Error getting articles: $e');
    }
    _notifications = notificationsList;
    notifyListeners();
    return _notifications;
  }
}
