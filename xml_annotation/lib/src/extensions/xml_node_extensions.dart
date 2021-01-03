import 'package:xml/xml.dart';

extension XmlNodeExtensions on XmlNode {
  /// Finds the text of the recursive child elements in document order with the [name] and [namespace].
  Iterable<String> findAllElementsText(String name, {String? namespace}) sync* {
    for (final element in findAllElements(name, namespace: namespace)) {
      final text = element.getText();
      if (text != null) yield text;
    }
  }

  /// Finds the text of the direct child elements in document order with the [name] and [namespace].
  Iterable<String> findElementsText(String name, {String? namespace}) sync* {
    for (final element in findElements(name, namespace: namespace)) {
      final text = element.getText();
      if (text != null) yield text;
    }
  }

  /// Gets the text of the first child element with the [name] and [namespace] or `null` if there are no `XmlText` children.
  String? getElementText(String name, {String? namespace}) {
    return getElement(name, namespace: namespace)?.getText();
  }

  /// Gets the text or `null` if there are no `XmlText` children.
  String? getText() {
    final texts = children.whereType<XmlText>().map((e) => e.text);
    return texts.isNotEmpty ? texts.join() : null;
  }
}
