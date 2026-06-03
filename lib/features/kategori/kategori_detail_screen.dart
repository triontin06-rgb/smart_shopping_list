import 'package:flutter/material.dart';

class CategoryDetailScreen extends StatefulWidget {
  final String title;

  const CategoryDetailScreen({super.key, required this.title});

  @override
  State<CategoryDetailScreen> createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends State<CategoryDetailScreen> {

  final Map<String, List<Map<String, dynamic>>> dataKategori = {
    "Makanan & Minuman": [
      {"nama": "Coca Cola", "harga": 8000},
      {"nama": "Coklat SilverQueen", "harga": 15000},
      {"nama": "Roti Tawar", "harga": 12000},
      {"nama": "Susu UHT", "harga": 18000},
      {"nama": "Mie Instan", "harga": 3500},
      {"nama": "Teh Kotak", "harga": 5000},
      {"nama": "Kopi Sachet", "harga": 2500},
    ],

    "Kebutuhan Rumah": [
      {"nama": "Panci Stainless", "harga": 75000},
      {"nama": "Lampu LED", "harga": 25000},
      {"nama": "Sapu Lantai", "harga": 20000},
      {"nama": "Ember Plastik", "harga": 15000},
      {"nama": "Gas LPG 3kg", "harga": 20000},
      {"nama": "Galon Air", "harga": 18000},
    ],

    "Perawatan Pribadi": [
      {"nama": "Shampo Clear", "harga": 18000},
      {"nama": "Sabun Lifebuoy", "harga": 7000},
      {"nama": "Pasta Gigi Pepsodent", "harga": 12000},
      {"nama": "Face Wash", "harga": 25000},
      {"nama": "Deodorant", "harga": 15000},
      {"nama": "Body Lotion", "harga": 22000},
    ],

    "Kebersihan": [
      {"nama": "Deterjen Bubuk", "harga": 15000},
      {"nama": "Sabun Cuci Piring", "harga": 8000},
      {"nama": "Pembersih Lantai", "harga": 12000},
      {"nama": "Tisu Gulung", "harga": 10000},
      {"nama": "Kain Pel", "harga": 20000},
      {"nama": "Pengharum Ruangan", "harga": 15000},
    ],

    "Olahraga": [
      {"nama": "Dumbbell 5kg", "harga": 120000},
      {"nama": "Matras Yoga", "harga": 85000},
      {"nama": "Skipping Rope", "harga": 25000},
      {"nama": "Resistance Band", "harga": 40000},
      {"nama": "Sepatu Lari", "harga": 250000},
    ],

    "Obat-obatan": [
      {"nama": "Paracetamol", "harga": 5000},
      {"nama": "Obat Flu", "harga": 8000},
      {"nama": "Minyak Kayu Putih", "harga": 15000},
      {"nama": "Vitamin C", "harga": 20000},
      {"nama": "Antasida", "harga": 7000},
    ],
  };

  List<Map<String, dynamic>> get items =>
      dataKategori[widget.title] ?? [];

  void addItem(Map<String, dynamic> item) {
    int qty = 1;

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setStateDialog) {

            int total = item["harga"] * qty;

            return AlertDialog(
              title: Text(item["nama"]),

              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Qty"),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              if (qty > 1) {
                                setStateDialog(() => qty--);
                              }
                            },
                            icon: const Icon(Icons.remove),
                          ),
                          Text("$qty"),
                          IconButton(
                            onPressed: () {
                              setStateDialog(() => qty++);
                            },
                            icon: const Icon(Icons.add),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  Text(
                    "Total: Rp $total",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Batal"),
                ),

                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);

                    // TODO: masuk ke checklist global nanti
                  },
                  child: const Text("Tambah"),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];

          return Card(
            child: ListTile(
              title: Text(item["nama"]),
              subtitle: Text("Rp ${item["harga"]}"),
              trailing: ElevatedButton(
                onPressed: () => addItem(item),
                child: const Text("Tambah"),
              ),
            ),
          );
        },
      ),
    );
  }
}