import 'package:flutter/material.dart';
import '../../Apis(Rest)/rest.dart';

class Exemplo1 extends StatefulWidget {
  const Exemplo1({super.key});

  @override
  State<Exemplo1> createState() => _Exemplo1State();
}

class _Exemplo1State extends State<Exemplo1> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Exemplo de Get'),
      ),
       body: FutureBuilder<List>(future: pegarUsuarios(),
      builder: (context, snapshot){
        if(snapshot.hasError){
          return Center(
            child: Text('erro ao buscar api'),
          );
        }
        if(snapshot.hasData){
         return ListView.builder(itemCount: snapshot.data?.length,
         itemBuilder: (context,index){
          return ListTile(
            leading: CircleAvatar(backgroundColor: Colors.transparent,
             ),
            title: Text(snapshot.data![index]['nome']),
            subtitle: Text ((snapshot.data![index]['rank']).toString  ()),
            trailing: Text(snapshot.data![index]['nome']),
          );
         },);
        }


        return const Center(
          child: CircularProgressIndicator( ),
        );

      },
      )
    );
  }
}