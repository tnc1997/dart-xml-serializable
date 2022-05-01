import 'package:source_gen/source_gen.dart';
import 'package:xml_annotation/xml_annotation.dart';

/// A [TypeChecker] for [XmlElement].
@Deprecated(
  'Use element.isXmlElement instead of xmlElementTypeChecker.hasAnnotationOf(element).',
)
const xmlElementTypeChecker = TypeChecker.fromRuntime(XmlElement);
