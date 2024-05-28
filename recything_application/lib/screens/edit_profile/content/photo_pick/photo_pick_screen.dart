import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:recything_application/constants/color_constant.dart';

class PhotoPickerScreen extends StatefulWidget {
  const PhotoPickerScreen({super.key});

  @override
  PhotoPickerScreenState createState() => PhotoPickerScreenState();
}

class PhotoPickerScreenState extends State<PhotoPickerScreen> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  List<AssetEntity> _images = [];
  int _currentIndex = 0;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _requestPermissions();
  }

  Future<void> _requestPermissions() async {
    final statuses = await [
      Permission.camera,
      Permission.photos,
    ].request();

    if (statuses[Permission.camera]!.isGranted &&
        statuses[Permission.photos]!.isGranted) {
      _fetchImages();
    } else {
      _showPermissionsDialog();
    }
  }

  Future<void> _fetchImages() async {
    final PermissionState ps = await PhotoManager.requestPermissionExtend();
    if (ps.isAuth) {
      final List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(
        type: RequestType.image,
        onlyAll: true,
      );
      if (albums.isNotEmpty) {
        final List<AssetEntity> recentImages =
            await albums.first.getAssetListRange(
          start: 0,
          end: 100,
        );
        setState(() {
          _images = recentImages;
          _isLoading = false;
        });
      } else {
        print('No albums found');
        _isLoading = false;
      }
    } else {
      _showPermissionsDialog();
      _isLoading = false;
    }
  }

  void _showPermissionsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Permissions Required'),
        content: const Text(
            'This app needs photo library and camera access to function properly. Please grant the required permissions in the settings.'),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: const Text('Open Settings'),
            onPressed: () {
              openAppSettings();
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  Future<void> _pickImageFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = image;
      });
    }
  }

  Future<void> _takePictureWithCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _image = image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick a Photo'),
        backgroundColor: ColorConstant.primaryColor500,
      ),
      body: _isLoading ? _buildLoadingState() : _buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_library),
            label: 'Gallery',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            label: 'Camera',
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingState() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildBody() {
    return _currentIndex == 0 ? _buildGalleryTab() : _buildCameraTab();
  }

  Widget _buildGalleryTab() {
    return _images.isEmpty
        ? const Center(child: Text('No images found'))
        : GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
            ),
            itemCount: _images.length,
            itemBuilder: (context, index) {
              return FutureBuilder<Uint8List?>(
                future: _images[index].thumbnailDataWithSize(
                  const ThumbnailSize(200, 200),
                ),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    print('Error loading thumbnail: ${snapshot.error}');
                    return const Center(child: Icon(Icons.error));
                  } else if (!snapshot.hasData || snapshot.data == null) {
                    print('No data available for thumbnail');
                    return const Center(child: Text('No image available'));
                  }

                  final bytes = snapshot.data!;
                  return GestureDetector(
                    onTap: () async {
                      final file = await _images[index].file;
                      if (file != null) {
                        setState(() {
                          _image = XFile(file.path);
                        });
                      } else {
                        print('Failed to load image file');
                      }
                    },
                    child: Image.memory(bytes, fit: BoxFit.cover),
                  );
                },
              );
            },
          );
  }

  Widget _buildCameraTab() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _image == null
              ? const Text('No image taken.')
              : Image.file(File(_image!.path)),
          ElevatedButton(
            onPressed: _takePictureWithCamera,
            child: const Text('Take Picture with Camera'),
          ),
        ],
      ),
    );
  }
}
