import 'package:flutter/material.dart';

class DetailPageView extends StatelessWidget {
  const DetailPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Details'),
      // ),
      body: Stack(
        children: [
          Image.asset(
            'assets/images/city1.jpg',
            width: double.infinity,
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height * 0.5,
          ),
          SafeArea(
            child: Column(
              children: [
                //appbar buttons
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(100),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: const BoxDecoration(
                                  // color: kPrimaryClr,
                                  shape: BoxShape.circle),
                              child: const Center(
                                child: Icon(
                                  Icons.arrow_back,
                                  color: Colors.purple,
                                  size: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(100),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            height: 25,
                            width: 25,
                            decoration: const BoxDecoration(
                                // color: Colors.purple,
                                shape: BoxShape.circle),
                            child: const Center(
                              child: Icon(
                                Icons.bookmark_rounded,
                                color: Colors.purple,
                                size: 25,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                ),
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height / 2,
                    width: double.infinity,
                    padding:
                        const EdgeInsets.only(top: 20, left: 20, right: 20),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: ListView(children: [
                      Padding(
                        padding: const EdgeInsets.only(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "swayambhunath",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 25,
                                    ),
                                    Text(
                                      "4.5",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            // const SizedBox(
                            //   height: 10,
                            // ),
                            // const Row(
                            //   children: [
                            //     Icon(
                            //       Icons.location_on,
                            //       color: Colors.orange,
                            //     ),
                            //     SizedBox(
                            //       width: 12,
                            //     ),
                            //     Text(
                            //       'swayambhunath.nepal',
                            //       style: TextStyle(
                            //         color: Colors.grey,
                            //         fontSize: 20,
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            // const SizedBox(
                            //   height: 25,
                            // ),
                            // const Text(
                            //   "Trip details",
                            //   style: TextStyle(
                            //     fontSize: 23,
                            //     fontWeight: FontWeight.bold,
                            //   ),
                            // ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'This stupa is the oldest of its kind in Nepal and has numerous shrines and monasteries on its premises. Swayambhu literally means "self-existent one". Believed to date back to 460 A.D., it was built by King Manadeva and by the 13th century, it had become an important center of Buddhism.',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 18,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Divider(
                              height: 5,
                              color: Colors.black,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Row(
                              children: [
                                Text(
                                  "duration",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Expanded(
                                  child: Text(
                                    " 2 days",
                                    //  "${swayambhunath.days} days ",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Row(
                              children: [
                                Text(
                                  "distance",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Expanded(
                                  child: Text(
                                    "10 km",
                                    //  "${swayambhunath.days} days ",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            MaterialButton(
                              color: Colors.orange,
                              minWidth: double.infinity,
                              height: 55,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100)),
                              onPressed: () {},
                              child: const Text(
                                "Book Trip",
                                style: TextStyle(
                                  color: Colors.purple,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 22,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
