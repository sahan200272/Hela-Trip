class AppUser {
  final String uid;
  final String name;
  final String email;
  final String? photoUrl;

  AppUser({
    required this.uid,
    required this.name,
    required this.email,
    this.photoUrl,
  });

  // convert firestore object into dart object
  factory AppUser.fromMap(String uid, Map<String, dynamic> data) {
    return AppUser(
      uid: uid,
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      photoUrl: data['photoUrl'],
    );
  }
}
