import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hello_flutter/utils/fetch.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class PageG extends StatefulWidget {
  const PageG({super.key});

  @override
  State<PageG> createState() => _PageGState();
}

class _PageGState extends State<PageG> {
  final _image = ImagePicker();
  final log = Logger();
  List<AssetEntity> selectedAssets = [];

  Future<void> _handleUpImage() async {
    final XFile? image = await _image.pickImage(source: ImageSource.gallery);

    if (image != null) {
      // Fluttertoast.showToast(msg: image.name);
      log.d("name==>${image.name}");
      log.d("path==>${image.path}");
      log.d("length==>${await image.length()}");

      final data = FormData.fromMap({
        "file": await MultipartFile.fromFile(image.path, filename: image.name),
      });
      final res = await fetch.post("xxx", data: data);

      log.d(res.data);
    }
  }

  Future<void> _pickAssets() async {
    final List<AssetEntity>? result = await AssetPicker.pickAssets(
      context,
      pickerConfig: const AssetPickerConfig(
        maxAssets: 9,
        requestType: RequestType.image,
      ),
    );

    if (result != null) {
      setState(() {
        selectedAssets = result;
      });
      log.d("selectedAssets${result[0].mimeType}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          TextButton(
            onPressed: () async {
              _pickAssets();
            },
            child: const Text("点击上传图片"),
          ),

          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
              ),
              itemCount: selectedAssets.length,
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: AssetEntityImage(
                    selectedAssets[index],
                    isOriginal: true,
                    thumbnailSize: const ThumbnailSize.square(100),
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
