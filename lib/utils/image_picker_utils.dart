import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import '../../core/extensions/context_extensions.dart';
import '../../core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart' show getTemporaryDirectory;

class ImagePickerUtils {
  final int maxSize = 1024 * 1024; // 1MB dalam bytes

  Future<String?> pickImageFromGallery(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) => Container(
        width: 100,
        height: 100,
        color: AppColors.background.withAlpha(50),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );

    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      File? compressedFile = await convertToJpg(
        context,
        pickedFile,
        'compressed_image',
      );
      if (compressedFile != null) {
        List<int> imageBytes = await compressedFile.readAsBytes();
        Navigator.pop(context);
        return base64Encode(imageBytes);
      }
      Navigator.pop(context);
      return null;
    }
    Navigator.pop(context);
    return null;
  }

  Future<String?> pickImageFromCamera(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) => Container(
        width: 100,
        height: 100,
        color: AppColors.background.withAlpha(50),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      File? compressedFile = await convertToJpg(
        context,
        pickedFile,
        'compressed_image',
      );
      if (compressedFile != null) {
        List<int> imageBytes = await compressedFile.readAsBytes();
        Navigator.pop(context);
        return base64Encode(imageBytes);
      }
      Navigator.pop(context);
      return null;
    }
    Navigator.pop(context);
    return null;
  }

  Future<File?> convertToJpg(
      BuildContext context, XFile file, String name) async {
    final directory = await getTemporaryDirectory();
    final img.Image? originalImage = img.decodeImage(await file.readAsBytes());

    if (originalImage == null) {
      context.errorSnackBar('Error convert image');
      return null;
    }

    // Path baru untuk gambar hasil konversi
    final newPath = '${directory.path}/$name.jpg';
    File newFile = File(newPath);

    int quality = 90; // Mulai dengan kualitas tinggi
    List<int> compressedBytes = img.encodeJpg(originalImage, quality: quality);

    // Kurangi kualitas jika masih lebih dari 1MB
    while (compressedBytes.length > maxSize && quality > 30) {
      quality -= 10; // Turunkan kualitas per 10%
      compressedBytes = img.encodeJpg(originalImage, quality: quality);
    }

    // Jika masih lebih dari 1MB, perkecil dimensi gambar
    int newWidth = originalImage.width;
    int newHeight = originalImage.height;
    while (
        compressedBytes.length > maxSize && newWidth > 200 && newHeight > 200) {
      newWidth = (newWidth * 0.9).toInt(); // Kurangi 10%
      newHeight = (newHeight * 0.9).toInt();
      img.Image resizedImage =
          img.copyResize(originalImage, width: newWidth, height: newHeight);
      compressedBytes = img.encodeJpg(resizedImage, quality: quality);
    }

    // Simpan hasil gambar ke file baru
    await newFile.writeAsBytes(compressedBytes, flush: true);
    return newFile;
  }

  Future<String?> compressAndConvertToBase64(
    BuildContext context,
    Uint8List imageBytes,
  ) async {
    int maxSize = 1024 * 1024; // 1MB dalam bytes
    int quality = 90; // Mulai dengan kualitas tinggi
    img.Image? originalImage = img.decodeImage(imageBytes);

    if (originalImage == null) {
      context.errorSnackBar('Error convert image');
      return null;
    }

    List<int> compressedBytes = img.encodeJpg(originalImage, quality: quality);

    // Kurangi kualitas jika masih lebih dari 1MB
    while (compressedBytes.length > maxSize && quality > 30) {
      quality -= 10; // Kurangi kualitas per 10%
      compressedBytes = img.encodeJpg(originalImage, quality: quality);
    }

    // Jika masih lebih dari 1MB, perkecil dimensi gambar
    int newWidth = originalImage.width;
    int newHeight = originalImage.height;
    while (
        compressedBytes.length > maxSize && newWidth > 200 && newHeight > 200) {
      newWidth = (newWidth * 0.9).toInt(); // Kurangi 10%
      newHeight = (newHeight * 0.9).toInt();
      img.Image resizedImage =
          img.copyResize(originalImage, width: newWidth, height: newHeight);
      compressedBytes = img.encodeJpg(resizedImage, quality: quality);
    }

    // Konversi ke Base64
    return 'data:image/jpg;base64,${base64Encode(compressedBytes)}';
  }
}
