class OnbordingContent {
 final String image;
 final String title;
 final String discription;

  OnbordingContent({required this.image,required this.title,required this.discription});
}

List<OnbordingContent> contents = [
  OnbordingContent(
    title: 'Find Hundreds of Hotels',
    image: 'assets/images/onboarding_image1.png',
    discription: "Discover hundreds of hotels that spread across the world for you "
  ),
  OnbordingContent(
    title: 'Make a Destination Plan',
    image: 'assets/images/onboarding_image2.png',
    discription: "Choose the location and we have many hotel recommendations wherever you are "
  ),
  OnbordingContent(
    title: 'Let’s Discover the World',
    image: 'assets/images/onboarding_image3.png',
    discription: "Book your hotel right now for the next level travel. Enjoy your trip! "
  ),
];
