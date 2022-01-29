// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'xml_serializable_example.dart';

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

extension BookXmlSerializableExtensions on Book {
  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    final title = this.title;
    final authors = this.authors;
    final price = this.price;

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
    final title = this.title;
    final authors = this.authors;
    final price = this.price;

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

Bookshelf _$BookshelfFromXmlElement(XmlElement element) {
  final books = element.findElements(
    'book',
  );
  final price = element.getElementText(
    'price',
  );

  return Bookshelf(
    books: books.map((element) => Book.fromXmlElement(element)).toList(),
    price: price,
  );
}

extension BookshelfXmlSerializableExtensions on Bookshelf {
  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    final books = this.books;
    final price = this.price;

    if (books != null) {
      for (final value in books) {
        builder.element(
          'book',
          isSelfClosing: true,
          nest: () {
            value.buildXmlChildren(
              builder,
              namespaces: namespaces,
            );
          },
        );
      }
    }
    if (price != null) {
      builder.element(
        'price',
        isSelfClosing: true,
        nest: () {
          builder.text(
            price,
          );
        },
      );
    }
  }

  void buildXmlElement(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    builder.element(
      'bookshelf',
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
    final books = this.books;
    final price = this.price;

    return [
      if (books != null)
        for (final value in books)
          XmlElement(
            XmlName(
              'book',
            ),
            value.toXmlAttributes(
              namespaces: namespaces,
            ),
            value.toXmlChildren(
              namespaces: namespaces,
            ),
            true,
          ),
      if (price != null)
        XmlElement(
          XmlName(
            'price',
          ),
          [],
          [
            XmlText(
              price,
            ),
          ],
          true,
        ),
    ];
  }

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) {
    return XmlElement(
      XmlName(
        'bookshelf',
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

extension TitleXmlSerializableExtensions on Title {
  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    final lang = this.lang;
    final text = this.text;

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
    final lang = this.lang;

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
    final text = this.text;

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
