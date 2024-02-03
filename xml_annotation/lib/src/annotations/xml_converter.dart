import 'package:xml/xml.dart';

/// Implement this class to provide custom converters for a specific [Type].
///
/// [T] is the data type you'd like to convert to and from.
///
/// An implementation to convert an XML element to and from a [Title] could be as simple as:
///
/// ```dart
/// class Title {
///   String? language;
///   String? text;
///
///   Title({
///     this.language,
///     this.text,
///   });
/// }
///
/// class TitleConverter implements XmlConverter<Title> {
///   const TitleConverter();
///
///   @override
///   void buildXmlChildren(
///     Title instance,
///     XmlBuilder builder, {
///     Map<String, String> namespaces = const {},
///   }) {
///     if (instance.language case final language?) {
///       builder.attribute('lang', language);
///     }
///
///     if (instance.text case final text?) {
///       builder.text(text);
///     }
///   }
///
///   @override
///   Title fromXmlElement(
///     XmlElement element,
///   ) {
///     return Title(
///       language: element.getAttribute('lang'),
///       text: element.getText(),
///     );
///   }
///
///   @override
///   List<XmlAttribute> toXmlAttributes(
///     Title instance, {
///     Map<String, String?> namespaces = const {},
///   }) {
///     final attributes = <XmlAttribute>[];
///
///     if (instance.language case final language?) {
///       attributes.add(
///         XmlAttribute(
///           XmlName('lang'),
///           language,
///         ),
///       );
///     }
///
///     return attributes;
///   }
///
///   @override
///   List<XmlNode> toXmlChildren(
///     Title instance, {
///     Map<String, String?> namespaces = const {},
///   }) {
///     final children = <XmlNode>[];
///
///     if (instance.text case final text?) {
///       children.add(
///         XmlText(
///           text,
///         ),
///       );
///     }
///
///     return children;
///   }
/// }
/// ```
///
/// [XmlConverter]s can be placed either on a class:
///
/// ```dart
/// @TitleConverter()
/// @XmlSerializable()
/// class Book {
///   @XmlElement()
///   Title? title;
/// }
/// ```
///
/// or on a property:
///
/// ```dart
/// @XmlSerializable()
/// class Book {
///   @TitleConverter()
///   @XmlElement()
///   Title? title;
/// }
/// ```
abstract class XmlConverter<T> {
  const XmlConverter();

  void buildXmlChildren(
    T instance,
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  });

  T fromXmlElement(
    XmlElement element,
  );

  List<XmlAttribute> toXmlAttributes(
    T instance, {
    Map<String, String?> namespaces = const {},
  });

  List<XmlNode> toXmlChildren(
    T instance, {
    Map<String, String?> namespaces = const {},
  });
}
