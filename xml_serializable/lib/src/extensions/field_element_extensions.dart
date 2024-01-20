import 'package:analyzer/dart/element/element.dart';
import 'package:recase/recase.dart';
import 'package:xml_annotation/xml_annotation.dart';

import 'dart_object_extensions.dart';
import 'element_extensions.dart';

extension FieldElementExtensions on FieldElement {
  String getEncodedFieldName() {
    final fieldRename = enclosingElement.hasXmlSerializable
        ? enclosingElement
            .getXmlSerializable()
            ?.toXmlSerializableValue()
            ?.fieldRename
        : enclosingElement.hasXmlEnum
            ? enclosingElement.getXmlEnum()?.toXmlEnumValue()?.fieldRename
            : null;

    switch (fieldRename) {
      case FieldRename.kebab:
        return name.paramCase;
      case FieldRename.snake:
        return name.snakeCase;
      case FieldRename.pascal:
        return name.pascalCase;
      case FieldRename.none:
      default:
        return name;
    }
  }
}
