import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';

import 'dart_type_extensions.dart';
import 'element_annotation_extensions.dart';

extension ElementExtensions on Element {
  /// Gets the annotation of the form `@XmlAttribute()`. Throws a [StateError] if this element does not have an annotation of the form `@XmlAttribute()`. Returns `null` if the value of the annotation could not be computed because of errors.
  DartObject? getXmlAttribute() =>
      metadata.singleWhere((e) => e.isXmlAttribute).computeConstantValue();

  /// Gets the element that represents the class `XmlAttribute` as an annotation on this element for example:
  ///
  /// ```dart
  /// class Book {
  ///   @XmlAttribute()
  ///   String? title;
  /// }
  /// ```
  Element? getXmlAttributeElement() {
    for (final annotation in metadata) {
      if (annotation.isXmlAttribute) {
        final element = annotation.element;
        if (element is ConstructorElement) {
          return element.enclosingElement;
        } else if (element is PropertyAccessorElement) {
          return element.returnType.element;
        }
      }
    }

    return null;
  }

  /// Gets the annotation of the form `@XmlCDATA()`. Throws a [StateError] if this element does not have an annotation of the form `@XmlCDATA()`. Returns `null` if the value of the annotation could not be computed because of errors.
  DartObject? getXmlCDATA() =>
      metadata.singleWhere((e) => e.isXmlCDATA).computeConstantValue();

  /// Gets the element that represents the class `XmlCDATA` as an annotation on this element for example:
  ///
  /// ```dart
  /// class Book {
  ///   @XmlCDATA()
  ///   String? title;
  /// }
  /// ```
  Element? getXmlCDATAElement() {
    for (final annotation in metadata) {
      if (annotation.isXmlCDATA) {
        final element = annotation.element;
        if (element is ConstructorElement) {
          return element.enclosingElement;
        } else if (element is PropertyAccessorElement) {
          return element.returnType.element;
        }
      }
    }

    return null;
  }

  /// Gets the annotation that implements `XmlConverter` and can convert the [type] as an annotation on this element for example:
  ///
  /// ```dart
  /// class Book {
  ///   @TitleConverter()
  ///   Title? title;
  /// }
  /// ```
  ///
  /// or as an annotation on the class of this element for example:
  ///
  /// ```dart
  /// @TitleConverter()
  /// class Book {
  ///   Title? title;
  /// }
  /// ```
  ///
  /// Throws a [StateError] if this element does not have an annotation that implements `XmlConverter` and can convert the [type]. Returns `null` if the value of the annotation could not be computed because of errors.
  DartObject? getXmlConverter({
    DartType? type,
  }) {
    for (var annotation in metadata) {
      if (annotation.isXmlConverter(type: type)) {
        return annotation.computeConstantValue();
      }
    }

    final enclosingElement = this.enclosingElement;
    if (enclosingElement != null) {
      for (var annotation in metadata) {
        if (annotation.isXmlConverter(type: type)) {
          return annotation.computeConstantValue();
        }
      }
    }

    throw StateError("No element");
  }

  /// Gets the element that represents the class that can convert the [type] as an annotation on this element for example:
  ///
  /// ```dart
  /// class Book {
  ///   @TitleConverter()
  ///   Title? title;
  /// }
  /// ```
  ///
  /// or as an annotation on the class of this element for example:
  ///
  /// ```dart
  /// @TitleConverter()
  /// class Book {
  ///   Title? title;
  /// }
  /// ```
  ///
  /// or as a converter that is contained within the annotation of the form `@XmlSerializable(converters: [...])` for example:
  ///
  /// ```dart
  /// @XmlSerializable(converters: [TitleConverter()])
  /// class Book {
  ///   Title? title;
  /// }
  /// ```
  Element? getXmlConverterElement({
    DartType? type,
  }) {
    for (final annotation in metadata) {
      if (annotation.isXmlConverter(type: type)) {
        final element = annotation.element;
        if (element is ConstructorElement) {
          return element.enclosingElement;
        } else if (element is PropertyAccessorElement) {
          return element.returnType.element;
        }
      }
    }

    final enclosingElement = this.enclosingElement;
    if (enclosingElement != null) {
      for (final annotation in enclosingElement.metadata) {
        if (annotation.isXmlConverter(type: type)) {
          final element = annotation.element;
          if (element is ConstructorElement) {
            return element.enclosingElement;
          } else if (element is PropertyAccessorElement) {
            return element.returnType.element;
          }
        }

        if (annotation.isXmlSerializable) {
          final converters = annotation
              .computeConstantValue()
              ?.getField('converters')
              ?.toListValue();
          if (converters != null) {
            for (final converter in converters) {
              if (converter.type!.isXmlAnnotationXmlConverter(type: type)) {
                return converter.type!.element;
              }
            }
          }
        }
      }
    }

    return null;
  }

