import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:remindmi/app/modules/home/managepages/accessibility.dart';
import 'package:remindmi/app/modules/home/widget/manage_card.dart';
import 'package:remindmi/app/routes/app_pages.dart';
import 'package:remindmi/app/modules/home/managepages/credits.dart';
import 'package:remindmi/app/modules/home/managepages/privacy_policy.dart';
import 'package:remindmi/app/modules/home/managepages/settings.dart';

class ManageView extends StatelessWidget {
  const ManageView({super.key});

  @override
  Widget build(BuildContext context) {
    final getStorage = GetStorage();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 228, 226, 226),
      
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 100,
        elevation: 0,
        title: Text(
          'Manage',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 12,
            ),
          ),
          SliverToBoxAdapter(
            child: ManageCard(
              icon: Icons.accessibility,
              title: 'Accessibility',
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return AccessibilityPage();
                },),);
              },
            ),
          ),
          SliverToBoxAdapter(
            child: ManageCard(
              icon: Icons.settings,
              title: 'Settings',
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return SettingsPage();
                },),);
              },
            ),
          ),SliverToBoxAdapter(
            child: ManageCard(
              icon: Icons.credit_score,
              title: 'Credits',
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return CreditsPage();
                },),);
              },
            ),
          ),SliverToBoxAdapter(
            child: ManageCard(
              icon: Icons.privacy_tip,
              title: 'Terms & Conditions',
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return PrivacyPolicyPage();
                },),);
              },
            ),
          ),SliverToBoxAdapter(
            child: ManageCard(
              icon: Icons.accessibility,
              title: 'Sign out',
              onTap: (){
                getStorage.erase();
                Get.offAllNamed(Routes.LOGIN);
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}