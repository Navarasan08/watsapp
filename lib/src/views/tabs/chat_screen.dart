part of views;

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: sampleData.length,
        itemBuilder: (context, index) {
          Chats chat = sampleData[index];

          return Column(
            children: [
              Divider(height: 10.0),
              ListTile(
                leading: CircleAvatar(
                  foregroundColor: Theme.of(context).primaryColor,
                  backgroundColor: Colors.grey,
                  radius: 25.0,
                  backgroundImage: NetworkImage(chat.avatarUrl),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(chat.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
                    Text(chat.time, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),)
                  ],
                ),
                subtitle: Padding(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Text(chat.message, style: TextStyle(fontSize: 15.0),),
                ),
                onTap: () => Navigator.pushNamed(context, AppRouter.chatRoom, arguments: chat),
              )
            ],
          );
        });
  }
}
