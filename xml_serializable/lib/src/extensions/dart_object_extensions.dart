import 'package:analyzer/dart/constant/value.dart';

extension DartObjectExtensions on DartObject {
  bool getBoolValue(String name) => getField(name)?.toBoolValue();

  int getIntValue(String name) => getField(name)?.toIntValue();

  double getDoubleValue(String name) => getField(name)?.toDoubleValue();

  String getStringValue(String name) => getField(name)?.toStringValue();
}
