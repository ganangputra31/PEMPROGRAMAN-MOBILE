import 'dart:io';

void main() {
  while (true) {
    print('\n==============================');
    print('     APLIKASI KONVERSI UNIT');
    print('==============================');
    print('Pilih kategori:');
    print('1. Panjang');
    print('2. Massa');
    print('3. Volume');
    print('4. Suhu');
    print('0. Keluar');

    int kategori = _readInt('Pilihan: ');

    if (kategori == 0) {
      print('Terima kasih! 👋');
      break;
    }

    switch (kategori) {
      case 1:
        _konversiDenganMap(
          judul: 'PANJANG',
          baseUnit: 'meter',
          // faktor terhadap 1 meter
          factors: {
            'millimeter': 1000.0,
            'centimeter': 100.0,
            'meter': 1.0,
            'kilometer': 0.001,
            'inch': 39.3700787,
          },
          allowNegative: false,
        );
        break;

      case 2:
        _konversiDenganMap(
          judul: 'MASSA',
          baseUnit: 'kilogram',
          // faktor terhadap 1 kilogram
          factors: {
            'miligram': 1000000.0,
            'gram': 1000.0,
            'kilogram': 1.0,
            'ton': 0.001,
            'pound': 2.20462262,
          },
          allowNegative: false,
        );
        break;

      case 3:
        _konversiDenganMap(
          judul: 'VOLUME',
          baseUnit: 'liter',
          // faktor terhadap 1 liter
          factors: {
            'milliliter': 1000.0,
            'liter': 1.0,
            'meter_kubik': 0.001,
            'gallon_us': 0.264172052,
            'cup': 4.22675284,
          },
          allowNegative: false,
        );
        break;

      case 4:
        _konversiSuhu();
        break;

      default:
        print('❌ Pilihan kategori tidak valid.');
    }
  }
}

/// Konversi berbasis Map faktor (untuk panjang, massa, volume)
void _konversiDenganMap({
  required String judul,
  required String baseUnit,
  required Map<String, double> factors,
  required bool allowNegative,
}) {
  print('\n--- KONVERSI $judul ---');

  // tampilkan daftar unit
  List<String> units = factors.keys.toList();
  for (int i = 0; i < units.length; i++) {
    print('${i + 1}. ${units[i]}');
  }

  double nilai = _readDouble('Masukkan nilai: ');
  if (!allowNegative && nilai < 0) {
    print('❌ Nilai tidak boleh negatif untuk kategori $judul.');
    return;
  }

  int fromIndex = _readInt('Dari unit (1-${units.length}): ') - 1;
  int toIndex = _readInt('Ke unit   (1-${units.length}): ') - 1;

  if (fromIndex < 0 ||
      fromIndex >= units.length ||
      toIndex < 0 ||
      toIndex >= units.length) {
    print('❌ Pilihan unit tidak valid.');
    return;
  }

  String fromUnit = units[fromIndex];
  String toUnit = units[toIndex];

  // cara konversi:
  // 1) ubah ke base unit
  //    baseValue = nilai / faktorFrom (karena faktor adalah "berapa unit per 1 base")
  // 2) ubah dari base ke target
  //    hasil = baseValue * faktorTo
  double factorFrom = factors[fromUnit]!;
  double factorTo = factors[toUnit]!;

  double baseValue = nilai / factorFrom;
  double hasil = baseValue * factorTo;

  print('\n✅ HASIL KONVERSI');
  print('Kategori : $judul');
  print('Input    : $nilai $fromUnit');
  print('Output   : ${hasil.toStringAsFixed(6)} $toUnit');
}

/// Konversi suhu: pakai rumus (bukan Map faktor sederhana)
/// Minimal 5 unit: Celsius, Fahrenheit, Kelvin, Reamur, Rankine
void _konversiSuhu() {
  print('\n--- KONVERSI SUHU ---');
  List<String> units = ['celsius', 'fahrenheit', 'kelvin', 'reamur', 'rankine'];

  for (int i = 0; i < units.length; i++) {
    print('${i + 1}. ${units[i]}');
  }

  double nilai = _readDouble('Masukkan nilai suhu: ');

  int fromIndex = _readInt('Dari unit (1-${units.length}): ') - 1;
  int toIndex = _readInt('Ke unit   (1-${units.length}): ') - 1;

  if (fromIndex < 0 ||
      fromIndex >= units.length ||
      toIndex < 0 ||
      toIndex >= units.length) {
    print('❌ Pilihan unit tidak valid.');
    return;
  }

  String fromUnit = units[fromIndex];
  String toUnit = units[toIndex];

  // langkah:
  // 1) ubah ke Celsius (sebagai base)
  double celsius = _toCelsius(nilai, fromUnit);
  // 2) dari Celsius ke target
  double hasil = _fromCelsius(celsius, toUnit);

  print('\n✅ HASIL KONVERSI');
  print('Kategori : SUHU');
  print('Input    : $nilai $fromUnit');
  print('Output   : ${hasil.toStringAsFixed(2)} $toUnit');
}

double _toCelsius(double value, String unit) {
  switch (unit) {
    case 'celsius':
      return value;
    case 'fahrenheit':
      return (value - 32) * 5 / 9;
    case 'kelvin':
      return value - 273.15;
    case 'reamur':
      return value * 5 / 4;
    case 'rankine':
      return (value - 491.67) * 5 / 9;
    default:
      throw Exception('Unit tidak dikenali');
  }
}

double _fromCelsius(double c, String unit) {
  switch (unit) {
    case 'celsius':
      return c;
    case 'fahrenheit':
      return (c * 9 / 5) + 32;
    case 'kelvin':
      return c + 273.15;
    case 'reamur':
      return c * 4 / 5;
    case 'rankine':
      return (c + 273.15) * 9 / 5;
    default:
      throw Exception('Unit tidak dikenali');
  }
}

/// Helper input int aman
int _readInt(String prompt) {
  while (true) {
    stdout.write(prompt);
    String? input = stdin.readLineSync();

    if (input == null || input.trim().isEmpty) {
      print('❌ Input kosong. Coba lagi.');
      continue;
    }

    int? val = int.tryParse(input.trim());
    if (val == null) {
      print('❌ Harus angka (int). Coba lagi.');
      continue;
    }
    return val;
  }
}

/// Helper input double aman
double _readDouble(String prompt) {
  while (true) {
    stdout.write(prompt);
    String? input = stdin.readLineSync();

    if (input == null || input.trim().isEmpty) {
      print('❌ Input kosong. Coba lagi.');
      continue;
    }

    double? val = double.tryParse(input.trim());
    if (val == null) {
      print('❌ Harus angka (double). Coba lagi.');
      continue;
    }
    return val;
  }
}
