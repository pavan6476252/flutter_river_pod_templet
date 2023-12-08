import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/src/res/colors.dart';
import 'package:flutter_riverpod_base/src/res/data.dart';

class ItemCardView extends StatefulWidget {
  final StudioModel studioModel;
  final VoidCallback onClick;
  const ItemCardView(
      {super.key, required this.studioModel, required this.onClick});

  @override
  State<ItemCardView> createState() => _ItemCardViewState();
}

class _ItemCardViewState extends State<ItemCardView> {
  bool isLiked = false;
  toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
        final color = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: widget.onClick,
      child: Container(
        height: 250,
        width: 200,
        decoration: BoxDecoration(
            boxShadow: [const BoxShadow(color: Colors.grey, blurRadius: 2)],
            borderRadius: BorderRadius.circular(6),
            color: ColorAssets.white),
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 120,
              width: double.maxFinite,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.asset(
                      widget.studioModel.image,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Positioned(
                      top: 10,
                      right: 10,
                      child: GestureDetector(
                        onTap: toggleLike,
                        child: CircleAvatar(
                          radius: 12,
                          backgroundColor:
                               color.secondary.withOpacity(0.6),
                          child: Icon(
                            isLiked
                                ? Icons.favorite
                                : Icons.favorite_border_rounded,
                            color: isLiked
                                ?  color.secondary
                                :  color.secondary,
                            size: 16,
                          ),
                        ),
                      ))
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  // margin: const EdgeInsets.symmetric(vertical: 12),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                      color:  color.secondary,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    widget.studioModel.tag,
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: ColorAssets.primaryBlue),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 12,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      widget.studioModel.rating.toString(),
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: ColorAssets.lightGray),
                    )
                  ],
                )
              ],
            ),
            Text(
              widget.studioModel.title,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: ColorAssets.blackFaded),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.location_on,
                  color: ColorAssets.lightGray,
                  size: 12,
                ),
                Text(
                  widget.studioModel.location,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: ColorAssets.lightGray),
                ),
              ],
            ),
            RichText(
                text: TextSpan(
                    text: "\$${widget.studioModel.rent}",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: ColorAssets.primaryBlue),
                    children: [
                  TextSpan(
                    text: " /month",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: ColorAssets.lightGray),
                  )
                ])),
          ],
        ),
      ),
    );
  }
}