  /// Gets the annotation of the form `@XmlElement()`. Throws a [StateError] if this element does not have an annotation of the form `@XmlElement()`. Returns `null` if the value of the annotation could not be computed because of errors.
  DartObject? getXmlElement() =>
      metadata.singleWhere((e) => e.isXmlElement).computeConstantValue();

  /// Gets the element that represents the class `XmlElement` as an annotation on this element for example:
  ///
  /// ```dart
  /// class Book {
  ///   @XmlElement()
  ///   String? title;
  /// }
  /// ```
  Element? getXmlElementElement() {
    for (final annotation in metadata) {
      if (annotation.isXmlElement) {
        final element = annotation.element;
        if (element is ConstructorElement) {
          return element.enclosingElement;
        } else if (element is PropertyAccessorElement) {
          return element.returnType.element;
        }
      }
    }

    return null;
  }

  /// Gets the annotation of the form `@XmlEnum()`. Throws a [StateError] if this element does not have an annotation of the form `@XmlEnum()`. Returns `null` if the value of the annotation could not be computed because of errors.
  DartObject? getXmlEnum() =>
      metadata.singleWhere((e) => e.isXmlEnum).computeConstantValue();

  /// Gets the element that represents the class `XmlEnum` as an annotation on this element for example:
  ///
  /// ```dart
  /// @XmlEnum()
  /// enum Language {
  ///   english,
  /// }
  /// ```
  Element? getXmlEnumElement() {
    for (final annotation in metadata) {
      if (annotation.isXmlEnum) {
        final element = annotation.element;
        if (element is ConstructorElement) {
          return element.enclosingElement;
        } else if (element is PropertyAccessorElement) {
          return element.returnType.element;
        }
      }
    }

    return null;
  }

  /// Gets the annotation of the form `@XmlRootElement()`. Throws a [StateError] if this element does not have an annotation of the form `@XmlRootElement()`. Returns `null` if the value of the annotation could not be computed because of errors.
  DartObject? getXmlRootElement() =>
      metadata.singleWhere((e) => e.isXmlRootElement).computeConstantValue();

  /// Gets the element that represents the class `XmlRootElement` as an annotation on this element for example:
  ///
  /// ```dart
  /// @XmlRootElement()
  /// class Book {
  ///   String? title;
  /// }
  /// ```
  Element? getXmlRootElementElement() {
    for (final annotation in metadata) {
      if (annotation.isXmlRootElement) {
        final element = annotation.element;
        if (element is ConstructorElement) {
          return element.enclosingElement;
        } else if (element is PropertyAccessorElement) {
          return element.returnType.element;
        }
      }
    }

    return null;
  }

  /// Gets the annotation of the form `@XmlSerializable()`. Throws a [StateError] if this element does not have an annotation of the form `@XmlSerializable()`. Returns `null` if the value of the annotation could not be computed because of errors.
  DartObject? getXmlSerializable() =>
      metadata.singleWhere((e) => e.isXmlSerializable).computeConstantValue();

  /// Gets the element that represents the class `XmlSerializable` as an annotation on this element for example:
  ///
  /// ```dart
  /// @XmlSerializable()
  /// class Book {
  ///   String? title;
  /// }
  /// ```
  Element? getXmlSerializableElement() {
    for (final annotation in metadata) {
      if (annotation.isXmlSerializable) {
        final element = annotation.element;
        if (element is ConstructorElement) {
          return element.enclosingElement;
        } else if (element is PropertyAccessorElement) {
          return element.returnType.element;
        }
      }
    }

    return null;
  }

