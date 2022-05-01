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

  const XmlSerializable({
    this.createMixin,
  });
}
