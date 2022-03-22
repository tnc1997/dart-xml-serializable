import 'package:analyzer/dart/element/element.dart';

extension ElementAnnotationExtensions on ElementAnnotation {
  /// Returns `true` if this annotation marks the associated member as being serializable as an `XmlAttribute`.
  bool get isXmlAttribute {
    final element = this.element;

    if (element is ConstructorElement) {
      return element.library.identifier.startsWith('package:xml_annotation') &&
          element.enclosingElement.name == 'XmlAttribute';
    } else if (element is PropertyAccessorElement) {
      return element.library.identifier.startsWith('package:xml_annotation') &&
          element.name == 'xmlAttribute';
    } else {
      return false;
    }
  }

  /// Returns `true` if this annotation marks the associated member as being serializable as an `XmlElement`.
  bool get isXmlElement {
    final element = this.element;

    if (element is ConstructorElement) {
      return element.library.identifier.startsWith('package:xml_annotation') &&
          element.enclosingElement.name == 'XmlElement';
    } else if (element is PropertyAccessorElement) {
      return element.library.identifier.startsWith('package:xml_annotation') &&
          element.name == 'xmlElement';
    } else {
      return false;
    }
  }

  /// Returns `true` if this annotation marks the associated member as being serializable as an `XmlRootElement`.
  bool get isXmlRootElement {
    final element = this.element;

    if (element is ConstructorElement) {
      return element.library.identifier.startsWith('package:xml_annotation') &&
          element.enclosingElement.name == 'XmlRootElement';
    } else if (element is PropertyAccessorElement) {
      return element.library.identifier.startsWith('package:xml_annotation') &&
          element.name == 'xmlRootElement';
    } else {
      return false;
    }
  }

  /// Returns `true` if this annotation marks the associated member as being serializable using `xml_serializable`.
  bool get isXmlSerializable {
    final element = this.element;

    if (element is ConstructorElement) {
      return element.library.identifier.startsWith('package:xml_annotation') &&
          element.enclosingElement.name == 'XmlSerializable';
    } else if (element is PropertyAccessorElement) {
      return element.library.identifier.startsWith('package:xml_annotation') &&
          element.name == 'xmlSerializable';
    } else {
      return false;
    }
  }

  /// Returns `true` if this annotation marks the associated member as being serializable as an `XmlText`.
  bool get isXmlText {
    final element = this.element;

    if (element is ConstructorElement) {
      return element.library.identifier.startsWith('package:xml_annotation') &&
          element.enclosingElement.name == 'XmlText';
    } else if (element is PropertyAccessorElement) {
      return element.library.identifier.startsWith('package:xml_annotation') &&
          element.name == 'xmlText';
    } else {
      return false;
    }
  }
}
