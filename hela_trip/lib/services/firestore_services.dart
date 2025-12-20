import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  
  final FirebaseFirestore firestore;

  FirebaseService({required this.firestore});

  Future<void> addMessage() async {
    await firestore.collection('test').add({
      'message': 'Hello Firebase',
      'time': DateTime.now(),
    });
  }
}
