typedef Operasi = double Function(double a, double b);

// Higher-order function: menerima fungsi sebagai parameter.
double hitung(double a, double b, Operasi op) => op(a, b);

// Fungsi yang mengembalikan fungsi (closure).
int Function() buatPenghitung() {
  var hitungan = 0;
  return () => ++hitungan;
}

void main() {
  final Map<String, Operasi> kalkulator = {
    '+': (a, b) => a + b,
    '-': (a, b) => a - b,
    '*': (a, b) => a * b,
  };

  print(hitung(6, 3, kalkulator['*']!));
  print(hitung(6, 3, (a, b) => a / b));

  // Closure dengan penghitung terpisah.
  final antrianA = buatPenghitung();
  final antrianB = buatPenghitung();

  print(antrianA());
  print(antrianA());
  print(antrianB());

  // Fungsi anonim sebagai pembanding.
  final nilai = [78, 92, 55];
  nilai.sort((a, b) => b.compareTo(a));

  print(nilai);
}
