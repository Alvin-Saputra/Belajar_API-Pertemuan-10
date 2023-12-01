import "package:ambildata/repository.dart";
import "package:flutter/material.dart";

class AddBlog extends StatefulWidget {
  const AddBlog({super.key});

  @override
  State<AddBlog> createState() => _AddBlogState();
}

class _AddBlogState extends State<AddBlog> {
  Repository repository = Repository();
  final _namaController = TextEditingController();
  final _kotaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as List<String>;
    if (args[1].isNotEmpty){
      _namaController.text=args[1];
    }
    if(args[2].isNotEmpty){
      _kotaController.text=args[2];
    }
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
                ElevatedButton(
                onPressed: () async {
                  bool response = await repository.putData(int.parse(args[0]),
                      _namaController.text, _kotaController.text);

                  if (response) {
                    Navigator.of(context).popAndPushNamed('/home');
                  } else {
                    print('Update data gagal');
                  }
                },
                child: Text('Update'))
          ],
        ),
      ),
    );
  }
}
