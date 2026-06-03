import 'package:flutter/material.dart';
import '../../services/api_service.dart';

class EditProductScreen extends StatefulWidget {

  final String id;
  final String namaBarang;
  final String kategori;
  final String jumlah;
  final String harga;

  const EditProductScreen({
    super.key,
    required this.id,
    required this.namaBarang,
    required this.kategori,
    required this.jumlah,
    required this.harga,
  });

  @override
  State<EditProductScreen> createState() =>
      _EditProductScreenState();
}

class _EditProductScreenState
    extends State<EditProductScreen> {

  late TextEditingController namaController;
  late TextEditingController kategoriController;
  late TextEditingController jumlahController;
  late TextEditingController hargaController;

  @override
  void initState() {
    super.initState();

    namaController =
        TextEditingController(
            text: widget.namaBarang);

    kategoriController =
        TextEditingController(
            text: widget.kategori);

    jumlahController =
        TextEditingController(
            text: widget.jumlah);

    hargaController =
        TextEditingController(
            text: widget.jumlah);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("Edit Barang"),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            TextField(
              controller: namaController,
              decoration: const InputDecoration(
                labelText: "Nama Barang",
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: kategoriController,
              decoration: const InputDecoration(
                labelText: "Kategori",
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: jumlahController,
              decoration: const InputDecoration(
                labelText: "Jumlah",
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: hargaController,
              decoration: const InputDecoration(
                labelText: "Harga",
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(

                onPressed: () async {

                  await ApiService.editChecklist(
                    widget.id,
                    namaController.text,
                    kategoriController.text,
                    jumlahController.text,
                    hargaController.text,
                  );

                  Navigator.pop(context);
                },

                child: const Text(
                  "Update",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}