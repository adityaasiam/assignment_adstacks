import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  final String title;
  final String tag;
  final Color accentColor;

  const ProjectCard({
    Key? key,
    required this.title,
    required this.tag,
    required this.accentColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey[800],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
        onTap: () {
          print('Project card tapped: $title');
        },
        hoverColor: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10.0),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Container(
                width: 6.0,
                color: accentColor,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4),
                      Text(
                        tag,
                        style: TextStyle(
                          color: accentColor,
                          fontSize: 11,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}