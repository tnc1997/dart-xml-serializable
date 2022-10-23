import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:test/fake.dart';

import 'fake_interface_type.dart';

class FakeDartObject<T> extends Fake implements DartObject {
  @override
  final DartType? type;

  final T? _value;

  final Map<String, DartObject>? _fields;

  FakeDartObject({
    DartType? type,
    T? value,
    Map<String, DartObject>? fields,
  })  : type = type ?? FakeInterfaceType(),
        _value = value,
        _fields = fields;

  @override
  DartObject? getField(String name) => _fields?[name];

  @override
  bool? toBoolValue() {
    final value = _value;

    return value is bool? ? value : null;
  }

  @override
  double? toDoubleValue() {
    final value = _value;

    return value is double? ? value : null;
  }

  @override
  ExecutableElement? toFunctionValue() {
    final value = _value;

    return value is ExecutableElement? ? value : null;
  }

  @override
  int? toIntValue() {
    final value = _value;

    return value is int? ? value : null;
  }

  @override
  List<DartObject>? toListValue() {
    final value = _value;

    return value is List<DartObject>? ? value : null;
  }

  @override
  Map<DartObject?, DartObject?>? toMapValue() {
    final value = _value;

    return value is Map<DartObject?, DartObject?>? ? value : null;
  }

  @override
  Set<DartObject>? toSetValue() {
    final value = _value;

    return value is Set<DartObject>? ? value : null;
  }

  @override
  String? toStringValue() {
    final value = _value;

    return value is String? ? value : null;
  }

  @override
  String? toSymbolValue() {
    final value = _value;

    return value is String? ? value : null;
  }

  @override
  DartType? toTypeValue() {
    final value = _value;

    return value is DartType? ? value : null;
  }
}
