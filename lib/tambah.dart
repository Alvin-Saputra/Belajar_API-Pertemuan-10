import "package:ambildata/repository.dart";
import "package:flutter/material.dart";

class tambahBlog extends StatefulWidget {
  const tambahBlog({super.key});

  @override
  State<tambahBlog> createState() => _AddBlogState();
}

class _AddBlogState extends State<tambahBlog> {
  Repository repository = Repository();
  final _namaController = TextEditingController();
  final _kotaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('tambah data'),
      ),
      body: Container(
        child: Column(
          children: [
            TextField(
              controller: _namaController,
              decoration: InputDecoration(hintText: 'name'),
            ),
            TextField(
              controller: _kotaController,
              decoration: InputDecoration(hintText: 'Kota'),
            ),
            ElevatedButton(
                onPressed: () async {
                  bool response = await repository.postData(
                      _namaController.text, _kotaController.text);

                  if (response) {
                    Navigator.of(context).popAndPushNamed('/home');
                  } else {
                    print('Post data gagal');
                  }
                },
                child: Text('Submit')),
          ],
        ),
      ),
    );
  }
}
