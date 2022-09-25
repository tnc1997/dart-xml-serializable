import 'serializer_generator.dart';

/// Unifies the implementations for types that are able to be converted to/from a [String] using a `toString()` function and a `parse` constructor respectively.
abstract class StringableSerializerGenerator extends SerializerGenerator {
  /// If `false` (the default) then the type does not represent a nullable type.
  final bool _isNullable;

  /// Represents an invocation on an instance of the type that returns a [String].
  ///
  /// Example: `toIso8601String()`.
  final String _toString;

  /// The static method or constructor to call when creating an instance of the type.
  ///
  /// Assumed to have one parameter of type [String].
  ///
  /// Example: `DateTime.parse`.
  final String _parse;

  const StringableSerializerGenerator(
    this._toString,
    this._parse, {
    bool isNullable = false,
  }) : _isNullable = isNullable;

  @override
  String generateSerializer(String expression, Set<String> addedMembers) {
    final buffer = StringBuffer(expression);

    if (_isNullable) {
      buffer.write('?');
    }

    buffer.write('.$_toString');

    return buffer.toString();
  }

  @override
  String generateDeserializer(String expression, Set<String> addedMembers) {
    final buffer = StringBuffer();

    if (_isNullable) {
      buffer.write('$expression != null ? ');
    }

    buffer.write('$_parse($expression)');

    if (_isNullable) {
      buffer.write(' : null');
    }

    return buffer.toString();
  }
}
