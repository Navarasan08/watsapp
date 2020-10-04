class Chats {
  final String message;
  final String name;
  final String time;
  final String avatarUrl;

  Chats({this.message, this.name, this.time, this.avatarUrl});
}

List<Chats> sampleData = [
  Chats(
      name: "Navarasan",
      message: "Hey Flutter a New Message from ME",
      time: "04:34",
      avatarUrl:
          "https://e0.365dm.com/19/07/2048x1152/skysports-ms-dhoni-india-cricket_4723720.jpg"),
  Chats(
    name: "MS Dhoni",
    message: "Hey How was your day?",
    time: "04:34",
    avatarUrl:
        "https://e0.365dm.com/19/07/2048x1152/skysports-ms-dhoni-india-cricket_4723720.jpg",
  ),
  Chats(
    name: "Virat Kohli",
    message: "Hey had Dinner?",
    time: "04:34",
    avatarUrl:
        "https://c.ndtvimg.com/2020-01/l3rnh4h8_virat-kohli-afp_625x300_14_January_20.jpg",
  ),
  Chats(
      name: "Yuvraj Sign",
      message: "Can WE Play Today?",
      time: "04:34",
      avatarUrl:
          "https://resize.indiatvnews.com/en/resize/newbucket/715_-/2020/09/pjimage-2020-09-09t183123-1599656487.jpg"),
  Chats(
      name: "Vijay",
      message: "You're Handsome Man..",
      time: "04:34",
      avatarUrl:
          "https://static.toiimg.com/thumb/msid-69320562,imgsize-363138,width-800,height-600,resizemode-75/69320562.jpg"),
];
