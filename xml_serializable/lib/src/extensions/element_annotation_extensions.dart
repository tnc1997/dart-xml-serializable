import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';

import 'dart_type_extensions.dart';

extension ElementAnnotationExtensions on ElementAnnotation {
  /// Returns `true` if this annotation marks the associated member as being serializable as an `XmlAttribute`.
  bool get isXmlAttribute {
    final element = this.element;
    if (element is ConstructorElement) {
      return element.enclosingElement.thisType.isXmlAnnotationXmlAttribute;
    } else if (element is PropertyAccessorElement) {
      return element.returnType.isXmlAnnotationXmlAttribute;
    }

    return false;
  }

  /// Returns `true` if this annotation marks the associated member as being serializable as an `XmlCDATA`.
  bool get isXmlCDATA {
    final element = this.element;
    if (element is ConstructorElement) {
      return element.enclosingElement.thisType.isXmlAnnotationXmlCDATA;
    } else if (element is PropertyAccessorElement) {
      return element.returnType.isXmlAnnotationXmlCDATA;
    }

    return false;
  }

  /// Returns `true` if this annotation marks the associated member as being serializable as an `XmlElement`.
  bool get isXmlElement {
    final element = this.element;
    if (element is ConstructorElement) {
      return element.enclosingElement.thisType.isXmlAnnotationXmlElement;
    } else if (element is PropertyAccessorElement) {
      return element.returnType.isXmlAnnotationXmlElement;
    }

    return false;
  }

  /// Returns `true` if this annotation marks the associated member as being serializable as an `XmlEnum`.
  bool get isXmlEnum {
    final element = this.element;
    if (element is ConstructorElement) {
      return element.enclosingElement.thisType.isXmlAnnotationXmlEnum;
    } else if (element is PropertyAccessorElement) {
      return element.returnType.isXmlAnnotationXmlEnum;
    }

    return false;
  }

  /// Returns `true` if this annotation marks the associated member as being serializable as an `XmlRootElement`.
  bool get isXmlRootElement {
    final element = this.element;
    if (element is ConstructorElement) {
      return element.enclosingElement.thisType.isXmlAnnotationXmlRootElement;
    } else if (element is PropertyAccessorElement) {
      return element.returnType.isXmlAnnotationXmlRootElement;
    }

    return false;
  }

  /// Returns `true` if this annotation marks the associated member as being serializable using `xml_serializable`.
  bool get isXmlSerializable {
    final element = this.element;
    if (element is ConstructorElement) {
      return element.enclosingElement.thisType.isXmlAnnotationXmlSerializable;
    } else if (element is PropertyAccessorElement) {
      return element.returnType.isXmlAnnotationXmlSerializable;
    }

    return false;
  }

  /// Returns `true` if this annotation marks the associated member as being serializable as an `XmlText`.
  bool get isXmlText {
    final element = this.element;
    if (element is ConstructorElement) {
      return element.enclosingElement.thisType.isXmlAnnotationXmlText;
    } else if (element is PropertyAccessorElement) {
      return element.returnType.isXmlAnnotationXmlText;
    }

    return false;
  }

  /// Returns `true` if this annotation marks the associated member as being serializable as an `XmlValue`.
  bool get isXmlValue {
    final element = this.element;
    if (element is ConstructorElement) {
      return element.enclosingElement.thisType.isXmlAnnotationXmlValue;
    } else if (element is PropertyAccessorElement) {
      return element.returnType.isXmlAnnotationXmlValue;
    }

    return false;
  }

  /// Returns `true` if this annotation marks the associated member as being convertible using an `XmlConverter`.
  bool isXmlConverter({
    DartType? type,
  }) {
    final element = this.element;
    if (element is ConstructorElement) {
      return element.enclosingElement.thisType.isXmlAnnotationXmlConverter(
        type: type,
      );
    } else if (element is PropertyAccessorElement) {
      return element.returnType.isXmlAnnotationXmlConverter(
        type: type,
      );
    }

    return false;
  }
}
