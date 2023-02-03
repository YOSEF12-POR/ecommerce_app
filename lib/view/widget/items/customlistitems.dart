import 'package:cached_network_image/cached_network_image.dart';
import '/controller/favorite_controller.dart';
import '/controller/items_controller.dart';
import '/core/constant/color.dart';
import '/core/functions/translatefatabase.dart';
import '/data/model/itemsmodel.dart';
import '/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListItems extends GetView<ItemsControllerImp> {
  final ItemsModel itemsModel;
  // final bool active;
  const CustomListItems({Key? key, required this.itemsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          controller.goToPageProductDetails(itemsModel);
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Hero(
                    tag: "${itemsModel.itemsId}",
                    child: CachedNetworkImage(
                      imageUrl:
                          AppLink.imagestItems + "/" + itemsModel.itemsImage!,
                      height: 100,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                      translateDatabase(
                          itemsModel.itemsNameAr, itemsModel.itemsName),
                      style: const TextStyle(
                          color: AppColor.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Rating 3.5 ", textAlign: TextAlign.center),
                      Container(
                        alignment: Alignment.bottomCenter,
                        height: 22,
                        child: Row(
                          children: [
                            ...List.generate(
                                5,
                                (index) => const Icon(
                                      Icons.star,
                                      size: 15,
                                    ))
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${itemsModel.itemsPrice} \$",
                          style: const TextStyle(
                              color: AppColor.primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: "sans")),
                      GetBuilder<FavoriteController>(
                          builder: (controller) => IconButton(
                              onPressed: () {
                                if (controller.isFavorite[itemsModel.itemsId] ==
                                    "1") {
                                  controller.setFavorite(
                                      itemsModel.itemsId, "0");
                                  controller
                                      .removeFavorite(itemsModel.itemsId!);
                                } else {
                                  controller.setFavorite(
                                      itemsModel.itemsId, "1");
                                  controller.addFavorite(itemsModel.itemsId!);
                                }
                              },
                              icon: Icon(
                                controller.isFavorite[itemsModel.itemsId] == "1"
                                    ? Icons.favorite
                                    : Icons.favorite_border_outlined,
                                color: AppColor.primaryColor,
                              )))
                    ],
                  )
                ]),
          ),
        ));
  }
}

// logical thinking

// GetBuilder<FavoriteController>(
//                         builder: (controller) => IconButton(
//                             onPressed: () {
//                                 if (controller.isFavorite[itemsModel.itemsId] == "1" ) {
//                                   controller.setFavorite(
//                                       itemsModel.itemsId, "0");
//                                 } else {
//                                   controller.setFavorite(
//                                       itemsModel.itemsId, "1");
//                                 }
//                             },
//                             icon: Icon(
//                               controller.isFavorite[itemsModel.itemsId] == "1"
//                                   ? Icons.favorite
//                                   : Icons.favorite_border_outlined,
//                               color: AppColor.primaryColor,
//                             )))
