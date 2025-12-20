import 'package:flutter_test/flutter_test.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:hela_trip/services/firestore_services.dart';

void main() {
  group('FirebaseService Tests', () {
    test('addMessage should add a document to Firestore', () async {
      // Arrange
      final fakeFirestore = FakeFirebaseFirestore();
      final firebaseService = FirebaseService(firestore: fakeFirestore);

      // Act
      await firebaseService.addMessage();

      // Assert
      final snapshot =
          await fakeFirestore.collection('test').get();

      expect(snapshot.docs.length, 1);
      expect(snapshot.docs.first['message'], 'Hello Firebase');
    });
  });
}
