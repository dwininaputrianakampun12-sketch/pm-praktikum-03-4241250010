import 'dart:io';

typedef Tugas = ({int id, String judul, bool selesai});

extension Kapital on String {
  String get kapital =>
      isEmpty ? this : '${this[0].toUpperCase()}${substring(1)}';
}

final List<Tugas> daftar = [];
int _idBerikut = 1;

void main() {
  print('=== TODO CLI ===');
  var jalan = true;

  while (jalan) {
    tampilkanMenu();
    final pilihan = baca('Pilih menu');

    try {
      switch (pilihan) {
        case '1':
          tambah(baca('Judul tugas'));
        case '2':
          tampilkan(daftar);
        case '3':
          tandaiSelesai(bacaAngka('ID tugas'));
        case '4':
          hapus(bacaAngka('ID tugas'));
        case '5':
          tampilkan(cari(baca('Kata kunci')), judul: 'Hasil pencarian');
        case '6':
          tampilkan(
            daftar.where((t) => !t.selesai).toList(),
            judul: 'Belum selesai',
          );
        case '7':
          ubahJudul(bacaAngka('ID tugas'), baca('Judul baru'));
        case '0':
          jalan = false;
        default:
          print('Menu tidak dikenal.');
      }
    } on FormatException catch (e) {
      print('Peringatan: ${e.message}');
    }
  }

  print('Sampai jumpa!');
}

void tampilkanMenu() {
  print('''

[1] Tambah   [2] Lihat semua     [3] Tandai selesai
[4] Hapus    [5] Cari            [6] Belum selesai
[7] Ubah judul                     [0] Keluar''');
}

String baca(String label) {
  stdout.write('$label: ');
  return (stdin.readLineSync() ?? '').trim();
}

int bacaAngka(String label) {
  final teks = baca(label);
  final angka = int.tryParse(teks);

  if (angka == null) {
    throw FormatException('"$teks" bukan angka.');
  }

  return angka;
}

void tambah(String judul) {
  if (judul.isEmpty) {
    throw FormatException('Judul tidak boleh kosong.');
  }

  daftar.add((id: _idBerikut++, judul: judul.kapital, selesai: false));

  print('Tugas ditambahkan.');
}

void tampilkan(List<Tugas> data, {String judul = 'Daftar tugas'}) {
  print('--- $judul (${data.length}) ---');

  if (data.isEmpty) {
    print('(kosong)');
    return;
  }

  for (final t in data) {
    final tanda = t.selesai ? '[x]' : '[ ]';
    print('${t.id.toString().padLeft(3)} $tanda ${t.judul}');
  }
}

int _indeksDari(int id) {
  final i = daftar.indexWhere((t) => t.id == id);

  if (i == -1) {
    throw FormatException('Tugas dengan ID $id tidak ditemukan.');
  }

  return i;
}

void tandaiSelesai(int id) {
  final i = _indeksDari(id);
  final t = daftar[i];

  daftar[i] = (id: t.id, judul: t.judul, selesai: true);

  print('"${t.judul}" ditandai selesai.');
}

void hapus(int id) {
  final t = daftar.removeAt(_indeksDari(id));
  print('"${t.judul}" dihapus.');
}

List<Tugas> cari(String kata) {
  final kunci = kata.toLowerCase();

  return daftar.where((t) => t.judul.toLowerCase().contains(kunci)).toList();
}

// Tantangan 1: mengubah judul tugas.
void ubahJudul(int id, String judulBaru) {
  if (judulBaru.isEmpty) {
    throw FormatException('Judul tidak boleh kosong.');
  }

  final i = _indeksDari(id);
  final t = daftar[i];

  daftar[i] = (id: t.id, judul: judulBaru.kapital, selesai: t.selesai);

  print('Judul tugas berhasil diubah.');
}
