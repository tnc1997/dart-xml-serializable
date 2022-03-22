import 'package:source_gen/source_gen.dart';
import 'package:xml_annotation/xml_annotation.dart';

/// A [TypeChecker] for [XmlAttribute].
@Deprecated(
  'Use element.isXmlAttribute instead of xmlAttributeTypeChecker.hasAnnotationOf(element).',
)
const xmlAttributeTypeChecker = TypeChecker.fromRuntime(XmlAttribute);
