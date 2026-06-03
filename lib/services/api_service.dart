import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl =
      "http://192.168.0.21/smart_shopping_api";

  static Future login(String email, String password) async {
    var response = await http.post(
      Uri.parse("$baseUrl/auth/login.php"),
      body: {
        "email": email,
        "password": password,
      },
    );

    print("LOGIN: ${response.body}");
    return jsonDecode(response.body);
  }

  static Future register(String name, String email, String password) async {
    var response = await http.post(
      Uri.parse("$baseUrl/auth/register.php"),
      body: {
        "name": name,
        "email": email,
        "password": password,
      },
    );

    print("REGISTER: ${response.body}");
    return jsonDecode(response.body);
  }

  //profil
  static Future updateProfile(
    String id,
    String name,
    String email,
  ) async {

    var response = await http.post(
      Uri.parse(
        "$baseUrl/profile/update_profile.php",
      ),
      body: {
        "id": id,
        "name": name,
        "email": email,
      },
    );

    return jsonDecode(response.body);
  }

  //checlist
  static Future addChecklist(
    String namaBarang,
    String kategori,
    String jumlah,
    String harga,
  ) async {

    var response = await http.post(
      Uri.parse(
        "$baseUrl/checklist/creat.php",
      ),
      body: {
        "nama_barang": namaBarang,
        "kategori": kategori,
        "jumlah": jumlah,
        "harga": harga,
      },
    );

    return jsonDecode(response.body);
  }

  static Future getChecklist() async {

    var response = await http.get(
      Uri.parse(
        "$baseUrl/checklist/read.php",
      ),
    );

    return jsonDecode(response.body);
  }

  // static Future updateChecklist(
  //   String id,
  //   String status,
  // ) async {

  //   var response = await http.post(
  //     Uri.parse(
  //       "$baseUrl/checklist/update.php",
  //     ),
  //     body: {
  //       "id": id,
  //       "status": status,
  //     },
  //   );

  //   return jsonDecode(response.body);
  // }

  static Future deleteChecklist(
    String id,
  ) async {

    var response = await http.post(
      Uri.parse(
        "$baseUrl/checklist/delete.php",
      ),
      body: {
        "id": id,
      },
    );

    return jsonDecode(response.body);
  }

  static Future editChecklist(
    String id,
    String namaBarang,
    String kategori,
    String jumlah,
    String harga,
  ) async {

    var response = await http.post(
      Uri.parse(
        "$baseUrl/checklist/update.php",
      ),
      body: {
        "id": id,
        "nama_barang": namaBarang,
        "kategori": kategori,
        "jumlah": jumlah,
        "harga": harga,
      },
    );

    return jsonDecode(response.body);
  }

 static Future updateChecklistStatus(
    String id,
    String status,
  ) async {
    var response = await http.post(
      Uri.parse("$baseUrl/checklist/update.php"),
      body: {
        "id": id,
        "status": status,
      },
    );

    return jsonDecode(response.body);
  }

  
}