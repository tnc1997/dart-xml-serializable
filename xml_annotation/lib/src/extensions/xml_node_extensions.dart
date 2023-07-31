import 'package:xml/xml.dart';

extension XmlNodeExtensions on XmlNode {
  /// Finds the text of the recursive child elements in document order with the [name] and [namespace].
  @Deprecated(
    'Use findAllElements(name, namespace: namespace).map((e) => e.getText()).whereType<String>() instead.',
  )
  Iterable<String> findAllElementsText(String name, {String? namespace}) sync* {
    for (final element in findAllElements(name, namespace: namespace)) {
      final text = element.getText();
      if (text != null) yield text;
    }
  }

  /// Finds the text of the direct child elements in document order with the [name] and [namespace].
  @Deprecated(
    'Use findElements(name, namespace: namespace).map((e) => e.getText()).whereType<String>() instead.',
  )
  Iterable<String> findElementsText(String name, {String? namespace}) sync* {
    for (final element in findElements(name, namespace: namespace)) {
      final text = element.getText();
      if (text != null) yield text;
    }
  }

  /// Gets the text of the first child element with the [name] and [namespace] or `null` if there are no `XmlText` children.
  @Deprecated(
    'Use getElement(name, namespace: namespace).getText() instead.',
  )
  String? getElementText(String name, {String? namespace}) {
    return getElement(name, namespace: namespace)?.getText();
  }

  /// Gets the _direct_ child elements in document order with the specified tag `name` and `namespace` or `null` if there are no matching elements.
  Iterable<XmlElement>? getElements(String name, {String? namespace}) {
    final elements = findElements(name, namespace: namespace);
    return elements.isNotEmpty ? elements : null;
  }

  /// Gets the text or `null` if there are no `XmlText` and `XmlCDATA` children.
  String? getText() {
    final texts = children
        .where((element) => [XmlText, XmlCDATA].contains(element.runtimeType))
        .map((e) => e.text);
    return texts.isNotEmpty ? texts.join() : null;
  }
}
