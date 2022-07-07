import 'package:flutter_test/flutter_test.dart';
import 'package:mvvm/src/home/person_model.dart';

void main() {
  test('getImc deve retornar 21.', () {
    final person = PersonModel(altura: 1.84, peso: 70);
    expect(person.getImc().round(), 21); 
  });
}