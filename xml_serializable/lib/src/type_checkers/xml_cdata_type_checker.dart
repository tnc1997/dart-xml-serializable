import 'package:source_gen/source_gen.dart';
import 'package:xml_annotation/xml_annotation.dart';

/// A [TypeChecker] for [XmlCDATA].
@Deprecated(
  'Use element.isXmlCDATA instead of xmlCDATATypeChecker.hasAnnotationOf(element).',
)
const xmlCDATATypeChecker = TypeChecker.fromRuntime(XmlCDATA);
