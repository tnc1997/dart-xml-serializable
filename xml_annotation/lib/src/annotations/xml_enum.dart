import 'xml_serializable.dart';

/// An annotation used to configure how `enum` elements are treated as XML.
///
/// ```dart
/// @XmlEnum()
/// enum Language {
///   mandarin,
///   spanish,
///   english,
///   hindi,
///   bengali,
/// }
/// ```
class XmlEnum {
  /// Defines the automatic naming strategy when converting enum values into attribute values or element values.
  ///
  /// With a value [FieldRename.none] (the default), the name of the enum value is used without modification.
  ///
  /// See [FieldRename] for details on the other options.
  ///
  /// The value for [XmlValue.value] takes precedence over this option.
  final FieldRename? fieldRename;

  const XmlEnum({
    this.fieldRename,
  });
}
