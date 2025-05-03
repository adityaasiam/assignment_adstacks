import 'package:flutter/material.dart';
import 'package:assignment_adstacks/widgets/app_sidebar.dart';
import 'package:assignment_adstacks/widgets/main_dashboard_content.dart';
import 'package:assignment_adstacks/widgets/right_info_sidebar.dart';
import 'package:assignment_adstacks/pages/employees_page.dart';
import 'package:assignment_adstacks/pages/attendance_page.dart';
import 'package:assignment_adstacks/pages/summary_page.dart';
import 'package:assignment_adstacks/pages/information_page.dart';
import 'package:assignment_adstacks/pages/settings_page.dart';
import 'package:assignment_adstacks/pages/adstacks_overview_page.dart';
import 'package:assignment_adstacks/pages/adstacks_projects_page.dart';
import 'package:assignment_adstacks/pages/adstacks_tasks_page.dart';
import 'package:assignment_adstacks/pages/finance_expenses_page.dart';
import 'package:assignment_adstacks/pages/finance_invoices_page.dart';


class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String _selectedDrawerItem = 'Home';

  void _onDrawerItemSelected(String item) {
    setState(() {
      _selectedDrawerItem = item;
      if (MediaQuery.of(context).size.width < 600) {
        Navigator.of(context).pop();
      }
    });
  }

  Widget _getMainContentWidget() {
    switch (_selectedDrawerItem) {
      case 'Home':
        return MainDashboardContent();
      case 'Employees':
        return EmployeesPage();
      case 'Attendance':
        return AttendancePage();
      case 'Summary':
        return SummaryPage();
      case 'Information':
        return InformationPage();
      case 'Adstacks_Overview':
        return AdstacksOverviewPage();
      case 'Adstacks_Projects':
        return AdstacksProjectsPage();
      case 'Adstacks_Tasks':
        return AdstacksTasksPage();
      case 'Finance_Expenses':
        return FinanceExpensesPage();
      case 'Finance_Invoices':
        return FinanceInvoicesPage();
      case 'Setting':
        return SettingsPage();
      case 'Logout':
        return Center(child: Text('Logout Action Page (Implement Logout)', style: TextStyle(fontSize: 24)));
      default:
        return MainDashboardContent();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isLargeScreen = screenWidth > 1024;
    final isMediumScreen = screenWidth >= 600 && screenWidth <= 1024;
    final isSmallScreen = screenWidth < 600;

    return Scaffold(
      appBar: isSmallScreen
          ? AppBar(
        title: Text('Dashboard'),
        backgroundColor: const Color(0xFF011140),
      )
          : null,

      drawer: isSmallScreen ? Drawer(
        child: AppSidebar(
          currentSelectedItem: _selectedDrawerItem,
          onItemSelected: _onDrawerItemSelected,
        ),
      ) : null,

      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isLargeScreen || isMediumScreen)
              SizedBox(
                width: 250,
                child: AppSidebar(
                  currentSelectedItem: _selectedDrawerItem,
                  onItemSelected: _onDrawerItemSelected,
                ),
              ),

            Expanded(
              child: _getMainContentWidget(),
            ),

            if (isLargeScreen)
              SizedBox(
                width: 300,
                child: RightInfoSidebar(),
              ),
          ],
        ),
      ),
    );
  }
}