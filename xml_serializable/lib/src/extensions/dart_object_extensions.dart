import 'package:analyzer/dart/constant/value.dart';

extension DartObjectExtensions on DartObject {
  /// Returns the value of the field with the given [name] as a [bool] or `null` if the field is not a [bool].
  bool? getBoolValue(String name) => getField(name)?.toBoolValue();

  /// Returns the value of the field with the given [name] as an [int] or `null` if the field is not an [int].
  int? getIntValue(String name) => getField(name)?.toIntValue();

  /// Returns the value of the field with the given [name] as a [double] or `null` if the field is not a [double].
  double? getDoubleValue(String name) => getField(name)?.toDoubleValue();

  /// Returns the value of the field with the given [name] as a [String] or `null` if the field is not a [String].
  String? getStringValue(String name) => getField(name)?.toStringValue();
}
