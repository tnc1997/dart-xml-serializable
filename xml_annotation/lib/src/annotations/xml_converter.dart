/// Implement this class to provide custom converters for a specific [Type].
///
/// [T] is the data type you'd like to convert to and from.
///
/// An implementation to convert a [base64Binary](https://www.w3.org/TR/xmlschema-2/#base64Binary) value to and from a [Uint8List] could be as simple as:
///
/// ```dart
/// class Base64BinaryConverter implements XmlConverter<Uint8List> {
///   @override
///   Uint8List fromXml(String value) => base64.decode(value);
///
///   @override
///   String toXml(Uint8List instance) => base64.encode(instance);
/// }
/// ```
///
/// [XmlConverter]s can be placed either on a class:
///
/// ```dart
/// @Base64BinaryConverter()
/// @XmlSerializable()
/// class Example {
///   @XmlText()
///   Uint8List? text;
/// }
/// ```
///
/// or on a property:
///
/// ```dart
/// @XmlSerializable()
/// class Example {
///   @Base64BinaryConverter()
///   @XmlText()
///   Uint8List? text;
/// }
/// ```
abstract class XmlConverter<T> {
  const XmlConverter();

  T fromXml(String value);

  String toXml(T instance);
}
