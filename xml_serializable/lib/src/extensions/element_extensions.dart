import 'package:analyzer/dart/element/element.dart';
import 'package:xml_serializable/src/type_checkers/xml_attribute_type_checker.dart';
import 'package:xml_serializable/src/type_checkers/xml_element_type_checker.dart';
import 'package:xml_serializable/src/type_checkers/xml_root_element_type_checker.dart';
import 'package:xml_serializable/src/type_checkers/xml_serializable_type_checker.dart';
import 'package:xml_serializable/src/type_checkers/xml_text_type_checker.dart';

extension ElementExtensions on Element {
  bool get hasXmlAttribute => xmlAttributeTypeChecker.hasAnnotationOf(this);

  bool get hasXmlElement => xmlElementTypeChecker.hasAnnotationOf(this);

  bool get hasXmlRootElement => xmlRootElementTypeChecker.hasAnnotationOf(this);

  bool get hasXmlSerializable =>
      xmlSerializableTypeChecker.hasAnnotationOf(this);

  bool get hasXmlText => xmlTextTypeChecker.hasAnnotationOf(this);
}
