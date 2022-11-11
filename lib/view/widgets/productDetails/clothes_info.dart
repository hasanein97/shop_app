import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:shop_app/logic/controllers/product_controller.dart';
import 'package:shop_app/utils/theme.dart';
import 'package:shop_app/view/widgets/text_utils.dart';

class ClothesInfo extends StatefulWidget {
  final String title;
  final int productId;
  final double rate;
  final String description;
   ClothesInfo(
      {required this.rate,
      required this.productId,
      required this.title,
        required this.description,
      Key? key})
      : super(key: key);

  @override
  State<ClothesInfo> createState() => _ClothesInfoState();
}

class _ClothesInfoState extends State<ClothesInfo> {
  final controller = Get.find<ProductController>();
double rating= 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  widget.title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
              ),
              Obx(
                () => Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Get.isDarkMode
                        ? Colors.white.withOpacity(0.9)
                        : Colors.grey.withOpacity(0.9),
                    shape: BoxShape.circle,
                  ),
                  child: InkWell(
                    onTap: () {
                      controller.manageFavourites(widget.productId);
                    },
                    child: controller.isFavourites(widget.productId)
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 20,
                          )
                        : const Icon(
                            Icons.favorite_outline,
                            color: Colors.red,
                            size: 20,
                          ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              TextUtils(
                  underLine: TextDecoration.none,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  text: "${widget.rate}",
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
              const SizedBox(
                width:3,
              ),
              RatingBar.builder(
                maxRating:1,
                itemSize: 20,
                itemBuilder:(context,_)=> const Icon(Icons.star,color: Colors.amber,) ,
              onRatingUpdate: (rating)=> setState(() {
                this.rating = rating;
              }),
              ),
            ],
          ),
           const SizedBox(
            height: 20,
          ),
          ReadMoreText(
            widget.description,
            trimLines: 3,
            textAlign: TextAlign.justify,
            trimMode: TrimMode.Line,
            trimCollapsedText: "Show More",
            trimExpandedText: "Show Less",
            lessStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode?pinkClr:mainColor,
            ),
            style:TextStyle(
              fontSize: 16,
                height: 2,
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode?Colors.white:Colors.black,
          ),
          ),
        ],
      ),
    );
  }
}
