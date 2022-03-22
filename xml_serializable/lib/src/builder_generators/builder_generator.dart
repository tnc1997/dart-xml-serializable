/// Defines methods for generating builders for representations of types for example:
///
/// ```dart
/// class XmlTextBuilderGenerator extends BuilderGenerator {
///   const XmlTextBuilderGenerator();
///
///   @override
///   String generateBuilder(String expression) => 'builder.text($expression);';
/// }
/// ```
///
/// It is recommended to use a [BuilderGenerator] in combination with a [SerializerGenerator] for example:
///
/// ```dart
/// // Builds an XML text with a serialized instance of an int type.
/// buffer.write(XmlTextBuilderGenerator().generateBuilder(IntSerializerGenerator().generateSerializer('element')));
/// ```
abstract class BuilderGenerator {
  /// Constructs a [BuilderGenerator].
  const BuilderGenerator();

  /// Generates code that builds a representation of the type from an [expression] as an XML attribute / XML element / XML text using a [builder].
  ///
  /// An implementation to build a representation of the type as an XML text could be as simple as:
  ///
  /// ```dart
  /// String generateBuilder(String expression) => 'builder.text($expression);';
  /// ```
  String generateBuilder(String expression, {String builder = 'builder'});
}
