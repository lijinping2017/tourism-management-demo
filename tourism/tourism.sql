/*
Navicat MySQL Data Transfer

Source Server         : mysql_localhost
Source Server Version : 50618
Source Host           : localhost:3306
Source Database       : tourism

Target Server Type    : MYSQL
Target Server Version : 50618
File Encoding         : 65001

Date: 2019-01-14 23:21:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for all_order
-- ----------------------------
DROP TABLE IF EXISTS `all_order`;
CREATE TABLE `all_order` (
  `id` varchar(13) NOT NULL DEFAULT '' COMMENT '订单编号',
  `userId` varchar(13) DEFAULT '' COMMENT '用户id',
  `productId` varchar(13) DEFAULT '' COMMENT '产品id',
  `name` varchar(200) DEFAULT '' COMMENT '产品名称',
  `type` varchar(100) DEFAULT '' COMMENT '订单类型',
  `adult` varchar(100) DEFAULT '' COMMENT '是否是成人价格',
  `personName` varchar(40) DEFAULT '' COMMENT '联系人',
  `price` varchar(11) DEFAULT '' COMMENT '单价',
  `ticketNum` varchar(11) DEFAULT '' COMMENT '票数量',
  `totalMoney` varchar(16) DEFAULT '' COMMENT '订单金额',
  `orderTime` varchar(100) DEFAULT '' COMMENT '下单时间',
  `status` varchar(40) DEFAULT '' COMMENT '订单状态',
  `usedDay` varchar(100) DEFAULT '' COMMENT '使用日期',
  `telephone` varchar(20) DEFAULT '' COMMENT '联系电话',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  `email` varchar(40) DEFAULT '' COMMENT '电子邮箱',
  `imagePath` varchar(100) DEFAULT '' COMMENT '订单图片路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of all_order
-- ----------------------------
INSERT INTO `all_order` VALUES ('1543161868026', '1540424767', '1542974840195', '三亚亚龙湾', 'scenic', 'true', '黄小姐', '419', '1', '419', '2018-11-26 00:04:28', '订单已取消', '2018-12-12', '132567890987', '请尽快处理订单', '1675492761@qq.com', '%2F20181125%2F7e77e4d1209444498ee969a9ca5f8df8.jpg');
INSERT INTO `all_order` VALUES ('1543161980684', '1540424767', '1543155489766', '丽江古城度假酒店', 'hotel', 'false', '张秀', '398', '1', '398', '2018-11-26 00:06:20', '已付款', '2018-12-8', '18846752138', '尽快处理哦', '1876492138@qq.com', '%2F20181125%2F8902b18159ef4ca59a7aabceacd5454f.jpg');
INSERT INTO `all_order` VALUES ('1543162050695', '1540424767', '1543149786225', '丽江二日游', 'line', 'false', '小军', '398', '2', '796', '2018-11-26 00:07:30', '等待付款', '2018-12-25', '16648792456', '', '1346875462@qq.com', '%2F20181125%2F43c8cdd8dd47411fa86012bafa4daeb7.jpg');
INSERT INTO `all_order` VALUES ('1543497706325', '1540424767', '1542549991028', '三亚线路', 'line', 'false', '许小姐', '189', '3', '567', '2018-11-29 21:21:46', '等待付款', '2018-12-30', '16678954328', '期待旅程快点开始', '1675492761@qq.com', '%2F20181118%2F067562c5ba2940bb92fbaddaff6d1dac.jpg');
INSERT INTO `all_order` VALUES ('1543498620171', '1540424767', '1542974840195', '三亚亚龙湾', 'scenic', 'false', '小明', '300', '1', '300', '2018-11-29 21:37:00', '等待付款', '2018-12-12', '15578462843', '期待旅程', '1468723468@qq.com', '%2F20181125%2F7e77e4d1209444498ee969a9ca5f8df8.jpg');
INSERT INTO `all_order` VALUES ('1545975239558', '1540424767', '1543149786225', '丽江二日游', 'line', 'false', '11', '398', '2', '796', '2018-12-28 13:33:59', '等待付款', '2018-11-21', '132567890987', '232', '1675492761@qq.com', '%2F20181125%2F43c8cdd8dd47411fa86012bafa4daeb7.jpg');
INSERT INTO `all_order` VALUES ('1545975616590', '1540424767', '1543155489766', '丽江古城度假酒店', 'hotel', 'false', '1', '398', '2', '796', '2018-12-28 13:40:16', '已付款', '2018-11-21', '132567890987', '33', '1675492761@qq.com', '%2F20181125%2F8902b18159ef4ca59a7aabceacd5454f.jpg');
INSERT INTO `all_order` VALUES ('1545976406360', '1540424767', '1545649224537', '九寨沟犀牛海', 'scenic', 'true', '55', '189', '1', '189', '2018-12-28 13:53:26', '已付款', '2018-12-4', '132567890987', '55', '1675492761@qq.com', '%2F20181224%2Ff1bd14f4f05841209c093af6461f254c.jpg');
INSERT INTO `all_order` VALUES ('1545976646591', '1540424767', '1545649224537', '九寨沟犀牛海', 'scenic', 'false', '55', '129', '1', '129', '2018-12-28 13:57:26', '已付款', '2018-12-4', '132567890987', '55', '1675492761@qq.com', '%2F20181224%2Ff1bd14f4f05841209c093af6461f254c.jpg');
INSERT INTO `all_order` VALUES ('1545976845247', '1540424767', '1545649224537', '九寨沟犀牛海', 'scenic', 'false', '55', '129', '1', '129', '2018-12-28 14:00:45', '等待付款', '2018-12-4', '132567890987', '55', '1675492761@qq.com', '%2F20181224%2Ff1bd14f4f05841209c093af6461f254c.jpg');
INSERT INTO `all_order` VALUES ('1546065488973', '1540424767', '1542549991028', '三亚线路', 'line', 'false', '黎', '189', '1', '189', '2018-12-29 14:38:09', '等待付款', '2018-12-4', '132567890987', '22', '1675492761@qq.com', '%2F20181118%2F067562c5ba2940bb92fbaddaff6d1dac.jpg');
INSERT INTO `all_order` VALUES ('1546822017251', '1540424767', '1543149786225', '丽江二日游', 'line', 'false', 'aa', '398', '1', '398', '2019-01-07 08:46:57', '已付款', '2018-11-21', '132567890987', '1', '1675492761@qq.com', '%2F20181125%2F43c8cdd8dd47411fa86012bafa4daeb7.jpg');
INSERT INTO `all_order` VALUES ('1546823505259', '1540424767', '1542549991028', '三亚线路', 'line', 'false', 'aa', '189', '2', '378', '2019-01-07 09:11:45', '已付款', '2018-12-4', '132567890987', '12', '1675492761@qq.com', '%2F20181118%2F067562c5ba2940bb92fbaddaff6d1dac.jpg');

-- ----------------------------
-- Table structure for file
-- ----------------------------
DROP TABLE IF EXISTS `file`;
CREATE TABLE `file` (
  `id` varchar(13) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `filePath` varchar(500) DEFAULT '',
  `fileDesc` varchar(5000) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of file
-- ----------------------------
INSERT INTO `file` VALUES ('1542974713779', 'm2.jpg', '%2F20181123%2Fe8a678eb2eaf4283ab817436bf4e6073.jpg', null);
INSERT INTO `file` VALUES ('1542974819902', 'a2.jpg', '%2F20181123%2F7d147ac2210c46a98e6f1f9e91f975ab.jpg', '楼主要去三亚玩，建议你可以体验一下坐游艇出海。当初我们去的时候就是海草自由行小萱帮我们安排的，我们全程乘坐豪华私家游艇，还免费给我们提供了鱼竿与鱼饵，让我们在船上体验了一回海钓。坐在游艇上，吹着海风，静静地看着大海，这种感觉真的很惬意。1天前 3回复小椰2天前LV.22哈哈，在美美的海边一定还要记得拍点高大上的照片。湛蓝的大海，张张都是大片的感觉你若安好便是晴天2天前LV.22对的，真的非常美。平行的世界推荐达人三亚号称中国最美的海滩，最近刚跟女朋友从三亚回来，我们当时去的时候也是联系海草自由行小萱给我们安排的行程，是真的很赞。全程5星级海景房，游艇出海、碧海蓝天、阳光沙滩、还有热带森林公园都看到了，我女朋友还说这次我安排的行程怎么这么靠谱，完全不像以前那么马虎了。哈哈。在三亚我们玩了很多项目，但是最开心的就是去潜水，我们虽然都是菜鸟，但是教我们的潜水教练还是挺耐心的，期间还拍了许多照片，看到海底的那一刻觉得真的值得了。不过去玩的话还是要注意安全。');
INSERT INTO `file` VALUES ('1542974820821', 'tyhj.jpg', '%2F20181123%2F1765ea77dfbe4762ac3fb47119f32cac.jpg', '亚龙湾的海水蔚蓝清澈，能见度高，沙质洁白如玉，这里的年平均海水温度22-25.1°C，终年可游泳。它被《中国国家地理》杂志评为中国最美八大湾之一。亚龙湾内各类豪华别墅、度假村云集，众多国际知名酒店可供挑选，比如万豪、希尔顿、喜来登、丽思卡尔顿等等，由于海岸是这些酒店的真正魅力所在，亚龙湾的水质因此得到了从维持到使用的最好保护，生态环境优良。亚龙湾还建有海上运动中心、高尔夫球场、游艇俱乐部、spa会所等一流配套设施，来此可轻松享受假期。');
INSERT INTO `file` VALUES ('1543144354490', 'a6.jpg', '%2F20181125%2F7e77e4d1209444498ee969a9ca5f8df8.jpg', '');
INSERT INTO `file` VALUES ('1543148593374', '6e59dcee.jpg', '%2F20181125%2F02d3f5889a6d4bf08b2d9d56ec44a9d0.jpg', null);
INSERT INTO `file` VALUES ('1543152565827', '41b6ec78.jpg', '%2F20181125%2F43c8cdd8dd47411fa86012bafa4daeb7.jpg', '');
INSERT INTO `file` VALUES ('1543155002473', '7 (1).jpg', '%2F20181125%2F399b0fca3d1349f5b8e6dc5fb774a42c.jpg', null);
INSERT INTO `file` VALUES ('1543155216770', '4.jpg', '%2F20181125%2F398b1d9e4d1b4a87b9de4c18c97bb907.jpg', '兰花街牌楼的小巷口 夜里等在寒风里接我们的阿波 早餐精致，小小一口馋人的包子，泡过的萝卜里散碎的红椒像我们匆忙都市生活里残存的激情。糯糯的白粥，还偷偷问老板讨了一扎喷流红油的咸蛋……餐厅的感觉好过闹市里噱头高的咖啡厅，幽幽的空气和光影，几张错落的藤桌，红丝绒沙发的靠背上是略带抽象的油画，落地的玻璃外银杏叶黄了，偶尔掉下来的它们，把金色的阳光裹挟着挽住了我们心。 绿色茶几上清甜的百合，天井里披满绿苔的石头，还有摇摆着腰肢低声耳语的锦鲤，灰鹦鹉趁着我们不注意吹起了口哨，诧异间它又一声“你好”引的你偷笑摇头…… 和孩子爬玩雪山，看完千古情疲惫不堪回来，善良的老板在厨间熬好了白粥，异地他乡对着昏黄光影喝着粥，聊起滇红茶的前世今生，大堂边的茶台上品了几种红茶，顿时决定，一定要带着这些高原古树的舌尖色彩回去喧闹的城市，回味…… 浴巾厚厚沉沉的，好过声名在外的星级酒店，边角绣着花，丝滑绒绒的拖鞋，瞬间让梦淹没了我们旅途的疲惫。 长长睫毛的雪纳瑞在阳光下看着我们拎着旅行箱远去，回头时觉得不舍，那些风景区美丽早就被熙熙攘攘的人流冲淡了，唯有这次住的酒店，一切的点点滴滴，唯一一次觉得丽江仍是十几年前的模样，那是窗前铜风铃一般，叮叮的细若可闻，像一直记得回头微笑的关怀，早就不见了却再也忘不了。 感谢雪悦的一切，让人能写出一篇文章的你们，要有多少真心和情怀厚重。');
INSERT INTO `file` VALUES ('1543155216785', '2002070000002eoaf2897_R_300_225.jpg', '%2F20181125%2Fa2565c1eac694bee8e9da13cbdc8a85f.jpg', '位置绝佳，交通便利，出行方便，后面的行程安排都是走出1分钟即可乘车，不用拖着行李箱到处走，可以商量寄存行李，从酒店走几步就进去逛丽江古城了，值得推荐入住呢！再说说酒店环境五颗星，一应俱全，拎包入住！店家啊波经理热情接待的我们，第一晚睡得很踏实，环境宜人，舒适恬静，有一种家的感觉。');
INSERT INTO `file` VALUES ('1543155542075', 'u=2751207367,1437471030&fm=26&gp=0.jpg', '%2F20181125%2F858c6d443c4a4a9f9e8a4444f4998273.jpg', '');
INSERT INTO `file` VALUES ('1543155858527', 'u=226356536,1986718677&fm=26&gp=0.jpg', '%2F20181125%2F8902b18159ef4ca59a7aabceacd5454f.jpg', '');
INSERT INTO `file` VALUES ('1544449628807', '56af2e90.jpg', '%2F20181210%2Fd35816b707ad492c8f645a080cf39159.jpg', null);
INSERT INTO `file` VALUES ('1544452187184', '4.jpg', '%2F20181210%2Fee5afa43074e424a807b67f42d822306.jpg', null);
INSERT INTO `file` VALUES ('1544966837903', 'line.png', '%2F20181216%2Fb168e91394474e93ac03d28031b1b198.png', null);
INSERT INTO `file` VALUES ('1544970156040', 'scenic.jpg', '%2F20181216%2Fa7b3c274d8fe49ada5bdd79cd1726fd2.jpg', null);
INSERT INTO `file` VALUES ('1544970296268', 'hotel.png', '%2F20181216%2F9cd42b7228054892a721fb3f0b240026.png', null);
INSERT INTO `file` VALUES ('1544971085821', 'hotel.png', '%2F20181216%2F20d88eb8420940788c54a27d8d0935d7.png', null);
INSERT INTO `file` VALUES ('1544971284165', 'hotel.png', '%2F20181216%2F25aac708450643b08678b27599e73dfb.png', null);
INSERT INTO `file` VALUES ('1544975028667', 'hotel.png', '%2F20181216%2Fb3174821c42f4bb48b1c4706bb8050f6.png', null);
INSERT INTO `file` VALUES ('1545049493940', 'hotel.png', '%2F20181217%2F91c7bc02397241f1a3a98c45a4c0f741.png', null);
INSERT INTO `file` VALUES ('1545050959265', 'hotel.png', '%2F20181217%2F76468ca2cdc740f39624fcfd5106f36b.png', null);
INSERT INTO `file` VALUES ('1545050976872', 'scenic.jpg', '%2F20181217%2F187164dffa014b298d6b1252db955754.jpg', null);
INSERT INTO `file` VALUES ('1545051080802', 'line.png', '%2F20181217%2Ffb610eccd2d544e08af7515f99b8e480.png', null);
INSERT INTO `file` VALUES ('1545649008059', '5d4e103874f64e2b81f0ce133817cbff.jpg', '%2F20181224%2Ff1bd14f4f05841209c093af6461f254c.jpg', null);
INSERT INTO `file` VALUES ('1545649204813', '3e9a1370368e42bb891b21379ba02b0e.jpg', '%2F20181224%2F87ac69dd6e034475bb3402731d1f33d7.jpg', '树正寨往上行， 便看到一座长约2公里，水深18米，海拔高度2400米的海子。这是树正沟最大的海子犀牛海。犀牛海的南端有一座栈桥通往对岸。 犀牛海是九寨沟中景色变化最多的海子之一，其倒影几乎是众海之冠。每天清晨云雾飘渺时的云雾倒影，亦幻亦真，让人分不清哪里是天，哪里是水海。湖岸四周的彩叶也是亮丽多姿，艳冠群芳。 犀牛海水域开阔，是九寨沟仅次于长海的第二大海子，其美丽的倒影堪称众海之冠。北岸的尽头是生意盎然芦苇丛。 每天清晨，云雾飘渺时的云雾倒影，亦幻亦真，让人分不清哪里是天，哪里是水。海子四周，长满了各色花草树木。');
INSERT INTO `file` VALUES ('1545649204940', '36b2eb75ad8d415d8d7acc86d241585e.jpg', '%2F20181224%2Fa65d3218d7ea49e4b64bf6cbc0f27ad8.jpg', '春夏季节，一片翠绿；秋风起时，便满堤秋色，红叶绿树倒影于湖光山色之中，美不胜收。特别是中间那一大片蓝得让人心醉的湖面，不仅让游客流连忘返，也成为摄影家和画家眼里最具魅力的地方。 传说古时候，有一位身患重病，奄奄一息的藏族老喇嘛，骑着犀牛来到这里。当他饮用了这里的湖水后，病症况然奇迹似的康复了。于是老喇嘛日夜饮用这里的湖水，舍不得离开，最后骑着犀牛进入海中，永久定居于此，这个海子便被称为犀牛海。 离开犀牛海继续上行，经过一段漫长的路途后，便到达树正沟的末端、九寨沟中最大的旅客聚集点--诺日朗招待所。');
INSERT INTO `file` VALUES ('1546070827363', '7.jpg', '%2F20181229%2Fb4ecaf317afa4443b0184524725a37a3.jpg', null);
INSERT INTO `file` VALUES ('1546070885443', '433e7403bd93e5653b9e00a99dde818b.jpg', '%2F20181229%2F8918e15fe1684cb88870ba0f89cc57a3.jpg', '1');
INSERT INTO `file` VALUES ('1546070885444', '56af2e90.jpg', '%2F20181229%2F48d5b9fa142c46fca2b5d924771663f0.jpg', '2');
INSERT INTO `file` VALUES ('1546821332177', 'af74cbd.jpg', '%2F20190107%2F76ec9672afbf4738b51b00108440e34a.jpg', null);
INSERT INTO `file` VALUES ('1546821484577', '5d8d8fa2.jpg', '%2F20190107%2F1dee1fae42f14378ae766948154804df.jpg', null);
INSERT INTO `file` VALUES ('1546823790926', '2.jpg', '%2F20190107%2F01ce8c7f29084767b2ecc5d50c0da1c5.jpg', null);
INSERT INTO `file` VALUES ('1546823824838', '4fdc67b2.jpg', '%2F20190107%2Fc55b484c306a479f930a70a967893000.jpg', '1');
INSERT INTO `file` VALUES ('1546824141829', 'line.png', '%2F20190107%2F8ad7fd852662430e869761290c381d2c.png', null);

-- ----------------------------
-- Table structure for first_menu
-- ----------------------------
DROP TABLE IF EXISTS `first_menu`;
CREATE TABLE `first_menu` (
  `id` varchar(13) NOT NULL,
  `name` varchar(40) NOT NULL,
  `imagePath` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of first_menu
-- ----------------------------
INSERT INTO `first_menu` VALUES ('1540427231111', '我的订单', '%2F20181216%2F501bc5a713d24f56a9f7c7aacd2d26c4.jpg');
INSERT INTO `first_menu` VALUES ('1540427242122', '个人中心', '%2F20181106%2Fa630ea9ad53c4b45acaf740b2f4d9190.jpg');
INSERT INTO `first_menu` VALUES ('1540427242133', '景点管理', '%2F20181106%2Fa630ea9ad53c4b45acaf740b2f4d5341.jpg');
INSERT INTO `first_menu` VALUES ('1540427242144', '线路管理', '%2F20181106%2Fa630ea9ad53c4b45acaf740b2f4d5341.jpg');
INSERT INTO `first_menu` VALUES ('1540427242155', '酒店管理', '%2F20181106%2Fa630ea9ad53c4b45acaf740b2f4d5341.jpg');
INSERT INTO `first_menu` VALUES ('1540427242166', '系统设置', '%2F20181106%2Fa630ea9ad53c4b45acaf740b2f4d5341.jpg');
INSERT INTO `first_menu` VALUES ('1546824143124', '国际', '%2F20190107%2F8ad7fd852662430e869761290c381d2c.png');

-- ----------------------------
-- Table structure for hotel
-- ----------------------------
DROP TABLE IF EXISTS `hotel`;
CREATE TABLE `hotel` (
  `id` varchar(13) NOT NULL DEFAULT '',
  `name` varchar(100) DEFAULT '' COMMENT '酒店名称',
  `province` varchar(40) DEFAULT '' COMMENT '所属省份',
  `city` varchar(40) DEFAULT '' COMMENT '所属城市',
  `address` varchar(400) DEFAULT '' COMMENT '酒店具体地址',
  `originalPrice` varchar(16) DEFAULT '' COMMENT '原价',
  `salePrice` varchar(16) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '优惠价',
  `tradeVolume` varchar(11) DEFAULT '' COMMENT '酒店销量',
  `satisfaction` varchar(11) DEFAULT '' COMMENT '满意度',
  `recommend` varchar(16) DEFAULT '' COMMENT '推荐',
  `homeType` varchar(100) DEFAULT '' COMMENT '房型',
  `bedType` varchar(100) DEFAULT '' COMMENT '床型',
  `mealSign` varchar(40) DEFAULT '' COMMENT '用餐标准',
  `grade` varchar(40) DEFAULT '' COMMENT '酒店星级',
  `openTime` date DEFAULT NULL COMMENT '开业时间',
  `decorateTime` date DEFAULT NULL COMMENT '装修时间',
  `payWay` varchar(40) DEFAULT '' COMMENT '付款方式',
  `introduce` varchar(5000) DEFAULT '' COMMENT '酒店介绍',
  `telephone` varchar(20) DEFAULT '' COMMENT '酒店电话',
  `hotelImage` varchar(100) DEFAULT '' COMMENT '酒店图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hotel
-- ----------------------------
INSERT INTO `hotel` VALUES ('1542339695976', '九寨沟美好酒店', '天津', '北京', '天津', '450', '380', '578', '290', '推荐', '商务间', '2米', '早晚餐', '四星级 AAAA', '1994-02-14', '1993-11-04', '支付宝', '天津酒店很美好', '14478546245', '%2F20181125%2F858c6d443c4a4a9f9e8a4444f4998273.jpg');
INSERT INTO `hotel` VALUES ('1543155489766', '丽江古城度假酒店', '云南', ' 古城', '云南丽江花园郊区', '453', '398', '245', '100', '推荐', '标准间', '2米', '早中晚三餐', '五星级 AAAAA', '1993-10-01', '1900-01-05', '支付宝', '　丽江古城度假酒店地处古城区玉河走廊兰花街，周围近邻飞机场、火车站及客运站，周边步行即至四方街、酒吧街，并配备专线前往香格里拉、拉市海茶马古道、玉龙雪山、虎跳峡、观音峡、黑龙潭公园等著名景点，位置得天独厚。\n　　丽江古城度假酒店为丽江纳西民居唯一石质瓦屋结构重点保护对象，获2015年“丽江传承：纳西民居与建筑艺术”专题评选奖。\n　　酒店由国际知名设计师Mr Feng在继承性整修设计的基础上，采用天然原石与暖色调木质搭建而成，酒店配备高档床具、3D液晶电视、品牌卫浴等星级客房设施，并拥有餐厅、茶台、酒吧、锦鲤鱼池及花园庭院等休闲场所。\n　　凭借着优质的酒店配置和更为优质的酒店服务，雪悦已成为丽江旅行入宿休养、怡然寻趣、倚栏凭吊、心灵慰藉的上佳选择。', '18847512467', '%2F20181125%2F8902b18159ef4ca59a7aabceacd5454f.jpg');

-- ----------------------------
-- Table structure for hotel_file
-- ----------------------------
DROP TABLE IF EXISTS `hotel_file`;
CREATE TABLE `hotel_file` (
  `id` varchar(13) NOT NULL,
  `hotelId` varchar(13) DEFAULT NULL,
  `fileId` varchar(13) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hotel_file
-- ----------------------------
INSERT INTO `hotel_file` VALUES ('1542339695997', '1542339695976', '1542382216394');
INSERT INTO `hotel_file` VALUES ('1542339696006', '1542339695976', '1542382228502');
INSERT INTO `hotel_file` VALUES ('1543155489828', '1543155489766', '1543155216770');
INSERT INTO `hotel_file` VALUES ('1543155489870', '1543155489766', '1543155216785');
INSERT INTO `hotel_file` VALUES ('1543571422581', '1543571422561', '1543571331029');

-- ----------------------------
-- Table structure for line
-- ----------------------------
DROP TABLE IF EXISTS `line`;
CREATE TABLE `line` (
  `id` varchar(13) NOT NULL DEFAULT '',
  `name` varchar(255) DEFAULT '' COMMENT '线路名称',
  `originalPrice` varchar(16) DEFAULT '' COMMENT '原价',
  `salePrice` varchar(16) DEFAULT '' COMMENT '优惠价',
  `tradeVolume` varchar(16) DEFAULT '' COMMENT '销量',
  `satisfaction` varchar(16) DEFAULT '' COMMENT '满意度',
  `mealSign` varchar(50) DEFAULT '' COMMENT '套餐类型',
  `lineNumber` varchar(50) DEFAULT '' COMMENT '线路编号',
  `gobackWay` varchar(200) DEFAULT '' COMMENT '往返交通',
  `aheadApply` varchar(40) DEFAULT '' COMMENT '提前报名',
  `payWay` varchar(50) DEFAULT '' COMMENT '付款方式',
  `lineFeature` varchar(3000) DEFAULT '' COMMENT '线路特色',
  `costInclude` varchar(3000) DEFAULT '' COMMENT '费用包含',
  `costUnInclude` varchar(3000) DEFAULT '' COMMENT '费用不包含',
  `ContractPay` varchar(500) DEFAULT '' COMMENT '签约付款',
  `remark` varchar(4000) DEFAULT '' COMMENT '备注',
  `telephone` varchar(20) DEFAULT '' COMMENT '线路电话',
  `lineImage` varchar(100) DEFAULT '' COMMENT '线路图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of line
-- ----------------------------
INSERT INTO `line` VALUES ('1542549991028', '三亚线路', '210', '189', '542', '200', '跟团游', '1006', '汽车', '1天以上', '支付宝', '好听又苦于', '党和国家', '国际化', '施工方和', '哈哈', '14478546245', '%2F20181118%2F067562c5ba2940bb92fbaddaff6d1dac.jpg');
INSERT INTO `line` VALUES ('1543149786225', '丽江二日游', '498', '398', '252', '99', '跟团游', '1003', '汽车', '2天以上', '支付宝', '苍山洱海、玉龙雪山、纳西族篝火晚会，西双版纳傣族风情', '费用包含了接送服务、全程交通、导游费用、住宿、用餐、保险等等，抵达云南后的费用都包含了，很省心也很划算！', '费用不包含景区的门票、自身钱财的保管与丢失责任等', '实行网上预订成功后付款，付款成功请耐心等待通知！', '1. 低价团一定不要报，其中的坑多得跳不完，我有朋友就跳过\n\n2. 路上陌生人的随意搭讪还是不要理会，从上火车开始到行程结束都会有好多人向你推荐各种团各种东西\n\n3. 要自由行一定需要充足的准备，人生地不熟最好还是找人安排\n\n最后，就是题主要从昆明去云南旅游，建议你找天天咨询下。不管是玩7天还是10天都可以根据你的时间和要求合理规划路线行程，你需要的话我可以把天天的微信和电话都给你，反正问问也不要钱嘛！', '16784520134', '%2F20181125%2F43c8cdd8dd47411fa86012bafa4daeb7.jpg');
INSERT INTO `line` VALUES ('1546821381469', '九寨沟线路', '120', '100', '200', '100', '跟团游', '1001', '汽车', '1天以上', '支付宝', '的，发几个酷虎', '  个客户就立刻就立刻；', '哪来的开发了划分共和国', '多个', '股份及货款', '16784520134', '%2F20190107%2F76ec9672afbf4738b51b00108440e34a.jpg');
INSERT INTO `line` VALUES ('1546821498545', '天津', '1', '1', '1', '1', '跟团游', '1', '1', '1天以上', '1', '1', '1', '1', '1', '1', '14478546245', '%2F20190107%2F1dee1fae42f14378ae766948154804df.jpg');

-- ----------------------------
-- Table structure for line_schedule
-- ----------------------------
DROP TABLE IF EXISTS `line_schedule`;
CREATE TABLE `line_schedule` (
  `id` varchar(13) NOT NULL DEFAULT '',
  `lineId` varchar(13) DEFAULT '' COMMENT '路线id',
  `day` varchar(16) DEFAULT '' COMMENT '行程天数',
  `name` varchar(50) DEFAULT '' COMMENT '行程目的地',
  `meal` varchar(400) DEFAULT '' COMMENT '用餐情况',
  `stay` varchar(1000) DEFAULT '' COMMENT '住宿情况',
  `trafic` varchar(100) DEFAULT '' COMMENT '交通工具',
  `detail` varchar(5000) DEFAULT '' COMMENT '行程详情',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of line_schedule
-- ----------------------------
INSERT INTO `line_schedule` VALUES ('1542549991063', '1542549991028', '1', '三亚', '一日三餐', '三亚', '汽车', '和井井有条');
INSERT INTO `line_schedule` VALUES ('1543149786279', '1543149786225', '1', '丽江古城', '中晚餐', '云南大酒店', '汽车', '到丽江两日的话，一天肯定是要逛古城，另外一天则是看喜好安排，可以是玉龙雪山、泸沽湖、虎跳峡等，如果已经在大理感受过洱海，那么我觉得剩下的一天可以安排游玩玉龙雪山，毕竟国内这样类型的山并不多，高海滨、空气稀薄，还可以在山腰观赏张艺谋导演的《印象丽江》。交通工具和住宿。\n交通工具主要靠DIDI出行网约快车，住宿可以直接就住在古城或古城附近的客栈，近两年丽江相对来说人流比往年稀少，住宿的价格其实算便宜，而且很多都非常的有民族特色。');
INSERT INTO `line_schedule` VALUES ('1543149786376', '1543149786225', '2', '玉龙雪山', '一日三餐', '海星级大酒店', '汽车', '游览玉龙雪山的话要耗时一天。个人觉得玉龙雪山以散客游的方式其实很浪费时间，经费上也不划算，因此可以提前一天在网上报一个纯玩团（分小团大团），折合下来很划算，并且节省时间（团在排队上比较有优势，旅行社在景区中消息互通，哪个项目人少先去哪个项目），可以以最少的时间游览最多的项目。而且根据当地客栈服务人员的说法，玉龙雪山没有明显的淡季和旺季，平时人都是很多的。即使是报纯玩团，也是分好几种套餐。个人觉得玉龙雪山上，不容错过的是要坐大索道登顶（仅为景区开放的最高顶端，海拔4680米）、观赏《印象丽江》（海拔3100米实景演出剧）、蓝月谷。一般报团的套餐都含有防寒服、氧气瓶和水。自己可以带一些巧克力上山，食用可以缓解高原反应。上山后不宜做剧烈的动作，尽量放慢运动状态，因为雪山空气比较稀薄，很容易导致缺氧头晕，体力不支。');
INSERT INTO `line_schedule` VALUES ('1546821381532', '1546821381469', '1', '九寨沟', '一日三餐', '放到', '飞', '订单');
INSERT INTO `line_schedule` VALUES ('1546821381686', '1546821381469', '2', '的', '一日三餐', '飞', ' 飞', ' 个');
INSERT INTO `line_schedule` VALUES ('1546821498548', '1546821498545', '1', '1', '一日三餐', '1', '1', '儿童');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` varchar(13) NOT NULL,
  `name` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '超级用户');
INSERT INTO `role` VALUES ('1544779017059', '普通管理员');
INSERT INTO `role` VALUES ('1544779186726', '景点管理员');
INSERT INTO `role` VALUES ('1544889606221', '普通用户');
INSERT INTO `role` VALUES ('1546824053372', '景点管理');

-- ----------------------------
-- Table structure for role_second_menu
-- ----------------------------
DROP TABLE IF EXISTS `role_second_menu`;
CREATE TABLE `role_second_menu` (
  `id` varchar(13) NOT NULL,
  `roleId` varchar(13) NOT NULL,
  `secmId` varchar(13) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_second_menu
-- ----------------------------
INSERT INTO `role_second_menu` VALUES ('1540427830111', '1', '1540427493111');
INSERT INTO `role_second_menu` VALUES ('1540428150112', '1', '1540427508122');
INSERT INTO `role_second_menu` VALUES ('1540428150113', '1', '1540427508133');
INSERT INTO `role_second_menu` VALUES ('1540428150114', '1', '1540427508144');
INSERT INTO `role_second_menu` VALUES ('1540428150115', '1', '1540427508155');
INSERT INTO `role_second_menu` VALUES ('1540428150116', '1', '1540427508166');
INSERT INTO `role_second_menu` VALUES ('1540428150117', '1', '1540427508177');
INSERT INTO `role_second_menu` VALUES ('1540428150118', '1', '1540427508188');
INSERT INTO `role_second_menu` VALUES ('1540428150119', '1', '1540427508199');
INSERT INTO `role_second_menu` VALUES ('1540428150120', '1', '1540427508200');
INSERT INTO `role_second_menu` VALUES ('1540428150121', '1', '1540427508211');
INSERT INTO `role_second_menu` VALUES ('1540428150122', '1', '1540427508212');
INSERT INTO `role_second_menu` VALUES ('1544601875026', '1', '1544598975802');
INSERT INTO `role_second_menu` VALUES ('1544601875028', '1', '1544677307336');
INSERT INTO `role_second_menu` VALUES ('1544804551893', '1', '1544799977533');
INSERT INTO `role_second_menu` VALUES ('1544878886723', '0', '1540427493111');
INSERT INTO `role_second_menu` VALUES ('1544878886756', '0', '1540427508133');
INSERT INTO `role_second_menu` VALUES ('1544878886774', '0', '1540427508144');
INSERT INTO `role_second_menu` VALUES ('1544878886779', '0', '1540427508155');
INSERT INTO `role_second_menu` VALUES ('1544878886790', '0', '1540427508122');
INSERT INTO `role_second_menu` VALUES ('1544878886862', '0', '1540427508166');
INSERT INTO `role_second_menu` VALUES ('1544933900077', '1544779017059', '1540427493111');
INSERT INTO `role_second_menu` VALUES ('1544937532962', '1544779017059', '1540427508133');
INSERT INTO `role_second_menu` VALUES ('1544937533469', '1544779017059', '1544677307336');
INSERT INTO `role_second_menu` VALUES ('1544937533485', '1544779017059', '1544799977533');
INSERT INTO `role_second_menu` VALUES ('1544937681223', '1544779017059', '1540427508144');
INSERT INTO `role_second_menu` VALUES ('1544937681261', '1544779017059', '1540427508155');
INSERT INTO `role_second_menu` VALUES ('1544937743495', '1544779017059', '1540427508211');
INSERT INTO `role_second_menu` VALUES ('1544941174602', '1544779017059', '1540427508122');
INSERT INTO `role_second_menu` VALUES ('1544941192481', '1544779017059', '1540427508166');
INSERT INTO `role_second_menu` VALUES ('1544942190908', '1544889606221', '1540427493111');
INSERT INTO `role_second_menu` VALUES ('1544942190973', '1544889606221', '1540427508133');
INSERT INTO `role_second_menu` VALUES ('1544942190984', '1544889606221', '1540427508144');
INSERT INTO `role_second_menu` VALUES ('1544942190993', '1544889606221', '1540427508155');
INSERT INTO `role_second_menu` VALUES ('1544942191021', '1544889606221', '1540427508122');
INSERT INTO `role_second_menu` VALUES ('1544942191066', '1544889606221', '1540427508166');
INSERT INTO `role_second_menu` VALUES ('1544942567034', '1544779186726', '1540427493111');
INSERT INTO `role_second_menu` VALUES ('1544971150007', '1', '1544971149960');
INSERT INTO `role_second_menu` VALUES ('1544975125008', '1', '1544975124977');
INSERT INTO `role_second_menu` VALUES ('1544975125009', '1', '1540427508213');
INSERT INTO `role_second_menu` VALUES ('1544975125010', '1', '1540427508214');
INSERT INTO `role_second_menu` VALUES ('1544975125011', '1', '1540427508215');
INSERT INTO `role_second_menu` VALUES ('1544975125012', '1', '1540427508216');
INSERT INTO `role_second_menu` VALUES ('1546824166511', '1', '1546824166474');

-- ----------------------------
-- Table structure for scenic
-- ----------------------------
DROP TABLE IF EXISTS `scenic`;
CREATE TABLE `scenic` (
  `id` varchar(13) NOT NULL DEFAULT '',
  `name` varchar(100) DEFAULT '' COMMENT '景点名称',
  `province` varchar(100) DEFAULT '' COMMENT '省份',
  `city` varchar(100) DEFAULT '' COMMENT '城市',
  `address` varchar(255) DEFAULT '' COMMENT '景点地址',
  `tradeVolume` varchar(11) DEFAULT '0' COMMENT '销量',
  `satisfaction` varchar(11) DEFAULT '0' COMMENT '满意度',
  `recommend` varchar(11) DEFAULT '0' COMMENT '推荐',
  `introduce` varchar(5000) DEFAULT '' COMMENT '景点简介',
  `grade` varchar(40) DEFAULT '' COMMENT '景点等级',
  `ticketWay` varchar(100) DEFAULT '' COMMENT '取票方式',
  `payWay` varchar(100) DEFAULT '' COMMENT '付款方式',
  `originalPrice` varchar(16) DEFAULT '0' COMMENT '原价',
  `salePrice` varchar(16) DEFAULT '0' COMMENT '优惠价',
  `childPrice` varchar(16) DEFAULT '0' COMMENT '儿童价',
  `childSale` varchar(16) DEFAULT '0' COMMENT '儿童优惠价',
  `orderNotice` varchar(1000) DEFAULT '' COMMENT '预订须知',
  `telephone` varchar(40) DEFAULT '' COMMENT '景点电话',
  `scenicImage` varchar(255) DEFAULT '' COMMENT '景点图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of scenic
-- ----------------------------
INSERT INTO `scenic` VALUES ('1542974840195', '三亚亚龙湾', '海南', '三亚', '海南三亚市海宾', '1579', '98', '推荐', '三亚的特点是轻抚的海风、一望无际的大海和成片的椰林。人字拖和太阳镜是三亚的城市象征，无论是躺在亚龙湾的沙滩上享受日光浴还是潜入神秘的水下世界寻找静谧的美好，都会为你留下一抹难忘的回忆。逃离拥堵的繁华城市，踏上椰风林立的三亚，才能真正感觉轻风微佛下夕阳落尽的无限涌动的美好！', '五星级 AAAAA', '景点处', '支付宝', '520', '419', '380', '300', '1、所有优惠票均以实际优惠为准。\n\n2、3岁以下、70岁以上老人不含意外险\n\n3、为了使行程更加丰富，游客可参观东方佛都景区或根据自身兴趣自愿游览东方佛都景区、乌木博物馆或参加观看巴蜀绝技川剧变脸晚会，吐火、滚灯、手影戏、峨眉武术等巴蜀绝活，感受丰富多彩的四川文化。\n\n4、为了更好地让客人深入了解当地的佛教文化，乐山景区和峨眉山景区分别更换景区导游，全陪导游不陪同进景区\n\n5、住宿酒店无电梯，空调双人标间特色酒店，房间基本设施：彩色电视、挂机空调、梳妆台等，淋浴房、马桶等绝对干净卫生。\n\n6、散客团（非独立成团）在行程中若有变动，导游会征求客人意见，客人签字更改，若您不同意更改行程请拒绝签字，我们将按照原定行程完成\n\n7、最少成团人数16人（特殊情况除外）\n\n8、雷洞坪至金顶可自行登山或乘坐索道，为了保障游览时间及观光顺畅，建议客人乘坐索道，全山索道185元（未收取）。因考虑游客宗教信仰不同，万年寺10元小门票旅行社未收取。客人根据个人需求自行购买或导游代购。\n\n9、安全说明：旅行社的导游人员和其他工作人员无法为游客提供一对一的服务，旅行社工作人员在接待游客报名时已经充分告知本行程中的注意事项和对游客身体健康的要求，旅游活动中游客必须注意自身安全和随行未成年人的安全，保管好个人财务，贵重物品随身携带。景区所在地区为著名佛教文化圣地，在旅游中请尊重宗教习俗；为了您的安全，请入夜后避免单独出行，个别思想开放者请不要在景区有所作为以免造成不必要的重大损失！自由活动期间，请注意保护自身人生安全及财物安全，过马路请小心；沿途停车加水或上厕所等任何一个停留地点，请你上下车及索道时注意脚下、头顶及周边安全，不要在汽车道公路边崖边活动停留，沿途上厕所大部份都有当地人收费，请主动付费，不要与当地人发生无谓的争吵；峨眉山猴子成群结队，逗猴是峨眉山游程一大特色，但峨眉青弥猴是野生猴类，并非人工饲养。特提醒游客在进入猴区前仔细阅读逗猴须知，进入后遵守猴区规定。游客与旅行社签订旅游合同生效日起，旅行社已为游客购买旅游意外保险。但此保险并未包括峨眉山猴区险，在进入猴区前管委会设有猴区意外险销售处（5元／位）客人可根据个人需求自行购买。（猴群因季节或天气因素会躲进山里，导致无法戏猴非旅行社责任）。    ', '14478546245', '%2F20181125%2F7e77e4d1209444498ee969a9ca5f8df8.jpg');
INSERT INTO `scenic` VALUES ('1545649224537', '九寨沟犀牛海', '四川', '九寨沟', '四川九寨沟', '456', '99', '推荐', '犀牛海是九寨沟中景色变化最多的海子之一，犀牛海是九寨沟的第二大海，其倒影几乎是众海之冠。每天清晨去雾飘渺时的云雾倒影，亦幻亦真，让人分不清哪里是天，哪里是海。湖岸四周的彩叶也是亮丽多姿，艳冠群芳。犀牛海水域开阔，北岸的尽头是生意盎然的芦苇丛，南岸的出口既有树林，又有银瀑，中间一大片是蓝得醉人的湖面。犀牛海的这一片山光水色，能让游客流连忘返。', '五星级 AAAAA', '景点处', '支付宝', '219', '189', '150', '129', '1、最好参加旅行社组织的团队，才有住房和安全的保证。 \n　　2、九寨沟属高海拔地区，不宜剧烈运动，宜少饮酒，多吃蔬菜、水果，以防发生高原反应。年老体弱者，应备好常用药品，最好能配备小型氧气瓶(此物可以成都购买)。 \n　　3、年老体弱者，有高血压，冠心病，心脏病者不宜前往。 \n　　4、景区严禁烟火。 \n　　5、景区日照强，紫外线强。长时间在户外活动，请戴上太阳帽，涂抹防霜，以保护皮肤。 \n　　6、景区昼夜温差大，请带足保暖防寒衣物，并备常用药品红景天。 \n　　7、景区内不能吸烟。旅游者应自觉保护好景区环境，不要随地扔果皮纸屑等破坏环境的杂物。 \n　　8、景区内有藏族、羌族人在卖各种纪念品，可以讨价还价，但一旦讨价成功就应该购买物品。', '0837-7739753', '%2F20181224%2Ff1bd14f4f05841209c093af6461f254c.jpg');
INSERT INTO `scenic` VALUES ('1546070906383', '1', '1', '1', '1', '1', '1', '推荐', '1', '五星级 AAAAA', '1', '1', '1', '1', '1', '1', '1', '1', '%2F20181229%2Fb4ecaf317afa4443b0184524725a37a3.jpg');

-- ----------------------------
-- Table structure for scenic_file
-- ----------------------------
DROP TABLE IF EXISTS `scenic_file`;
CREATE TABLE `scenic_file` (
  `id` varchar(13) NOT NULL,
  `scenicId` varchar(13) DEFAULT NULL,
  `fileId` varchar(13) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of scenic_file
-- ----------------------------
INSERT INTO `scenic_file` VALUES ('1542974840271', '1542974840195', '1542974819902');
INSERT INTO `scenic_file` VALUES ('1542974840344', '1542974840195', '1542974820821');
INSERT INTO `scenic_file` VALUES ('1545649224584', '1545649224537', '1545649204813');
INSERT INTO `scenic_file` VALUES ('1545649224621', '1545649224537', '1545649204940');
INSERT INTO `scenic_file` VALUES ('1546070906416', '1546070906383', '1546070885443');
INSERT INTO `scenic_file` VALUES ('1546070906492', '1546070906383', '1546070885444');

-- ----------------------------
-- Table structure for second_menu
-- ----------------------------
DROP TABLE IF EXISTS `second_menu`;
CREATE TABLE `second_menu` (
  `id` varchar(13) NOT NULL,
  `fmid` varchar(13) NOT NULL,
  `name` varchar(40) NOT NULL,
  `url` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of second_menu
-- ----------------------------
INSERT INTO `second_menu` VALUES ('1540427493111', '1540427231111', '所有订单', '../../orderall/page/index.html');
INSERT INTO `second_menu` VALUES ('1540427508122', '1540427242122', '密码修改', '../../modifypwd/page/index.html');
INSERT INTO `second_menu` VALUES ('1540427508133', '1540427231111', '线路订单', '../../lineorder/page/index.html');
INSERT INTO `second_menu` VALUES ('1540427508144', '1540427231111', '酒店订单', '../../hotelorder/page/index.html');
INSERT INTO `second_menu` VALUES ('1540427508155', '1540427231111', '景点订单', '../../scenicorder/page/index.html');
INSERT INTO `second_menu` VALUES ('1540427508166', '1540427242122', '个人信息', '../../userinfo/page/index.html');
INSERT INTO `second_menu` VALUES ('1540427508177', '1540427242133', '景点添加', '../../scenicadd/page/index.html');
INSERT INTO `second_menu` VALUES ('1540427508188', '1540427242133', '景点查看', '../../scenicquery/page/index.html');
INSERT INTO `second_menu` VALUES ('1540427508199', '1540427242144', '线路添加', '../../lineadd/page/index.html');
INSERT INTO `second_menu` VALUES ('1540427508200', '1540427242144', '线路查看', '../../linequery/page/index.html');
INSERT INTO `second_menu` VALUES ('1540427508211', '1540427242155', '酒店查看', '../../hotelquery/page/index.html');
INSERT INTO `second_menu` VALUES ('1540427508212', '1540427242155', '酒店添加', '../../hoteladd/page/index.html');
INSERT INTO `second_menu` VALUES ('1540427508213', '1540427242166', '菜单管理', '../../menumana/page/index.html');
INSERT INTO `second_menu` VALUES ('1540427508214', '1540427242166', '角色菜单管理', '../../rolemenumana/page/index.html');
INSERT INTO `second_menu` VALUES ('1540427508215', '1540427242166', '角色管理', '../../rolemana/page/index.html');
INSERT INTO `second_menu` VALUES ('1540427508216', '1540427242166', '用户管理', '../../usermana/page/index.html');
INSERT INTO `second_menu` VALUES ('1546824166474', '1546824143124', '地方', '1.html');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` varchar(13) NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL,
  `roleId` varchar(13) DEFAULT NULL,
  `realName` varchar(50) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `telephone` varchar(30) DEFAULT NULL,
  `birthday` varchar(20) DEFAULT NULL,
  `idCard` varchar(30) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `lastModifyTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1540424767', 'a', '123456', '1', '黄立云', '男', '广西', '18844536271', '1992-03-21', '450921199803212426', '1439329460@qq.com', '2018-10-25 07:46:08', '2018-10-25 07:46:08');
INSERT INTO `user` VALUES ('1542977847139', '小青', '123456', '1544779017059', '许华青', '女', '广大广州', '18847512467', '1994-03-18', '450846199403182428', '1764852462@qq.com', '2018-11-23 20:57:27', '2018-11-23 20:57:27');
INSERT INTO `user` VALUES ('1544878053931', '小华', '123456', '1', '杨白许', '男', '广西玉林', '18847512467', '1992-04-18', '457921199204182575', '1754685126@qq.com', '2018-11-23 20:51:06', '2018-11-23 20:51:06');
INSERT INTO `user` VALUES ('1544878418151', '111', '666', '1544779186726', '黎金萍', '女', '容县', '13322214', '1993-3-16', '111111111111', '14@qq.com', '2018-10-24 08:41:05', '2018-10-24 08:41:05');
