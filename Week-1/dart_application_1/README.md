A sample command-line application with an entrypoint in `bin/`, library code
in `lib/`, and example unit test in `test/`.


1. Mengunduh dan Menginstal Android Studio
    - Mengunduh Android Studio 
    - Menjalankan file installer Android Studio.
    - ada tahap pemilihan komponen, memastikan opsi Android Studio dan Android Virtual Device (AVD) dalam keadaan tercentang.
    - Melanjutkan proses instalasi hingga selesai dengan menekan tombol Next dan Install.

2. Melakukan Konfigurasi Awal Android Studio
    - Membuka Android Studio setelah proses instalasi selesai.
    - Memilih opsi Standard Setup agar sistem secara otomatis menginstal komponen yang dibutuhkan.
    - Menunggu proses pengunduhan dan pemasangan komponen seperti Android SDK Platform,Android SDK Build Tools,Android Emulator,Android SDK Command Line Tools
    - Memastikan proses konfigurasi selesai tanpa error.


3. Mengunduh dan Mengekstrak Flutter SDK
    - Mengunduh Flutter SDK melalui website
    - ngekstrak file Flutter ke dalam direktor
    - Memastikan di dalam folder Flutter terdapat folder bin yang berisi file flutter.bat.

4. Menambahkan Flutter ke Environment Variable (PATH)
    - Membuka menu Edit System Environment Variables.
    - Memilih Environment Variables.
    - Pada bagian System Variables, memilih variabel Path lalu klik Edit.
    - Menambahkan lokasi folder
    - Menekan tombol OK hingga semua jendela tertutup.
    - Menutup dan membuka kembali Command Prompt.

5. Menginstal Extension Flutter dan Dart di VS Code
    - Membuka Visual Studio Code.
    - Masuk ke menu Extensions (Ctrl + Shift + X).
    -  Mencari extension Flutter.
    - Menginstal extension Flutter.
    - Menginstal extension Flutter.

6. Membuat dan Menjalankan Program Dart
    - Membuka terminal di VS Code.
    - Membuat project Dart dengan perintah:
        dart create dart_application_1
    - Masuk ke folder project:
        cd dart_application_1
    - Mengedit file utama dan menuliskan program menghitung luas segitiga
    - Menjalankan program dengan perintah:
        dart run
    - Memastikan output berhasil muncul di terminal

