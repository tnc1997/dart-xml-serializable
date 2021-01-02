class XmlElement {
  final String? name;
  final String? namespace;
  final bool isSelfClosing;
  final bool includeIfNull;

  const XmlElement({
    this.name,
    this.namespace,
    this.isSelfClosing = true,
    this.includeIfNull = true,
  });
}
