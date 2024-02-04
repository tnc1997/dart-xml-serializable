import 'package:test/test.dart';
import 'package:xml_annotation/xml_annotation.dart';
import 'package:xml_serializable/xml_serializable.dart';

import '../fake_class_element.dart';
import '../fake_enum_element.dart';
import '../fake_field_element.dart';
import '../fake_xml_enum_element_annotation.dart';
import '../fake_xml_serializable_element_annotation.dart';

void main() {
  group(
    'FieldElementExtensions',
    () {
      group(
        'getEncodedFieldName',
        () {
          test(
            'should return the name of the field encoded to kebab case if the class has an `XmlSerializable` annotation with a `fieldRename` of `kebab`',
            () {
              expect(
                FakeFieldElement(
                  enclosingElement: FakeClassElement(
                    metadata: [
                      FakeXmlSerializableConstructorElementElementAnnotation(
                        value: XmlSerializable(
                          fieldRename: FieldRename.kebab,
                        ),
                      ),
                    ],
                  ),
                  name: 'helloWorld',
                ).getEncodedFieldName(),
                'hello-world',
              );
            },
          );

          test(
            'should return the name of the field encoded to snake case if the class has an `XmlSerializable` annotation with a `fieldRename` of `snake`',
            () {
              expect(
                FakeFieldElement(
                  enclosingElement: FakeClassElement(
                    metadata: [
                      FakeXmlSerializableConstructorElementElementAnnotation(
                        value: XmlSerializable(
                          fieldRename: FieldRename.snake,
                        ),
                      ),
                    ],
                  ),
                  name: 'helloWorld',
                ).getEncodedFieldName(),
                'hello_world',
              );
            },
          );

          test(
            'should return the name of the field encoded to pascal case if the class has an `XmlSerializable` annotation with a `fieldRename` of `pascal`',
            () {
              expect(
                FakeFieldElement(
                  enclosingElement: FakeClassElement(
                    metadata: [
                      FakeXmlSerializableConstructorElementElementAnnotation(
                        value: XmlSerializable(
                          fieldRename: FieldRename.pascal,
                        ),
                      ),
                    ],
                  ),
                  name: 'helloWorld',
                ).getEncodedFieldName(),
                'HelloWorld',
              );
            },
          );

          test(
            'should return the name of the field without modification if the class has an `XmlSerializable` annotation with a `fieldRename` of `none`',
            () {
              expect(
                FakeFieldElement(
                  enclosingElement: FakeClassElement(
                    metadata: [
                      FakeXmlSerializableConstructorElementElementAnnotation(
                        value: XmlSerializable(
                          fieldRename: FieldRename.none,
                        ),
                      ),
                    ],
                  ),
                  name: 'helloWorld',
                ).getEncodedFieldName(),
                'helloWorld',
              );
            },
          );

          test(
            'should return the name of the field without modification if the class has an `XmlSerializable` annotation with a null `fieldRename`',
            () {
              expect(
                FakeFieldElement(
                  enclosingElement: FakeClassElement(
                    metadata: [
                      FakeXmlSerializableConstructorElementElementAnnotation(
                        value: XmlSerializable(),
                      ),
                    ],
                  ),
                  name: 'helloWorld',
                ).getEncodedFieldName(),
                'helloWorld',
              );
            },
          );

          test(
            'should return the name of the field without modification if the class does not have an `XmlSerializable` annotation',
            () {
              expect(
                FakeFieldElement(
                  name: 'helloWorld',
                ).getEncodedFieldName(),
                'helloWorld',
              );
            },
          );

          test(
            'should return the name of the enum value encoded to kebab case if the enum has an `XmlEnum` annotation with a `fieldRename` of `kebab`',
            () {
              expect(
                FakeFieldElement(
                  enclosingElement: FakeEnumElement(
                    metadata: [
                      FakeXmlEnumConstructorElementElementAnnotation(
                        value: XmlEnum(
                          fieldRename: FieldRename.kebab,
                        ),
                      ),
                    ],
                  ),
                  name: 'helloWorld',
                ).getEncodedFieldName(),
                'hello-world',
              );
            },
          );

          test(
            'should return the name of the enum value encoded to snake case if the enum has an `XmlEnum` annotation with a `fieldRename` of `snake`',
            () {
              expect(
                FakeFieldElement(
                  enclosingElement: FakeEnumElement(
                    metadata: [
                      FakeXmlEnumConstructorElementElementAnnotation(
                        value: XmlEnum(
                          fieldRename: FieldRename.snake,
                        ),
                      ),
                    ],
                  ),
                  name: 'helloWorld',
                ).getEncodedFieldName(),
                'hello_world',
              );
            },
          );

          test(
            'should return the name of the enum value encoded to pascal case if the enum has an `XmlEnum` annotation with a `fieldRename` of `pascal`',
            () {
              expect(
                FakeFieldElement(
                  enclosingElement: FakeEnumElement(
                    metadata: [
                      FakeXmlEnumConstructorElementElementAnnotation(
                        value: XmlEnum(
                          fieldRename: FieldRename.pascal,
                        ),
                      ),
                    ],
                  ),
                  name: 'helloWorld',
                ).getEncodedFieldName(),
                'HelloWorld',
              );
            },
          );

          test(
            'should return the name of the enum value without modification if the enum has an `XmlEnum` annotation with a `fieldRename` of `none`',
            () {
              expect(
                FakeFieldElement(
                  enclosingElement: FakeEnumElement(
                    metadata: [
                      FakeXmlEnumConstructorElementElementAnnotation(
                        value: XmlEnum(
                          fieldRename: FieldRename.none,
                        ),
                      ),
                    ],
                  ),
                  name: 'helloWorld',
                ).getEncodedFieldName(),
                'helloWorld',
              );
            },
          );

          test(
            'should return the name of the enum value without modification if the enum has an `XmlEnum` annotation with a null `fieldRename`',
            () {
              expect(
                FakeFieldElement(
                  enclosingElement: FakeEnumElement(
                    metadata: [
                      FakeXmlEnumConstructorElementElementAnnotation(
                        value: XmlEnum(),
                      ),
                    ],
                  ),
                  name: 'helloWorld',
                ).getEncodedFieldName(),
                'helloWorld',
              );
            },
          );

          test(
            'should return the name of the enum value without modification if the enum does not have an `XmlEnum` annotation',
            () {
              expect(
                FakeFieldElement(
                  name: 'helloWorld',
                ).getEncodedFieldName(),
                'helloWorld',
              );
            },
          );
        },
      );
    },
  );
}
