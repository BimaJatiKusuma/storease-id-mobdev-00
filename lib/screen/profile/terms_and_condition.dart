import 'package:flutter/material.dart';

class TermsAndcondition extends StatefulWidget {
  const TermsAndcondition({super.key});

  @override
  State<TermsAndcondition> createState() => _TermsAndconditionState();
}

class _TermsAndconditionState extends State<TermsAndcondition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SYARAT DAN KETENTUAN"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(termsAndConditions)
          ],
        ),
      ),
    );
  }
}

String termsAndConditions = '''
SYARAT DAN KETENTUAN LAYANAN WEDDING ORGANIZER

1. Pihak Terlibat
- Wedding Organizer (WO): Pihak penyelenggara yang bertanggung jawab mengatur acara pernikahan sesuai dengan kesepakatan.
- Pelanggan: Pihak yang menggunakan jasa WO untuk keperluan acara pernikahan.

2. Ruang Lingkup Layanan
WO menyediakan jasa pengelolaan acara pernikahan, yang mencakup namun tidak terbatas pada:
- Perencanaan keseluruhan acara
- Pengadaan vendor (catering, dekorasi, fotografi, dan lainnya)
- Koordinasi hari-H acara
- Penjadwalan rapat, konsultasi, dan inspeksi lokasi
- Penyediaan susunan acara dan rundown

3. Biaya dan Pembayaran
- Pelanggan wajib membayar sejumlah biaya sesuai kesepakatan yang tertuang dalam kontrak.
- Pembayaran dilakukan dalam beberapa tahap:
  1. DP (Down Payment): Sebesar 30% dari total biaya sebagai tanda jadi, dibayarkan setelah kontrak ditandatangani.
  2. Pembayaran Kedua: 50% dari total biaya, dilakukan maksimal 2 bulan sebelum hari acara.
  3. Pembayaran Terakhir: 20% dari total biaya, dilakukan maksimal 7 hari sebelum acara berlangsung.
- Pembayaran dilakukan melalui transfer bank ke rekening yang ditentukan oleh pihak WO.
- Jika pembayaran tidak dilakukan sesuai jadwal, WO berhak menunda atau membatalkan layanan dengan pemberitahuan terlebih dahulu.

4. Perubahan dan Pembatalan
- Perubahan Tanggal Acara:
  - Pelanggan dapat mengajukan perubahan tanggal acara maksimal 30 hari sebelum hari-H, selama tanggal baru yang diinginkan masih tersedia.
  - Jika tanggal baru tidak tersedia, pelanggan berhak atas pengembalian dana sebesar 50% dari pembayaran yang telah dilakukan.
- Pembatalan oleh Pelanggan:
  - Pembatalan yang dilakukan oleh pelanggan setelah pembayaran DP tidak akan mendapatkan pengembalian dana.
  - Pembatalan yang dilakukan 30 hari sebelum acara akan dikenakan penalti sebesar 70% dari total biaya.
- Pembatalan oleh WO:
  - Jika WO membatalkan kontrak tanpa alasan yang jelas, seluruh pembayaran yang telah dilakukan oleh pelanggan akan dikembalikan.

5. Tanggung Jawab
- Tanggung Jawab WO:
  - WO bertanggung jawab penuh untuk memastikan bahwa semua layanan yang disepakati diselenggarakan dengan baik pada hari acara.
  - WO tidak bertanggung jawab atas kerusakan, keterlambatan, atau masalah yang disebabkan oleh pihak ketiga (vendor) yang bukan bagian dari kontrak langsung WO.
  - Jika terjadi masalah di hari acara, WO berkewajiban untuk mencari solusi terbaik sesuai dengan situasi.
- Tanggung Jawab Pelanggan:
  - Pelanggan bertanggung jawab untuk memberikan informasi yang akurat dan tepat waktu terkait dengan rincian acara.
  - Pelanggan bertanggung jawab atas kerusakan atau kehilangan yang disebabkan oleh tamu atau pihak yang terkait dengan acara.

6. Force Majeure
WO tidak bertanggung jawab atas keterlambatan atau pembatalan layanan yang disebabkan oleh kejadian di luar kendali (force majeure), termasuk tapi tidak terbatas pada bencana alam, pandemi, kebakaran, pemogokan, dan kebijakan pemerintah. Dalam situasi ini, kedua belah pihak sepakat untuk menunda acara atau merundingkan kembali layanan.

7. Kerahasiaan
WO wajib menjaga kerahasiaan seluruh informasi pribadi pelanggan, termasuk data acara, vendor, dan informasi keuangan. Informasi ini hanya akan digunakan untuk keperluan penyelenggaraan acara dan tidak akan dibagikan kepada pihak ketiga tanpa persetujuan tertulis dari pelanggan.

8. Penyelesaian Sengketa
Apabila terjadi sengketa atau ketidaksepakatan antara pelanggan dan WO, kedua belah pihak setuju untuk menyelesaikan masalah melalui jalur musyawarah dan mufakat. Jika musyawarah tidak mencapai penyelesaian, maka sengketa akan diselesaikan melalui hukum yang berlaku di wilayah setempat.

9. Lain-lain
- Syarat dan ketentuan ini berlaku sejak tanggal kontrak ditandatangani hingga seluruh layanan selesai diberikan.
- Segala hal yang belum diatur dalam syarat dan ketentuan ini akan dirundingkan secara tertulis oleh kedua belah pihak.
''';
