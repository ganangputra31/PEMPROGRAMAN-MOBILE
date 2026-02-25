import 'dart:io';

void main() {
  // Kurs contoh (IDR ke mata uang lain)
  const double idrToUsd = 1 / 15500; // USD
  const double idrToCny = 1 / 2200; // China (Yuan)
  const double idrToSar = 1 / 4100; // Arab Saudi (Riyal)

  print('=== KONVERSI MATA UANG (IDR) ===');
  stdout.write('Masukkan jumlah uang (IDR): ');
  double idr = double.parse(stdin.readLineSync()!);

  print('\nPilih tujuan:');
  print('1. USD (Amerika)');
  print('2. CNY (China)');
  print('3. SAR (Arab Saudi)');
  stdout.write('Pilihan (1/2/3): ');
  int pilihan = int.parse(stdin.readLineSync()!);

  double hasil;
  String mataUang;

  if (pilihan == 1) {
    hasil = idr * idrToUsd;
    mataUang = 'USD';
  } else if (pilihan == 2) {
    hasil = idr * idrToCny;
    mataUang = 'CNY';
  } else if (pilihan == 3) {
    hasil = idr * idrToSar;
    mataUang = 'SAR';
  } else {
    print('Pilihan tidak valid!');
    return;
  }

  print('\nHasil Konversi:');
  print('Rp$idr = ${hasil.toStringAsFixed(2)} $mataUang');
}
