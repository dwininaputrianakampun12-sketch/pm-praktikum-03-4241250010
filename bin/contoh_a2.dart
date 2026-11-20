void main() {
  // For loop
  for (var i = 1; i <= 3; i++) {
    print('Pertemuan $i');
  }

  // For-in
  final matkul = ['Mobile', 'Jaringan', 'AI'];

  for (final mk in matkul) {
    print(mk);
  }

  // While
  var saldo = 100000;

  while (saldo >= 30000) {
    saldo -= 30000;
    print('Beli kopi, sisa saldo $saldo');
  }

  // Do-while
  var percobaan = 0;

  do {
    percobaan++;
  } while (percobaan < 3);

  print('Percobaan: $percobaan');

  // Continue dan break
  for (var n = 1; n <= 10; n++) {
    if (n.isEven) continue;
    if (n > 7) break;
    print(n);
  }
}
