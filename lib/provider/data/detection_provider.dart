import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:suri/model/data_model.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// Define a model for the user data
final detectionInfoProvider = StreamProvider<List<DataModel>>((ref) async* {
  await Future.delayed(const Duration(seconds: 20));
  final data = _firestore
      .collection("data")
      .orderBy("timestamp", descending: true)
      .snapshots()
      .map(
        (querySnapshot) => querySnapshot.docs
            .map(
              (data) => DataModel.fromSnapshot(data),
            )
            .toList(),
      );
  yield* data;
});
