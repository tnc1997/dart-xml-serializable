/// An annotation used to specify how an `enum` value is serialized.
///
/// ```dart
/// @XmlEnum()
/// enum Language {
///   @XmlValue('Mandarin')
///   mandarin,
///   @XmlValue('Spanish')
///   spanish,
///   @XmlValue('English')
///   english,
///   @XmlValue('Hindi')
///   hindi,
///   @XmlValue('Bengali')
///   bengali,
/// }
/// ```
class XmlValue {
  /// The value to use when serializing and deserializing.
  final String value;

  const XmlValue(this.value);
}
