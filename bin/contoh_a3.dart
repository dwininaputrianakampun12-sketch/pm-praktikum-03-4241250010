// Parameter posisional wajib
int luasPersegi(int sisi) {
  return sisi * sisi;
}

// Arrow function
double luasLingkaran(double r) => 3.14159 * r * r;

// Parameter posisional opsional
String sapa(String nama, [String? gelar]) =>
    gelar == null ? 'Halo, $nama' : 'Halo, $gelar $nama';

// Parameter bernama
String formatHarga(int harga, {String mataUang = 'Rp', bool pemisah = true}) {
  final angka = pemisah ? _beriTitik(harga) : harga.toString();
  return '$mataUang$angka';
}

// Parameter bernama wajib
void daftarMk({required String kode, required int sks}) =>
    print('$kode ($sks SKS) didaftarkan');

// Fungsi privat
String _beriTitik(int n) {
  final s = n.toString();
  final buf = StringBuffer();

  for (var i = 0; i < s.length; i++) {
    if (i > 0 && (s.length - i) % 3 == 0) {
      buf.write('.');
    }
    buf.write(s[i]);
  }

  return buf.toString();
}

void main() {
  print(luasPersegi(4));
  print(luasLingkaran(2).toStringAsFixed(2));
  print(sapa('Butet'));
  print(sapa('Butet', 'Dr.'));
  print(formatHarga(1250000));
  print(formatHarga(5000, pemisah: false));
  daftarMk(sks: 3, kode: '3KOM40215');
}
