import 'package:flutter/material.dart';

class CreatorListItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final int artworks;
  final double rating;

  const CreatorListItem({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.artworks,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 18,
            backgroundImage: AssetImage(imageUrl),
            backgroundColor: Colors.white,
          ),
          SizedBox(width: 12),
          Expanded(
            flex: 3,
            child: Text(
              name,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            flex: 1,
            child: Text(
              artworks.toString(),
              style: TextStyle(
                fontSize: 14,
                color: Colors.white70,
              ),
              textAlign: TextAlign.end,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.star, color: Colors.amber, size: 16),
                SizedBox(width: 2),
                Text(
                  rating.toString(),
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 20),
        ],
      ),
    );
  }
}