import 'package:cloud_firestore/cloud_firestore.dart';

class useri {
  final String id;
  final String profileName;
  final String username;
  final String url;
  final String email;
  final int amount;

  useri({
    this.id,
    this.profileName,
    this.username,
    this.url,
    this.email,
    this.amount,
  });

  factory useri.fromDocument(DocumentSnapshot doc) {
    return useri(
      id: doc.id,
      email: doc['email'],
      username: doc['username'],
      url: doc['url'],
      profileName: doc['profileName'],
      amount: doc['amount'],
    );
  }
}


