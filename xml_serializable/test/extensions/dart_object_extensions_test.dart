import 'package:test/test.dart';
import 'package:xml_serializable/xml_serializable.dart';

import '../fake_dart_object.dart';

void main() {
  group(
    'DartObjectExtensions',
    () {
      group(
        'getBoolValue',
        () {
          final object = FakeDartObject(
            fields: {
              'value': FakeDartObject(
                value: true,
              ),
            },
          );

          test(
            'should return the value of the field if the field exists',
            () {
              expect(object.getBoolValue('value'), equals(true));
            },
          );

          test(
            'should return null if the field does not exist',
            () {
              expect(object.getBoolValue(''), isNull);
            },
          );
        },
      );

      group(
        'getDoubleValue',
        () {
          final object = FakeDartObject(
            fields: {
              'value': FakeDartObject(
                value: 1.0,
              ),
            },
          );

          test(
            'should return the value of the field if the field exists',
            () {
              expect(object.getDoubleValue('value'), equals(1.0));
            },
          );

          test(
            'should return null if the field does not exist',
            () {
              expect(object.getDoubleValue(''), isNull);
            },
          );
        },
      );

      group(
        'getIntValue',
        () {
          final object = FakeDartObject(
            fields: {
              'value': FakeDartObject(
                value: 1,
              ),
            },
          );

          test(
            'should return the value of the field if the field exists',
            () {
              expect(object.getIntValue('value'), equals(1));
            },
          );

          test(
            'should return null if the field does not exist',
            () {
              expect(object.getIntValue(''), isNull);
            },
          );
        },
      );

      group(
        'getStringValue',
        () {
          final object = FakeDartObject(
            fields: {
              'value': FakeDartObject(
                value: 'string',
              ),
            },
          );

          test(
            'should return the value of the field if the field exists',
            () {
              expect(object.getStringValue('value'), equals('string'));
            },
          );

          test(
            'should return null if the field does not exist',
            () {
              expect(object.getStringValue(''), isNull);
            },
          );
        },
      );
    },
  );
}
