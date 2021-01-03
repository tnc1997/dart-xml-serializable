import 'package:xml/xml.dart';

extension NamespaceMapExtensions on Map<String, String?> {
  /// Converts this namespace map to a list of attributes.
  Iterable<XmlAttribute> toXmlAttributes() sync* {
    for (final entry in entries) {
      final key = entry.key;
      final value = entry.value;

      yield XmlAttribute(
        value != null ? XmlName(value, 'xmlns') : XmlName('xmlns'),
        key,
      );
    }
  }
}
