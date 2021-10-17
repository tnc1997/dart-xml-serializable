import 'package:source_gen/source_gen.dart';

extension ConstantReaderExtensions on ConstantReader {
  /// Returns the value of the [field] as a [bool] or throws a [FormatException] if the field is not a [bool].
  bool readBoolValue(String field) {
    final reader = read(field);

    return reader.isBool ? reader.boolValue : throw FormatException();
  }

  /// Returns the value of the [field] as an [int] or throws a [FormatException] if the field is not an [int].
  int readIntValue(String field) {
    final reader = read(field);

    return reader.isInt ? reader.intValue : throw FormatException();
  }

  /// Returns the value of the [field] as a [double] or throws a [FormatException] if the field is not a [double].
  double readDoubleValue(String field) {
    final reader = read(field);

    return reader.isDouble ? reader.doubleValue : throw FormatException();
  }

  /// Returns the value of the [field] as a [String] or throws a [FormatException] if the field is not a [String].
  String readStringValue(String field) {
    final reader = read(field);

    return reader.isString ? reader.stringValue : throw FormatException();
  }

  /// Returns the value of the [field] as a [bool] or `null` if the field is not a [bool].
  bool? peekBoolValue(String field) {
    final reader = peek(field);

    return reader != null && reader.isBool ? reader.boolValue : null;
  }

  /// Returns the value of the [field] as an [int] or `null` if the field is not an [int].
  int? peekIntValue(String field) {
    final reader = peek(field);

    return reader != null && reader.isInt ? reader.intValue : null;
  }

  /// Returns the value of the [field] as a [double] or `null` if the field is not a [double].
  double? peekDoubleValue(String field) {
    final reader = peek(field);

    return reader != null && reader.isDouble ? reader.doubleValue : null;
  }

  /// Returns the value of the [field] as a [String] or `null` if the field is not a [String].
  String? peekStringValue(String field) {
    final reader = peek(field);

    return reader != null && reader.isString ? reader.stringValue : null;
  }
}
