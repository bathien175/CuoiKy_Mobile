class OnbordingContent {
 final String image;
 final String title;
 final String discription;

  OnbordingContent({required this.image,required this.title,required this.discription});
}

List<OnbordingContent> contents = [
  OnbordingContent(
    title: 'Hotel Booking Apps',
    image: 'assets/images/onboarding_image1.png',
    discription: "Discover hundreds of hotels that spread across the world for you "
  ),
  OnbordingContent(
    title: 'Performed by group of 8',
    image: 'assets/images/onboarding_image2.png',
    discription: "As a final topic in the mobile cross-platform course"
  ),
  OnbordingContent(
    title: 'These are team members',
    image: 'assets/images/onboarding_image3.png',
    discription: "Bá Thiện, Quang Huy, Tuấn Kiệt, Văn Trung, Tử Đang, Tiến Dũng"
  ),
];
