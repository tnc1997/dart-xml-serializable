import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';

import 'element_annotation_extensions.dart';

extension ElementExtensions on Element {
  /// Gets the annotation of the form `@XmlAttribute()`. Throws a [StateError] if this element does not have an annotation of the form `@XmlAttribute()`. Returns `null` if the value of the annotation could not be computed because of errors.
  DartObject? getXmlAttribute() =>
      metadata.singleWhere((e) => e.isXmlAttribute).computeConstantValue();

  /// Gets the annotation of the form `@XmlCDATA()`. Throws a [StateError] if this element does not have an annotation of the form `@XmlCDATA()`. Returns `null` if the value of the annotation could not be computed because of errors.
  DartObject? getXmlCDATA() =>
      metadata.singleWhere((e) => e.isXmlCDATA).computeConstantValue();

  /// Gets the annotation of the form `@XmlElement()`. Throws a [StateError] if this element does not have an annotation of the form `@XmlElement()`. Returns `null` if the value of the annotation could not be computed because of errors.
  DartObject? getXmlElement() =>
      metadata.singleWhere((e) => e.isXmlElement).computeConstantValue();

  /// Gets the annotation of the form `@XmlEnum()`. Throws a [StateError] if this element does not have an annotation of the form `@XmlEnum()`. Returns `null` if the value of the annotation could not be computed because of errors.
  DartObject? getXmlEnum() =>
      metadata.singleWhere((e) => e.isXmlEnum).computeConstantValue();

  /// Gets the annotation of the form `@XmlRootElement()`. Throws a [StateError] if this element does not have an annotation of the form `@XmlRootElement()`. Returns `null` if the value of the annotation could not be computed because of errors.
  DartObject? getXmlRootElement() =>
      metadata.singleWhere((e) => e.isXmlRootElement).computeConstantValue();

  /// Gets the annotation of the form `@XmlSerializable()`. Throws a [StateError] if this element does not have an annotation of the form `@XmlSerializable()`. Returns `null` if the value of the annotation could not be computed because of errors.
  DartObject? getXmlSerializable() =>
      metadata.singleWhere((e) => e.isXmlSerializable).computeConstantValue();

  /// Gets the annotation of the form `@XmlText()`. Throws a [StateError] if this element does not have an annotation of the form `@XmlText()`. Returns `null` if the value of the annotation could not be computed because of errors.
  DartObject? getXmlText() =>
      metadata.singleWhere((e) => e.isXmlText).computeConstantValue();

  /// Gets the annotation of the form `@XmlValue()`. Throws a [StateError] if this element does not have an annotation of the form `@XmlValue()`. Returns `null` if the value of the annotation could not be computed because of errors.
  DartObject? getXmlValue() =>
      metadata.singleWhere((e) => e.isXmlValue).computeConstantValue();

  /// Returns `true` if this element has an annotation of the form `@XmlAttribute()`.
  bool get hasXmlAttribute => metadata.any((e) => e.isXmlAttribute);

  /// Returns `true` if this element has an annotation of the form `@XmlCDATA()`.
  bool get hasXmlCDATA => metadata.any((e) => e.isXmlCDATA);

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
