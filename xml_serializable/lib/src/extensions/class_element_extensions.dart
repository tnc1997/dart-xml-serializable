import 'package:analyzer/dart/element/element.dart';
import 'package:xml_serializable/src/type_checkers/xml_root_element_type_checker.dart';
import 'package:xml_serializable/src/type_checkers/xml_serializable_type_checker.dart';

extension ClassElementExtensions on ClassElement {
  bool get hasXmlRootElement => xmlRootElementTypeChecker.hasAnnotationOf(this);

  bool get hasXmlSerializable =>
      xmlSerializableTypeChecker.hasAnnotationOf(this);
}
