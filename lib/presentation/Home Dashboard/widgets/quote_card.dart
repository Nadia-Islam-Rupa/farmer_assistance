import 'package:flutter/material.dart';

class QuoteCard extends StatelessWidget {
  const QuoteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        //borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.format_quote_rounded, color: Colors.teal, size: 20),
              SizedBox(width: 4),
              Expanded(
                child: Text(
                  "The farmer is the only man in our economy who buys everything at retail, "
                  "sells everything at wholesale, and pays the freight both ways.",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                    height: 1.4,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              "- John F. Kennedy",
              style: TextStyle(fontSize: 13, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
