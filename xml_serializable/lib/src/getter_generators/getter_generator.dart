/// Defines methods for generating getters for representations of types for example:
///
/// ```dart
/// class XmlTextGetterGenerator extends GetterGenerator {
///   const XmlTextGetterGenerator();
///
///   @override
///   String generateGetter(String expression) => '$expression.getText()';
/// }
/// ```
///
/// It is recommended to use a [GetterGenerator] in combination with a [SerializerGenerator] for example:
///
/// ```dart
/// // Deserializes an instance of an int type from the text of an XML element.
/// buffer.write('final value = ${IntSerializerGenerator().generateDeserializer(XmlTextGetterGenerator().generateGetter('element'))};');
/// ```
abstract class GetterGenerator {
  /// Constructs a [GetterGenerator].
  const GetterGenerator();

  /// Generates code that gets a representation of the type from an [expression] representing an [XmlElement].
  ///
  /// The representation of the type should be a [String] or [XmlElement] that can be deserialized by a [SerializerGenerator].
  ///
  /// An implementation to get a representation of the type from the text of an XML element could be as simple as:
  ///
  /// ```dart
  /// String generateGetter(String expression) => '$expression.getText()';
  /// ```
  String generateGetter(String expression);
}
