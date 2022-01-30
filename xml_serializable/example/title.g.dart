// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'title.dart';

// **************************************************************************
// XmlSerializableGenerator
// **************************************************************************

Title _$TitleFromXmlElement(XmlElement element) {
  final lang = element.getAttribute(
    'lang',
  );
  final text = element.getText();

  return Title(
    lang: lang,
    text: text,
  );
}

mixin TitleXmlSerializableMixin {
  void buildXmlChildren(
      XmlBuilder builder, {
        Map<String, String> namespaces = const {},
      }) {
    final lang = (this as Title).lang;
    final text = (this as Title).text;

    if (lang != null) {
      builder.attribute(
        'lang',
        lang,
      );
    }
    if (text != null) {
      builder.text(
        text,
      );
    }
  }

  void buildXmlElement(
      XmlBuilder builder, {
        Map<String, String> namespaces = const {},
      }) {
    builder.element(
      'title',
      namespaces: namespaces,
      nest: () {
        buildXmlChildren(
          builder,
          namespaces: namespaces,
        );
      },
    );
  }

  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) {
    final lang = (this as Title).lang;

    return [
      if (lang != null)
        XmlAttribute(
          XmlName(
            'lang',
          ),
          lang,
        ),
    ];
  }

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) {
    final text = (this as Title).text;

    return [
      if (text != null)
        XmlText(
          text,
        ),
    ];
  }

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) {
    return XmlElement(
      XmlName(
        'title',
      ),
      [
        ...namespaces.toXmlAttributes(),
        ...toXmlAttributes(
          namespaces: namespaces,
        ),
      ],
      toXmlChildren(
        namespaces: namespaces,
      ),
      true,
    );
  }
}
