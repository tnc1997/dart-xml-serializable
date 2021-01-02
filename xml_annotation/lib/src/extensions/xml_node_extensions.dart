import 'package:xml/xml.dart';

extension XmlNodeExtensions on XmlNode {
  Iterable<String> findAllElementsText(String name, {String? namespace}) sync* {
    for (final element in findAllElements(name, namespace: namespace)) {
      final text = element.getText();
      if (text != null) yield text;
    }
  }

  Iterable<String> findElementsText(String name, {String? namespace}) sync* {
    for (final element in findElements(name, namespace: namespace)) {
      final text = element.getText();
      if (text != null) yield text;
    }
  }

  String? getElementText(String name, {String? namespace}) {
    return getElement(name, namespace: namespace)?.getText();
  }

  String? getText() {
    final texts = children.whereType<XmlText>().map((e) => e.text);
    return texts.isNotEmpty ? texts.join() : null;
  }
}
