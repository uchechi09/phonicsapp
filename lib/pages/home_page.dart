import 'package:flutter/material.dart';
import 'package:phonicsapp/pages/lesson_page.dart';
import 'package:phonicsapp/pages/profile_page.dart';
import 'package:phonicsapp/widgets/custom_tab_controller.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: tabController,
        children: [LessonsPage(), ProfilePage()],
      ),
      bottomNavigationBar: CustomBottomNavigation(tabController: tabController,),
    );
  }
}