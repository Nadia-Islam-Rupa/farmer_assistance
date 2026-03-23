import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_filex/open_filex.dart';

import 'bloc/crop_disease_bloc.dart';

class ImageUploadBox extends StatefulWidget {
  const ImageUploadBox({super.key});

  @override
  State<ImageUploadBox> createState() => _ImageUploadBoxState();
}

class _ImageUploadBoxState extends State<ImageUploadBox> {
  bool filePic = false;
  String? fileName;
  File? selectedFile;

  Future<void> _pickFile(BuildContext context) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['png', 'jpg', 'jpeg'],
    );

    if (result != null) {
      setState(() {
        filePic = true;
        selectedFile = File(result.files.single.path!);
      });
      final file = result.files.first;
      fileName = file.name;
    }
  }

  void deleteFile() {
    setState(() {
      filePic = false;
      selectedFile = null;
      fileName = null;
    });
  }

  void previewFile() {
    if (selectedFile != null) {
      OpenFilex.open(selectedFile!.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: selectedFile == null
              ? null
              : () {
                  previewFile();
                },
          child: Container(
            height: 180,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.shade300,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey.shade50,
            ),
            child: selectedFile == null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.cloud_upload_rounded,
                        color: Color(0xff00796B),
                        size: 48,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Drop your leaf image here',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Text(
                        'or click to browse from your device\n(JPG, PNG, Max 10MB)',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.file(
                      selectedFile!,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
          ),
        ),
        const SizedBox(height: 18),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            selectedFile == null
                ? ElevatedButton.icon(
                    onPressed: () {
                      _pickFile(context);
                    },
                    icon: const Icon(Icons.folder_open_rounded),
                    label: const Text('Select Image'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff00796B),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  )
                : ElevatedButton.icon(
                    onPressed: () {
                      context.read<CropDiseaseBloc>().add(
                        CropDiseaseEvent.started(imageFile: selectedFile!),
                      );
                    },
                    icon: const Icon(Icons.auto_awesome),
                    label: const Text('Predict Disease'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff00796B),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
            const SizedBox(width: 10),
            selectedFile != null
                ? ElevatedButton.icon(
                    onPressed: () {
                      deleteFile();
                    },
                    icon: const Icon(Icons.delete_outline_rounded),
                    label: const Text('Delete Image'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade50,
                      foregroundColor: Colors.red.shade700,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  )
                : SizedBox(),
          ],
        ),
      ],
    );
  }
}
