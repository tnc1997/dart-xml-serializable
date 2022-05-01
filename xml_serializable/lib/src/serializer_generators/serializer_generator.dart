/// Defines methods for generating serializers and deserializers for types for example:
///
/// ```dart
/// class DateTimeSerializerGenerator extends SerializerGenerator {
///   const DateTimeSerializerGenerator();
///
///   @override
///   String serializer(String expression) => '$expression.toIso8601String()';
///
///   @override
///   String deserializer(String expression) => 'DateTime.parse($expression)';
/// }
/// ```
abstract class SerializerGenerator {
  /// Constructs a [SerializerGenerator].
  const SerializerGenerator();

  /// Generates code that serializes an [expression] representing an instance of the type to a [String].
  ///
  /// An implementation to serialize a [DateTime] as its ISO-8601 representation could be as simple as:
  ///
  /// ```dart
  /// String generateSerializer(String expression) => '$expression.toIso8601String()';
  /// ```
  String generateSerializer(String expression);

  /// Generates code that deserializes an [expression] representing a [String] to an instance of the type.
  ///
  /// An implementation to deserialize a [DateTime] by calling the [DateTime.parse] method could be as simple as:
  ///
  /// ```dart
  /// String generateDeserializer(String expression) => 'DateTime.parse($expression)';
  /// ```
  String generateDeserializer(String expression);
}
