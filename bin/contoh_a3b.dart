const kampus = 'UNIMED';

// Fungsi untuk menunjukkan lingkup variabel.
void cetakKelas() {
  final kelas = 'Kom-A';

  for (var i = 1; i <= 2; i++) {
    final pesan = '$kampus $kelas pertemuan $i';
    print(pesan);
  }
}

// Rekursi faktorial.
int faktorial(int n) {
  if (n <= 1) return 1;
  return n * faktorial(n - 1);
}

// Rekursi Fibonacci.
int fibonacci(int n) => n < 2 ? n : fibonacci(n - 1) + fibonacci(n - 2);

// Rekursi jumlah digit.
int jumlahDigit(int n) => n < 10 ? n : n % 10 + jumlahDigit(n ~/ 10);

void main() {
  cetakKelas();

  print(faktorial(5));
  print([for (var i = 0; i < 8; i++) fibonacci(i)]);
  print(jumlahDigit(2026));
}
