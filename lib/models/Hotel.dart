
// ignore: camel_case_types
class listHotel {
  // ignore: non_constant_identifier_names
  final String KHACH_SAN_ID;
  final String KHACH_SAN_NAME;
  final String KHACH_SAN_ADDRESS;
  final String KHACH_SAN_CITY;
  final String KHACH_SAN_DESCRIPTION;
  final int KHACH_SAN_PRICE;

  listHotel({required this.KHACH_SAN_ID,
    required this.KHACH_SAN_NAME,
    required this.KHACH_SAN_ADDRESS,
    required this.KHACH_SAN_CITY,
    required this.KHACH_SAN_DESCRIPTION,
    required this.KHACH_SAN_PRICE,
  });
}

List<listHotel> contents = [
  listHotel(
    KHACH_SAN_ID: '001',
    KHACH_SAN_NAME: 'Cozryn Lux Hotel',
    KHACH_SAN_ADDRESS: "19C Bùi Thị Xuân, phường Bến Thành, Thành phố Hồ Chí Minh",
    KHACH_SAN_CITY: "Thành phố Hồ Chí Minh",
    KHACH_SAN_DESCRIPTION: "Khách sạn này là lựa chọn hoàn hảo cho các kỳ nghỉ mát lãng mạn hay tuần trăng mật của các cặp đôi. Quý khách hãy tận hưởng những đêm đáng nhớ nhất cùng người thương của mình tại Cozrum Lux Hotel",
    KHACH_SAN_PRICE: 1000000,
  ),

  listHotel(
    KHACH_SAN_ID: '002',
    KHACH_SAN_NAME: 'Windsor Plaza Hotel',
    KHACH_SAN_ADDRESS: "18 An Dương Vương, phường 9, Quận 5, Thành phố Hồ Chí Minh",
    KHACH_SAN_CITY: "Thành phố Hồ Chí Minh",
    KHACH_SAN_DESCRIPTION: "Nếu dự định có một kỳ nghỉ dài, thì Windsor Plaza Hotel chính là lựa chọn dành cho quý khách. Với đầy đủ tiện nghi với chất lượng dịch vụ tuyệt vời, Windsor Plaza Hotel sẽ khiến quý khách cảm thấy thoải mái như đang ở nhà vậy. Dịch vụ thượng hạng song hành với hàng loạt tiện nghi phong phú sẽ đem đến cho quý khách trải nghiệm của một kỳ nghỉ viên mãn nhất",
    KHACH_SAN_PRICE: 2145000,
  ),

  listHotel(
    KHACH_SAN_ID: '003',
    KHACH_SAN_NAME: 'Northern Hotel',
    KHACH_SAN_ADDRESS: "11A Thi Sách, phường Bến Nghé, quận 1, thành phố Hồ Chí Minh ",
    KHACH_SAN_CITY: "Thành phố Hồ Chí Minh",
    KHACH_SAN_DESCRIPTION: "Northern Hotel toạ lạc tại khu vực / thành phố Bến Nghé. Khách sạn sở hữu vị trí đắc địa cách sân bay Sân bay Tân Sơn Nhất 6,59 km. Có rất nhiều điểm tham quan lân cận như Ciao Bella ở khoảng cách 0,34 km, và Cyclo Resto ở khoảng cách 1,35 km.",
    KHACH_SAN_PRICE: 2082000,
  ),

  listHotel(
    KHACH_SAN_ID: '004',
    KHACH_SAN_NAME: 'Annata Beach Hotel',
    KHACH_SAN_ADDRESS: "165 Thùy Vân, Thắng Tam, Thành phố Vũng Tàu, Bà Rịa - Vũng Tàu",
    KHACH_SAN_CITY: "Bà Rịa - Vũng Tàu",
    KHACH_SAN_DESCRIPTION: "Annata Beach Hotel toạ lạc tại khu vực / thành phố Thắng Tam. Khách sạn sở hữu vị trí đắc địa cách sân bay Sân bay Vũng Tàu 3,4 km. Có rất nhiều điểm tham quan lân cận như Trung Tâm Y Tế Huyện Long Điền ở khoảng cách 18,51 km, và Long Hai Beach ở khoảng cách 15,76 km.",
    KHACH_SAN_PRICE: 1500000,
  ),
  listHotel(
    KHACH_SAN_ID: '005',
    KHACH_SAN_NAME: 'Mermaid Seaside Hotel',
    KHACH_SAN_ADDRESS: "164 Trần Phú, Phường 5, Thành phố Vũng Tàu, Bà Rịa - Vũng Tàu",
    KHACH_SAN_CITY: "Bà Rịa - Vũng Tàu",
    KHACH_SAN_DESCRIPTION: "Mermaid Seaside Hotel là một khách sạn nằm trong khu vực an ninh, toạ lạc tại Phường 5. Khách sạn sở hữu vị trí đắc địa cách sân bay Sân bay Vũng Tàu 3,74 km. Không chỉ sở hữu vị trí đắc địa, Mermaid Seaside Hotel còn là một trong những khách sạn nằm cách TRUNG TÂM Y TẾ HUYỆN NHÀ BÈ chưa đầy 49,05 km và Bãi biển Cần Giờ chưa đầy 14,68 km.",
    KHACH_SAN_PRICE: 1462000,
  ),

  listHotel(
    KHACH_SAN_ID: '006',
    KHACH_SAN_NAME: 'Classy Boutique Hotel',
    KHACH_SAN_ADDRESS: "21 Hàng Cá, Hàng Đào, Quận Hoàn Kiếm, Hà Nội  ",
    KHACH_SAN_CITY: "Hà Nội",
    KHACH_SAN_DESCRIPTION: "Lưu trú tại Classy Boutique Hotel là một lựa chọn đúng đắn khi quý khách đến thăm Hàng Đào. Nơi nghỉ nằm cách Hanoi Railway Station 1,54 km. Nơi nghỉ này rất dễ tìm bởi vị trí đắc địa, nằm gần với nhiều tiện ích công cộng.",
    KHACH_SAN_PRICE: 1100000,
  ),
  listHotel(
    KHACH_SAN_ID: '007',
    KHACH_SAN_NAME: 'Hanoi Gatsby Hotel',
    KHACH_SAN_ADDRESS: "167 Hàng Thiếc, Hàng Gai, Quận Hoàn Kiếm, Hà Nội  ",
    KHACH_SAN_CITY: "Hà Nội",
    KHACH_SAN_DESCRIPTION: "Hanoi Gatsby Hotel toạ lạc tại khu vực / thành phố Hàng Gai. Khách sạn nằm cách Hanoi Train Street 0,49 km. Có rất nhiều điểm tham quan lân cận như Hồ Lác ở khoảng cách 48,88 km, và Khu Sinh Thái Thiên Phú Lâm ở khoảng cách 29,17 km.",
    KHACH_SAN_PRICE: 340000,
  ),
  listHotel(
    KHACH_SAN_ID: '003',
    KHACH_SAN_NAME: 'Mermaid Seaside Hotel',
    KHACH_SAN_ADDRESS: "165 Thùy Vân, Thắng Tam, Thành phố Vũng Tàu, Bà Rịa - Vũng Tàu, Việt Nam, 790000  ",
    KHACH_SAN_CITY: "Bà Rịa - Vũng Tàu",
    KHACH_SAN_DESCRIPTION: "",
    KHACH_SAN_PRICE: 1000000,
  ),
  listHotel(
    KHACH_SAN_ID: '003',
    KHACH_SAN_NAME: 'Mermaid Seaside Hotel',
    KHACH_SAN_ADDRESS: "165 Thùy Vân, Thắng Tam, Thành phố Vũng Tàu, Bà Rịa - Vũng Tàu, Việt Nam, 790000  ",
    KHACH_SAN_CITY: "Bà Rịa - Vũng Tàu",
    KHACH_SAN_DESCRIPTION: "",
    KHACH_SAN_PRICE: 1000000,
  ),  listHotel(
    KHACH_SAN_ID: '003',
    KHACH_SAN_NAME: 'Mermaid Seaside Hotel',
    KHACH_SAN_ADDRESS: "165 Thùy Vân, Thắng Tam, Thành phố Vũng Tàu, Bà Rịa - Vũng Tàu, Việt Nam, 790000  ",
    KHACH_SAN_CITY: "Bà Rịa - Vũng Tàu",
    KHACH_SAN_DESCRIPTION: "",
    KHACH_SAN_PRICE: 1000000,
  ),  listHotel(
    KHACH_SAN_ID: '003',
    KHACH_SAN_NAME: 'Mermaid Seaside Hotel',
    KHACH_SAN_ADDRESS: "165 Thùy Vân, Thắng Tam, Thành phố Vũng Tàu, Bà Rịa - Vũng Tàu, Việt Nam, 790000  ",
    KHACH_SAN_CITY: "Bà Rịa - Vũng Tàu",
    KHACH_SAN_DESCRIPTION: "",
    KHACH_SAN_PRICE: 1000000,
  ),
  listHotel(
    KHACH_SAN_ID: '008',
    KHACH_SAN_NAME: 'Millennium Hanoi Hotel',
    KHACH_SAN_ADDRESS: "246B Hàng Bông, Cửa Nam, Quận Hoàn Kiếm, Hà Nội ",
    KHACH_SAN_CITY: "Hà Nội",
    KHACH_SAN_DESCRIPTION: "Millennium Hanoi Hotel là một khách sạn nằm trong khu vực an ninh, toạ lạc tại Cửa Nam. Khách sạn nằm cách Hanoi Train Street 0,25 km. Không chỉ sở hữu vị trí đắc địa, Millennium Hanoi Hotel còn là một trong những khách sạn nằm cách Đình Làng Nghĩa Lộ chưa đầy 33,12 km và Nhà thờ Thường Lệ chưa đầy 19,92 km.",
    KHACH_SAN_PRICE: 603000,
  ),
  listHotel(
    KHACH_SAN_ID: '009',
    KHACH_SAN_NAME: 'Ruby Hotel Ha Giang',
    KHACH_SAN_ADDRESS: "47 Lâm Đồng, phường Trần Phú, Thành phố Hà Giang, Hà Giang ",
    KHACH_SAN_CITY: "Hà Giang",
    KHACH_SAN_DESCRIPTION: "Phoenix Hotel Ha Giang toạ lạc tại khu vực / thành phố phường Nguyễn Trãi. Có rất nhiều điểm tham quan lân cận như Hồ Noong ở khoảng cách 11,97 km, và Quan Ba ​​Heaven Gate ở khoảng cách 26,58 km.",
    KHACH_SAN_PRICE: 1024000,
  ),
  listHotel(
    KHACH_SAN_ID: '10',
    KHACH_SAN_NAME: 'Mermaid Seaside Hotel',
    KHACH_SAN_ADDRESS: "117 Vườn Cam, Phường Hợp Giang, Cao Bằng, Việt Nam ",
    KHACH_SAN_CITY: "Cao Bằng",
    KHACH_SAN_DESCRIPTION: "Max Boutique Hotel là một khách sạn nằm trong khu vực an ninh, toạ lạc tại Phường Hợp Giang. Không chỉ sở hữu vị trí đắc địa, Max Boutique Hotel còn là một trong những khách sạn nằm cách Tháp chàm Po Nagar chưa đầy 41,53 km và Coc Bo Cave chưa đầy 41,53 km.",
    KHACH_SAN_PRICE: 675000,
  ),
  listHotel(
    KHACH_SAN_ID: '11',
    KHACH_SAN_NAME: 'Phoenix Hotel Hà Giang',
    KHACH_SAN_ADDRESS: " 92T Nguyễn Trãi, phường Nguyễn Trãi, Thành phố Hà Giang, Hà Giang",
    KHACH_SAN_CITY: "Hà Giang",
    KHACH_SAN_DESCRIPTION: "Phoenix Hotel Ha Giang toạ lạc tại khu vực / thành phố phường Nguyễn Trãi. Có rất nhiều điểm tham quan lân cận như Hồ Noong ở khoảng cách 11,97 km, và Quan Ba ​​Heaven Gate ở khoảng cách 26,58 km.",
    KHACH_SAN_PRICE: 1024000,
  ),
  listHotel(
    KHACH_SAN_ID: '12',
    KHACH_SAN_NAME: 'Mường Thanh Luxury Cao Bằng',
    KHACH_SAN_ADDRESS: "42 Kim Đồng, Phường Hợp Giang, Cao Bằng ",
    KHACH_SAN_CITY: "Cao Bằng",
    KHACH_SAN_DESCRIPTION: "Lưu trú tại Muong Thanh Luxury Cao Bang là một lựa chọn đúng đắn khi quý khách đến thăm Phường Hợp Giang. Khách sạn này rất dễ tìm bởi vị trí đắc địa, nằm gần với nhiều tiện ích công cộng.",
    KHACH_SAN_PRICE: 2160000,
  ),
  listHotel(
    KHACH_SAN_ID: '13',
    KHACH_SAN_NAME: 'Hoang Nham Luxury Hotel',
    KHACH_SAN_ADDRESS: "Số 69 Đường Điện Biên Phủ, Phường Tân Phong, Thành Phố Lai Châu, Tỉnh Lai Châu",
    KHACH_SAN_CITY: "Lai Châu ",
    KHACH_SAN_DESCRIPTION: "Hoang Nham Luxury Hotel là một khách sạn nằm trong khu vực an ninh, toạ lạc tại Phường Tân Phong. Không chỉ sở hữu vị trí đắc địa, Hoang Nham Luxury Hotel còn là một trong những khách sạn nằm cách Pu Sam Cap Caves chưa đầy 6,46 km và Thác Tác Tình chưa đầy 15 km.",
    KHACH_SAN_PRICE: 1300000,
  ),  listHotel(
    KHACH_SAN_ID: '14',
    KHACH_SAN_NAME: 'Adela Boutique Hotel',
    KHACH_SAN_ADDRESS: "10 An Thượng 36, My An, Ngũ Hành Sơn, Mỹ An, Ngũ Hành Sơn, Đà Nẵng ",
    KHACH_SAN_CITY: "Đà Nẵng",
    KHACH_SAN_DESCRIPTION: "Adela Boutique Hotel là một khách sạn nằm trong khu vực an ninh, toạ lạc tại Mỹ An. Khách sạn sở hữu vị trí đắc địa cách sân bay Sân bay quốc tế Đà Nẵng (DAD) 4,92 km. Khách sạn nằm cách Da Nang Railway Station 4,26 km. Không chỉ sở hữu vị trí đắc địa, Adela Boutique Hotel còn là một trong những khách sạn nằm cách Khu cáp treo Bà Nà Hills chưa đầy 23,06 km và Công Viên 29 Tháng 3 chưa đầy 4,25 km.",
    KHACH_SAN_PRICE: 1058000,
  ),
  listHotel(
    KHACH_SAN_ID: '15',
    KHACH_SAN_NAME: 'Khách sạn Zalo Sea',
    KHACH_SAN_ADDRESS: "36 Mỹ Khê 4, Phước Mỹ, Sơn Trà, Đà Nẵng",
    KHACH_SAN_CITY: "Đà Nẵng",
    KHACH_SAN_DESCRIPTION: "Zalo Sea Hotel là một khách sạn nằm trong khu vực an ninh, toạ lạc tại Phước Mỹ. Khách sạn sở hữu vị trí đắc địa cách sân bay Sân bay quốc tế Đà Nẵng (DAD) 5,23 km. Không chỉ sở hữu vị trí đắc địa, Zalo Sea Hotel còn là một trong những khách sạn nằm cách Cà phê Mỹ Hạnh chưa đầy 45,24 km và Núi Bạch Mã chưa đầy 45,69 km.",
    KHACH_SAN_PRICE: 1344000,
  ),  listHotel(
    KHACH_SAN_ID: '16',
    KHACH_SAN_NAME: 'Fairy Hills - Suoi Tien Hills Hotel',
    KHACH_SAN_ADDRESS: "129/16 Đường Chế Lan Viên, Phường Mũi Né, Phan Thiết, Bình Thuận",
    KHACH_SAN_CITY: "Bình Thuận",
    KHACH_SAN_DESCRIPTION: "Fairy Hills - Suoi Tien Hills Hotel là một khách sạn nằm trong khu vực an ninh, toạ lạc tại Phường Mũi Né. Không chỉ sở hữu vị trí đắc địa, Fairy Hills - Suoi Tien Hills Hotel còn là một trong những khách sạn nằm cách Cây Kơ Nia chưa đầy 45,38 km và Sân golf Ocean Dunes chưa đầy 19,37 km.",
    KHACH_SAN_PRICE: 817000,
  ),
  listHotel(
    KHACH_SAN_ID: '17',
    KHACH_SAN_NAME: 'Hai Dong Hotel',
    KHACH_SAN_ADDRESS: "Xuân Diệu, Phường Mũi Né, Phan Thiết, Bình Thuận",
    KHACH_SAN_CITY: "Bình Thuận",
    KHACH_SAN_DESCRIPTION: "Hai Dong Hotel toạ lạc tại khu vực / thành phố Phường Mũi Né. Có rất nhiều điểm tham quan lân cận như Bung Thi Hot Spring ở khoảng cách 43,04 km, và Hải Đăng Kê Gà ở khoảng cách 41,91 km.",
    KHACH_SAN_PRICE: 530000,
  ),  listHotel(
    KHACH_SAN_ID: '18',
    KHACH_SAN_NAME: 'Holi Panorama Nha Trang',
    KHACH_SAN_ADDRESS: "Panorama Building, 02 Nguyễn Thị Minh Khai, Lộc Thọ, Nha Trang, Khánh Hòa",
    KHACH_SAN_CITY: "Khánh Hòa",
    KHACH_SAN_DESCRIPTION: "Holi Panorama Nha Trang toạ lạc tại khu vực / thành phố Lộc Thọ. Nơi nghỉ nằm cách Nha Trang Railway Station 1,6 km. Có rất nhiều điểm tham quan lân cận như Trung Tâm Y Tế Huyện Khánh Sơn ở khoảng cách 36,54 km, và Khu Công Nghiệp Suối Dầu ở khoảng cách 15,54 km.",
    KHACH_SAN_PRICE: 765000,
  ),
  listHotel(
    KHACH_SAN_ID: '19',
    KHACH_SAN_NAME: 'Smile Hotel Nha Trang',
    KHACH_SAN_ADDRESS: "45/1 Hùng Vương, Lộc Thọ, Nha Trang, Khánh Hòa",
    KHACH_SAN_CITY: "Khánh Hòa",
    KHACH_SAN_DESCRIPTION: "Smile Hotel Nha Trang là một khách sạn nằm trong khu vực an ninh, toạ lạc tại Lộc Thọ. Khách sạn nằm cách Nha Trang Railway Station 1,39 km. Không chỉ sở hữu vị trí đắc địa, Smile Hotel Nha Trang còn là một trong những khách sạn nằm cách Vinpearl Beach chưa đầy 5,92 km và Sân golf Diamond Bay chưa đầy 7,6 km.",
    KHACH_SAN_PRICE: 381000,
  ),
  listHotel(
    KHACH_SAN_ID: '20',
    KHACH_SAN_NAME: 'The Palmy Phu Quoc Resort & Spa',
    KHACH_SAN_ADDRESS: "Trần Hưng Đạo, Thị trấn Dương Đông, Phú Quốc, Tỉnh Kiên Giang",
    KHACH_SAN_CITY: "Kiên Giang",
    KHACH_SAN_DESCRIPTION: "The Palmy Phu Quoc Resort & Spa là một nơi nghỉ nằm trong khu vực an ninh, toạ lạc tại Thị trấn Dương Đông. Nơi nghỉ sở hữu vị trí đắc địa cách sân bay Sân bay quốc tế Phú Quốc (PQC) 4,51 km. Nơi nghỉ nằm cách Cang An Thoi Terminal 9,01 km. Không chỉ sở hữu vị trí đắc địa, The Palmy Phu Quoc Resort & Spa còn là một trong những nơi nghỉ nằm cách Crab Market chưa đầy 48,75 km và Khem Beach chưa đầy 17,93 km.",
    KHACH_SAN_PRICE: 926000,
  ),
];