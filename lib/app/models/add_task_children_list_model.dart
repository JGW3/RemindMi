import 'package:cloud_firestore/cloud_firestore.dart';

class Dependent {
  final String name;
  final String id;
  // final String description;

  const Dependent({
    required this.name,
    required this.id,
    // required this.description,
  });

  static Dependent fromSnapshot(DocumentSnapshot snap) {
    print('hello hello');
    print(
      snap.reference.id,
    );
    Dependent dependent = Dependent(
      id: snap.reference.id,
      name: snap['fullName'],
      // description: snap['description'],
    );
    return dependent;
  }
}
