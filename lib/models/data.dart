import 'package:hive/hive.dart';
// part 'data.g.dart';

@HiveType(typeId: 0)
class DataModel {
  @HiveField(0)
  String title;

  DataModel({required this.title});
}
