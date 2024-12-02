import 'dart:developer';

import 'package:finance_app/common/widgets/custom_bottom_app_bar.dart';
import 'package:finance_app/features/home/home_page.dart';
import 'package:finance_app/features/wallet/wallet_page.dart';
import 'package:flutter/material.dart';

import '../../common/constants/app_colors.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  final pageController = PageController();

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      log(pageController.page.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: const [
          HomePage(),
          WalletPage(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomAppBar(
        selectedItemColor: AppColors.indigo,
        children: [
          CustomBottomAppBarItem(
            label: 'wallet',
            primaryIcon: Icons.account_balance_wallet,
            secondaryIcon: Icons.account_balance_wallet_outlined,
            onPressed: () => pageController.jumpToPage(
              2,
            ),
          ),
        ],
      ),
    );
  }
}
