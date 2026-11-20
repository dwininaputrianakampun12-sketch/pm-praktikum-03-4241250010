import 'dart:math';

void main() {
  print(pi.toStringAsFixed(4));
  print(sqrt(144));
  print(pow(2, 10));
  print(max(78, 92));
  print(min(3.5, 2.75));
  print((-7).abs());
  print(7.6.floor());
  print(7.2.ceil());
  print(7.5.round());
  print(17.clamp(0, 10));

  // Jarak dua titik menggunakan Pythagoras.
  double jarak(num x1, num y1, num x2, num y2) =>
      sqrt(pow(x2 - x1, 2) + pow(y2 - y1, 2));

  print(jarak(0, 0, 3, 4));

  // Bilangan acak.
  final acak = Random(42);
  final nilai = List.generate(5, (_) => 50 + acak.nextInt(51));

  print(nilai);
}
