import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import shared_preferences
import 'package:storease_mobileapp_dev/api/api_services.dart';
import 'package:storease_mobileapp_dev/model/aiModel.dart';
import 'dart:convert';

class AIPageOrder extends StatefulWidget {
  final int package_id;
  const AIPageOrder({required this.package_id,super.key});

  @override
  State<AIPageOrder> createState() => _AIPageOrderState();
}

class _AIPageOrderState extends State<AIPageOrder> {
  final TextEditingController _controller = TextEditingController();
  // final List<Map<String, String>> _messages = [{"":""}];
  final List<Map<String, String>> _messages = [
    {'type': 'ai', 'text': 'Selamat datang di halaman Tanya AI Pernikahan, masukkan pertanyaan mengenai detail pernikahan anda'}
    ];
  final ApiServices _apiServices = ApiServices();
  bool _isLoading = false;
final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    print(widget.package_id);
    _loadMessages(); // Load messages when the page is initialized
  }

  void safeSetState(VoidCallback fn) {
    if (mounted) {
      setState(fn);
    }
  }
void _scrollToBottom() {
  _scrollController.animateTo(
    _scrollController.position.maxScrollExtent,
    duration: const Duration(milliseconds: 300),
    curve: Curves.easeOut,
  );
}

  Future<void> _loadMessages() async {
    final prefs = await SharedPreferences.getInstance();
    final String? cachedMessages = prefs.getString('chat_history_order');

    if (cachedMessages != null) {
      List<Map<String, String>> messagesList = List<Map<String, String>>.from(
        json.decode(cachedMessages).map((x) => Map<String, String>.from(x)),
      );
      safeSetState(() {
        // print(messagesList[0].map(convert));
        print(messagesList[0]);
        _messages.addAll(messagesList);
      });
    }
  }

  Future<void> _saveMessages() async {
    final prefs = await SharedPreferences.getInstance();
    String jsonMessages = json.encode(_messages);
    await prefs.setString('chat_history_order', jsonMessages);
  }

  void _sendMessage() async {
    if (_controller.text.isEmpty) return;

    // Add user message to the list
    safeSetState(() {
      _messages.add({'type': 'user', 'text': _controller.text});
      _isLoading = true;
    });

    // Create the AI request model
    final requestModel = AIOrderRequestModel(message: _controller.text, id_package: widget.package_id);

    try {
      print("order page ${requestModel.message} ${widget.package_id}", );
      // Get the AI response
      final AIResponseModel response = await _apiServices.askAIOrder(requestModel);


      // Add AI response to the list
      safeSetState(() {
        _messages.add({'type': 'ai', 'text': response.response});
        _isLoading = false;
        _controller.clear();
        _scrollToBottom();
      });

      // Save messages to cache
      await _saveMessages();
    } catch (e) {
      safeSetState(() {
        _isLoading = false;
      });
      // Optionally show an error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }
  }

  void _clearMessages() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('chat_history_order'); // Clear stored messages

    safeSetState(() {
      _messages.clear(); // Clear the messages in the state
    });
  }

  void _showClearHistoryDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Bersihkan Riwayat'),
          content:
              const Text('Apakah anda ingin menghapus riwayat pesan?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _clearMessages(); // Clear the messages
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Clear'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AI Page"),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed:
                _showClearHistoryDialog, // Show the dialog on button press
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return Align(
                  alignment: message['type'] == 'user'
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin:
                    message['type'] == 'user'?
                        const EdgeInsets.only(bottom: 5, top: 5, right: 10, left: 40):
                        const EdgeInsets.only(bottom: 5, top: 5, right: 40, left: 10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: message['type'] == 'user'
                          ? Colors.blue[200]
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: BoldTextFromAPI(text: message['text']??"")
                    // Text(message['text'] ?? ''),
                  ),
                );
              },
            ),
          ),
          if (_isLoading) BouncingDot(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class BoldTextFromAPI extends StatelessWidget {
  final String text;

  BoldTextFromAPI({required this.text});

  @override
  Widget build(BuildContext context) {
    // RegExp untuk mendeteksi teks yang diapit oleh **
    final RegExp boldRegex = RegExp(r'\*\*(.*?)\*\*');
    
    // Menyimpan list TextSpan
    List<TextSpan> spans = [];
    
    // Posisi mulai saat ini
    int currentIndex = 0;

    // Mencari semua bagian yang diapit oleh ** untuk dijadikan bold
    for (final match in boldRegex.allMatches(text)) {
      // Bagian teks sebelum ** yang perlu ditambahkan sebagai teks biasa
      if (match.start > currentIndex) {
        spans.add(TextSpan(
          text: text.substring(currentIndex, match.start),
        ));
      }
      
      // Bagian teks di dalam ** yang perlu dijadikan bold
      spans.add(TextSpan(
        text: match.group(1),
        style: TextStyle(fontWeight: FontWeight.bold),
      ));
      
      // Update posisi currentIndex ke akhir match
      currentIndex = match.end;
    }

    // Menambahkan sisa teks setelah match terakhir
    if (currentIndex < text.length) {
      spans.add(TextSpan(
        text: text.substring(currentIndex),
      ));
    }

    // Menggunakan Text.rich untuk menampilkan teks dengan berbagai format
    return Text.rich(
      TextSpan(children: spans),
      textAlign: TextAlign.justify,
      style: TextStyle(fontSize: 12),
    );
  }
}


class BouncingDot extends StatefulWidget {
  @override
  _BouncingDotState createState() => _BouncingDotState();
}

class _BouncingDotState extends State<BouncingDot> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0, end: 10).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          margin: const EdgeInsets.only(left: 10),
          child: Row(
            children: [
              Transform.translate(
                offset: Offset(0, _animation.value),
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              const Text('AI is thinking...'),
            ],
          ),
        );
      },
    );
  }
}