  /// Gets the annotation of the form `@XmlText()`. Throws a [StateError] if this element does not have an annotation of the form `@XmlText()`. Returns `null` if the value of the annotation could not be computed because of errors.
  DartObject? getXmlText() =>
      metadata.singleWhere((e) => e.isXmlText).computeConstantValue();

  /// Gets the element that represents the class `XmlText` as an annotation on this element for example:
  ///
  /// ```dart
  /// class Book {
  ///   @XmlText()
  ///   String? title;
  /// }
  /// ```
  Element? getXmlTextElement() {
    for (final annotation in metadata) {
      if (annotation.isXmlText) {
        final element = annotation.element;
        if (element is ConstructorElement) {
          return element.enclosingElement;
        } else if (element is PropertyAccessorElement) {
          return element.returnType.element;
        }
      }
    }

    return null;
  }

  /// Gets the annotation of the form `@XmlValue()`. Throws a [StateError] if this element does not have an annotation of the form `@XmlValue()`. Returns `null` if the value of the annotation could not be computed because of errors.
  DartObject? getXmlValue() =>
      metadata.singleWhere((e) => e.isXmlValue).computeConstantValue();

  /// Gets the element that represents the class `XmlValue` as an annotation on this element for example:
  ///
  /// ```dart
  /// enum Language {
  ///   @XmlValue('English')
  ///   english,
  /// }
  /// ```
  Element? getXmlValueElement() {
    for (final annotation in metadata) {
      if (annotation.isXmlValue) {
        final element = annotation.element;
        if (element is ConstructorElement) {
          return element.enclosingElement;
        } else if (element is PropertyAccessorElement) {
          return element.returnType.element;
        }
      }
    }

    return null;
  }

  /// Returns `true` if this element has an annotation of the form `@XmlAttribute()`.
  bool get hasXmlAttribute => metadata.any((e) => e.isXmlAttribute);

  /// Returns `true` if this element has an annotation of the form `@XmlCDATA()`.
  bool get hasXmlCDATA => metadata.any((e) => e.isXmlCDATA);

  /// Returns `true` if this element has an annotation that implements `XmlConverter` and can convert the [type] for example:
  ///
  /// ```dart
  /// class Book {
  ///   @TitleConverter()
  ///   Title? title;
  /// }
  /// ```
  ///
  /// or the class of this element has an annotation that implements `XmlConverter` and can convert the [type] for example:
  ///
  /// ```dart
  /// @TitleConverter()
  /// class Book {
  ///   Title? title;
  /// }
  /// ```
  bool hasXmlConverter({
    DartType? type,
  }) {
    for (var annotation in metadata) {
      if (annotation.isXmlConverter(type: type)) {
        return true;
      }
    }

    final enclosingElement = this.enclosingElement;
    if (enclosingElement != null) {
      for (var annotation in metadata) {
        if (annotation.isXmlConverter(type: type)) {
          return true;
        }
      }
    }

    return false;
  }

  /// Returns `true` if this element has an annotation of the form `@XmlElement()`.
  bool get hasXmlElement => metadata.any((e) => e.isXmlElement);

  /// Returns `true` if this element has an annotation of the form `@XmlEnum()`.
  bool get hasXmlEnum => metadata.any((e) => e.isXmlEnum);

  /// Returns `true` if this element has an annotation of the form `@XmlRootElement()`.
  bool get hasXmlRootElement => metadata.any((e) => e.isXmlRootElement);

  /// Returns `true` if this element has an annotation of the form `@XmlSerializable()`.
  bool get hasXmlSerializable => metadata.any((e) => e.isXmlSerializable);

  /// Returns `true` if this element has an annotation of the form `@XmlText()`.
  bool get hasXmlText => metadata.any((e) => e.isXmlText);

  /// Returns `true` if this element has an annotation of the form `@XmlValue()`.
  bool get hasXmlValue => metadata.any((e) => e.isXmlValue);
}
