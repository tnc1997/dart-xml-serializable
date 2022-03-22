/// Defines methods for generating constructors for representations of types for example:
///
/// ```dart
/// class XmlTextConstructorGenerator extends ConstructorGenerator {
///   const XmlTextConstructorGenerator();
///
///   @override
///   String generateConstructor(String expression) => 'XmlText($expression)';
/// }
/// ```
///
/// It is recommended to use a [ConstructorGenerator] in combination with a [SerializerGenerator] for example:
///
/// ```dart
/// // Constructs an XML text with a serialized instance of an int type.
/// buffer.write('final value = ${XmlTextConstructorGenerator().generateConstructor(IntSerializerGenerator().generateSerializer('element'))};');
/// ```
abstract class ConstructorGenerator {
  /// Constructs a [ConstructorGenerator].
  const ConstructorGenerator();

  /// Generates code that constructs a representation of the type from an [expression] as an XML attribute / XML element / XML text.
  ///
  /// An implementation to construct a representation of the type as an XML text could be as simple as:
  ///
  /// ```dart
  /// String generateConstructor(String expression) => 'XmlText($expression)';
  /// ```
  String generateConstructor(String expression);
}
