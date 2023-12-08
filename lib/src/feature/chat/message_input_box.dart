import 'dart:io';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/src/core/config/theme/theme.dart';
import 'package:flutter_riverpod_base/src/res/assets.dart';
import 'package:flutter_riverpod_base/src/utils/custom_extension_methods.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MessageInputBoxWidget extends StatefulWidget {
  const MessageInputBoxWidget({
    Key? key,
  }) : super(key: key);

  @override
  _MessageInputBoxWidgetState createState() => _MessageInputBoxWidgetState();
}

class _MessageInputBoxWidgetState extends State<MessageInputBoxWidget> {
  final ImagePicker _imagePicker = ImagePicker();
  List<File> pickedImage = [];
  List<File> pickedFiles = [];

  Future<void> _pickImageFromCamera() async {
    final XFile? image =
        await _imagePicker.pickImage(source: ImageSource.camera);

    if (image != null) {
      pickedImage = [File(image.path)];
      setState(() {});
    }
  }

  void _pickMultipleImages() async {
    List<XFile>? images = await _imagePicker.pickMultiImage();
    pickedImage.addAll(images.map((image) => File(image.path)) ?? []);
    setState(() {});
  }

  void _pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc'],
    );

    if (result != null) {
      pickedFiles.addAll(result.paths.map((path) => File(path!)) ?? []);
      setState(() {});
    }
  }

  void removeFileAt(int index) {
    pickedFiles.removeAt(index);
    setState(() {});
  }

  void removeImageAt(int index) {
    pickedImage.removeAt(index);
    setState(() {});
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      showDragHandle: true,
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.image_rounded),
              title: const Text('Gallery'),
              onTap: _pickMultipleImages,
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.file_copy_rounded),
              title: const Text('Documents'),
              onTap: _pickFiles,
            ),
          ],
        );
      },
    );
  }

  PageController pageController = PageController();
  ScrollController listviewController = ScrollController();
  TextEditingController messageController = TextEditingController();

  bool showEmojiPanel = false;
  toggleEmojiPanel() {
    showEmojiPanel = !showEmojiPanel;
    setState(() {});
  }

  Widget _buildFileCard(File file) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(left: 15),
      child: Card(
        child: Stack(
          children: [
            const Center(
              child: Icon(
                Icons.picture_as_pdf_rounded,
                size: 50,
              ),
            ),
            Positioned(
              bottom: 10,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  file.path.split('/').last,
                  overflow: TextOverflow.clip,
                ),
              ),
            ),
            Positioned(
              right: 10,
              top: 10,
              child: CircleAvatar(
                child: GestureDetector(
                  onTap: () => removeFileAt(pickedFiles.indexOf(file)),
                  child: const Icon(Icons.remove),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          constraints:
              const BoxConstraints(maxHeight: 200, maxWidth: double.maxFinite),
          child: pickedFiles.isNotEmpty
              ? ListView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: listviewController,
                  itemCount: pickedFiles.length,
                  itemBuilder: (context, index) =>
                      _buildFileCard(pickedFiles[index]),
                )
              : pickedImage.isNotEmpty
                  ? Stack(
                      children: [
                        PageView.builder(
                          itemCount: pickedImage.length,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.file(
                                    pickedImage[index],
                                    width: double.maxFinite,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  right: 10,
                                  top: 10,
                                  child: CircleAvatar(
                                    backgroundColor: colorScheme.secondary,
                                    child: GestureDetector(
                                      onTap: () => removeImageAt(index),
                                      child: const Icon(Icons.remove),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: SmoothPageIndicator(
                              controller: pageController,
                              count: pickedImage.length,
                              onDotClicked: (index) =>
                                  pageController.animateToPage(
                                index,
                                duration: const Duration(seconds: 1),
                                curve: Curves.easeIn,
                              ),
                              effect: WormEffect(
                                spacing: 28,
                                activeDotColor: colorScheme.primary,
                                dotColor: colorScheme.outline,
                                dotWidth: 12,
                                dotHeight: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : const SizedBox.shrink(),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          constraints:
              const BoxConstraints(maxHeight: 200, maxWidth: double.maxFinite),
          child: Offstage(
            offstage: !showEmojiPanel,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: EmojiPicker(
                onEmojiSelected: (cat, emi) {},
                onBackspacePressed: () {},
                textEditingController: messageController,
                config: Config(
                  columns: 7,
                  emojiSizeMax: 32 *
                      (foundation.defaultTargetPlatform == TargetPlatform.iOS
                          ? 1.30
                          : 1.0),
                  verticalSpacing: 0,
                  horizontalSpacing: 0,
                  gridPadding: EdgeInsets.zero,
                  initCategory: Category.RECENT,
                  bgColor: Color(0xFFF2F2F2),
                  indicatorColor: Colors.blue,
                  iconColor: Colors.grey,
                  iconColorSelected: Colors.blue,
                  backspaceColor: Colors.blue,
                  skinToneDialogBgColor: Colors.white,
                  skinToneIndicatorColor: Colors.grey,
                  enableSkinTones: true,
                  recentTabBehavior: RecentTabBehavior.RECENT,
                  recentsLimit: 28,
                  noRecents: const Text(
                    'No Recents',
                    style: TextStyle(fontSize: 20, color: Colors.black26),
                    textAlign: TextAlign.center,
                  ), // Needs to be const Widget
                  loadingIndicator:
                      const SizedBox.shrink(), // Needs to be const Widget
                  tabIndicatorAnimDuration: kTabScrollDuration,
                  categoryIcons: const CategoryIcons(),
                  buttonMode: ButtonMode.MATERIAL,
                ),
              ),
            ),
          ),
        ),
        Card(
          margin: const EdgeInsets.only(left: 20, right: 20),
          elevation: 5,
          child: Row(
            children: [
              IconButton(
                onPressed: toggleEmojiPanel,
                icon: SvgPicture.asset(ImageAssets.smile),
                color: colorScheme.secondary,
                padding: EdgeInsets.zero,
              ),
              Expanded(
                child: TextFormField(
                  maxLines: 5,
                  minLines: 1,
                  keyboardType: TextInputType.multiline,
                  controller: messageController,
                  decoration: InputDecoration(
                    hintText: 'Type a message...',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                    prefixIconColor: colorScheme.secondary,
                    hintStyle: textTheme.titleLarge!.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: _showBottomSheet,
                child: SvgPicture.asset(ImageAssets.link),
              ),
              const SizedBox(width: 15),
              GestureDetector(
                onTap: _pickImageFromCamera,
                child: SvgPicture.asset(ImageAssets.camera),
              ),
              const SizedBox(width: 15),
            ],
          ),
        ),
      ],
    ).addSpacingBetweenElements(5);
  }
}
