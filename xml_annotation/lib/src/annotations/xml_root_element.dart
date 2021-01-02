class XmlRootElement {
  final String? name;
  final String? namespace;
  final bool isSelfClosing;

  const XmlRootElement({
    this.name,
    this.namespace,
    this.isSelfClosing = true,
  });
}
