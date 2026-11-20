void main() {
  // forEach: menjalankan fungsi untuk setiap elemen
  final hari = ['Senin', 'Rabu', 'Jumat'];
  hari.forEach(print);

  // For dengan indeks
  for (var i = 0; i < hari.length; i++) {
    print('${i + 1}. ${hari[i]}');
  }

  // Menelusuri Map
  final sks = {'Mobile': 3, 'Jaringan': 3, 'Etika': 2};

  for (final e in sks.entries) {
    print('${e.key} = ${e.value} SKS');
  }

  sks.forEach((mk, n) => print('$mk: $n SKS'));

  // Perulangan bersarang: tabel perkalian 1–3
  for (var i = 1; i <= 3; i++) {
    final baris = StringBuffer();

    for (var j = 1; j <= 3; j++) {
      baris.write('${i * j}'.padLeft(4));
    }

    print(baris);
  }

  // Pola segitiga bintang
  for (var i = 1; i <= 4; i++) {
    print('*' * i);
  }
}
