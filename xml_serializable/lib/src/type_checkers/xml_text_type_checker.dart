import 'package:source_gen/source_gen.dart';
import 'package:xml_annotation/xml_annotation.dart';

/// A [TypeChecker] for [XmlText].
@Deprecated(
  'Use element.isXmlText instead of xmlTextTypeChecker.hasAnnotationOf(element).',
)
const xmlTextTypeChecker = TypeChecker.fromRuntime(XmlText);
