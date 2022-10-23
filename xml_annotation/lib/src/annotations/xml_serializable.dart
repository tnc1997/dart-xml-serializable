/// Values for the automatic field renaming behavior for [XmlSerializable].
enum FieldRename {
  /// Use the field name without changes.
  none,

  /// Encodes a field named `kebabCase` with a name `kebab-case`.
  kebab,

  /// Encodes a field named `snakeCase` with a name `snake_case`.
  snake,

  /// Encodes a field named `pascalCase` with a name `PascalCase`.
  pascal,
}

/// An annotation used to specify that a class is serializable.
class XmlSerializable {
  /// If `true` (not the default) then a mixin will be created that contains the serialization methods.
  ///
  /// ```dart
  /// @XmlRootElement(name: 'example')
  /// @XmlSerializable(createMixin: true)
  /// class Example with _$ExampleXmlSerializableMixin {
  ///   @XmlText()
  ///   String? text;
  ///
  ///   Example({this.text});
  ///
  ///   factory Example.fromXmlElement(XmlElement element) => _$ExampleFromXmlElement(element);
  /// }
  /// ```
  final bool? createMixin;

  /// Defines the automatic naming strategy when converting class field names into attribute names or element names.
  ///
  /// With a value [FieldRename.none] (the default), the name of the field is used without modification.
  ///
  /// See [FieldRename] for details on the other options.
  ///
  /// The value for [XmlAttribute.name] or [XmlElement.name] takes precedence over this option.
  final FieldRename? fieldRename;

  const XmlSerializable({
    this.createMixin,
    this.fieldRename,
  });
}
