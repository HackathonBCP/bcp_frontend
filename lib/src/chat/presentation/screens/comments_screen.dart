import 'package:flutter/material.dart';

class CommentsScreen extends StatelessWidget {
  final List<Map<String, String>> comments = [
    {
      "title": "Emprendedora Destacada",
      "content":
          "Gracias al ahorro sistemático, logré abrir mi propia tienda online. ¡Ahora tengo independencia financiera!",
      "author": "María G.",
    },
    {
      "title": "Meta Educativa",
      "content":
          "Ahorré durante 6 meses para mi certificación en marketing digital. ¡Hoy trabajo en lo que me apasiona!",
      "author": "Ana P.",
    },
    {
      "title": "Fondo de Emergencia",
      "content":
          "Construí mi fondo de emergencia en 1 año. Me da tranquilidad saber que estoy preparada para cualquier imprevisto.",
      "author": "Laura M.",
    },
  ];

  CommentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: comments.length,
                itemBuilder: (context, index) {
                  return _buildCommentCard(comments[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCommentCard(Map<String, String> comment) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.purple.shade100,
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.emoji_events, color: Colors.amber),
              const SizedBox(width: 8),
              Text(
                comment["title"]!,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            comment["content"]!,
            style: const TextStyle(fontSize: 14, color: Colors.black87),
          ),
          const SizedBox(height: 8),
          Text(
            "- ${comment["author"]!}",
            style: const TextStyle(
              fontSize: 12,
              fontStyle: FontStyle.italic,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
