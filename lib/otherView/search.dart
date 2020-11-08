import 'package:flutter/material.dart';
import 'package:graduationproject/viewConfigruation/ViewConfig.dart';
import 'package:graduationproject/views/chidViewPlugin/searchResultPage.dart';


class SearchUI extends SearchDelegate<String>{
  @override
  List<Widget> buildActions(BuildContext context) {

    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed:()=>query="",

      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon:AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation
      ),
      onPressed: ()=>close(context,null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {

    return Container(

        child: SearchGoods()
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty ? recentSuggest : searchlist.where((
        input) => input.startsWith(query)).toList();
    return ListView.builder(
      itemCount: suggestionList.length,
        itemBuilder: (context,index){
        return ListTile(
          title: RichText(
            text: TextSpan(
              text: suggestionList[index].substring(0,query.length),
              style: TextStyle(
                color: Colors.black,fontWeight: FontWeight.bold
              ),
              children: [
                TextSpan(
                text: suggestionList[index].substring(query.length),
                  style: TextStyle(color: Colors.grey)
                ),
              ]
            )
          ),
          onTap: (){
            query=suggestionList[index];
            Scaffold.of(context).showSnackBar(SnackBar(content: Text(query)));
          },
        );
        },
    );
  }
  
}