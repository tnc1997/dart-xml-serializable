import 'package:analyzer/dart/element/element.dart';

extension ElementAnnotationExtensions on ElementAnnotation {
  /// Returns `true` if this annotation marks the associated member as being serializable as an `XmlAttribute`.
  bool get isXmlAttribute {
    final element = this.element;

    return element is ConstructorElement &&
        element.library.identifier.startsWith('package:xml_annotation') &&
        element.enclosingElement3.name == 'XmlAttribute';
  }

  /// Returns `true` if this annotation marks the associated member as being serializable as an `XmlCDATA`.
  bool get isXmlCDATA {
    final element = this.element;

    return element is ConstructorElement &&
        element.library.identifier.startsWith('package:xml_annotation') &&
        element.enclosingElement3.name == 'XmlCDATA';
  }

  /// Returns `true` if this annotation marks the associated member as being serializable as an `XmlElement`.
  bool get isXmlElement {
    final element = this.element;

    return element is ConstructorElement &&
        element.library.identifier.startsWith('package:xml_annotation') &&
        element.enclosingElement3.name == 'XmlElement';
  }

  /// Returns `true` if this annotation marks the associated member as being serializable as an `XmlEnum`.
  bool get isXmlEnum {
    final element = this.element;

    return element is ConstructorElement &&
        element.library.identifier.startsWith('package:xml_annotation') &&
        element.enclosingElement3.name == 'XmlEnum';
  }

  /// Returns `true` if this annotation marks the associated member as being serializable as an `XmlRootElement`.
  bool get isXmlRootElement {
    final element = this.element;

    return element is ConstructorElement &&
        element.library.identifier.startsWith('package:xml_annotation') &&
        element.enclosingElement3.name == 'XmlRootElement';
  }

  /// Returns `true` if this annotation marks the associated member as being serializable using `xml_serializable`.
  bool get isXmlSerializable {
    final element = this.element;

    return element is ConstructorElement &&
        element.library.identifier.startsWith('package:xml_annotation') &&
        element.enclosingElement3.name == 'XmlSerializable';
  }

  /// Returns `true` if this annotation marks the associated member as being serializable as an `XmlText`.
  bool get isXmlText {
    final element = this.element;

    return element is ConstructorElement &&
        element.library.identifier.startsWith('package:xml_annotation') &&
        element.enclosingElement3.name == 'XmlText';
  }

  /// Returns `true` if this annotation marks the associated member as being serializable as an `XmlValue`.
  bool get isXmlValue {
    final element = this.element;

    return element is ConstructorElement &&
        element.library.identifier.startsWith('package:xml_annotation') &&
        element.enclosingElement3.name == 'XmlValue';
  }
}
