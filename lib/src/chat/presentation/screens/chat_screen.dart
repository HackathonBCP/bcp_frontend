import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          _buildChatHeader(),
          Expanded(child: _buildChatMessages()),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildChatHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [Colors.purple, Colors.pink]),
      ),
      child: const Row(
        children: [
          Icon(Icons.chat_bubble, color: Colors.white),
          SizedBox(width: 8),
          Text(
            "Yapana",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          Icon(Icons.close, color: Colors.white),
        ],
      ),
    );
  }

  Widget _buildChatMessages() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildMessage(
          "¡Hola! Soy Yapana, tu asistente financiera personal. 💜 ¿En qué puedo ayudarte hoy?",
          isUser: false,
        ),
        _buildMessage(
          "Quisiera ahorrar para matricularme en un curso de Platzi.",
          isUser: true,
        ),
        _buildMessage(
          "¡Vas por buen camino! ¿Te gustaría unirte a un reto grupal de ahorro? 👥",
          isUser: false,
        ),
      ],
    );
  }

  Widget _buildMessage(String text, {required bool isUser}) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isUser ? Colors.pinkAccent : Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isUser ? Colors.white : Colors.black,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Row(
        children: [
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Escribe tu mensaje...",
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Colors.purple,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.send, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
