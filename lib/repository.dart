import 'dart:convert';
import 'package:ambildata/model.dart';
import 'package:http/http.dart' as http;

class Repository {
  final _baseUrl = 'https://6560126983aba11d99d02c46.mockapi.io';

  Future getData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl + '/Blog'));

      if (response.statusCode == 200) {
        print(response.body);
        Iterable it = jsonDecode(response.body);
        List<Blog> blog = it.map((e) => Blog.fromJson(e)).toList();
        return blog;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future postData(String name, String Kota) async {
    try {
      final response = await http.post(Uri.parse(_baseUrl + '/Blog'),
          body: {"name": name, "Kota": Kota});

      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future putData(int? id, String? name, String? Kota) async {
    try {
      final response = await http.put(
          Uri.parse(
            _baseUrl + '/Blog/' + id.toString(),
          ),
          body: {'name': name, 'Kota': Kota});

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future deleteData(String id) async {
    try {
      final response = await http.delete(
        Uri.parse(
          _baseUrl + '/Blog/' + id,
        ),
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
