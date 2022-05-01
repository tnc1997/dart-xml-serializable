import 'package:source_gen/source_gen.dart';
import 'package:xml_annotation/xml_annotation.dart';

/// A [TypeChecker] for [XmlRootElement].
@Deprecated(
  'Use element.isXmlRootElement instead of xmlRootElementTypeChecker.hasAnnotationOf(element).',
)
const xmlRootElementTypeChecker = TypeChecker.fromRuntime(XmlRootElement);
