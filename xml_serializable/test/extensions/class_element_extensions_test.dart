import 'package:test/test.dart';
import 'package:xml_serializable/xml_serializable.dart';

import '../fake_class_element.dart';
import '../fake_field_element.dart';
import '../fake_interface_type.dart';

void main() {
  group(
    'ClassElementExtensions',
    () {
      group(
        'allFields',
        () {
          test(
            'should return all of the fields in the class',
            () {
              final fields = [
                FakeFieldElement(
                  name: 'field',
                ),
              ];

              expect(
                FakeClassElement(
                  fields: fields,
                ).allFields,
                [
                  ...fields,
                ],
              );
            },
          );

          test(
            'should return all of the fields in all of the supertypes',
            () {
              final superfields = [
                FakeFieldElement(
                  name: 'superfield',
                ),
              ];

              expect(
                FakeClassElement(
                  thisType: FakeInterfaceType(
                    allSupertypes: [
                      FakeInterfaceType(
                        element: FakeClassElement(
                          fields: superfields,
                        ),
                      ),
                    ],
                  ),
                ).allFields,
                [
                  ...superfields,
                ],
              );
            },
          );

          test(
            'should return all of the fields in the class and all of the supertypes',
            () {
              final fields = [
                FakeFieldElement(
                  name: 'field',
                ),
              ];

              final superfields = [
                FakeFieldElement(
                  name: 'superfield',
                ),
              ];

              expect(
                FakeClassElement(
                  fields: fields,
                  thisType: FakeInterfaceType(
                    allSupertypes: [
                      FakeInterfaceType(
                        element: FakeClassElement(
                          fields: superfields,
                        ),
                      ),
                    ],
                  ),
                ).allFields,
                [
                  ...fields,
                  ...superfields,
                ],
              );
            },
          );

          test(
            'should not return duplicate overridden fields',
            () {
              final fields = [
                FakeFieldElement(
                  name: 'field',
                ),
              ];

              final superfields = [
                FakeFieldElement(
                  name: 'field',
                ),
              ];

              expect(
                FakeClassElement(
                  fields: fields,
                  thisType: FakeInterfaceType(
                    allSupertypes: [
                      FakeInterfaceType(
                        element: FakeClassElement(
                          fields: superfields,
                        ),
                      ),
                    ],
                  ),
                ).allFields,
                [
                  ...fields,
                ],
              );
            },
          );
        },
      );
    },
  );
}
