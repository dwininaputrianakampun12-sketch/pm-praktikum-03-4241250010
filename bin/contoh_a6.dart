int bagi(int a, int b) {
  if (b == 0) {
    throw Exception('Pembagi tidak boleh nol');
  }

  return a ~/ b;
}

void main() {
  try {
    final umur = int.parse('dua puluh');
    print(umur);
  } on FormatException catch (e) {
    print('Format salah: ${e.message}');
  } finally {
    print('Blok finally selalu dijalankan');
  }

  try {
    print(bagi(10, 0));
  } on Exception catch (e) {
    print(e);
  } catch (e, stack) {
    print('Kesalahan lain: $e');
    print(stack);
  }

  // Assert hanya aktif saat debug.
  const sks = 3;
  assert(sks > 0 && sks <= 6, 'SKS harus 1–6');
}
