import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
        title: Text(
          "Messages",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.white,
          ),
        ),
      ),
      body: MessageScreen(),
    );
  }
}

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: "Search...",
                    contentPadding: EdgeInsets.all(10),
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(), // Removes the underline
                  ),
                  onChanged: (value) {},
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Received Messages",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black26),
            textAlign: TextAlign.left,
          ),
          SingleChildScrollView(
            child: Container(
              height: 450,
              child: ListView.builder(
                itemCount: 10, // Number of items in the list
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 2,
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          // Image on the left
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              'assets/profile.png', // Replace with your image path
                              width: 30,
                              height: 30,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                              width: 16), // Space between the image and icon
                          // Text or other widgets can go here if needed
                          Expanded(
                            child: Text(
                              'User $index', // Example: User name
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          // Icon on the right
                          IconButton(
                            icon: Icon(Icons.message),
                            color: Colors.greenAccent,
                            onPressed: () {
                              // Handle button press
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Total Spam Message ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.grey,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Total Ham Message ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.grey,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.contacts,
                    size: 30,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Contacts",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.block,
                    size: 30,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Blocking",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                ],
              )
            ],
          ),
          Center(
              child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.greenAccent,
              elevation: 2,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Go Home"),
          )),
        ],
      ),
    );
  }
}
