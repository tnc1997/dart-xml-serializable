import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';

extension DartTypeExtensions on DartType {
  /// Returns `true` if this type represents a type defined in the dart:core library.
  bool get isDartCore => element?.library?.isDartCore ?? false;

  /// Returns `true` if this type represents the type 'DateTime' defined in the dart:core library.
  bool get isDartCoreDateTime => isDartCore && element?.name == 'DateTime';

  /// Returns `true` if this type represents the type 'Duration' defined in the dart:core library.
  bool get isDartCoreDuration => isDartCore && element?.name == 'Duration';

  /// Returns `true` if this type represents the type 'Uri' defined in the dart:core library.
  bool get isDartCoreUri => isDartCore && element?.name == 'Uri';

  /// Returns `true` if this type represents a nullable type.
  bool get isNullable =>
      isDynamic || nullabilitySuffix == NullabilitySuffix.question;
}
