import 'package:flutter/material.dart';
import '../../services/api_service.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() =>
      _AddProductScreenState();
}

class _AddProductScreenState
    extends State<AddProductScreen> {

  final namaController =
      TextEditingController();

  final kategoriController =
      TextEditingController();

  final jumlahController =
      TextEditingController();

  final hargaController = 
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F4FA),

      appBar: AppBar(
        title: const Text("Tambah Barang"),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(20),
              ),
              child: Column(
                children: [

                  TextField(
                    controller: namaController,
                    decoration: InputDecoration(
                      labelText: "Nama Barang",
                      prefixIcon:
                          const Icon(Icons.shopping_bag),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(15),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  TextField(
                    controller: kategoriController,
                    decoration: InputDecoration(
                      labelText: "Kategori",
                      prefixIcon:
                          const Icon(Icons.category),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(15),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  TextField(
                    controller: jumlahController,
                    keyboardType:
                        TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Jumlah",
                      prefixIcon:
                          const Icon(Icons.numbers),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(15),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  TextField(
                    controller: hargaController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Harga",
                      prefixIcon: Icon(Icons.payments_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(15),
                  ),
                ),

                onPressed: () async {

                  var res =
                      await ApiService.addChecklist(
                    namaController.text,
                    kategoriController.text,
                    jumlahController.text,
                    hargaController.text,
                  );

                  if (res['status'] ==
                      'success') {

                    ScaffoldMessenger.of(context)
                        .showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Barang berhasil ditambahkan",
                        ),
                      ),
                    );

                    Navigator.pop(context);
                  }
                },

                child: const Text(
                  "Simpan",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}