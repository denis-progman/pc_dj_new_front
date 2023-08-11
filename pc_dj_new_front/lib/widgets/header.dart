import 'package:flutter/material.dart';
import 'package:pc_dj_new_front/widgets/components/avatar.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(
          //   'Welcome',
          //   style: Theme.of(context).textTheme.bodyLarge,
          // ),
          // const SizedBox(height: 5),
          // Text(
          //   'Looking for something best?',
          //   style: Theme.of(context)
          //       .textTheme
          //       .titleLarge!
          //       .copyWith(fontWeight: FontWeight.bold),
          // ),
          // const SizedBox(height: 20),
          SizedBox(
              height: 100,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const TitledAvatar(
                      imageUrl: 'assets/images/default/dj_avatar.png',
                      imageTitle: "Best Critic",
                      size: 30,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.40,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image:
                              AssetImage('assets/images/pc_studio_dj_logo.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const TitledAvatar(
                      imageUrl: 'assets/images/default/dj_avatar.png',
                      imageTitle: "Best author",
                      size: 30,
                    ),
                  ])),
        ],
      ),
    );
  }
}
