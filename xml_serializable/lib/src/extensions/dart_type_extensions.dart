import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';

extension DartTypeExtensions on DartType {
  static const _prefix = 'package:xml_annotation/src/annotations';

  /// Returns `true` if this type represents a type defined in the dart:core library.
  bool get isDartCore => element?.library?.isDartCore ?? false;

  /// Returns `true` if this type represents the type 'DateTime' defined in the dart:core library.
  bool get isDartCoreDateTime => isDartCore && element?.name == 'DateTime';

  /// Returns `true` if this type represents the type 'Duration' defined in the dart:core library.
  bool get isDartCoreDuration => isDartCore && element?.name == 'Duration';

  /// Returns `true` if this type represents the type 'Uri' defined in the dart:core library.
  bool get isDartCoreUri => isDartCore && element?.name == 'Uri';

  /// Returns `true` if this type represents a nullable type.
  bool get isNullable =>
      this is DynamicType || nullabilitySuffix == NullabilitySuffix.question;

  /// Returns `true` if this type represents the type 'XmlAttribute' defined in the xml_annotation library.
  bool get isXmlAnnotationXmlAttribute =>
      element?.library?.identifier == '$_prefix/xml_attribute.dart' &&
      element?.name == 'XmlAttribute';

  /// Returns `true` if this type represents the type 'XmlCDATA' defined in the xml_annotation library.
  bool get isXmlAnnotationXmlCDATA =>
      element?.library?.identifier == '$_prefix/xml_cdata.dart' &&
      element?.name == 'XmlCDATA';

  /// Returns `true` if this type represents the type 'XmlElement' defined in the xml_annotation library.
  bool get isXmlAnnotationXmlElement =>
      element?.library?.identifier == '$_prefix/xml_element.dart' &&
      element?.name == 'XmlElement';

  /// Returns `true` if this type represents the type 'XmlEnum' defined in the xml_annotation library.
  bool get isXmlAnnotationXmlEnum =>
      element?.library?.identifier == '$_prefix/xml_enum.dart' &&
      element?.name == 'XmlEnum';

  /// Returns `true` if this type represents the type 'XmlRootElement' defined in the xml_annotation library.
  bool get isXmlAnnotationXmlRootElement =>
      element?.library?.identifier == '$_prefix/xml_root_element.dart' &&
      element?.name == 'XmlRootElement';

  /// Returns `true` if this type represents the type 'XmlSerializable' defined in the xml_annotation library.
  bool get isXmlAnnotationXmlSerializable =>
      element?.library?.identifier == '$_prefix/xml_serializable.dart' &&
      element?.name == 'XmlSerializable';

  /// Returns `true` if this type represents the type 'XmlText' defined in the xml_annotation library.
  bool get isXmlAnnotationXmlText =>
      element?.library?.identifier == '$_prefix/xml_text.dart' &&
      element?.name == 'XmlText';

  /// Returns `true` if this type represents the type 'XmlValue' defined in the xml_annotation library.
  bool get isXmlAnnotationXmlValue =>
      element?.library?.identifier == '$_prefix/xml_value.dart' &&
      element?.name == 'XmlValue';

  /// Returns `true` if this type represents a type that implements the type 'XmlConverter' defined in the xml_annotation library and can convert the [type].
  bool isXmlAnnotationXmlConverter({
    DartType? type,
  }) {
    final _ = this;
    if (_ is InterfaceType) {
      for (final supertype in _.allSupertypes) {
        final element = supertype.element;
        if ((element.library.identifier == '$_prefix/xml_converter.dart' &&
                element.name == 'XmlConverter') &&
            (type == null ||
                (supertype.typeArguments[0].element == type.element &&
                    ((supertype.typeArguments[0].nullabilitySuffix ==
                                NullabilitySuffix.none &&
                            type.nullabilitySuffix == NullabilitySuffix.none) ||
                        (supertype.typeArguments[0].nullabilitySuffix ==
                                NullabilitySuffix.none &&
                            type.nullabilitySuffix ==
                                NullabilitySuffix.question) ||
                        (supertype.typeArguments[0].nullabilitySuffix ==
                                NullabilitySuffix.question &&
                            type.nullabilitySuffix ==
                                NullabilitySuffix.question))))) {
          return true;
        }
      }
    }

    return false;
  }
}
