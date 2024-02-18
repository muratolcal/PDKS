
// import 'package:teknopark_pdks/theme/theme_settings.dart';
// import 'package:teknopark_pdks/utils/helper.dart';
// import 'package:flutter/material.dart';
// import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

// class CustomBottomNavBar extends StatefulWidget {
//   const CustomBottomNavBar({super.key});

//   @override
//   State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
// }

// class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
//   final GlobalKey<ScaffoldState> navbar = GlobalKey<ScaffoldState>();
//   bool stateNamane = false;
//   @override
//   void dispose() {
//     navbar.currentState?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     PersistentTabController controller;
//     controller = PersistentTabController(initialIndex: 0);

//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       key: navbar,
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(0.0),
//         child: AppBar(
//           elevation: 0,
//         ),
//       ),
//       body: PersistentTabView(
//         context,
//         controller: controller,
//         hideNavigationBar: false,
//         // navBarHeight: 60,
//         screens: Helper.roleId == 1
//             ? buildStudentScreens()
//             : Helper.roleId == 2
//                 ? buildParentScreens()
//                 : buildTeachercreens(),
//         items: Helper.roleId == 1
//             ? navBarsStudentItems()
//             : Helper.roleId == 2
//                 ? navBarsParentItems()
//                 : navBarsTeacherItems(),
//         confineInSafeArea: true,
//         backgroundColor: CustomTheme.primaryColor,
//         resizeToAvoidBottomInset: true,
//         popAllScreensOnTapOfSelectedTab: true,
//         popAllScreensOnTapAnyTabs: true,
//         popActionScreens: PopActionScreensType.all,
//         stateManagement: true,
//         selectedTabScreenContext: (p0) {},
//         itemAnimationProperties: const ItemAnimationProperties(
//           duration: Duration(milliseconds: 100),
//           curve: Curves.ease,
//         ),
//         screenTransitionAnimation: const ScreenTransitionAnimation(
//           animateTabTransition: true,
//           curve: Curves.ease,
//           duration: Duration(milliseconds: 100),
//         ),
//         navBarStyle: NavBarStyle.style3,
//       ),
//     );
//     // ),
//     // );
//   }

//   buildStudentScreens() {
//     return [
//       const HomeScreen(),
//       const AttendanceListScreen(),
//       const ProfileSettingsScreen(),
//     ];
//   }

//   buildParentScreens() {
//     return [
//       const HomeScreen(),
//       const PaymentInfoScreen(),
//       const ProfileSettingsScreen(),
//     ];
//   }

//   buildTeachercreens() {
//     return [
//       const TeacherHomeScreen(),
//       const TabSyllabusScreen(),
//       const ProfileSettingsScreen(),
//     ];
//   }

//   List<PersistentBottomNavBarItem> navBarsStudentItems() {
//     return [
//       PersistentBottomNavBarItem(
//         icon: const Icon(Icons.home),
//         title: AppLocalizations.of(context)!.anasayfa,
//         activeColorPrimary: CustomTheme.darkColor,
//         inactiveColorPrimary: Colors.grey,
//       ),
//       PersistentBottomNavBarItem(
//         icon: const Icon(Icons.list),
//         title: AppLocalizations.of(context)!.yoklama,
//         activeColorPrimary: CustomTheme.darkColor,
//         inactiveColorPrimary: Colors.grey,
//       ),
//       PersistentBottomNavBarItem(
//         icon: const Icon(Icons.person),
//         title: AppLocalizations.of(context)!.profilim,
//         activeColorPrimary: CustomTheme.darkColor,
//         inactiveColorPrimary: Colors.grey,
//       ),
//     ];
//   }

//   List<PersistentBottomNavBarItem> navBarsParentItems() {
//     return [
//       PersistentBottomNavBarItem(
//         icon: const Icon(Icons.home),
//         title: AppLocalizations.of(context)!.anasayfa,
//         activeColorPrimary: CustomTheme.darkColor,
//         inactiveColorPrimary: Colors.grey,
//       ),
//       PersistentBottomNavBarItem(
//         icon: const Icon(Icons.credit_card),
//         title: AppLocalizations.of(context)!.odemeler,
//         activeColorPrimary: CustomTheme.darkColor,
//         inactiveColorPrimary: Colors.grey,
//       ),
//       PersistentBottomNavBarItem(
//         icon: const Icon(Icons.person),
//         title: AppLocalizations.of(context)!.profilim,
//         activeColorPrimary: CustomTheme.darkColor,
//         inactiveColorPrimary: Colors.grey,
//       ),
//     ];
//   }

//   List<PersistentBottomNavBarItem> navBarsTeacherItems() {
//     return [
//       PersistentBottomNavBarItem(
//         icon: const Icon(Icons.home),
//         title: AppLocalizations.of(context)!.anasayfa,
//         activeColorPrimary: CustomTheme.darkColor,
//         inactiveColorPrimary: Colors.grey,
//       ),
//       PersistentBottomNavBarItem(
//         icon: const Icon(Icons.table_chart_outlined),
//         title: AppLocalizations.of(context)!.dersProgrami,
//         activeColorPrimary: CustomTheme.darkColor,
//         inactiveColorPrimary: Colors.grey,
//       ),
//       PersistentBottomNavBarItem(
//         icon: const Icon(Icons.person),
//         title: AppLocalizations.of(context)!.profilim,
//         activeColorPrimary: CustomTheme.darkColor,
//         inactiveColorPrimary: Colors.grey,
//       ),
//     ];
//   }
// }
