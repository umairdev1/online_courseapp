import 'package:flutter/material.dart';

import '../utilis/colors.dart';

class CourseCard extends StatelessWidget {
  bool? coursecard;
  final String title, subtitle, authorname, avatar, date;
  CourseCard(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.authorname,
      required this.avatar,
      required this.date,
      this.coursecard = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 300,
      decoration: BoxDecoration(
          color: coursecard! ? kblueClr : klightpurpleClr,
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
                const Icon(
                  Icons.more_horiz,
                  color: kgreyClr,
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: kgreyClr,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                  color: coursecard! ? kbottonblueClr : kbottonpurpleClr,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 14,
                          backgroundImage: NetworkImage(avatar),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          authorname,
                          style: const TextStyle(
                              color: kblackClr,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              date,
              style: const TextStyle(
                  color: kblackClr, fontSize: 12, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
