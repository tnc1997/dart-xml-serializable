import 'package:analyzer/dart/element/element.dart';
import 'package:xml_annotation/xml_annotation.dart';
import 'package:xml_serializable/src/type_checkers/xml_attribute_type_checker.dart';
import 'package:xml_serializable/src/type_checkers/xml_element_type_checker.dart';
import 'package:xml_serializable/src/type_checkers/xml_root_element_type_checker.dart';
import 'package:xml_serializable/src/type_checkers/xml_serializable_type_checker.dart';
import 'package:xml_serializable/src/type_checkers/xml_text_type_checker.dart';

extension ElementExtensions on Element {
  /// Returns `true` if this element has an [XmlAttribute] annotation.
  bool get hasXmlAttribute => xmlAttributeTypeChecker.hasAnnotationOf(this);

  /// Returns `true` if this element has an [XmlElement] annotation.
  bool get hasXmlElement => xmlElementTypeChecker.hasAnnotationOf(this);

  /// Returns `true` if this element has an [XmlRootElement] annotation.
  bool get hasXmlRootElement => xmlRootElementTypeChecker.hasAnnotationOf(this);

  /// Returns `true` if this element has an [XmlSerializable] annotation.
  bool get hasXmlSerializable =>
      xmlSerializableTypeChecker.hasAnnotationOf(this);

  /// Returns `true` if this element has an [XmlText] annotation.
  bool get hasXmlText => xmlTextTypeChecker.hasAnnotationOf(this);
}
