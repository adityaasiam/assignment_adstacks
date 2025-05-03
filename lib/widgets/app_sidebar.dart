import 'package:flutter/material.dart';

const Color cetaceanBlue = Color(0xFF011140);

class AppSidebar extends StatelessWidget {
  final String currentSelectedItem;
  final ValueChanged<String> onItemSelected;

  const AppSidebar({
    Key? key,
    required this.currentSelectedItem,
    required this.onItemSelected,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      color: cetaceanBlue,
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Center(
              child: Image.asset(
                'assets/Adstacks-logo.png',
                height: 50,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/user_placeholder.png'),
                    backgroundColor: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Aditya Singh',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Admin',
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildSidebarItem(context, Icons.home, 'Home', 'Home'),
                _buildSidebarItem(context, Icons.people, 'Employees', 'Employees'),
                _buildSidebarItem(context, Icons.calendar_today, 'Attendance', 'Attendance'),
                _buildSidebarItem(context, Icons.summarize, 'Summary', 'Summary'),
                _buildSidebarItem(context, Icons.info, 'Information', 'Information'),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    'WORKSPACES',
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ExpansionTile(
                  tilePadding: EdgeInsets.zero,
                  title: _buildSidebarItem(context, Icons.workspaces, 'Adstacks', 'Adstacks', showIcon: false),
                  children: [
                    _buildSidebarSubItem(context, 'Overview', 'Adstacks_Overview'),
                    _buildSidebarSubItem(context, 'Projects', 'Adstacks_Projects'),
                    _buildSidebarSubItem(context, 'Tasks', 'Adstacks_Tasks'),
                  ],
                  iconColor: Colors.white,
                  collapsedIconColor: Colors.white,
                ),
                ExpansionTile(
                  tilePadding: EdgeInsets.zero,
                  title: _buildSidebarItem(context, Icons.attach_money, 'Finance', 'Finance', showIcon: false),
                  children: [
                    _buildSidebarSubItem(context, 'Expenses', 'Finance_Expenses'),
                    _buildSidebarSubItem(context, 'Invoices', 'Finance_Invoices'),
                  ],
                  iconColor: Colors.white,
                  collapsedIconColor: Colors.white,
                ),
              ],
            ),
          ),

          Divider(color: Colors.grey[700]),
          _buildSidebarItem(context, Icons.settings, 'Setting', 'Setting'),
          _buildSidebarItem(context, Icons.logout, 'Logout', 'Logout'),
        ],
      ),
    );
  }

  Widget _buildSidebarItem(BuildContext context, IconData icon, String text, String itemIdentifier, {bool showIcon = true}) {
    final isSelected = currentSelectedItem == itemIdentifier;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blueGrey[800] : Colors.transparent,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: InkWell(
        onTap: () {
          onItemSelected(itemIdentifier);
        },
        hoverColor: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(5.0),
        child: ListTile(
          leading: showIcon ? Icon(icon, color: Colors.white) : null,
          title: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }

  Widget _buildSidebarSubItem(BuildContext context, String text, String itemIdentifier) {
    final isSelected = currentSelectedItem == itemIdentifier;

    return Padding(
      padding: const EdgeInsets.only(left: 30.0),
      child: InkWell(
        onTap: () {
          onItemSelected(itemIdentifier);
        },
        hoverColor: Colors.white.withOpacity(0.05),
        child: ListTile(
          title: Text(
            text,
            style: TextStyle(
                color: isSelected ? Colors.white : Colors.white70,
                fontSize: 14
            ),
          ),
        ),
      ),
    );
  }
}