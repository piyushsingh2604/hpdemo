import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hpdemo/app/routes/app_pages.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  String formatDateDifference(DateTime apiDate) {
    final current = DateTime.now();
    final difference = current.difference(apiDate);

    if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () {
          Get.toNamed(Routes.PDF_SEARCH);
        }, icon: const Icon(Icons.add))],
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Container(
        child: Obx(
          () => controller.discussionLists.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: controller.discussionLists.length,
                  itemBuilder: (BuildContext context, int index) {
                    final data = controller.discussionLists[index];
                    final apiDate = DateTime.parse(data.createdOn.toString());
                    final timeDifference = formatDateDifference(apiDate);
                    PageController pageController = PageController();
                    return Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 15, right: 15),
                      child: Container(
                        padding: const EdgeInsets.only(),
                        width: 1.sw,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                spreadRadius: 1,
                                blurRadius: 10,
                                color: Color.fromARGB(26, 0, 0, 0),
                              )
                            ],
                            color: Colors.white),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (data.img!.isNotEmpty)
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, bottom: 10),
                                child: Row(
                                  children: [
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  data.likedBy!.image ?? ""),
                                              fit: BoxFit.cover)),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Text('${data.likedBy!.name ?? ""} liked')
                                  ],
                                ),
                              ),
                            Container(
                                decoration: const BoxDecoration(
                                  color: Color(0xffE9F8F5),
                                ),
                                width: 1.sw,
                                height: 40,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 10, left: 10),
                                  child: Text(data.pdfName ?? ""),
                                )),
                            const SizedBox(
                              height: 18,
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (data.ownerCategory!.name!.isNotEmpty)
                                    Container(
                                      decoration: const BoxDecoration(),
                                      height: 25.h,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            height: 25,
                                            width: 160,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(15),
                                                      topLeft:
                                                          Radius.circular(15)),
                                              color:
                                                  data.ownerCategory!.bgColor ==
                                                          ''
                                                      ? null
                                                      : Color(int.parse(data
                                                          .ownerCategory!
                                                          .bgColor
                                                          .toString())),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                SizedBox(
                                                  height: 15,
                                                  width: 15,
                                                  child: Image.network(data
                                                          .ownerCategory!
                                                          .icon ??
                                                      ""),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  data.ownerCategory!.name ??
                                                      "",
                                                  style: TextStyle(
                                                      color: data.ownerCategory!
                                                                  .textColor ==
                                                              ''
                                                          ? null
                                                          : Color(int.parse(data
                                                              .ownerCategory!
                                                              .textColor
                                                              .toString()))),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ), //
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: SizedBox(
                                      height: 60,
                                      width: 1.sw,
                                      child: Stack(
                                        children: [
                                          Container(
                                            height: 49,
                                            width: 49,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        data.ownerImg ?? ''),
                                                    fit: BoxFit.cover)),
                                          ),
                                          Positioned(
                                              left: 60,
                                              child: Text(
                                                data.ownerName ?? "",
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              )),
                                          Positioned(
                                              left: 60,
                                              top: 20,
                                              child: Row(
                                                children: [
                                                  Container(
                                                    child: Column(
                                                      children: [
                                                        // add if

                                                        if (data.ownerLevel !=
                                                            0.toString())
                                                          Row(
                                                            children: [
                                                              Text(
                                                                data.ownerLevelName ??
                                                                    "",
                                                                style: const TextStyle(
                                                                    color: Color(
                                                                        0xffBA502D),
                                                                    fontSize:
                                                                        13,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                              ),
                                                              const SizedBox(
                                                                width: 10,
                                                              ),
                                                              Container(
                                                                height: 20,
                                                                width: 20,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            30),
                                                                    border: Border.all(
                                                                        color: Colors
                                                                            .black)),
                                                                child: Center(
                                                                  child: Text(
                                                                    data.ownerLevel ??
                                                                        "",
                                                                    style: const TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            13,
                                                                        fontWeight:
                                                                            FontWeight.w400),
                                                                  ),
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                width: 15,
                                                              ),
                                                              const Text(
                                                                "•",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .green,
                                                                    fontSize:
                                                                        25),
                                                              ),
                                                            ],
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 15,
                                                  ),
                                                  Text(
                                                    timeDifference,
                                                    style: const TextStyle(
                                                        color:
                                                            Color(0xff707070),
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ],
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 15,
                                    ),
                                    child: Text(
                                      data.title ?? "",
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, right: 15, top: 5),
                                    child: Text(
                                      data.pdfImportance ?? "",
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  if (data.img!.isNotEmpty)
                                    SizedBox(
                                      height: 0.3.sh,
                                      width: 1.sw,
                                      child: Stack(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 10),
                                            height: 0.3.sh,
                                            width: 1.sw,
                                            child: PageView.builder(
                                              onPageChanged: (value) {
                                                controller.pages.value =
                                                    ++value;
                                              },
                                              controller: pageController,
                                              scrollDirection: Axis.horizontal,
                                              itemCount: data.img!.length,
                                              itemBuilder: (context, j) {
                                                return Container(
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                            data.img![j],
                                                          ),
                                                          fit: BoxFit.cover),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                );
                                              },
                                            ),
                                          ),
                                          if (data.img!.isNotEmpty)
                                            Positioned(
                                              right: 1,
                                              left: 1,
                                              bottom: 10,
                                              child: Align(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: Container(
                                                  height: 12,
                                                  decoration: BoxDecoration(
                                                      color: Colors.black,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  width: 75,
                                                  child: Center(
                                                    child: SmoothPageIndicator(
                                                      controller:
                                                          pageController,
                                                      count: data.img!.length,
                                                      axisDirection:
                                                          Axis.horizontal,
                                                      effect: const WormEffect(
                                                          spacing: 5,
                                                          activeDotColor:
                                                              Colors.white,
                                                          dotHeight: 8,
                                                          dotWidth: 8),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          Obx(
                                            () => Positioned(
                                              top: 30,
                                              right: 40,
                                              child: Container(
                                                height: 30,
                                                width: 60,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: const Color.fromARGB(
                                                        123, 0, 0, 0)),
                                                child: Center(
                                                  child: Text(
                                                    "${controller.pages}/${data.img!.length}",
                                                    style: const TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, right: 1),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.thumb_up_alt_outlined,
                                        ),
                                        Text(data.likeCount ?? '0'),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        const Icon(
                                          Icons.comment,
                                        ),
                                        Text(data.commentCount ?? "0"),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        const Spacer(),
                                        const Icon(
                                          Icons.share,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Icon(
                                          Icons.bookmark_border_rounded,
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
