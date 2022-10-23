// coverage:ignore-file

import 'package:source_gen/source_gen.dart';

extension ConstantReaderExtensions on ConstantReader {
  /// Returns the value of the [field] as a [bool] or throws a [FormatException] if the field is not a [bool].
  @Deprecated(
    'Use element.getXyz().getField(abc).toBoolValue() instead of ConstantReader(xyzTypeChecker.firstAnnotationOf(element)).readBoolValue(abc).',
  )
  bool readBoolValue(String field) {
    final reader = read(field);

    return reader.isBool ? reader.boolValue : throw FormatException();
  }

  /// Returns the value of the [field] as an [int] or throws a [FormatException] if the field is not an [int].
  @Deprecated(
    'Use element.getXyz().getField(abc).toIntValue() instead of ConstantReader(xyzTypeChecker.firstAnnotationOf(element)).readIntValue(abc).',
  )
  int readIntValue(String field) {
    final reader = read(field);

    return reader.isInt ? reader.intValue : throw FormatException();
  }

  /// Returns the value of the [field] as a [double] or throws a [FormatException] if the field is not a [double].
  @Deprecated(
    'Use element.getXyz().getField(abc).toDoubleValue() instead of ConstantReader(xyzTypeChecker.firstAnnotationOf(element)).readDoubleValue(abc).',
  )
  double readDoubleValue(String field) {
    final reader = read(field);

    return reader.isDouble ? reader.doubleValue : throw FormatException();
  }

  /// Returns the value of the [field] as a [String] or throws a [FormatException] if the field is not a [String].
  @Deprecated(
    'Use element.getXyz().getField(abc).toStringValue() instead of ConstantReader(xyzTypeChecker.firstAnnotationOf(element)).readStringValue(abc).',
  )
  String readStringValue(String field) {
    final reader = read(field);

    return reader.isString ? reader.stringValue : throw FormatException();
  }

  /// Returns the value of the [field] as a [bool] or `null` if the field is not a [bool].
  @Deprecated(
    'Use element.getXyz().getField(abc).toBoolValue() instead of ConstantReader(xyzTypeChecker.firstAnnotationOf(element)).peekBoolValue(abc).',
  )
  bool? peekBoolValue(String field) {
    final reader = peek(field);

    return reader != null && reader.isBool ? reader.boolValue : null;
  }

  /// Returns the value of the [field] as an [int] or `null` if the field is not an [int].
  @Deprecated(
    'Use element.getXyz().getField(abc).toIntValue() instead of ConstantReader(xyzTypeChecker.firstAnnotationOf(element)).peekIntValue(abc).',
  )
  int? peekIntValue(String field) {
    final reader = peek(field);

    return reader != null && reader.isInt ? reader.intValue : null;
  }

  /// Returns the value of the [field] as a [double] or `null` if the field is not a [double].
  @Deprecated(
    'Use element.getXyz().getField(abc).toDoubleValue() instead of ConstantReader(xyzTypeChecker.firstAnnotationOf(element)).peekDoubleValue(abc).',
  )
  double? peekDoubleValue(String field) {
    final reader = peek(field);

    return reader != null && reader.isDouble ? reader.doubleValue : null;
  }

  /// Returns the value of the [field] as a [String] or `null` if the field is not a [String].
  @Deprecated(
    'Use element.getXyz().getField(abc).toStringValue() instead of ConstantReader(xyzTypeChecker.firstAnnotationOf(element)).peekStringValue(abc).',
  )
  String? peekStringValue(String field) {
    final reader = peek(field);

    return reader != null && reader.isString ? reader.stringValue : null;
  }
}
