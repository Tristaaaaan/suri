// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

class DataModel {
  final ClassificationModel classCounts;
  final String? downloadUrl;
  final DateTime timestamp;

  DataModel({
    required this.classCounts,
    this.downloadUrl,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'class_counts': classCounts.toMap(),
      'downloadUrl': downloadUrl,
      'timestamp': timestamp.millisecondsSinceEpoch,
    };
  }

  factory DataModel.fromMap(Map<String, dynamic> map) {
    return DataModel(
      classCounts: ClassificationModel.fromMap(
          map['class_counts'] as Map<String, dynamic>),
      downloadUrl: map['download_url'] as String?,
      timestamp: DateTime.fromMillisecondsSinceEpoch(map['timestamp'] as int),
    );
  }

  factory DataModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    return DataModel(
      classCounts: ClassificationModel.fromMap(
          doc['class_counts'] as Map<String, dynamic>),
      downloadUrl: doc['download_url'] as String?,
      timestamp: DateTime.fromMillisecondsSinceEpoch(doc['timestamp'] as int),
    );
  }
}

class ClassificationModel {
  final int entryHole;
  final int infectedBerry;
  final int ripe;
  final int unripe;

  ClassificationModel({
    required this.entryHole,
    required this.infectedBerry,
    required this.ripe,
    required this.unripe,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'EH': entryHole,
      'IB': infectedBerry,
      'R': ripe,
      'U': unripe,
    };
  }

  factory ClassificationModel.fromMap(Map<String, dynamic> map) {
    return ClassificationModel(
      entryHole: map['EH'] as int,
      infectedBerry: map['IB'] as int,
      ripe: map['R'] as int,
      unripe: map['U'] as int,
    );
  }

  factory ClassificationModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    return ClassificationModel(
      entryHole: doc['EH'] as int,
      infectedBerry: doc['IB'] as int,
      ripe: doc['R'] as int,
      unripe: doc['U'] as int,
    );
  }
}
