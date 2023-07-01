import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:Gift_Erbil/models/product.dart';

class ProductsData extends ChangeNotifier {
  final Map productTypes = {
    'cakes': 1,
    'boxes': 2,
    'flowers': 3,
  };

  final List<Product> _productCakeItems = [
    Product(
      id: 'c1',
      title: 'Minions cake',
      description:
          'Chocolate cake with a distinctive taste and beautiful shape, available sizes: 20 people',
      imageUrl: 'assets/images/cakes/MinionsCake.jpg',
      price: 100000,
    ),
    Product(
      id: 'c2',
      title: 'chocolate cake',
      description:
          'Chocolate cake with a distinctive taste and beautiful shape, available sizes: 10 people',
      imageUrl: 'assets/images/cakes/weddingCake.jpg',
      price: 55000,
    ),
    Product(
      id: 'c3',
      title: 'Cake in the form of a cigar box',
      description:
          'Chocolate cake with a distinctive taste and beautiful shape, available sizes: 10 people',
      imageUrl: 'assets/images/cakes/anniversary1.jpg',
      price: 65000,
    ),
    Product(
      id: 'c4',
      title: 'Kinder cake',
      description:
          'Chocolate cake with a distinctive taste and beautiful shape, available sizes: 10 people',
      imageUrl: 'assets/images/cakes/birthdayCake1.jpg',
      price: 100000,
    ),
    Product(
      id: 'c5',
      title: 'Army suit cake',
      description:
          'Chocolate cake with a distinctive taste and beautiful shape, available sizes: 10 people',
      imageUrl: 'assets/images/cakes/armySuitCake.jpg',
      price: 65000,
    ),
    Product(
      id: 'c6',
      title: 'Chocolate Cake',
      description:
          'Chocolate cake with a distinctive taste and beautiful shape, available sizes: 10 people',
      imageUrl: 'assets/images/cakes/chocolateCakeV1.jpg',
      price: 45000,
    ),
    Product(
      id: 'c7',
      title: 'Chocolate Cake',
      description:
          'Chocolate cake with a distinctive taste and beautiful shape, available sizes: 10 people',
      imageUrl: 'assets/images/cakes/chocolateCakeV2.jpg',
      price: 55000,
    ),
    Product(
      id: 'c8',
      title: 'SpongeBob cake',
      description:
          'Chocolate cake with a distinctive taste and beautiful shape, available sizes: 10 people',
      imageUrl: 'assets/images/cakes/SpongeBob.jpg',
      price: 100000,
    ),
    Product(
      id: 'c9',
      title: 'Cake farm golf',
      description:
          'Chocolate cake with a distinctive taste and beautiful shape, available sizes: 10 people',
      imageUrl: 'assets/images/cakes/CakeFarmGolf.jpg',
      price: 65000,
    ),
    Product(
      id: 'c10',
      title: 'Kingdom Cake',
      description:
          'Chocolate cake with a distinctive taste and beautiful shape, available sizes: 10 people',
      imageUrl: 'assets/images/cakes/kingdomCake.jpg',
      price: 65000,
    ),
    Product(
      id: 'c11',
      title: 'Kitkat Cake',
      description:
          'Chocolate cake with a distinctive taste and beautiful shape, available sizes: 10 people',
      imageUrl: 'assets/images/cakes/kitkatCake.jpg',
      price: 65000,
    ),
    Product(
      id: 'c12',
      title: 'Red hearts cake',
      description:
          'Chocolate cake with a distinctive taste and beautiful shape, available sizes: 10 people',
      imageUrl: 'assets/images/cakes/Redheartscake.jpg',
      price: 65000,
    ),
    Product(
      id: 'c13',
      title: 'Elegance Cake',
      description:
          'Chocolate cake with a distinctive taste and beautiful shape, available sizes: 10 people',
      imageUrl: 'assets/images/cakes/EleganceCake.jpg',
      price: 65000,
    ),
    Product(
      id: 'c14',
      title: 'PUBG CAKE',
      description:
          'Chocolate cake with a distinctive taste and beautiful shape, available sizes: 10 people',
      imageUrl: 'assets/images/cakes/PUBGCAKE.jpg',
      price: 55000,
    ),
    Product(
      id: 'c15',
      title: 'Oreo cake',
      description:
          'Chocolate cake with a distinctive taste and beautiful shape, available sizes: 10 people',
      imageUrl: 'assets/images/cakes/OreoCake.jpg',
      price: 55000,
    ),
    Product(
      id: 'c16',
      title: 'Little princess cake',
      description:
          'Chocolate cake with a distinctive taste and beautiful shape, available sizes: 10 people',
      imageUrl: 'assets/images/cakes/LittlePrincessCake.jpg',
      price: 100000,
    ),
    Product(
      id: 'c17',
      title: 'Snow Boy Cake',
      description:
          'Chocolate cake with a distinctive taste and beautiful shape, available sizes: 10 people',
      imageUrl: 'assets/images/cakes/SnowBoyCake.jpg',
      price: 65000,
    ),
    Product(
      id: 'c18',
      title: 'Spider-Man Cake',
      description:
          'Chocolate cake with a distinctive taste and beautiful shape, available sizes: 10 people',
      imageUrl: 'assets/images/cakes/SpiderManCake.jpg',
      price: 65000,
    ),
    Product(
      id: 'c19',
      title: 'Supermom cake',
      description:
          'Chocolate cake with a distinctive taste and beautiful shape, available sizes: 10 people',
      imageUrl: 'assets/images/cakes/SupermomCake.jpg',
      price: 65000,
    ),
  ];

