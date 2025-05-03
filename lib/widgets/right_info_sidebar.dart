import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

const Color cetaceanBlue = Color(0xFF011140);

class RightInfoSidebar extends StatefulWidget {
  @override
  _RightInfoSidebarState createState() => _RightInfoSidebarState();
}

class _RightInfoSidebarState extends State<RightInfoSidebar> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100.0,
              margin: EdgeInsets.only(bottom: 15.0),
              padding: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: cetaceanBlue,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'GENERAL INFO',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '10:00 AM TO 7:00 PM',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(bottom: 15.0),
              padding: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: cetaceanBlue,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: TableCalendar(
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: _focusedDay,
                calendarFormat: _calendarFormat,
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  if (!isSameDay(_selectedDay, selectedDay)) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                  }
                },
                onFormatChanged: (format) {
                  if (_calendarFormat != format) {
                    setState(() {
                      _calendarFormat = format;
                    });
                  }
                },
                onPageChanged: (focusedDay) {
                  _focusedDay = focusedDay;
                },
                calendarStyle: CalendarStyle(
                  defaultTextStyle: TextStyle(color: Colors.white70),
                  weekendTextStyle: TextStyle(color: Colors.white70),
                  outsideTextStyle: TextStyle(color: Colors.white54),
                  todayDecoration: BoxDecoration(color: Colors.blueAccent, shape: BoxShape.circle),
                  selectedDecoration: BoxDecoration(color: Colors.purpleAccent, shape: BoxShape.circle),
                  todayTextStyle: TextStyle(color: Colors.white),
                  selectedTextStyle: TextStyle(color: Colors.white),
                ),
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                  titleTextStyle: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  leftChevronIcon: Icon(Icons.chevron_left, color: Colors.white),
                  rightChevronIcon: Icon(Icons.chevron_right, color: Colors.white),
                ),
                daysOfWeekStyle: DaysOfWeekStyle(
                  weekdayStyle: TextStyle(color: Colors.white70),
                  weekendStyle: TextStyle(color: Colors.white70),
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(bottom: 15.0),
              padding: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: cetaceanBlue,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.cake, color: Colors.orange),
                      SizedBox(width: 5),
                      Text(
                        'Today Birthday',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Spacer(),
                      Text('✨', style: TextStyle(fontSize: 18)),
                      SizedBox(width: 2),
                      Text('✨', style: TextStyle(fontSize: 18)),
                    ],
                  ),
                  Divider(color: Colors.white54),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          CircleAvatar(radius: 20, backgroundImage: AssetImage('assets/avatars/avatar1.png')),
                          SizedBox(height: 5),
                          Text('User 1', style: TextStyle(fontSize: 12, color: Colors.white70)),
                        ],
                      ),
                      Column(
                        children: [
                          CircleAvatar(radius: 20, backgroundImage: AssetImage('assets/avatars/avatar2.png')),
                          SizedBox(height: 5),
                          Text('User 2', style: TextStyle(fontSize: 12, color: Colors.white70)),
                        ],
                      ),
                      Column(
                        children: [
                          Text('Total', style: TextStyle(fontSize: 12, color: Colors.white60)),
                          SizedBox(height: 5),
                          Text('2', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Center(
                    child: InkWell(
                      onTap: () {
                      },
                      hoverColor: Colors.purpleAccent.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20.0),
                      child: ElevatedButton(
                        onPressed: () {
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purpleAccent,
                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                          textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        child: Text('Birthday Wishing', style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(bottom: 15.0),
              padding: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: cetaceanBlue,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.cake_outlined, color: Colors.blueAccent),
                      SizedBox(width: 5),
                      Text(
                        'Anniversary',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Spacer(),
                      Text('✨', style: TextStyle(fontSize: 18)),
                      SizedBox(width: 2),
                      Text('✨', style: TextStyle(fontSize: 18)),
                    ],
                  ),
                  Divider(color: Colors.white54),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          CircleAvatar(radius: 20, backgroundImage: AssetImage('assets/avatars/avatar3.png')),
                          SizedBox(height: 5),
                          Text('User 3', style: TextStyle(fontSize: 12, color: Colors.white70)),
                        ],
                      ),
                      Column(
                        children: [
                          CircleAvatar(radius: 20, backgroundImage: AssetImage('assets/avatars/avatar4.png')),
                          SizedBox(height: 5),
                          Text('User 4', style: TextStyle(fontSize: 12, color: Colors.white70)),
                        ],
                      ),
                      Column(
                        children: [
                          CircleAvatar(radius: 20, backgroundImage: AssetImage('assets/avatars/avatar1.png')),
                          SizedBox(height: 5),
                          Text('User 5', style: TextStyle(fontSize: 12, color: Colors.white70)),
                        ],
                      ),
                      Column(
                        children: [
                          Text('Total', style: TextStyle(fontSize: 12, color: Colors.white60)),
                          SizedBox(height: 5),
                          Text('3', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Center(
                    child: InkWell(
                      onTap: () {
                      },
                      hoverColor: Colors.blueAccent.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20.0),
                      child: ElevatedButton(
                        onPressed: () {
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                          textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        child: Text('Anniversary Wishing', style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}