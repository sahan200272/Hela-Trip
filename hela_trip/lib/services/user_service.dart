import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';

class UserService {
  final _db = FirebaseFirestore.instance;

  Stream<AppUser> getUser(String uid) {
    return _db
        .collection('reg-users')
        .doc(uid)
        .snapshots()
        .map((doc) => AppUser.fromMap(
              doc.id,
              doc.data() as Map<String, dynamic>,
            ));
  }
}
