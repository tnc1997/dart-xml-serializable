import 'package:source_gen/source_gen.dart';
import 'package:xml_annotation/xml_annotation.dart';

/// A [TypeChecker] for [XmlSerializable].
@Deprecated(
  'Use element.isXmlSerializable instead of xmlSerializableTypeChecker.hasAnnotationOf(element).',
)
const xmlSerializableTypeChecker = TypeChecker.fromRuntime(XmlSerializable);
