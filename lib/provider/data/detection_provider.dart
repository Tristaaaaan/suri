import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:suri/functions/current_datetime.dart';
import 'package:suri/model/data_model.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// Define a model for the user data
final detectionInfoProvider =
    StreamProvider.autoDispose<List<DataModel>>((ref) {
  final startOfDay = getStartOfDayInMillis();
  final endOfDay = getEndOfDayInMillis();

  final data = _firestore
      .collection("data")
      .where("timestamp", isGreaterThanOrEqualTo: startOfDay)
      .where("timestamp", isLessThanOrEqualTo: endOfDay)
      .orderBy("timestamp", descending: true)
      .snapshots()
      .map(
        (querySnapshot) => querySnapshot.docs
            .map(
              (data) => DataModel.fromSnapshot(data),
            )
            .toList(),
      );
  return data;
});
