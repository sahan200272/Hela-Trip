import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addMessage() async {
    await _firestore.collection('test').add({
      'message': 'Hello Firebase',
      'time': DateTime.now(),
    });
  }
}