  List<Product> getCakeProducts() => [..._productCakeItems];

  //////////////////////////////////boxes ////////////////////////////////////////////////

  final List<Product> _productBoxItems = [
    Product(
      id: 'b1',
      title: 'tasty meal',
      description:
          ' A delicious meal from KFC with Hardees, natural juice, cola and fresh kiwi with Ferrero chocolate in a special gift basket',
      imageUrl: 'assets/images/boxes/1.jpg',
      price: 85000,
    ),
    Product(
      id: 'b2',
      title: 'winter box',
      description:
          ' A winter box containing coffee, a cup, honey, cookies, and a neck wrap in an elegant arrangement and consistent colors',
      imageUrl: 'assets/images/boxes/2.jpg',
      price: 100000,
    ),
    Product(
      id: 'b3',
      title: 'nivea box',
      description:
          ' A distinctive Nivea collection for men with a printed mug and a distinctive Rolex watch',
      imageUrl: 'assets/images/boxes/3.jpg',
      price: 185000,
    ),
    Product(
      id: 'b4',
      title: 'pinky box',
      description:
          ' Nutella chocolate with name imprinted on it, Ferrero, Tux, Mars and Kitkat with 6 natural flowers',
      imageUrl: 'assets/images/boxes/4.jpg',
      price: 70000,
    ),
    Product(
      id: 'b5',
      title: 'jadore box',
      description:
          ' The distinctive Jadore perfume from Dior with a distinctive natural rose and luxurious arrangement',
      imageUrl: 'assets/images/boxes/5.jpg',
      price: 200000,
    ),
    Product(
      id: 'b6',
      title: 'ramadan box',
      description:
          ' The Ramadan box contains a light wooden letter with femto juice, chocolate and natural roses',
      imageUrl: 'assets/images/boxes/6.jpg',
      price: 125000,
    ),
    Product(
      id: 'b7',
      title: 'black lovers',
      description:
          ' T-shirt printing, light wood lettering with printed car hanging and synthetic flowers',
      imageUrl: 'assets/images/boxes/7.jpg',
      price: 65000,
    ),
    Product(
      id: 'b8',
      title: 'ramadan box 2',
      description:
          ' The Ramadan box contains a light wooden letter with femto juice, chocolate and natural roses ',
      imageUrl: 'assets/images/boxes/8.jpg',
      price: 125000,
    ),
    Product(
      id: 'b9',
      title: 'Ferrero box with rose',
      description:
          ' A huge box of natural Ferrero and red roses, with an elegant and luxurious arrangement ',
      imageUrl: 'assets/images/boxes/9.jpg',
      price: 150000,
    ),
    Product(
      id: 'b10',
      title: ' Apple AirPods ',
      description:
          ' Apple AirPods are wrapped with cash inside the box and some artificial flowers -cash not include  ',
      imageUrl: 'assets/images/boxes/10.jpg',
      price: 200000,
    ),
    Product(
      id: 'b11',
      title: ' Rose Box ',
      description: ' A distinctive box contains 48 natural red roses ',
      imageUrl: 'assets/images/boxes/11.jpg',
      price: 250000,
    ),
    Product(
      id: 'b12',
      title: 'iphone 11 pro',
      description: 'pink box with flower and iphone 11 pro max',
      imageUrl: 'assets/images/boxes/12.jpg',
      price: 1200000,
    ),
    Product(
      id: 'b13',
      title: 'cute family',
      description:
          'The happy family is made of pottery and consists of father, mother and children (4 pieces) with a special gift box',
      imageUrl: 'assets/images/boxes/13.jpg',
      price: 30000,
    ),
    Product(
      id: 'b14',
      title: 'Happy birthday mom',
      description:
          'A special gift for the mother’s birthday, a gift box that contains the Holy Quran and a special watch (the price does not include the watch)',
      imageUrl: 'assets/images/boxes/14.jpg',
      price: 40000,
    ),
    Product(
      id: 'b15',
      title: 'red box small',
      description: 'smal box with many colure ',
      imageUrl: 'assets/images/boxes/15.jpg',
      price: 10000,
    ),
    Product(
      id: 'b16',
      title: 'basket of happiness',
      description:
          'The basket of happiness contains a large group of chocolates, potato chips and cola in a special and charming arrangement',
      imageUrl: 'assets/images/boxes/16.jpg',
      price: 80000,
    ),
    Product(
      id: 'b17',
      title: 'Chocolate bouquet',
      description:
          'The chocolate bouquet contains many types of chocolate and is arranged in the form of a bouquet',
      imageUrl: 'assets/images/boxes/17.jpg',
      price: 60000,
    ),
    Product(
      id: 'b18',
      title: 'Gift desk',
      description:
          'A piece of wood printed with a beautiful calendar, birthdate and phrases, with illuminated wooden letters, and decorated with flowers',
      imageUrl: 'assets/images/boxes/18.jpg',
      price: 70000,
    ),
    Product(
      id: 'b19',
      title: 'for your car',
      description:
          'Wooden hanging car mirrors with writing of your choice in addition to steering wheel grip with writing of your choice in a simple gift box',
      imageUrl: 'assets/images/boxes/19.jpg',
      price: 40000,
    ),
    Product(
      id: 'b20',
      title: 'Ferrero and Rose Box',
      description:
          'Box Ferrero and natural roses with a message on the cover of the gift box, a very luxurious gift',
      imageUrl: 'assets/images/boxes/20.jpg',
      price: 90000,
    ),
    Product(
      id: 'b21',
      title: 'Morning breakfast box',
      description:
          'The most beautiful morning gift that contains cheese, jam, chocolate, natural roses, honey and nutella',
      imageUrl: 'assets/images/boxes/21.jpg',
      price: 70000,
    ),
    Product(
      id: 'b22',
      title: 'Nivea Men\'s Box',
      description:
          'Nivea men box contains shampoo, body freshener, razor blades and other special gifts',
      imageUrl: 'assets/images/boxes/22.jpg',
      price: 75000,
    ),
    Product(
      id: 'b23',
      title: ' bouquet of kitkat and roses ',
      description:
          'A bouquet of natural roses, kitkat and small white roses with distinctive packaging',
      imageUrl: 'assets/images/boxes/23.jpg',
      price: 40000,
    ),
    Product(
      id: 'b24',
      title: 'Friendship Box',
      description:
          ' Light wooden crafts with chocolate, ferrero and dried rose leaves in a special box ',
      imageUrl: 'assets/images/boxes/24.jpg',
      price: 40000,
    ),
    Product(
      id: 'b25',
      title: 'iphone 6 box',
      description:
          ' IPhone 6 with natural roses, a distinctive and luxurious gift (price without phone)',
      imageUrl: 'assets/images/boxes/25.jpg',
      price: 50000,
    ),
    Product(
      id: 'b26',
      title: 'Memorial Box',
      description:
          ' Car mirror holder and you can print what you like names or pictures and give it a special gift box ',
      imageUrl: 'assets/images/boxes/26.jpg',
      price: 25000,
    ),
  ];

