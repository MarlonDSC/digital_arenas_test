import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inmo_mobile/core/constants/page_keys.dart';
import 'package:inmo_mobile/core/generated/l10n/app_localizations.dart';
import 'package:inmo_mobile/core/ui/components/base_sheet.dart';
import 'package:inmo_mobile/core/value_objects/file_type.dart';
import 'package:inmo_mobile/features/permission/presentation/bloc/permission/permission_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

class SelectFileType extends StatelessWidget {
  final bool isMultiple;
  final List<FileType> fileTypes;
  final CameraDevice preferredCameraDevice;
  final void Function(List<XFile> selectedFiles) onSelectedFiles;

  const SelectFileType._({
    required this.isMultiple,
    required this.fileTypes,
    required this.onSelectedFiles,
    required this.preferredCameraDevice,
    super.key,
  }) : assert(fileTypes.length > 0, 'fileTypes must not be empty');

  // Single
  const SelectFileType.single({
    super.key,
    required this.fileTypes,
    required this.onSelectedFiles,
    this.preferredCameraDevice = CameraDevice.front,
  }) : isMultiple = false,
       assert(fileTypes.length == 1, 'fileTypes must have exactly one element');

  // File type
  SelectFileType.image({
    Key? key,
    required void Function(List<XFile>) onSelectedFiles,
    CameraDevice preferredCameraDevice = CameraDevice.front,
  }) : this._(
         key: key,
         isMultiple: false,
         fileTypes: [FileType.takePhoto, FileType.chooseFromGallery],
         onSelectedFiles: onSelectedFiles,
         preferredCameraDevice: preferredCameraDevice,
       );

  SelectFileType.video({
    Key? key,
    required void Function(List<XFile>) onSelectedFiles,
    CameraDevice preferredCameraDevice = CameraDevice.front,
  }) : this._(
         key: key,
         isMultiple: false,
         fileTypes: [FileType.takeVideo, FileType.chooseFromVideo],
         onSelectedFiles: onSelectedFiles,
         preferredCameraDevice: preferredCameraDevice,
       );

  // Source type
  SelectFileType.gallery({
    Key? key,
    required void Function(List<XFile>) onSelectedFiles,
    CameraDevice preferredCameraDevice = CameraDevice.front,
  }) : this._(
         key: key,
         isMultiple: false,
         fileTypes: [FileType.chooseFromGallery, FileType.chooseFromVideo],
         onSelectedFiles: onSelectedFiles,
         preferredCameraDevice: preferredCameraDevice,
       );

  SelectFileType.camera({
    Key? key,
    required void Function(List<XFile>) onSelectedFiles,
    CameraDevice preferredCameraDevice = CameraDevice.front,
  }) : this._(
         key: key,
         isMultiple: false,
         fileTypes: [FileType.takePhoto, FileType.takeVideo],
         onSelectedFiles: onSelectedFiles,
         preferredCameraDevice: preferredCameraDevice,
       );

  // Multiple
  SelectFileType.multiple({
    Key? key,
    required void Function(List<XFile>) onSelectedFiles,
    CameraDevice preferredCameraDevice = CameraDevice.front,
  }) : this._(
         key: key,
         isMultiple: true,
         fileTypes: [FileType.chooseFromGallery, FileType.chooseFromVideo],
         onSelectedFiles: onSelectedFiles,
         preferredCameraDevice: preferredCameraDevice,
       );

  // All
  SelectFileType.all({
    Key? key,
    required void Function(List<XFile>) onSelectedFiles,
    CameraDevice preferredCameraDevice = CameraDevice.front,
    bool isMultiple = true,
  }) : this._(
         key: key,
         isMultiple: isMultiple,
         fileTypes: [
           FileType.takePhoto,
           FileType.takeVideo,
           FileType.chooseFromGallery,
           FileType.chooseFromVideo,
         ],
         onSelectedFiles: onSelectedFiles,
         preferredCameraDevice: preferredCameraDevice,
       );

  ListTile _fileTypeToListItem(BuildContext context, FileType fileType) {
    final Map<FileType, ({Key key, String title, IconData icon})> fileTypeMap = {
      FileType.takePhoto: (
        key: pageKeys.photoFileInput.takePhoto,
        title: AppLocalizations.of(context)!.takePhoto,
        icon: Icons.photo_camera,
      ),
      FileType.chooseFromGallery: (
        key: pageKeys.photoFileInput.chooseFromGallery,
        title: AppLocalizations.of(context)!.chooseFromGallery,
        icon: Icons.photo_library,
      ),
      FileType.takeVideo: (
        key: pageKeys.photoFileInput.takeVideo,
        title: AppLocalizations.of(context)!.takeVideo,
        icon: Icons.videocam,
      ),
      FileType.chooseFromVideo: (
        key: pageKeys.photoFileInput.chooseFromVideo,
        title: AppLocalizations.of(context)!.chooseFromVideo,
        icon: Icons.video_library,
      ),
    };

    final fileTypeInfo = fileTypeMap[fileType]!;

    return ListTile(
      key: fileTypeInfo.key,
      title: Text(fileTypeInfo.title),
      leading: Icon(fileTypeInfo.icon),
      onTap: () => _onTap(context, fileType),
    );
  }

  void _onTap(BuildContext context, FileType fileType) async {
    Navigator.pop(context);
    if (isMultiple) {
      List<XFile> pickedFiles = await ImagePicker().pickMultipleMedia();
      if (pickedFiles.isNotEmpty) {
        onSelectedFiles(pickedFiles);
      }
    } else {
      XFile? pickedFile;

      if (fileType.isImage) {
        pickedFile = await ImagePicker().pickImage(
          source:
              fileType == FileType.chooseFromGallery
                  ? ImageSource.gallery
                  : ImageSource.camera,
          preferredCameraDevice: preferredCameraDevice,
        );
      } else {
        pickedFile = await ImagePicker().pickVideo(
          source: ImageSource.camera,
          preferredCameraDevice: preferredCameraDevice,
        );
      }

      if (pickedFile != null) {
        onSelectedFiles([pickedFile]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PermissionBloc, PermissionState>(
      listener: (context, state) {
        var mediaLibraryPermission = state.permissions[Permission.mediaLibrary];
        var cameraPermission = state.permissions[Permission.camera];
        if (mediaLibraryPermission?.isPermanentlyDenied ?? false) {
          openAppSettings();
        } else if (cameraPermission?.isPermanentlyDenied ?? false) {
          openAppSettings();
        }
      },
      child: BaseSheet(
        children: [
          ...fileTypes.map(
            (fileType) => _fileTypeToListItem(context, fileType),
          ),
        ],
      ),
    );
  }
}
