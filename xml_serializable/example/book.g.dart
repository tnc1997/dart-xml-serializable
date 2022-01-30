// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// XmlSerializableGenerator
// **************************************************************************

Book _$BookFromXmlElement(XmlElement element) {
  final title = element.getElement(
    'title',
  );
  final authors = element.findElementsText(
    'author',
  );
  final price = element.getElementText(
    'price',
  );

  return Book(
    title: title != null ? Title.fromXmlElement(title) : null,
    authors: authors.toList(),
    price: price,
  );
}

mixin BookXmlSerializableMixin {
  void buildXmlChildren(
      XmlBuilder builder, {
        Map<String, String> namespaces = const {},
      }) {
    final title = (this as Book).title;
    final authors = (this as Book).authors;
    final price = (this as Book).price;

    builder.element(
      'title',
      isSelfClosing: true,
      nest: () {
        if (title != null) {
          title.buildXmlChildren(
            builder,
            namespaces: namespaces,
          );
        }
      },
    );
    if (authors != null) {
      for (final value in authors) {
        builder.element(
          'author',
          isSelfClosing: true,
          nest: () {
            builder.text(
              value,
            );
          },
        );
      }
    }
    builder.element(
      'price',
      isSelfClosing: false,
      nest: () {
        if (price != null) {
          builder.text(
            price,
          );
        }
      },
    );
  }

  void buildXmlElement(
      XmlBuilder builder, {
        Map<String, String> namespaces = const {},
      }) {
    builder.element(
      'book',
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
    return [];
  }

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) {
    final title = (this as Book).title;
    final authors = (this as Book).authors;
    final price = (this as Book).price;

    return [
      XmlElement(
        XmlName(
          'title',
        ),
        [
          if (title != null)
            ...title.toXmlAttributes(
              namespaces: namespaces,
            ),
        ],
        [
          if (title != null)
            ...title.toXmlChildren(
              namespaces: namespaces,
            ),
        ],
        true,
      ),
      if (authors != null)
        for (final value in authors)
          XmlElement(
            XmlName(
              'author',
            ),
            [],
            [
              XmlText(
                value,
              ),
            ],
            true,
          ),
      XmlElement(
        XmlName(
          'price',
        ),
        [],
        [
          if (price != null)
            XmlText(
              price,
            ),
        ],
        false,
      ),
    ];
  }

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) {
    return XmlElement(
      XmlName(
        'book',
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
