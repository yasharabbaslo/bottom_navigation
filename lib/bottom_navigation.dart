import 'package:flutter/material.dart';

const int blueIndex = 0;
const int yellowIndex = 1;
const int redIndex = 2;
const int greenIndex = 3;
const double bottomNavigationHeight = 65;

class BottomNavigation extends StatelessWidget {
  final Function(int index) onTap;
  final int selectedTabIndex;

  const BottomNavigation({
    Key? key,
    required this.onTap,
    required this.selectedTabIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: bottomNavigationHeight,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xff9b8487).withOpacity(0.3),
                    blurRadius: 20,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _BottomNavigationItem(
                    iconFileName: 'Home.png',
                    activeIconFileName: 'HomeActive.png',
                    title: 'Blue',
                    onTap: () {
                      onTap(blueIndex);
                    },
                    isActive: selectedTabIndex == blueIndex,
                  ),
                  _BottomNavigationItem(
                    iconFileName: 'Articles.png',
                    activeIconFileName: 'ArticlesActive.png',
                    title: 'Yellow',
                    onTap: () {
                      onTap(yellowIndex);
                    },
                    isActive: selectedTabIndex == yellowIndex,
                  ),
                  Expanded(child: Container()),
                  _BottomNavigationItem(
                    iconFileName: 'Search.png',
                    activeIconFileName: 'SearchActive.png',
                    title: 'Red',
                    onTap: () {
                      onTap(redIndex);
                    },
                    isActive: selectedTabIndex == redIndex,
                  ),
                  _BottomNavigationItem(
                    iconFileName: 'Menu.png',
                    activeIconFileName: 'MenuActive.png',
                    title: 'Green',
                    onTap: () {
                      onTap(greenIndex);
                    },
                    isActive: selectedTabIndex == greenIndex,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: MediaQuery.of(context).size.width / 2 - 26,
            child: Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: const Color(0xff376AED),
                borderRadius: BorderRadius.circular(26),
                border: Border.all(
                  width: 4,
                  color: Colors.white,
                ),
              ),
              child: Image.asset('assets/img/plus.png'),
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomNavigationItem extends StatelessWidget {
  final String iconFileName;
  final String activeIconFileName;
  final String title;
  final bool isActive;
  final Function() onTap; // For recognising tab taps

  const _BottomNavigationItem(
      {Key? key,
      required this.iconFileName,
      required this.activeIconFileName,
      required this.title,
      required this.onTap,
      required this.isActive})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/img/${isActive ? activeIconFileName : iconFileName}',
              width: 24,
              height: 24,
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.caption!.copyWith(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: isActive
                      ? const Color(0xff376AED)
                      : const Color(0xff7B8BB2)),
            ),
          ],
        ),
      ),
    );
  }
}
