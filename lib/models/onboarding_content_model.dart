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
    title: 'Group 8 - mr.Truyền',
    image: 'assets/images/thaytruyenhehe.jpg',
    discription: "As a final topic in the mobile cross-platform course"
  ),
  OnbordingContent(
      title: 'These are team members',
      image: 'assets/images/kietdung.jpg',
      discription: "Tiến Dũng và Tuấn Kiệt"
  ),
  OnbordingContent(
      title: 'These are team members',
      image: 'assets/images/trungdang.jpg',
      discription: "Văn Trung, Tử Đang"
  ),
  OnbordingContent(
      title: 'These are team members',
      image: 'assets/images/huythien.jpg',
      discription: "Quang Huy, Bá Thiện - Leader"
  ),
];
