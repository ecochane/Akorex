import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'to_do_list_record.g.dart';

abstract class ToDoListRecord
    implements Built<ToDoListRecord, ToDoListRecordBuilder> {
  static Serializer<ToDoListRecord> get serializer =>
      _$toDoListRecordSerializer;

  @nullable
  DateTime get toDoDate;

  @nullable
  String get toDoName;

  @nullable
  String get toDoDescription;

  @nullable
  bool get toDoState;

  @nullable
  String get every;

  @nullable
  String get time;

  @nullable
  String get category;

  @nullable
  DocumentReference get owner;

  @nullable
  String get brand;

  @nullable
  String get dayWeek;

  @nullable
  String get dayMonth;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ToDoListRecordBuilder builder) => builder
    ..toDoName = ''
    ..toDoDescription = ''
    ..toDoState = false
    ..every = ''
    ..time = ''
    ..category = ''
    ..brand = ''
    ..dayWeek = ''
    ..dayMonth = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ToDoList');

  static Stream<ToDoListRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ToDoListRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ToDoListRecord._();
  factory ToDoListRecord([void Function(ToDoListRecordBuilder) updates]) =
      _$ToDoListRecord;

  static ToDoListRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createToDoListRecordData({
  DateTime toDoDate,
  String toDoName,
  String toDoDescription,
  bool toDoState,
  String every,
  String time,
  String category,
  DocumentReference owner,
  String brand,
  String dayWeek,
  String dayMonth,
}) =>
    serializers.toFirestore(
        ToDoListRecord.serializer,
        ToDoListRecord((t) => t
          ..toDoDate = toDoDate
          ..toDoName = toDoName
          ..toDoDescription = toDoDescription
          ..toDoState = toDoState
          ..every = every
          ..time = time
          ..category = category
          ..owner = owner
          ..brand = brand
          ..dayWeek = dayWeek
          ..dayMonth = dayMonth));
