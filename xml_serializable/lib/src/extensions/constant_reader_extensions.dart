import 'package:source_gen/source_gen.dart';

extension ConstantReaderExtensions on ConstantReader {
  bool readBoolValue(String field) {
    final reader = read(field);

    return reader.isBool ? reader.boolValue : throw FormatException();
  }

  int readIntValue(String field) {
    final reader = read(field);

    return reader.isInt ? reader.intValue : throw FormatException();
  }

  double readDoubleValue(String field) {
    final reader = read(field);

    return reader.isDouble ? reader.doubleValue : throw FormatException();
  }

  String readStringValue(String field) {
    final reader = read(field);

    return reader.isString ? reader.stringValue : throw FormatException();
  }

  bool? peekBoolValue(String field) {
    final reader = peek(field) as ConstantReader?;

    return reader != null && reader.isBool ? reader.boolValue : null;
  }

  int? peekIntValue(String field) {
    final reader = peek(field) as ConstantReader?;

    return reader != null && reader.isInt ? reader.intValue : null;
  }

  double? peekDoubleValue(String field) {
    final reader = peek(field) as ConstantReader?;

    return reader != null && reader.isDouble ? reader.doubleValue : null;
  }

  String? peekStringValue(String field) {
    final reader = peek(field) as ConstantReader?;

    return reader != null && reader.isString ? reader.stringValue : null;
  }
}
