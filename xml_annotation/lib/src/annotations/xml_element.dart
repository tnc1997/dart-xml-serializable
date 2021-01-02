class XmlElement {
  final String? name;
  final String? namespace;
  final bool isSelfClosing;

  const XmlElement({
    this.name,
    this.namespace,
    this.isSelfClosing = true,
  });
}
