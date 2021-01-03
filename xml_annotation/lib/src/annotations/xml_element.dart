/// An annotation used to specify how an element is serialized.
class XmlElement {
  /// The name of the element.
  final String? name;

  /// The namespace of the element.
  final String? namespace;

  /// If `true` (the default) then the element will be self-closed if it is empty.
  final bool isSelfClosing;

  /// If `true` (the default) then the element will be serialized even if it is `null`.
  final bool includeIfNull;

  const XmlElement({
    this.name,
    this.namespace,
    this.isSelfClosing = true,
    this.includeIfNull = true,
  });
}
