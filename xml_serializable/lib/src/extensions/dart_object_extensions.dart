import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:xml_annotation/xml_annotation.dart';

extension DartObjectExtensions on DartObject {
  /// Returns the value of the field with the given [name] as a [bool] or `null` if the field is not a [bool].
  @Deprecated(
    'Use getField(abc).toBoolValue() instead of getBoolValue(abc).',
  )
  bool? getBoolValue(String name) => getField(name)?.toBoolValue();

  /// Returns the value of the field with the given [name] as a [double] or `null` if the field is not a [double].
  @Deprecated(
    'Use getField(abc).toDoubleValue() instead of getDoubleValue(abc).',
  )
  double? getDoubleValue(String name) => getField(name)?.toDoubleValue();

  /// Returns the value of the field with the given [name] as an [int] or `null` if the field is not an [int].
  @Deprecated(
    'Use getField(abc).toIntValue() instead of getIntValue(abc).',
  )
  int? getIntValue(String name) => getField(name)?.toIntValue();

  /// Returns the value of the field with the given [name] as a [String] or `null` if the field is not a [String].
  @Deprecated(
    'Use getField(abc).toStringValue() instead of getStringValue(abc).',
  )
  String? getStringValue(String name) => getField(name)?.toStringValue();

  /// Returns a [FieldRename] corresponding to the value of the object being represented or `null` if this object is not of type [FieldRename] or the value of the object being represented is `null`.
  FieldRename? toFieldRenameValue() {
    final type = this.type;

    if (type is InterfaceType) {
      final element = type.element2;

      if (element is EnumElement &&
          element.library.identifier.startsWith('package:xml_annotation') &&
          element.name == 'FieldRename') {
        final index = getField('index')?.toIntValue();

        if (index != null) {
          return FieldRename.values[index];
        }
      }
    }

    return null;
  }

  /// Returns a [XmlAttribute] corresponding to the value of the object being represented or `null` if this object is not of type [XmlAttribute].
  XmlAttribute? toXmlAttributeValue() {
    final type = this.type;

    if (type is InterfaceType) {
      final element = type.element2;

      if (element is ClassElement &&
          element.library.identifier.startsWith('package:xml_annotation') &&
          element.name == 'XmlAttribute') {
        return XmlAttribute(
          name: getField('name')?.toStringValue(),
          namespace: getField('namespace')?.toStringValue(),
        );
      }
    }

    return null;
  }

  /// Returns an [XmlElement] corresponding to the value of the object being represented or `null` if this object is not of type [XmlElement].
  XmlElement? toXmlElementValue() {
    final type = this.type;

    if (type is InterfaceType) {
      final element = type.element2;

      if (element is ClassElement &&
          element.library.identifier.startsWith('package:xml_annotation') &&
          element.name == 'XmlElement') {
        return XmlElement(
          name: getField('name')?.toStringValue(),
          namespace: getField('namespace')?.toStringValue(),
          isSelfClosing: getField('isSelfClosing')?.toBoolValue(),
          includeIfNull: getField('includeIfNull')?.toBoolValue(),
        );
      }
    }

    return null;
  }

  /// Returns a [XmlEnum] corresponding to the value of the object being represented or `null` if this object is not of type [XmlEnum].
  XmlEnum? toXmlEnumValue() {
    final type = this.type;

    if (type is InterfaceType) {
      final element = type.element2;

      if (element is ClassElement &&
          element.library.identifier.startsWith('package:xml_annotation') &&
          element.name == 'XmlEnum') {
        return XmlEnum(
          fieldRename: getField('fieldRename')?.toFieldRenameValue(),
        );
      }
    }

    return null;
  }

  /// Returns an [XmlRootElement] corresponding to the value of the object being represented or `null` if this object is not of type [XmlRootElement].
  XmlRootElement? toXmlRootElementValue() {
    final type = this.type;

    if (type is InterfaceType) {
      final element = type.element2;

      if (element is ClassElement &&
          element.library.identifier.startsWith('package:xml_annotation') &&
          element.name == 'XmlRootElement') {
        return XmlRootElement(
          name: getField('name')?.toStringValue(),
          namespace: getField('namespace')?.toStringValue(),
          isSelfClosing: getField('isSelfClosing')?.toBoolValue(),
        );
      }
    }

    return null;
  }

  /// Returns an [XmlSerializable] corresponding to the value of the object being represented or `null` if this object is not of type [XmlSerializable].
  XmlSerializable? toXmlSerializableValue() {
    final type = this.type;

    if (type is InterfaceType) {
      final element = type.element2;

      if (element is ClassElement &&
          element.library.identifier.startsWith('package:xml_annotation') &&
          element.name == 'XmlSerializable') {
        return XmlSerializable(
          createMixin: getField('createMixin')?.toBoolValue(),
          fieldRename: getField('fieldRename')?.toFieldRenameValue(),
        );
      }
    }

    return null;
  }

  /// Returns an [XmlText] corresponding to the value of the object being represented or `null` if this object is not of type [XmlText].
  XmlText? toXmlTextValue() {
    final type = this.type;

    if (type is InterfaceType) {
      final element = type.element2;

      if (element is ClassElement &&
          element.library.identifier.startsWith('package:xml_annotation') &&
          element.name == 'XmlText') {
        return XmlText();
      }
    }

    return null;
  }

  /// Returns an [XmlValue] corresponding to the value of the object being represented or `null` if this object is not of type [XmlValue].
  XmlValue? toXmlValueValue() {
    final type = this.type;

    if (type is InterfaceType) {
      final element = type.element2;

      if (element is ClassElement &&
          element.library.identifier.startsWith('package:xml_annotation') &&
          element.name == 'XmlValue') {
        return XmlValue(getField('value')!.toStringValue()!);
      }
    }

    return null;
  }
}
