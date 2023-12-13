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
                  name: 'field1',
                ),
                FakeFieldElement(
                  name: 'field2',
                ),
              ];

              expect(
                FakeClassElement(
                  fields: fields,
                ).allFields,
                containsAll(
                  [
                    ...fields,
                  ],
                ),
              );
            },
          );

          test(
            'should return all of the fields in the superclass',
            () {
              final superclass1Fields = [
                FakeFieldElement(
                  name: 'superclass1Field1',
                ),
                FakeFieldElement(
                  name: 'superclass1Field2',
                ),
              ];

              expect(
                FakeClassElement(
                  allSupertypes: [
                    FakeInterfaceType(
                      element: FakeClassElement(
                        fields: superclass1Fields,
                      ),
                    ),
                  ],
                ).allFields,
                containsAll(
                  [
                    ...superclass1Fields,
                  ],
                ),
              );
            },
          );

          test(
            'should return all of the fields in the class and the superclass',
            () {
              final fields = [
                FakeFieldElement(
                  name: 'field1',
                ),
                FakeFieldElement(
                  name: 'field2',
                ),
              ];

              final superclass1Fields = [
                FakeFieldElement(
                  name: 'superclass1Field1',
                ),
                FakeFieldElement(
                  name: 'superclass1Field2',
                ),
              ];

              expect(
                FakeClassElement(
                  fields: fields,
                  allSupertypes: [
                    FakeInterfaceType(
                      element: FakeClassElement(
                        fields: superclass1Fields,
                      ),
                    ),
                  ],
                ).allFields,
                containsAll(
                  [
                    ...fields,
                    ...superclass1Fields,
                  ],
                ),
              );
            },
          );

          test(
            'should return all of the fields in all of the superclasses',
            () {
              final superclass1Fields = [
                FakeFieldElement(
                  name: 'superclass1Field1',
                ),
                FakeFieldElement(
                  name: 'superclass1Field2',
                ),
              ];

              final superclass2Fields = [
                FakeFieldElement(
                  name: 'superclass2Field1',
                ),
                FakeFieldElement(
                  name: 'superclass2Field2',
                ),
              ];

              expect(
                FakeClassElement(
                  allSupertypes: [
                    FakeInterfaceType(
                      element: FakeClassElement(
                        fields: superclass1Fields,
                      ),
                    ),
                    FakeInterfaceType(
                      element: FakeClassElement(
                        fields: superclass2Fields,
                      ),
                    ),
                  ],
                ).allFields,
                containsAll(
                  [
                    ...superclass1Fields,
                    ...superclass2Fields,
                  ],
                ),
              );
            },
          );

          test(
            'should return all of the fields in the class and all of the superclasses',
            () {
              final fields = [
                FakeFieldElement(
                  name: 'field1',
                ),
                FakeFieldElement(
                  name: 'field2',
                ),
              ];

              final superclass1Fields = [
                FakeFieldElement(
                  name: 'superclass1Field1',
                ),
                FakeFieldElement(
                  name: 'superclass1Field2',
                ),
              ];

              final superclass2Fields = [
                FakeFieldElement(
                  name: 'superclass2Field1',
                ),
                FakeFieldElement(
                  name: 'superclass2Field2',
                ),
              ];

              expect(
                FakeClassElement(
                  fields: fields,
                  allSupertypes: [
                    FakeInterfaceType(
                      element: FakeClassElement(
                        fields: superclass1Fields,
                      ),
                    ),
                    FakeInterfaceType(
                      element: FakeClassElement(
                        fields: superclass2Fields,
                      ),
                    ),
                  ],
                ).allFields,
                containsAll(
                  [
                    ...fields,
                    ...superclass1Fields,
                    ...superclass2Fields,
                  ],
                ),
              );
            },
          );
        },
      );
    },
  );
}
