import 'package:flutter/material.dart';
import 'package:assignment_adstacks/widgets/project_card.dart';
import 'package:assignment_adstacks/widgets/creator_list_item.dart';
import 'package:assignment_adstacks/widgets/overall_performance_chart.dart';
import 'package:intl/intl.dart';

// Define the custom color
const Color cetaceanBlue = Color(0xFF011140);

class MainDashboardContent extends StatefulWidget {
  @override
  _MainDashboardContentState createState() => _MainDashboardContentState();
}

class _MainDashboardContentState extends State<MainDashboardContent> with SingleTickerProviderStateMixin {
  // Dummy data for demonstration
  final List<Map<String, dynamic>> allProjects = [
    {'title': 'Technology behind the Blockchain', 'tag': 'Blockchain', 'color': Colors.pinkAccent},
    {'title': 'Innovative AI Solutions', 'tag': 'Artificial Intelligence', 'color': Colors.blueAccent},
    {'title': 'Decentralized Finance Platform', 'tag': 'DeFi', 'color': Colors.greenAccent},
    {'title': 'Secure Cloud Computing', 'tag': 'Cloud Computing', 'color': Colors.orangeAccent},
  ];

  final List<Map<String, dynamic>> topCreators = [
    {'imageUrl': 'assets/avatars/avatar1.png', 'name': '@mark802', 'artworks': 1032, 'rating': 4.5},
    {'imageUrl': 'assets/avatars/avatar2.png', 'name': '@elizabet_t', 'artworks': 987, 'rating': 4.2},
    {'imageUrl': 'assets/avatars/avatar3.png', 'name': '@davidson_d', 'artworks': 921, 'rating': 4.8},
    {'imageUrl': 'assets/avatars/avatar4.png', 'name': '@maddison__k', 'artworks': 889, 'rating': 4.0},
  ];

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0, end: 10).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentDate = DateTime.now();
    final formattedDate = DateFormat('EEE, d MMM').format(currentDate);

    return Material(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- Search Section ---
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Hello Aditya Singh!',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey[900],
                        ),
                      ),
                      Spacer(),
                      Text(
                        formattedDate,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search here...',
                            prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.grey[200],
                            contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                      InkWell(
                        onTap: () {
                          // TODO: Implement Add Project action
                        },
                        hoverColor: Colors.blueGrey[700]?.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10.0),
                        child: ElevatedButton(
                          onPressed: () {
                            // TODO: Implement Add Project action
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueGrey[900],
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                            textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: Text(
                            'Add Project',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                      Container(
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Icon(
                          Icons.notifications_none,
                          color: Colors.grey[600],
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30),

              // --- Top Rating Project Section ---
              Container(
                height: 200,
                margin: EdgeInsets.only(bottom: 20),
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFF8BBD0),
                      Color(0xFFCE93D8),
                    ],
                  ),
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
                child: Row(
                  children: [
                    // Text content on the left
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ETHEREUM 2.0',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 8), // Reduced spacing
                            Text(
                              'Top Rating Project',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 8), // Reduced spacing
                            Text(
                              'Trending project and high rating Project Created by team.',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white70,
                              ),
                            ),
                            SizedBox(height: 12), // Reduced spacing
                            ElevatedButton(
                              onPressed: () {
                                // TODO: Implement Learn More action
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black87,
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8), // Reduced padding
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                              child: Text(
                                'Learn More.',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // 2D shapes with animation on the right
                    Expanded(
                      child: Stack(
                        children: [
                          // Torus (black ring)
                          AnimatedPositioned(
                            duration: Duration(seconds: 5),
                            top: 10 + _animation.value,
                            right: 20 - _animation.value,
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.transparent,
                                border: Border.all(
                                  color: Colors.black,
                                  width: 8,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 5,
                                    offset: Offset(2, 2),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // Purple triangular prism
                          AnimatedPositioned(
                            duration: Duration(seconds: 5),
                            top: 60 - _animation.value,
                            right: 30 + _animation.value,
                            child: Transform.rotate(
                              angle: 0.5,
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  gradient: LinearGradient(
                                    colors: [Colors.purple, Colors.purpleAccent],
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 5,
                                      offset: Offset(2, 2),
                                    ),
                                  ],
                                ),
                                child: CustomPaint(
                                  painter: TrianglePainter(),
                                ),
                              ),
                            ),
                          ),
                          // Blue cylinder
                          AnimatedPositioned(
                            duration: Duration(seconds: 5),
                            top: 50 + _animation.value,
                            right: 70 - _animation.value,
                            child: Container(
                              width: 20,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  colors: [Colors.blue, Colors.blueAccent],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 5,
                                    offset: Offset(2, 2),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // Green sphere
                          AnimatedPositioned(
                            duration: Duration(seconds: 5),
                            bottom: 20 - _animation.value,
                            right: 40 + _animation.value,
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: RadialGradient(
                                  colors: [Colors.greenAccent, Colors.green],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 5,
                                    offset: Offset(2, 2),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // White cube
                          AnimatedPositioned(
                            duration: Duration(seconds: 5),
                            bottom: 10 + _animation.value,
                            right: 80 - _animation.value,
                            child: Transform.rotate(
                              angle: -0.3,
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 5,
                                      offset: Offset(2, 2),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          // Small multicolored shape
                          AnimatedPositioned(
                            duration: Duration(seconds: 5),
                            top: 20 - _animation.value,
                            right: 90 + _animation.value,
                            child: Transform.rotate(
                              angle: 0.8,
                              child: Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [Colors.purple, Colors.blue],
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 5,
                                      offset: Offset(2, 2),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // --- All Projects and Top Creators Sections ---
              LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 700) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // All Projects Section (in its own styled container with cetaceanBlue background)
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.all(20.0),
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
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: Text(
                                    'All Projects',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: allProjects.length,
                                  itemBuilder: (context, index) {
                                    final project = allProjects[index];
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                                      child: ProjectCard(
                                        title: project['title'],
                                        tag: project['tag'],
                                        accentColor: project['color'],
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        // Top Creators Section (in its own styled container with cetaceanBlue background)
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.all(20.0),
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
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: Text(
                                    'Top Creators',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                // --- Top Creators Headers ---
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
                                    children: [
                                      SizedBox(width: 18.0 * 2 + 12),
                                      Expanded(
                                        flex: 3,
                                        child: Text(
                                          'Name',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white70,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          'Artworks',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white70,
                                          ),
                                          textAlign: TextAlign.end,
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          'Rating',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white70,
                                          ),
                                          textAlign: TextAlign.end,
                                        ),
                                      ),
                                      SizedBox(width: 20 + 5),
                                    ],
                                  ),
                                ),
                                // --- End Top Creators Headers ---
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: topCreators.length,
                                  itemBuilder: (context, index) {
                                    final creator = topCreators[index];
                                    return CreatorListItem(
                                      imageUrl: creator['imageUrl'],
                                      name: creator['name'],
                                      artworks: creator['artworks'],
                                      rating: creator['rating'],
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // All Projects Section (in its own styled container with cetaceanBlue background)
                        Container(
                          padding: EdgeInsets.all(20.0),
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
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: Text(
                                  'All Projects',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: allProjects.length,
                                itemBuilder: (context, index) {
                                  final project = allProjects[index];
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                                    child: ProjectCard(
                                      title: project['title'],
                                      tag: project['tag'],
                                      accentColor: project['color'],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),

                        // Top Creators Section (in its own styled container with cetaceanBlue background)
                        Container(
                          padding: EdgeInsets.all(20.0),
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
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: Text(
                                  'Top Creators',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              // --- Top Creators Headers ---
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                child: Row(
                                  children: [
                                    SizedBox(width: 18.0 * 2 + 12),
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        'Name',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white70,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        'Artworks',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white70,
                                        ),
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        'Rating',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white70,
                                        ),
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                    SizedBox(width: 20 + 5),
                                  ],
                                ),
                              ),
                              // --- End Top Creators Headers ---
                              ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: topCreators.length,
                                itemBuilder: (context, index) {
                                  final creator = topCreators[index];
                                  return CreatorListItem(
                                    imageUrl: creator['imageUrl'],
                                    name: creator['name'],
                                    artworks: creator['artworks'],
                                    rating: creator['rating'],
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),

              // --- Over All Performance Section ---
              Container(
                height: 300,
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
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
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        'Over All Performance',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey[900],
                        ),
                      ),
                    ),
                    Expanded(
                      child: OverallPerformanceChart(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.purple
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}