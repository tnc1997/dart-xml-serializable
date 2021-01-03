/// An annotation used to specify how an attribute is serialized.
class XmlAttribute {
  /// The name of the attribute.
  final String? name;

  /// The namespace of the attribute.
  final String? namespace;

  const XmlAttribute({
    this.name,
    this.namespace,
  });
}