  List<Product> getBoxProducts() => [..._productBoxItems];

  ///////////////////////////////////flowers //////////////////////////////////////////////

  final List<Product> _productFlowerItems = [
    Product(
      id: 'f1',
      title: '10 roses red flowers',
      description: '10 natural roses in a bouquet with a special tie',
      imageUrl: 'assets/images/flowers/tenRedFlowers.jpg',
      price: 50000,
      colors: [Colors.red, Colors.pinkAccent, Colors.yellow, Colors.white],
    ),
    Product(
      id: 'f2',
      title: '10 roses red flowers',
      description: '10 natural roses in a bouquet with a special tie',
      imageUrl: 'assets/images/flowers/tenRedFlowersV2.jpg',
      price: 50000,
      colors: [Colors.red, Colors.pinkAccent, Colors.yellow, Colors.white],
    ),
    Product(
      id: 'f3',
      title: '50 roses red flower',
      description: '50 natural roses in a bouquet with a special tie',
      imageUrl: 'assets/images/flowers/redFlowers.jpg',
      price: 250000,
      colors: [Colors.red, Colors.pinkAccent, Colors.yellow, Colors.white],
    ),
    Product(
      id: 'f4',
      title: '10 roses  Flowers – chocolate',
      description: '10 natural roses in a bouquet with a special tie',
      imageUrl: 'assets/images/flowers/tenFlowersChocolate.jpg',
      price: 80000,
      colors: [Colors.red, Colors.pinkAccent, Colors.yellow, Colors.white],
    ),
    Product(
      id: 'f5',
      title: '20 roses pink flowers',
      description: '20 natural roses in a bouquet with a special tie',
      imageUrl: 'assets/images/flowers/twentyPinkFlowers.jpg',
      price: 100000,
      colors: [Colors.red, Colors.pinkAccent, Colors.yellow, Colors.white],
    ),
    Product(
      id: 'f6',
      title: '20 Red Roses',
      description: '20 natural roses in a bouquet with a special tie',
      imageUrl: 'assets/images/flowers/twentyRedFlowers.jpg',
      price: 100000,
      colors: [Colors.red, Colors.pinkAccent, Colors.yellow, Colors.white],
    ),
    Product(
      id: 'f7',
      title: '10 roses with different colors!',
      description: '10 natural roses in a bouquet with a special tie',
      imageUrl: 'assets/images/flowers/tenDifferentColors.jpg',
      price: 50000,
      colors: [Colors.red, Colors.pinkAccent, Colors.yellow, Colors.white],
    ),
    Product(
      id: 'f8',
      title: '10 roses',
      description: '10 natural roses in a bouquet with a special tie',
      imageUrl: 'assets/images/flowers/tenRedFlowersV3.jpg',
      price: 50000,
      colors: [Colors.red, Colors.pinkAccent, Colors.yellow, Colors.white],
    ),
    Product(
      id: 'f9',
      title: '10  pink Dawody',
      description: '10 natural dawody  roses in a bouquet with a special tie',
      imageUrl: 'assets/images/flowers/tenDawoodyPink.jpg',
      price: 30000,
      colors: [Colors.white, Colors.pinkAccent],
    ),
    Product(
      id: 'f10',
      title: '10 yellow roses',
      description: '10 natural dawody  roses in a bouquet with a special tie',
      imageUrl: 'assets/images/flowers/tenYellowFlowers.jpg',
      price: 50000,
      colors: [Colors.red, Colors.pinkAccent, Colors.yellow, Colors.white],
    ),
    Product(
      id: 'f11',
      title: '10 Red Roses',
      description: '10 natural roses in a bouquet with a special tie',
      imageUrl: 'assets/images/flowers/tenRedFlowersV4.jpg',
      price: 50000,
      colors: [Colors.red, Colors.pinkAccent, Colors.yellow, Colors.white],
    ),
    Product(
      id: 'f12',
      title: '15 Colored Roses',
      description: '15 natural roses in a bouquet with a special tie',
      price: 75000,
      imageUrl: 'assets/images/flowers/fifteenColoredFlowers.jpg',
      colors: [Colors.white, Colors.pinkAccent, Colors.red, Colors.yellow],
    ),
    Product(
      id: 'f13',
      title: '8 Colored Roses',
      description: '8 natural roses in a bouquet with a special tie',
      price: 40000,
      imageUrl: 'assets/images/flowers/eightColoredFlowers.jpg',
      colors: [Colors.white, Colors.pinkAccent, Colors.red, Colors.yellow],
    ),
    Product(
      id: 'f14',
      title: '20 Colored Roses',
      description: '20 natural roses in a bouquet with a special tie',
      price: 100000,
      imageUrl: 'assets/images/flowers/twentyColoredFlowers.jpg',
      colors: [Colors.white, Colors.pinkAccent, Colors.red, Colors.yellow],
    ),
    Product(
      id: 'f15',
      title: '6 roses & 4 chocolate bars',
      description:
          '6 natural roses in a bouquet with a special tie, And 4 piece chocolate bars',
      price: 50000,
      imageUrl: 'assets/images/flowers/sixFlowersFourChocolateBars.jpg',
      colors: [Colors.white, Colors.pinkAccent, Colors.red, Colors.yellow],
    ),
    Product(
      id: 'f16',
      title: '10 Pink Roses',
      description: '10 natural roses in a bouquet with a special tie',
      price: 50000,
      imageUrl: 'assets/images/flowers/tenPinkFlowers.jpg',
      colors: [Colors.white, Colors.pinkAccent, Colors.red, Colors.yellow],
    ),
    Product(
      id: 'f17',
      title: '10  Roses',
      description: '10 natural roses in a bouquet with a special tie',
      price: 50000,
      imageUrl: 'assets/images/flowers/tenFlowers.jpg',
      colors: [Colors.white, Colors.pinkAccent, Colors.red, Colors.yellow],
    ),
    Product(
      id: 'f18',
      title: '36 Roses',
      description: '36 natural roses in a box with a special tie',
      price: 180000,
      imageUrl: 'assets/images/flowers/thirtySixFlowers.jpg',
      colors: [Colors.white, Colors.pinkAccent, Colors.red, Colors.yellow],
    ),
    Product(
      id: 'f19',
      title: '20 Roses',
      description: '20 natural roses in a bouquet with a special tie',
      price: 100000,
      imageUrl: 'assets/images/flowers/twentyFlowers.jpg',
      colors: [Colors.white, Colors.pinkAccent, Colors.red, Colors.yellow],
    ),
    Product(
      id: 'f20',
      title: '10 Dianthus Roses',
      description: '10 natural roses in a bouquet with a special tie',
      price: 50000,
      imageUrl: 'assets/images/flowers/dianthusFlowers.jpg',
      colors: [Colors.white, Colors.pinkAccent, Colors.red, Colors.yellow],
    ),
    Product(
      id: 'f21',
      title: '50 Roses',
      description: '50 natural roses in a bouquet with a special tie',
      price: 250000,
      imageUrl: 'assets/images/flowers/fiftyFlowers.jpg',
      colors: [Colors.white, Colors.pinkAccent, Colors.red, Colors.yellow],
    ),
    Product(
      id: 'f22',
      title: '20 Roses',
      description: '20 natural roses in a bouquet with a special tie',
      price: 100000,
      imageUrl: 'assets/images/flowers/twentyFlowers.jpg',
      colors: [Colors.white, Colors.pinkAccent, Colors.red, Colors.yellow],
    ),
    Product(
      id: 'f23',
      title: '50 Roses',
      description: '50 natural roses in a bouquet with a special tie',
      price: 250000,
      imageUrl: 'assets/images/flowers/fiftyFlowersV2.jpg',
      colors: [Colors.white, Colors.pinkAccent, Colors.red, Colors.yellow],
    ),
  ];

  List<Product> getFlowerProducts() => [..._productFlowerItems];

  // List<Product> getProduct(String id){
  //   var product;
  //   if(id.contains('b')){
  //       product = _productBoxItems.where((element) => element.id.contains(id));
  //     return product;
  //   }else if(id.contains('f')){
  //     product = _productFlowerItems.where((element) => element.id.contains(id));
  //     return product;
  //   }else if(id.contains('c')){
  //     product = _productCakeItems.where((element) => element.id.contains(id));
  //     return product;
  //   }
  //   return null;
  // }
}
