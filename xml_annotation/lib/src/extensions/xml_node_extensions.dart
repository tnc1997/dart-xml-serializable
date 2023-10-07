import 'package:xml/xml.dart';

extension XmlNodeExtensions on XmlNode {
  /// Finds the CDATA of the recursive child elements in document order with the [name] and [namespace].
  @Deprecated(
    'Use findAllElements(name, namespace: namespace).map((e) => e.getCDATA()).whereType<String>() instead.',
  )
  Iterable<String> findAllElementsCDATA(String name, {String? namespace}) sync* {
    for (final element in findAllElements(name, namespace: namespace)) {
      final cdata = element.getCDATA();
      if (cdata != null) yield cdata;
    }
  }

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

  /// Finds the CDATA of the direct child elements in document order with the [name] and [namespace].
  @Deprecated(
    'Use findElements(name, namespace: namespace).map((e) => e.getCDATA()).whereType<String>() instead.',
  )
  Iterable<String> findElementsCDATA(String name, {String? namespace}) sync* {
    for (final element in findElements(name, namespace: namespace)) {
      final cdata = element.getCDATA();
      if (cdata != null) yield cdata;
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

  /// Gets the CDATA of the first child element with the [name] and [namespace] or `null` if there are no `XmlCDATA` children.
  @Deprecated(
    'Use getElement(name, namespace: namespace).getCDATA() instead.',
  )
  String? getElementCDATA(String name, {String? namespace}) {
    return getElement(name, namespace: namespace)?.getCDATA();
  }

  /// Gets the text of the first child element with the [name] and [namespace] or `null` if there are no `XmlText` children.
  @Deprecated(
    'Use getElement(name, namespace: namespace).getText() instead.',
  )
  String? getElementText(String name, {String? namespace}) {
    return getElement(name, namespace: namespace)?.getText();
  }

  /// Gets the CDATA or `null` if there are no `XmlCDATA` children.
  String? getCDATA() {
    final cdatas = children.whereType<XmlCDATA>().map((e) => e.value);
    return cdatas.isNotEmpty ? cdatas.join() : null;
  }

  /// Gets the _direct_ child elements in document order with the specified tag `name` and `namespace` or `null` if there are no matching elements.
  Iterable<XmlElement>? getElements(String name, {String? namespace}) {
    final elements = findElements(name, namespace: namespace);
    return elements.isNotEmpty ? elements : null;
  }

  /// Gets the text or `null` if there are no `XmlText` children.
  String? getText() {
    final texts = children.whereType<XmlText>().map((e) => e.value);
    return texts.isNotEmpty ? texts.join() : null;
  }
}
