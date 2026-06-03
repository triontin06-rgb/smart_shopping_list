import 'package:flutter/material.dart';
import '../../services/api_service.dart';
import 'add_product_screen.dart';
import 'edit_product_screen.dart';

class SmartChecklistScreen extends StatefulWidget {
  const SmartChecklistScreen({super.key});

  @override
  State<SmartChecklistScreen> createState() =>
      _SmartChecklistScreenState();
}

class _SmartChecklistScreenState
    extends State<SmartChecklistScreen> {

  Future getData() async {
    return await ApiService.getChecklist();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F4FA),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const AddProductScreen(),
            ),
          );

          setState(() {});
        },
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [

              const Text(
                "Daftar Belanja",
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "Kelola daftar belanja mingguanmu",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 20),

              TextField(
                decoration: InputDecoration(
                  hintText: "Cari barang...",
                  prefixIcon:
                      const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius:
                      BorderRadius.circular(25),
                ),
                child: const Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [

                    Text(
                      "Progress Belanja",
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),

                    SizedBox(height: 10),

                    Text(
                      "65%",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 15),

                    LinearProgressIndicator(
                      value: 0.65,
                      minHeight: 10,
                    ),

                    SizedBox(height: 15),

                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment
                              .spaceAround,
                      children: [

                        Column(
                          children: [
                            Text(
                              "20",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight:
                                    FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Total",
                              style: TextStyle(
                                color:
                                    Colors.white70,
                              ),
                            )
                          ],
                        ),

                        Column(
                          children: [
                            Text(
                              "13",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight:
                                    FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Dibeli",
                              style: TextStyle(
                                color:
                                    Colors.white70,
                              ),
                            )
                          ],
                        ),

                        Column(
                          children: [
                            Text(
                              "7",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight:
                                    FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Sisa",
                              style: TextStyle(
                                color:
                                    Colors.white70,
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Item Belanja",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              Expanded(
                child: FutureBuilder(
                  future: getData(),
                  builder: (context, snapshot) {

                    if (!snapshot.hasData) {
                      return const Center(
                        child:
                            CircularProgressIndicator(),
                      );
                    }

                    var data =
                        snapshot.data as List;

                    if (data.isEmpty) {
                      return const Center(
                        child: Text(
                          "Belum ada barang",
                        ),
                      );
                    }

                    return ListView.builder(
                      itemCount: data.length,
                      itemBuilder:
                          (context, index) {

                        bool checked =
                            data[index]
                                    ['status']
                                    .toString() ==
                                "1";

                        return Container(
                          margin:
                              const EdgeInsets.only(
                                  bottom: 12),
                          decoration:
                              BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius
                                    .circular(20),
                          ),
                          child: ListTile(

                            leading: Checkbox(
                                value: data[index]['status'].toString() == "1",
                                onChanged: (value) async {

                                  await ApiService.updateChecklistStatus(
                                    data[index]['id'].toString(),
                                    value == true ? "1" : "0",
                                  );

                                  setState(() {});
                                },
                              ),

                            title: Text(
                              data[index]
                                  ['nama_barang'],
                              style: TextStyle(
                                decoration:
                                    checked
                                        ? TextDecoration
                                            .lineThrough
                                        : null,
                              ),
                            ),

                            subtitle: Text(
                              "${data[index]['jumlah']} pcs",
                            ),

                            trailing: Row(
                              mainAxisSize:
                                  MainAxisSize.min,
                              children: [

                                Text(
                                  "Rp ${data[index]['harga']}",
                                  style:
                                      const TextStyle(
                                    fontWeight:
                                        FontWeight
                                            .bold,
                                    color: Colors
                                        .deepPurple,
                                  ),
                                ),

                                IconButton(
                                  icon: const Icon(
                                    Icons.edit,
                                    color:
                                        Colors.blue,
                                  ),
                                  onPressed:
                                      () async {

                                    await Navigator
                                        .push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) =>
                                            EditProductScreen(
                                          id: data[index]
                                                  ['id']
                                              .toString(),
                                          namaBarang:
                                              data[index]
                                                  [
                                                  'nama_barang'],
                                          kategori:
                                              data[index]
                                                  [
                                                  'kategori'],
                                          jumlah:
                                              data[index]
                                                  [
                                                  'jumlah']
                                                  .toString(),

                                          harga:
                                              data[index]
                                                  [
                                                  'harga']
                                        ),
                                      ),
                                    );

                                    setState(() {});
                                  },
                                ),

                                IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    color:
                                        Colors.red,
                                  ),
                                  onPressed:
                                      () async {

                                    await ApiService
                                        .deleteChecklist(
                                      data[index]
                                              ['id']
                                          .toString(),
                                    );

                                    setState(() {});
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}