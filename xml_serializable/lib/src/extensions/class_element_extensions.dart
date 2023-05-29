import 'package:analyzer/dart/element/element.dart';

extension ClassElementExtensions on ClassElement {
  /// Returns a list containing all of the fields declared in this class and its supertypes. This includes superclasses, mixins, interfaces, and superclass constraints.
  List<FieldElement> get allFields {
    final allFields = {
      for (var field in fields) field.name: field,
    };

    for (var supertype in allSupertypes) {
      for (var field in supertype.element2.fields) {
        allFields.putIfAbsent(field.name, () => field);
      }
    }

    return allFields.values.toList();
  }
}
