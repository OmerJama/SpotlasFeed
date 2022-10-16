import 'package:feed_tab/utils/media_query.dart';
import 'package:flutter/material.dart';

class TagsRow extends StatelessWidget {
  const TagsRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*
      This class would use a list view builder, however, API is showing tags as null, so I hard coded each one. Eventually, this would be replaced by
      Container(
        height: 40,
        width: 367,
        child: ListView.builder(
          
          itemCount: tags.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 6),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                )
              padding: const EdgeInsets.only(left: 8, right: 8, top: 6, bottom: 6),
              height: 32,
          
              child: Center(child: Text(tags[index], textAlign: TextAlign.center, style: TextStyle(fontFamily: 'SF Pro Display', fontSize: 15, fontWeight: FontWeight.w600),)),
            ),
          );
        },),
      ),
    */

    List<String> tags = [
      "Outdoors",
      "Cheap",
      "Live music",
      "Fancy",
      "Romantic"
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
          padding: EdgeInsets.only(left: getProportionateScreenWidth(12)),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                ),
                padding:
                    const EdgeInsets.only(left: 8, right: 8, top: 6, bottom: 6),
                height: getProportionateScreenHeight(32),
                width: getProportionateScreenWidth(79),
                child: Center(
                    child: Text(
                  tags[0],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                )),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * (4 / 375),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                ),
                padding:
                    const EdgeInsets.only(left: 8, right: 8, top: 6, bottom: 6),
                height: getProportionateScreenHeight(32),
                width: getProportionateScreenWidth(60),
                child: Center(
                    child: Text(
                  tags[1],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                )),
              ),
              SizedBox(
                width: getProportionateScreenWidth(4),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                ),
                padding:
                    const EdgeInsets.only(left: 8, right: 8, top: 6, bottom: 6),
                height: getProportionateScreenHeight(32),
                width: getProportionateScreenWidth(86),
                child: Center(
                    child: Text(
                  tags[2],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                )),
              ),
              SizedBox(
                width: getProportionateScreenWidth(4),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                ),
                padding:
                    const EdgeInsets.only(left: 8, right: 8, top: 6, bottom: 6),
                height: getProportionateScreenHeight(32),
                width: getProportionateScreenWidth(56),
                child: Center(
                    child: Text(
                  tags[3],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                )),
              ),
              SizedBox(
                width: getProportionateScreenWidth(4),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                ),
                padding:
                    const EdgeInsets.only(left: 8, right: 8, top: 6, bottom: 6),
                height: getProportionateScreenHeight(32),
                width: getProportionateScreenWidth(80),
                child: Center(
                    child: Text(
                  tags[4],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                )),
              ),
            ],
          )),
    );
  }
}
