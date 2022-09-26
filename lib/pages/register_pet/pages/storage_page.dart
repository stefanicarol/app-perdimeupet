import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../register_store.dart';

class StoragePage extends StatefulWidget {
  final RegisterStore store;
  const StoragePage({Key? key, required this.store}) : super(key: key);

  @override
  _StoragePageState createState() => _StoragePageState();
}

class _StoragePageState extends State<StoragePage> {
  final FirebaseStorage storage = FirebaseStorage.instance;
  Reference? refs;
  String? arquivo;
  bool loading = true;
  bool uploading = false;
  double total = 0;

  Future<XFile?> getImage() async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.camera);
    return image;
  }

  Future<UploadTask> upload(String path) async {
    File file = File(path);
    try {
      String ref = 'images/img-${DateTime.now().toString()}.jpeg';
      final storageRef = FirebaseStorage.instance.ref();
      return storageRef.child(ref).putFile(
            file,
            SettableMetadata(
              cacheControl: "public, max-age=300",
              contentType: "image/jpeg",
              customMetadata: {
                "user": "123",
              },
            ),
          );
    } on FirebaseException catch (e) {
      throw Exception('Erro no upload: ${e.code}');
    }
  }

  pickAndUploadImage() async {
    XFile? file = await getImage();
    if (file != null) {
      UploadTask task = await upload(file.path);

      task.snapshotEvents.listen((TaskSnapshot snapshot) async {
        if (snapshot.state == TaskState.running) {
          setState(() {
            uploading = true;
            total = (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
          });
        } else if (snapshot.state == TaskState.success) {
          final photoRef = snapshot.ref;
          arquivo = await photoRef.getDownloadURL();
          refs = photoRef;

          setState(() => uploading = false);
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  deleteImage() async {
    await storage.refFromURL(arquivo!).delete();
    arquivo = null;
    refs = null;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: uploading
            ? Text('${total.round()}% enviado')
            : const Text('Firebase Storage'),
        actions: [
          uploading
              ? const Padding(
                  padding: EdgeInsets.only(right: 12.0),
                  child: Center(
                    child: SizedBox(
                      width: 20.0,
                      height: 20.0,
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              : IconButton(
                  icon: const Icon(Icons.upload),
                  onPressed: pickAndUploadImage,
                )
        ],
        elevation: 0,
      ),
      body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: arquivo == null
              ? const Center(child: Text('Não há imagem ainda.'))
              : ListTile(
                  leading: SizedBox(
                    width: 100,
                    height: 100,
                    child: CachedNetworkImage(
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      imageUrl: arquivo!,
                    ),
                  ),
                  title: ElevatedButton(
                      onPressed: () {
                        widget.store.imagem = arquivo;
                        Navigator.pop(context);
                      },
                      child: const Text("Inserir imagem")),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => deleteImage(),
                  ),
                )),
    );
  }
}
