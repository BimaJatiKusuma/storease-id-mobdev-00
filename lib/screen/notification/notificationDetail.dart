import 'package:flutter/material.dart';

class NotificationDetail extends StatefulWidget {
  const NotificationDetail({super.key});

  @override
  State<NotificationDetail> createState() => _NotificationDetailState();
}

class _NotificationDetailState extends State<NotificationDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Storease"),),
      body: Column(
        children: [
          Text('''
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque ornare, odio in consequat condimentum, elit sapien sagittis velit, eu rhoncus tortor nisl vitae ipsum. In convallis felis et ligula interdum, sed fringilla magna congue. Donec vel porttitor nisl. Quisque scelerisque odio urna, a ornare tortor rutrum non. Nulla volutpat neque ut orci sodales, sit amet bibendum est hendrerit. Ut id arcu urna. Cras lacinia sapien vitae neque luctus, ut fermentum purus iaculis.
Mauris vulputate eros et nisl pharetra semper. Quisque ultrices pulvinar ante ac lacinia. Pellentesque imperdiet nec turpis ac laoreet. Duis et eleifend risus, sed gravida augue. Praesent lobortis consequat mauris. Sed erat purus, iaculis non iaculis ut, tempus vel turpis. Praesent at ullamcorper augue. Vestibulum pulvinar, orci et tempor pulvinar, dui lectus vestibulum risus, accumsan egestas est lacus in velit. Aenean iaculis lectus felis, nec egestas mauris convallis quis. Suspendisse tincidunt vel magna vel bibendum. In consectetur sollicitudin purus at sagittis. Donec bibendum odio non urna ultrices ullamcorper. Cras feugiat, massa id hendrerit congue, quam tortor feugiat massa, in bibendum ante justo sit amet dolor. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Maecenas sagittis sagittis leo.
''')
        ],
      ),
    );
  }
}
