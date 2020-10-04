part of views;

class StatusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        AddStatus(),
      ],
    );
  }
}


class AddStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Stack(
            children: <Widget>[
              CircleAvatar(
                radius: 25.0,
                child: Icon(Icons.person),
              ),
              Positioned(
                right: 0.0,
                bottom: 0.0,
                child: CircleAvatar(
                  radius: 10.0,
                  backgroundColor: Theme.of(context).accentColor,
                  child: Icon(
                    Icons.add,
                    size: 20.0,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
              ),
            ],
          ),
          title: Text('My status'),
          subtitle: Text('Tap to add status update'),
        ),
        Divider(),
      ],
    );
  }
}

