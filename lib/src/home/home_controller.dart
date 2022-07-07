import 'package:mvvm/src/home/person_model.dart';
import 'package:rx_notifier/rx_notifier.dart';

abstract class ImcViewModel {
  void calculateImc();
}


class HomeViewModelImpl extends ImcViewModel {
  double _altura = 0.0;
  double _peso = 0.0;

  void setAltura(String value) => _altura = double.tryParse(value) ?? 0;
  void setPeso(String value) => _peso = double.tryParse(value) ?? 0;

  final _result = RxNotifier<String>('');
  String get result => _result.value;

  @override
  void calculateImc() {
    final imcValue = PersonModel(altura: _altura, peso: _peso).getImc();
    final imcText = imcValue.toStringAsFixed(1);
    if (imcValue < 18) {
      _result.value = 'O IMC é: $imcText. Você está abaixo do peso.';
    } else if (imcValue > 18 && imcValue < 24) {
      _result.value = 'O IMC é: $imcText. Seu peso está normal.';
    } else {
      _result.value = 'O IMC é: $imcText. Você está acima do peso.';
    }
  }
}
