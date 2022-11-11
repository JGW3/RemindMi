import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remindmi/app/modules/addDependent/add_dependent_view.dart';
import 'package:remindmi/app/routes/app_pages.dart';

import 'package:remindmi/app/widget/manage_card.dart';
import 'package:remindmi/app/modules/home/managepages/credits.dart';
import 'package:remindmi/app/modules/home/managepages/accessibility.dart';
import 'package:remindmi/app/modules/home/managepages/privacy_policy.dart';
import 'package:remindmi/app/modules/home/managepages/settings.dart';

class ManageView extends StatefulWidget {
  const ManageView({super.key});

  @override
  State<ManageView> createState() => _ManageViewState();
}

class _ManageViewState extends State<ManageView> {
  @override
  Widget build(BuildContext context) {
    GetStorage getStorage = GetStorage();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 100,
          elevation: 0,
          title: Column(
            children: [
              Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.fromLTRB(16, 0, 0, 0),
                child: Text(
                  'Manage',
                  style: GoogleFonts.dmSans(
                      fontSize: 36.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
              ),
            ],
          ),
        ),
        body: Container(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 12,
                ),
              ),
              SliverToBoxAdapter(
                child: ManageCard(
                  icon: Icons.add_box,
                  title: 'Add Dependent',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return AddDependentView();
                        },
                      ),
                    );
                  },
                ),
              ),
              // SliverToBoxAdapter(
              //   child: ManageCard(
              //     icon: Icons.article,
              //     title: 'All Tasks',
              //     onTap: () {
              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //           builder: (context) {
              //             return AccessibilityPage(); //change
              //           },
              //         ),
              //       );
              //     },
              //   ),
              // ),
              SliverToBoxAdapter(
                child: ManageCard(
                  icon: Icons.accessible,
                  title: 'Accessibility',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return AccessibilityPage();
                        },
                      ),
                    );
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: ManageCard(
                  icon: Icons.settings_sharp,
                  title: 'Settings',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SettingsPage();
                        },
                      ),
                    );
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: ManageCard(
                  icon: Icons.copyright,
                  title: 'Credits',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return CreditsPage();
                        },
                      ),
                    );
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: ManageCard(
                  icon: Icons.article_rounded,
                  title: 'Terms & Conditions',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return PrivacyPolicyPage();
                        },
                      ),
                    );
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: ManageCard(
                  icon: Icons.logout_sharp,
                  title: 'Sign out',
                  onTap: () {
                    Get.offAllNamed(Routes.LANDINGPAGE);
                    getStorage.erase();

                    // Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
