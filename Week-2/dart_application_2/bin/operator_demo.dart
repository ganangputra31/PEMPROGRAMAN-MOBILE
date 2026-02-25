void main() {
  print('=== DEMO OPERATOR DART ===');

  // Aritmatika
  int a = 10, b = 3;
  print('\n-- Aritmatika --');
  print('a + b = ${a + b}');
  print('a - b = ${a - b}');
  print('a * b = ${a * b}');
  print('a / b = ${a / b}');
  print('a ~/ b = ${a ~/ b}');
  print('a % b = ${a % b}');

  // Increment / Decrement
  print('\n-- Increment/Decrement --');
  int x = 5;
  print('x awal = $x');
  print('x++ = ${x++} (setelah itu x = $x)');
  print('++x = ${++x} (sekarang x = $x)');
  print('x-- = ${x--} (setelah itu x = $x)');
  print('--x = ${--x} (sekarang x = $x)');

  // Relasional
  print('\n-- Relasional --');
  print('a == b: ${a == b}');
  print('a != b: ${a != b}');
  print('a > b : ${a > b}');
  print('a < b : ${a < b}');
  print('a >= 10: ${a >= 10}');
  print('b <= 2 : ${b <= 2}');

  // Logika
  print('\n-- Logika --');
  bool p = true, q = false;
  print('p && q = ${p && q}');
  print('p || q = ${p || q}');
  print('!p = ${!p}');

  // Assignment
  print('\n-- Assignment --');
  int nilai = 10;
  nilai += 5;
  nilai *= 2;
  nilai ~/= 3;
  print('hasil nilai setelah +=, *=, ~/= : $nilai');

  // Ternary
  print('\n-- Ternary --');
  int skor = 75;
  String status = skor >= 70 ? 'Lulus' : 'Gagal';
  print('Skor $skor => $status');

  // Null-aware
  print('\n-- Null-aware --');
  String? nama;
  print('nama ?? "Tamu" => ${nama ?? "Tamu"}');
  nama = "Budi";
  print('nama ?? "Tamu" => ${nama ?? "Tamu"}');

  String? pesan;
  print('pesan?.length => ${pesan?.length}');
  pesan = "Halo";
  print('pesan?.length => ${pesan?.length}');

  // Type test & casting
  print('\n-- Type Test & Casting --');
  dynamic data = "Hello";
  print('data is String: ${data is String}');
  String teks = data as String;
  print('teks.toUpperCase() = ${teks.toUpperCase()}');

  // Bitwise
  print('\n-- Bitwise --');
  print('5 & 3 = ${5 & 3}');
  print('5 | 3 = ${5 | 3}');
  print('5 ^ 3 = ${5 ^ 3}');
  print('~5 = ${~5}');
  print('5 << 1 = ${5 << 1}');
  print('5 >> 1 = ${5 >> 1}');
}
