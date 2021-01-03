/// An annotation used to specify how a root element is serialized.
class XmlRootElement {
  /// The name of the root element.
  final String? name;

  /// The namespace of the root element.
  final String? namespace;

  /// If `true` (the default) then the root element will be self-closed if it is empty.
  final bool isSelfClosing;

  const XmlRootElement({
    this.name,
    this.namespace,
    this.isSelfClosing = true,
  });
}
