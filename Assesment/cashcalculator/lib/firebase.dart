import 'package:cloud_firestore/cloud_firestore.dart';
import 'model/cash.dart';

class FirebaseService {
  final CollectionReference cashRef =
  FirebaseFirestore.instance.collection('cash_records');

  Future<void> addRecord(CashModel model) async {
    await cashRef.doc(model.id).set(model.toMap());
  }

  Stream<List<CashModel>> getRecords() {
    return cashRef.orderBy('date', descending: true).snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => CashModel.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
    });
  }

  Future<void> updateRecord(CashModel model) async {
    await cashRef.doc(model.id).update(model.toMap());
  }

  Future<void> deleteRecord(String id) async {
    await cashRef.doc(id).delete();
  }
}
