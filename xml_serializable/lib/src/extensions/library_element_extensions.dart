import 'package:analyzer/dart/element/element.dart';

extension LibraryElementExtensions on LibraryElement {
  /// Returns `true` if this library is the xml_annotation library.
  bool get isXmlAnnotation => identifier.startsWith('package:xml_annotation');
}
