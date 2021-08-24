/*
 Navicat Premium Data Transfer

 Source Server         : locahost
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : localhost:3306
 Source Schema         : onlinesystem

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 22/08/2021 11:09:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for aqofpython
-- ----------------------------
DROP TABLE IF EXISTS `aqofpython`;
CREATE TABLE `aqofpython`  (
  `aq_id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `aq_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `aq_rt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`aq_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of aqofpython
-- ----------------------------
INSERT INTO `aqofpython` VALUES (1, '表达式 len([i for i in range(10)]) 的值为 __________。', '10');
INSERT INTO `aqofpython` VALUES (2, '已知 x = (3) ， 那么表达式 x * 3 的值为 __________。', '9');
INSERT INTO `aqofpython` VALUES (3, '已知 x = (3,) ，那么表达式 x * 3 的值为 _____________。', '(3, 3, 3)');
INSERT INTO `aqofpython` VALUES (4, '假设列表对象 x = [1, 1, 1] ，那么表达式 id(x[0]) == id(x[2]) 的值为 _____________ 。', 'True');
INSERT INTO `aqofpython` VALUES (5, '已知列表 x = list(range(10)) ，那么执行语句 del x[::2] 之后， x 的值为 _________。', '[1, 3, 5, 7, 9]');
INSERT INTO `aqofpython` VALUES (6, '已知列表 x = [1, 2, 3, 4] ，那么执行语句 del x[1] 之后 x 的值为 ____________。', '[1,3, 4]');
INSERT INTO `aqofpython` VALUES (7, '表达式 [1] * 2 的值为 _________________。', '[1, 1]');
INSERT INTO `aqofpython` VALUES (8, ' 表达式 [1, 2] * 2 的值为 ______________。', '[1, 2, 1, 2]');
INSERT INTO `aqofpython` VALUES (9, '已知列表 x = [1, 2, 3] ，那么执行语句 x.insert(1, 4) 只有， x 的值为 ___________。', '[1, 4, 2, 3]');
INSERT INTO `aqofpython` VALUES (10, '已知列表 x = [1, 2, 3] ，那么执行语句 x.insert(0, 4) 只有， x 的值为 ___________。', '[4, 1, 2, 3]');

-- ----------------------------
-- Table structure for cqofpython
-- ----------------------------
DROP TABLE IF EXISTS `cqofpython`;
CREATE TABLE `cqofpython`  (
  `cq_id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cq_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cq_a` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cq_b` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cq_c` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cq_d` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cq_true` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`cq_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cqofpython
-- ----------------------------
INSERT INTO `cqofpython` VALUES (1, 'Which is used as a magnifying glass?', 'Plane mirror', 'Concave mirror', 'Converging lens', 'Diverging lens', 'c');
INSERT INTO `cqofpython` VALUES (2, 'In a water lifting electric pump, we convert ____', 'Kinetic energy into Electrical energy', 'Kinetic energy into Potential energy', 'Electrical energy into Kinetic energy', 'Electrical energy into Potential energy', 'c');
INSERT INTO `cqofpython` VALUES (3, 'Intensity of sound has ____', 'an object existence', 'a subject existence', 'no existence', 'both subjective and objective existence', 'a');
INSERT INTO `cqofpython` VALUES (4, 'Mica is used in electrical appliances such as electric iron because mica is _____', 'a good conductor of heat but a bad conductor of electricity', 'a bad conductor of heat but a good conductor of electricity', 'a good conductor of heat as well as electricity', 'a bad conductor of heat as well as electricity', 'a');
INSERT INTO `cqofpython` VALUES (5, 'One should not connect a number of electrical appliances to the same power socket because _____', 'this can damage the appliances due to overloading', 'this can damage the domestic wiring due to overloading', 'this can damage the electrical meter', 'the appliance will not get full voltage', 'b');
INSERT INTO `cqofpython` VALUES (6, 'Identify the vector quantity from the following _____', 'Heat', 'Angular momentum', 'Time', 'Work', 'b');
INSERT INTO `cqofpython` VALUES (7, 'Nuclear sizes are expressed in a unit named ______', 'Fermi', 'angstrom', 'newton', 'tesla', 'a');
INSERT INTO `cqofpython` VALUES (8, 'The absorption of ink by blotting paper involves _____', 'viscosity of ink', 'capillary action phenomenon', 'diffusion of ink through the blotting', 'siphon action', 'b');
INSERT INTO `cqofpython` VALUES (9, 'Which one of the following scales of temperature does not have a negative value?', 'Celsius', 'Kelvin', 'Fahrenheit', 'Reaumar', 'c');
INSERT INTO `cqofpython` VALUES (10, 'Which is used as a magnifying glass?', 'Plane mirror', 'Concave mirror', 'Converging lens', 'Diverging lens', 'c');

-- ----------------------------
-- Table structure for examclass
-- ----------------------------
DROP TABLE IF EXISTS `examclass`;
CREATE TABLE `examclass`  (
  `on_id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `exam_id` int(0) UNSIGNED NOT NULL,
  `class_id` int(0) UNSIGNED NOT NULL,
  PRIMARY KEY (`on_id`) USING BTREE,
  INDEX `exam`(`exam_id`) USING BTREE,
  INDEX `class`(`class_id`) USING BTREE,
  CONSTRAINT `class` FOREIGN KEY (`class_id`) REFERENCES `unitinfo` (`class_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `exam` FOREIGN KEY (`exam_id`) REFERENCES `examinfo` (`exam_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1000004 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of examclass
-- ----------------------------
INSERT INTO `examclass` VALUES (1000001, 100001, 3001);
INSERT INTO `examclass` VALUES (1000002, 100001, 2001);
INSERT INTO `examclass` VALUES (1000003, 100001, 3002);
INSERT INTO `examclass` VALUES (1000004, 100002, 2002);

-- ----------------------------
-- Table structure for examinfo
-- ----------------------------
DROP TABLE IF EXISTS `examinfo`;
CREATE TABLE `examinfo`  (
  `exam_id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `exam_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_user` int(0) UNSIGNED NOT NULL,
  `start_time` datetime(0) NOT NULL,
  `end_time` datetime(0) NOT NULL,
  `user_time` int(0) UNSIGNED NOT NULL,
  `t_score` int(0) UNSIGNED NOT NULL,
  `num_q` int(0) UNSIGNED NOT NULL,
  `start_id` int(0) UNSIGNED NOT NULL,
  PRIMARY KEY (`exam_id`) USING BTREE,
  INDEX `create_user`(`create_user`) USING BTREE,
  INDEX `start_id`(`start_id`) USING BTREE,
  INDEX `num_q`(`num_q`) USING BTREE,
  INDEX `exam_name`(`exam_name`) USING BTREE,
  CONSTRAINT `create_user` FOREIGN KEY (`create_user`) REFERENCES `userinfo` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `start_id` FOREIGN KEY (`start_id`) REFERENCES `examofq` (`order_number`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 100003 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of examinfo
-- ----------------------------
INSERT INTO `examinfo` VALUES (100001, 'test01', 5210001, '2021-08-17 10:43:28', '2021-08-18 10:43:36', 120, 100, 50, 1);
INSERT INTO `examinfo` VALUES (100002, 'test02', 5210001, '2021-08-18 20:49:00', '2022-01-28 20:49:07', 120, 100, 50, 40);

-- ----------------------------
-- Table structure for examofa
-- ----------------------------
DROP TABLE IF EXISTS `examofa`;
CREATE TABLE `examofa`  (
  `order_number` int(0) UNSIGNED NOT NULL,
  `q_type` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `true_a` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bank_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bankid_of_q` int(0) UNSIGNED NOT NULL,
  `score` int(0) UNSIGNED NOT NULL,
  `user_a` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_score` int(0) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`order_number`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of examofa
-- ----------------------------
INSERT INTO `examofa` VALUES (1, 'c', 'c', 'cqofpython', 1, 2, 'c', 2);
INSERT INTO `examofa` VALUES (2, 'c', 'c', 'cqofpython', 2, 2, 'c', 2);
INSERT INTO `examofa` VALUES (3, 'c', 'a', 'cqofpython', 3, 2, 'a', 2);
INSERT INTO `examofa` VALUES (4, 'c', 'a', 'cqofpython', 4, 2, 'a', 2);
INSERT INTO `examofa` VALUES (5, 'c', 'b', 'cqofpython', 5, 2, 'b', 2);
INSERT INTO `examofa` VALUES (6, 'c', 'b', 'cqofpython', 6, 2, 'b', 2);
INSERT INTO `examofa` VALUES (7, 'c', 'a', 'cqofpython', 7, 2, 'a', 2);
INSERT INTO `examofa` VALUES (8, 'c', 'b', 'cqofpython', 8, 2, 'b', 2);
INSERT INTO `examofa` VALUES (9, 'c', 'c', 'cqofpython', 9, 2, 'c', 2);
INSERT INTO `examofa` VALUES (10, 'c', 'c', 'cqofpython', 10, 2, 'c', 2);
INSERT INTO `examofa` VALUES (11, 'i', 'T', 'iqofpython', 1, 2, 'T', 2);
INSERT INTO `examofa` VALUES (12, 'i', 'F', 'iqofpython', 2, 2, 'F', 2);
INSERT INTO `examofa` VALUES (13, 'i', 'T', 'iqofpython', 3, 2, NULL, 0);
INSERT INTO `examofa` VALUES (14, 'i', 'T', 'iqofpython', 4, 2, NULL, 0);
INSERT INTO `examofa` VALUES (15, 'i', 'T', 'iqofpython', 5, 2, NULL, 0);
INSERT INTO `examofa` VALUES (16, 'i', 'T', 'iqofpython', 6, 2, NULL, 0);
INSERT INTO `examofa` VALUES (17, 'i', 'T', 'iqofpython', 7, 2, NULL, 0);
INSERT INTO `examofa` VALUES (18, 'i', 'T', 'iqofpython', 8, 2, NULL, 0);
INSERT INTO `examofa` VALUES (19, 'i', 'T', 'iqofpython', 9, 2, NULL, 0);
INSERT INTO `examofa` VALUES (20, 'i', 'T', 'iqofpython', 10, 2, NULL, 0);
INSERT INTO `examofa` VALUES (21, 'i', 'F', 'iqofpython', 11, 2, NULL, 0);
INSERT INTO `examofa` VALUES (22, 'i', 'T', 'iqofpython', 12, 2, NULL, 0);
INSERT INTO `examofa` VALUES (23, 'i', 'F', 'iqofpython', 13, 2, NULL, 0);
INSERT INTO `examofa` VALUES (24, 'i', 'T', 'iqofpython', 14, 2, NULL, 0);
INSERT INTO `examofa` VALUES (25, 'i', 'F', 'iqofpython', 15, 2, NULL, 0);
INSERT INTO `examofa` VALUES (26, 'i', 'T', 'iqofpython', 16, 2, NULL, 0);
INSERT INTO `examofa` VALUES (27, 'i', 'T', 'iqofpython', 17, 2, NULL, 0);
INSERT INTO `examofa` VALUES (28, 'i', 'T', 'iqofpython', 18, 2, NULL, 0);
INSERT INTO `examofa` VALUES (29, 'i', 'T', 'iqofpython', 19, 2, NULL, 0);
INSERT INTO `examofa` VALUES (30, 'i', 'T', 'iqofpython', 20, 2, NULL, 0);
INSERT INTO `examofa` VALUES (31, 'i', 'F', 'iqofpython', 21, 2, NULL, 0);
INSERT INTO `examofa` VALUES (32, 'i', 'F', 'iqofpython', 22, 2, NULL, 0);
INSERT INTO `examofa` VALUES (33, 'i', 'F', 'iqofpython', 23, 2, NULL, 0);
INSERT INTO `examofa` VALUES (34, 'i', 'F', 'iqofpython', 24, 2, NULL, 0);
INSERT INTO `examofa` VALUES (35, 'i', 'T', 'iqofpython', 25, 2, NULL, 0);
INSERT INTO `examofa` VALUES (36, 'i', 'T', 'iqofpython', 26, 2, NULL, 0);
INSERT INTO `examofa` VALUES (37, 'i', 'T', 'iqofpython', 27, 2, NULL, 0);
INSERT INTO `examofa` VALUES (38, 'i', 'T', 'iqofpython', 28, 2, NULL, 0);
INSERT INTO `examofa` VALUES (39, 'i', 'F', 'iqofpython', 29, 2, NULL, 0);
INSERT INTO `examofa` VALUES (40, 'i', 'F', 'iqofpython', 30, 2, NULL, 0);
INSERT INTO `examofa` VALUES (41, 'i', 'T', 'iqofpython', 31, 2, NULL, 0);
INSERT INTO `examofa` VALUES (42, 'i', 'T', 'iqofpython', 32, 2, NULL, 0);
INSERT INTO `examofa` VALUES (43, 'i', 'T', 'iqofpython', 33, 2, NULL, 0);
INSERT INTO `examofa` VALUES (44, 'i', 'T', 'iqofpython', 34, 2, NULL, 0);
INSERT INTO `examofa` VALUES (45, 'i', 'T', 'iqofpython', 35, 2, NULL, 0);
INSERT INTO `examofa` VALUES (46, 'i', 'T', 'iqofpython', 36, 2, NULL, 0);
INSERT INTO `examofa` VALUES (47, 'i', 'T', 'iqofpython', 37, 2, NULL, 0);
INSERT INTO `examofa` VALUES (48, 'i', 'T', 'iqofpython', 38, 2, NULL, 0);
INSERT INTO `examofa` VALUES (49, 'i', 'T', 'iqofpython', 39, 2, NULL, 0);
INSERT INTO `examofa` VALUES (50, 'i', 'T', 'iqofpython', 40, 2, NULL, 0);

-- ----------------------------
-- Table structure for examofq
-- ----------------------------
DROP TABLE IF EXISTS `examofq`;
CREATE TABLE `examofq`  (
  `order_number` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `q_type` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `true_a` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bank_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bankid_of_q` int(0) UNSIGNED NOT NULL,
  `score` int(0) UNSIGNED NOT NULL DEFAULT 2,
  PRIMARY KEY (`order_number`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 91 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of examofq
-- ----------------------------
INSERT INTO `examofq` VALUES (1, 'c', 'c', 'cqofpython', 1, 2);
INSERT INTO `examofq` VALUES (2, 'c', 'c', 'cqofpython', 2, 2);
INSERT INTO `examofq` VALUES (3, 'c', 'a', 'cqofpython', 3, 2);
INSERT INTO `examofq` VALUES (4, 'c', 'a', 'cqofpython', 4, 2);
INSERT INTO `examofq` VALUES (5, 'c', 'b', 'cqofpython', 5, 2);
INSERT INTO `examofq` VALUES (6, 'c', 'b', 'cqofpython', 6, 2);
INSERT INTO `examofq` VALUES (7, 'c', 'a', 'cqofpython', 7, 2);
INSERT INTO `examofq` VALUES (8, 'c', 'b', 'cqofpython', 8, 2);
INSERT INTO `examofq` VALUES (9, 'c', 'c', 'cqofpython', 9, 2);
INSERT INTO `examofq` VALUES (10, 'c', 'c', 'cqofpython', 10, 2);
INSERT INTO `examofq` VALUES (11, 'i', 'T', 'iqofpython', 1, 2);
INSERT INTO `examofq` VALUES (12, 'i', 'F', 'iqofpython', 2, 2);
INSERT INTO `examofq` VALUES (13, 'i', 'T', 'iqofpython', 3, 2);
INSERT INTO `examofq` VALUES (14, 'i', 'T', 'iqofpython', 4, 2);
INSERT INTO `examofq` VALUES (15, 'i', 'T', 'iqofpython', 5, 2);
INSERT INTO `examofq` VALUES (16, 'i', 'T', 'iqofpython', 6, 2);
INSERT INTO `examofq` VALUES (17, 'i', 'T', 'iqofpython', 7, 2);
INSERT INTO `examofq` VALUES (18, 'i', 'T', 'iqofpython', 8, 2);
INSERT INTO `examofq` VALUES (19, 'i', 'T', 'iqofpython', 9, 2);
INSERT INTO `examofq` VALUES (20, 'i', 'T', 'iqofpython', 10, 2);
INSERT INTO `examofq` VALUES (21, 'i', 'F', 'iqofpython', 11, 2);
INSERT INTO `examofq` VALUES (22, 'i', 'T', 'iqofpython', 12, 2);
INSERT INTO `examofq` VALUES (23, 'i', 'F', 'iqofpython', 13, 2);
INSERT INTO `examofq` VALUES (24, 'i', 'T', 'iqofpython', 14, 2);
INSERT INTO `examofq` VALUES (25, 'i', 'F', 'iqofpython', 15, 2);
INSERT INTO `examofq` VALUES (26, 'i', 'T', 'iqofpython', 16, 2);
INSERT INTO `examofq` VALUES (27, 'i', 'T', 'iqofpython', 17, 2);
INSERT INTO `examofq` VALUES (28, 'i', 'T', 'iqofpython', 18, 2);
INSERT INTO `examofq` VALUES (29, 'i', 'T', 'iqofpython', 19, 2);
INSERT INTO `examofq` VALUES (30, 'i', 'T', 'iqofpython', 20, 2);
INSERT INTO `examofq` VALUES (31, 'i', 'F', 'iqofpython', 21, 2);
INSERT INTO `examofq` VALUES (32, 'i', 'F', 'iqofpython', 22, 2);
INSERT INTO `examofq` VALUES (33, 'i', 'F', 'iqofpython', 23, 2);
INSERT INTO `examofq` VALUES (34, 'i', 'F', 'iqofpython', 24, 2);
INSERT INTO `examofq` VALUES (35, 'i', 'T', 'iqofpython', 25, 2);
INSERT INTO `examofq` VALUES (36, 'i', 'T', 'iqofpython', 26, 2);
INSERT INTO `examofq` VALUES (37, 'i', 'T', 'iqofpython', 27, 2);
INSERT INTO `examofq` VALUES (38, 'i', 'T', 'iqofpython', 28, 2);
INSERT INTO `examofq` VALUES (39, 'i', 'F', 'iqofpython', 29, 2);
INSERT INTO `examofq` VALUES (40, 'i', 'F', 'iqofpython', 30, 2);
INSERT INTO `examofq` VALUES (41, 'i', 'T', 'iqofpython', 31, 2);
INSERT INTO `examofq` VALUES (42, 'i', 'T', 'iqofpython', 32, 2);
INSERT INTO `examofq` VALUES (43, 'i', 'T', 'iqofpython', 33, 2);
INSERT INTO `examofq` VALUES (44, 'i', 'T', 'iqofpython', 34, 2);
INSERT INTO `examofq` VALUES (45, 'i', 'T', 'iqofpython', 35, 2);
INSERT INTO `examofq` VALUES (46, 'i', 'T', 'iqofpython', 36, 2);
INSERT INTO `examofq` VALUES (47, 'i', 'T', 'iqofpython', 37, 2);
INSERT INTO `examofq` VALUES (48, 'i', 'T', 'iqofpython', 38, 2);
INSERT INTO `examofq` VALUES (49, 'i', 'T', 'iqofpython', 39, 2);
INSERT INTO `examofq` VALUES (50, 'i', 'T', 'iqofpython', 40, 2);
INSERT INTO `examofq` VALUES (51, 'i', 'T', 'iqofpython', 41, 2);
INSERT INTO `examofq` VALUES (52, 'i', 'T', 'iqofpython', 42, 2);
INSERT INTO `examofq` VALUES (53, 'i', 'T', 'iqofpython', 43, 2);
INSERT INTO `examofq` VALUES (54, 'i', 'T', 'iqofpython', 44, 2);
INSERT INTO `examofq` VALUES (55, 'i', 'T', 'iqofpython', 45, 2);
INSERT INTO `examofq` VALUES (56, 'i', 'T', 'iqofpython', 46, 2);
INSERT INTO `examofq` VALUES (57, 'i', 'T', 'iqofpython', 47, 2);
INSERT INTO `examofq` VALUES (58, 'i', 'T', 'iqofpython', 48, 2);
INSERT INTO `examofq` VALUES (59, 'i', 'F', 'iqofpython', 49, 2);
INSERT INTO `examofq` VALUES (60, 'i', 'T', 'iqofpython', 50, 2);
INSERT INTO `examofq` VALUES (61, 'i', 'T', 'iqofpython', 51, 2);
INSERT INTO `examofq` VALUES (62, 'i', 'F', 'iqofpython', 52, 2);
INSERT INTO `examofq` VALUES (63, 'i', 'T', 'iqofpython', 53, 2);
INSERT INTO `examofq` VALUES (64, 'i', 'F', 'iqofpython', 54, 2);
INSERT INTO `examofq` VALUES (65, 'i', 'T', 'iqofpython', 55, 2);
INSERT INTO `examofq` VALUES (66, 'i', 'T', 'iqofpython', 56, 2);
INSERT INTO `examofq` VALUES (67, 'i', 'T', 'iqofpython', 57, 2);
INSERT INTO `examofq` VALUES (68, 'i', 'F', 'iqofpython', 58, 2);
INSERT INTO `examofq` VALUES (69, 'i', 'T', 'iqofpython', 59, 2);
INSERT INTO `examofq` VALUES (70, 'i', 'T', 'iqofpython', 60, 2);
INSERT INTO `examofq` VALUES (71, 'i', 'T', 'iqofpython', 61, 2);
INSERT INTO `examofq` VALUES (72, 'i', 'T', 'iqofpython', 62, 2);
INSERT INTO `examofq` VALUES (73, 'i', 'F', 'iqofpython', 63, 2);
INSERT INTO `examofq` VALUES (74, 'i', 'T', 'iqofpython', 64, 2);
INSERT INTO `examofq` VALUES (75, 'i', 'F', 'iqofpython', 65, 2);
INSERT INTO `examofq` VALUES (76, 'i', 'T', 'iqofpython', 66, 2);
INSERT INTO `examofq` VALUES (77, 'i', 'F', 'iqofpython', 67, 2);
INSERT INTO `examofq` VALUES (78, 'i', 'F', 'iqofpython', 68, 2);
INSERT INTO `examofq` VALUES (79, 'i', 'T', 'iqofpython', 69, 2);
INSERT INTO `examofq` VALUES (80, 'i', 'T', 'iqofpython', 70, 2);
INSERT INTO `examofq` VALUES (81, 'f', '[1, 2, 3, 1, 2, 3, 1, 2, 3]', 'fqofpython', 1, 2);
INSERT INTO `examofq` VALUES (82, 'f', '[ ‘1’, ‘2’, ‘3’]', 'fqofpython', 2, 2);
INSERT INTO `examofq` VALUES (83, 'f', 'False', 'fqofpython', 3, 2);
INSERT INTO `examofq` VALUES (84, 'f', '18', 'fqofpython', 4, 2);
INSERT INTO `examofq` VALUES (85, 'f', 'False', 'fqofpython', 5, 2);
INSERT INTO `examofq` VALUES (86, 'f', 'None', 'fqofpython', 6, 2);
INSERT INTO `examofq` VALUES (87, 'f', '[6, 7, 9, 11]', 'fqofpython', 7, 2);
INSERT INTO `examofq` VALUES (88, 'f', '[5for i in range(10)]', 'fqofpython', 8, 2);
INSERT INTO `examofq` VALUES (89, 'f', 'c = dict(zip(a, b))', '', 9, 2);
INSERT INTO `examofq` VALUES (90, 'f', '-1', '', 10, 2);

-- ----------------------------
-- Table structure for fqofpython
-- ----------------------------
DROP TABLE IF EXISTS `fqofpython`;
CREATE TABLE `fqofpython`  (
  `fq_id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `fq_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fq_true` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`fq_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fqofpython
-- ----------------------------
INSERT INTO `fqofpython` VALUES (1, '表达式 [1, 2, 3]*3 的执行结果为 ______________________ 。', '[1, 2, 3, 1, 2, 3, 1, 2, 3]');
INSERT INTO `fqofpython` VALUES (2, ' list(map(str, [1, 2, 3])) 的执行结果为 _____________________ 。', '[ ‘1’, ‘2’, ‘3’]');
INSERT INTO `fqofpython` VALUES (3, '已知 x = 3 ，并且 id(x) 的返回值为 496103280，那么执行语句 x += 6 之后，表达式 id(x) == 496103280 的值为 ___________。', 'False');
INSERT INTO `fqofpython` VALUES (4, '已知 x = 3，那么执行语句 x *= 6 之后， x 的值为 ________________。', '18');
INSERT INTO `fqofpython` VALUES (5, '表达式 [3] in [1, 2, 3, 4] 的值为 ________________ 。', 'False');
INSERT INTO `fqofpython` VALUES (6, '列表对象的 sort()方法用来对列表元素进行原地排序，该函数返回值为____________ 。', 'None');
INSERT INTO `fqofpython` VALUES (7, '假设列表对象 aList 的值为 [3, 4, 5, 6, 7, 9, 11, 13, 15, 17] ，那么切片 aList[3:7] 得到的值是______________________。', '[6, 7, 9, 11]');
INSERT INTO `fqofpython` VALUES (8, '使用列表推导式生成包含 10 个数字 5 的列表，语句可以写为 _______________。', '[5for i in range(10)]');
INSERT INTO `fqofpython` VALUES (9, '假设有列表 a = [\'name\', \'age\', \'sex\']和 b = [\'Dong\', 38, \'Male\'] ，请使用一个语句将这两个列表的内容转换为字典， 并且以列表 a 中的元素为 “键” ，以列表 b 中的元素为 “值”，这个语句可以写为 _____________________。', 'c = dict(zip(a, b))');
INSERT INTO `fqofpython` VALUES (10, '任意长度的 Python 列表、元组和字符串中最后一个元素的下标为 ________。', '-1');
INSERT INTO `fqofpython` VALUES (11, 'Python 语句 list(range(1,10,3)) 执行结果为 ___________________ 。', '[1, 4, 7]');
INSERT INTO `fqofpython` VALUES (12, '表达式 list(range(5)) 的值为 ________________。', '[0, 1, 2, 3, 4]');
INSERT INTO `fqofpython` VALUES (13, '已知 a = [1, 2, 3] 和 b = [1, 2, 4] ，那么 id(a[1])==id(b[1]) 的执行结果为 ___________。', 'True');
INSERT INTO `fqofpython` VALUES (14, '切片操作 list(range(6))[::2] 执行结果为 ________________。', '[0, 2, 4]');
INSERT INTO `fqofpython` VALUES (15, '使用切片操作在列表对象 x 的开始处增加一个元素 3 的代码为 _________。', 'x[0:0]= [3]');
INSERT INTO `fqofpython` VALUES (16, '语句 sorted([1, 2, 3], reverse=True) == reversed([1, 2, 3])执行结果为 _________。', 'False');
INSERT INTO `fqofpython` VALUES (17, '表达式 sorted([111, 2, 33], key=lambda x: len(str(x))) 的值为 ________________。', '[2,33, 111]');
INSERT INTO `fqofpython` VALUES (18, '表达式 sorted([111, 2, 33], key=lambda x: -len(str(x))) 的值为 ____________。', '[111,33, 2]');
INSERT INTO `fqofpython` VALUES (19, '语句 x = (3,) 执行后 x 的值为 _______________。', '(3,)');
INSERT INTO `fqofpython` VALUES (20, '语句 x = (3) 执行后 x 的值为 ________________ 。', '3');
INSERT INTO `fqofpython` VALUES (21, '已知 x=3 和 y=5，执行语句 x, y = y, x 后 x 的值是 ____。', '5');
INSERT INTO `fqofpython` VALUES (22, '可以使用内置函数 _______________查看包含当前作用域内所有全局变量和值的字典。', 'globals()');
INSERT INTO `fqofpython` VALUES (23, '可以使用内置函数 ___________________ 查看包含当前作用域内所有局部变量和值的字典。', 'locals()');
INSERT INTO `fqofpython` VALUES (24, '每个元素的“键”与“值”之间使用________分隔开。', '冒号');
INSERT INTO `fqofpython` VALUES (25, '字典对象的 ___________方法可以获取指定“键”对应的“值”，并且可以在指定“键”不存在的时候返回指定值，如果不指定则返回 None。', 'get()');
INSERT INTO `fqofpython` VALUES (26, '字典对象的 _____________方法返回字典中的“键 -值对”列表。', 'items()');
INSERT INTO `fqofpython` VALUES (27, '字典对象的 ____________方法返回字典的“键”列表。', 'keys()');
INSERT INTO `fqofpython` VALUES (28, '字典对象的 ______________方法返回字典的“值”列表。', 'values()');
INSERT INTO `fqofpython` VALUES (29, '已知 x = {1:2} ，那么执行语句 x[2] = 3 之后，x 的值为 ________________。', '{1: 2, 2: 3}');
INSERT INTO `fqofpython` VALUES (30, '表达式 {1, 2, 3, 4} - {3, 4, 5, 6} 的值为 __________________。', '{1, 2}');
INSERT INTO `fqofpython` VALUES (31, '表达式 set([1, 1, 2, 3])的值为 ____________________。', '{1, 2, 3}');
INSERT INTO `fqofpython` VALUES (32, '使用 列 表推 导 式 得 到 100 以 内 所有 能 被 13 整除 的 数 的 代 码 可 以 写 作___________________________________ 。', '[i for i in range(100) if i%13==0]');
INSERT INTO `fqofpython` VALUES (33, '已知 x = [3, 5, 7] ，那么表达式 x[10:] 的值为 ____________。', '[]');
INSERT INTO `fqofpython` VALUES (34, '已知 x = [3, 5, 7] ，那么执行语句 x[len(x):] = [1, 2] 之后，x 的值为 ______________。', '[3, 5, 7, 1, 2]');
INSERT INTO `fqofpython` VALUES (35, '已知 x = [3, 7, 5] ， 那 么 执 行 语 句 x.sort(reverse=True) 之 后 ， x 的 值 为_________________。', '[7, 5, 3]');
INSERT INTO `fqofpython` VALUES (36, '已知 x = [3, 7, 5] ，那么执行语句 x = x.sort(reverse=True) 之后，x 的值为 _________。', 'None');
INSERT INTO `fqofpython` VALUES (37, '已知 x = [1, 11, 111] ，那么执行语句 x.sort(key=lambda x: len(str(x)), reverse=True)之后， x 的值为 __________________。', '[111, 11, 1]');
INSERT INTO `fqofpython` VALUES (38, '表达式 list(zip([1,2], [3,4])) 的值为 ________________________ 。', '[(1, 3), (2, 4)]');
INSERT INTO `fqofpython` VALUES (39, '已知 x = [1, 2, 3, 2, 3] ，执行语句 x.pop() 之后，x 的值为 _____________。', '[1, 2, 3,2]');
INSERT INTO `fqofpython` VALUES (40, '表达式 list(map(list,zip(*[[1, 2, 3], [4, 5, 6]]))) 的值为 ________________。', '[[1, 4], [2,5], [3, 6]]');
INSERT INTO `fqofpython` VALUES (41, '表达式 [x for x in [1,2,3,4,5] if x<3] 的值为 _____________________ 。', '[1, 2]');
INSERT INTO `fqofpython` VALUES (42, '表达式 [index for index, value in enumerate([3,5,7,3,7]) if value == max([3,5,7,3,7])]的值为 __________________。', '[2, 4]');
INSERT INTO `fqofpython` VALUES (43, '已 知 x = [3,5,3,7] ， 那 么 表 达 式 [x.index(i) for i in x if i==3] 的 值 为______________。', '[0, 0]');
INSERT INTO `fqofpython` VALUES (44, '已知列表 x = [1, 2] ，那么表达式 list(enumerate(x)) 的值为 _______________。', '[(0,1), (1, 2)]');
INSERT INTO `fqofpython` VALUES (45, '已知 vec = [[1,2], [3,4]] ，则表达式 [col for row in vec for col in row] 的值为__________________________。', '[1, 2, 3, 4]');
INSERT INTO `fqofpython` VALUES (46, '已知 vec = [[1,2], [3,4]] ，则表达式 [[row[i] for row in vec] for i in range(len(vec[0]))]的值为 _________________________。', '[[1, 3], [2, 4]]');
INSERT INTO `fqofpython` VALUES (47, '已知 x = list(range(10)) ，则表达式 x[-4:] 的值为 __________。', '[6, 7, 8, 9]');
INSERT INTO `fqofpython` VALUES (48, ' 已知 x = [3, 5, 7] ，那么执行语句 x[1:] = [2] 之后，x 的值为 ________________。', '[3,2]');
INSERT INTO `fqofpython` VALUES (49, '已知 x = [3, 5, 7] ，那么执行语句 x[:3] = [2] 之后，x 的值为 ________________。', '[ 2]');
INSERT INTO `fqofpython` VALUES (50, '已知 x = [1, 2, 3, 2, 3] ，执行语句 x.remove(2) 之后，x 的值为 ____________。', '[1,3, 2, 3]');

-- ----------------------------
-- Table structure for iqofpython
-- ----------------------------
DROP TABLE IF EXISTS `iqofpython`;
CREATE TABLE `iqofpython`  (
  `iq_id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `iq_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `iq_true` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`iq_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 76 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of iqofpython
-- ----------------------------
INSERT INTO `iqofpython` VALUES (1, 'Python 支持多继承，如果父类中有相同的方法名，而在子类中调用时没有指定父类名，则 Python 解释器将从左向右按顺序进行搜索。', 'T');
INSERT INTO `iqofpython` VALUES (2, '在 Python 中定义类时实例方法的第一个参数名称必须是 self。', 'F');
INSERT INTO `iqofpython` VALUES (3, '在 Python 中定义类时实例方法的第一个参数名称不管是什么，都表示对象自身。', 'T');
INSERT INTO `iqofpython` VALUES (4, '定义类时如果实现了 __contains__() 方法，该类对象即可支持成员测试运算 in。', 'T');
INSERT INTO `iqofpython` VALUES (5, '定义类时如果实现了 __len__() 方法，该类对象即可支持内置函数 len()。', 'T');
INSERT INTO `iqofpython` VALUES (6, '定义类时实现了 __eq__()方法，该类对象即可支持运算符 ==。', 'T');
INSERT INTO `iqofpython` VALUES (7, ' 定义类时实现了 __pow__() 方法，该类对象即可支持运算符 ** 。', 'T');
INSERT INTO `iqofpython` VALUES (8, 'Python 类的构造函数是 __init__() 。', 'T');
INSERT INTO `iqofpython` VALUES (9, '定义类时，在一个方法前面使用 @classmethod 进行修饰，则该方法属于类方法。', 'T');
INSERT INTO `iqofpython` VALUES (10, '定义类时， 在一个方法前面使用 @staticmethod 进行休息， 则该方法属于静态方法。', 'T');
INSERT INTO `iqofpython` VALUES (11, '通过对象不能调用类方法和静态方法。', 'F');
INSERT INTO `iqofpython` VALUES (12, '在 Python 中可以为自定义类的对象动态增加新成员。', 'T');
INSERT INTO `iqofpython` VALUES (13, 'Python 类不支持多继承。', 'F');
INSERT INTO `iqofpython` VALUES (14, '属性可以像数据成员一样进行访问， 但赋值时具有方法的优点， 可以对新值进行检查。', 'T');
INSERT INTO `iqofpython` VALUES (15, '只可以动态为对象增加数据成员，而不能为对象动态增加成员方法。', 'F');
INSERT INTO `iqofpython` VALUES (16, '任何包含 __call__()方法的类的对象都是可调用的。', 'T');
INSERT INTO `iqofpython` VALUES (17, '在 Python 中函数和类都属于可调用对象。', 'T');
INSERT INTO `iqofpython` VALUES (18, '函数和对象方法是一样的，内部实现和外部调用都没有任何区别。', 'F');
INSERT INTO `iqofpython` VALUES (19, '在设计派生类时，基类的私有成员默认是不会继承的。', 'T');
INSERT INTO `iqofpython` VALUES (20, '如果在设计一个类时实现类 __len__()方法，那么该类的对象会自动支持 Python 内置函数 len()。', 'T');
INSERT INTO `iqofpython` VALUES (21, '扩展库 os 中的方法 remove()可以删除带有只读属性的文件。', 'F');
INSERT INTO `iqofpython` VALUES (22, '使用内置函数 open()且以 ”w”模式打开的文件，文件指针默认指向文件尾。', 'F');
INSERT INTO `iqofpython` VALUES (23, '使用内置函数 open()打开文件时， 只要文件路径正确就总是可以正确打开的。', 'F');
INSERT INTO `iqofpython` VALUES (24, '使用 print() 函数无法将信息写入文件。', 'F');
INSERT INTO `iqofpython` VALUES (25, '对文件进行读写操作之后必须显式关闭文件以确保所有内容都得到保存。', 'T');
INSERT INTO `iqofpython` VALUES (26, 'Python 标准库 os 中的方法 startfile() 可以启动任何已关联应用程序的文件，并自动调用关联的程序。', 'T');
INSERT INTO `iqofpython` VALUES (27, ' Python 标准库 os 中的方法 startfile() 可以用来打开外部程序或文件，系统会自动关联相应的程序来打开或执行指定的文件。', 'T');
INSERT INTO `iqofpython` VALUES (28, '假 设 os 模 块 已 导 入 ， 那 么 列 表 推 导 式 [filename for filename inos.listdir(\'C:\\\\Windows\') if filename.endswith(\'.exe\')] 的作用是列出 C:\\Windows 文件夹中所有扩展名为 .exe 的文件。', 'T');
INSERT INTO `iqofpython` VALUES (29, '二进制文件不能使用记事本程序打开。', 'F');
INSERT INTO `iqofpython` VALUES (30, '使用普通文本编辑器软件也可以正常查看二进制文件的内容。', 'F');
INSERT INTO `iqofpython` VALUES (31, '二进制文件也可以使用记事本或其他文本编辑器打开， 但是一般来说无法正常查看其中的内容。', 'T');
INSERT INTO `iqofpython` VALUES (32, 'Python 标准库 os 中的方法 isfile() 可以用来测试给定的路径是否为文件。', 'T');
INSERT INTO `iqofpython` VALUES (33, 'Python 标准库 os 中的方法 exists() 可以用来测试给定路径的文件是否存在。', 'T');
INSERT INTO `iqofpython` VALUES (34, 'Python 标准库 os 中的方法 isdir() 可以用来测试给定的路径是否为文件夹。', 'T');
INSERT INTO `iqofpython` VALUES (35, 'Python 标准库 os中的方法 listdir() 返回包含指定路径中所有文件和文件夹名称的列表。', 'T');
INSERT INTO `iqofpython` VALUES (36, 'Python 扩展库 xlwt 支持对 Excel 2003 或更低版本的 Excel 文件进行写操作。', 'T');
INSERT INTO `iqofpython` VALUES (37, ' Python 扩展库 xlrd 支持对 Excel 2003 或更低版本的 Excel 文件进行读操作。', 'T');
INSERT INTO `iqofpython` VALUES (38, '标准库 os 的 rename()方法可以实现文件移动操作。', 'T');
INSERT INTO `iqofpython` VALUES (39, '标准库 os 的 listdir() 方法默认只能列出指定文件夹中当前层级的文件和文件夹列表，而不能列出其子文件夹中的文件。', 'T');
INSERT INTO `iqofpython` VALUES (40, '文件对象的 tell() 方法用来返回文件指针的当前位置。', 'T');
INSERT INTO `iqofpython` VALUES (41, '以写模式打开的文件无法进读操作。', 'T');
INSERT INTO `iqofpython` VALUES (42, '假设已成功导入 os 和 sys 标准库，那么表达式 os.path.dirname(sys.executable) 的值为 Python 安装目录。', 'T');
INSERT INTO `iqofpython` VALUES (43, '以读模式打开文件时，文件指针指向文件开始处。', 'T');
INSERT INTO `iqofpython` VALUES (44, '以追加模式打开文件时，文件指针指向文件尾。', 'T');
INSERT INTO `iqofpython` VALUES (45, '二进制文件也可以使用记事本程序打开，只是无法正确阅读和理解其中的内容。', 'T');
INSERT INTO `iqofpython` VALUES (46, '文本文件是可以迭代的， 可以使用 for line in fp 类似的语句遍历文件对象 fp 中的每一行。', 'T');
INSERT INTO `iqofpython` VALUES (47, 'Python 的主程序文件 python.exe 属于二进制文件。', 'T');
INSERT INTO `iqofpython` VALUES (48, '对字符串信息进行编码以后， 必须使用同样的或者兼容的编码格式进行解码才能还原本来的信息。', 'T');
INSERT INTO `iqofpython` VALUES (49, '使用 pickle 进行序列化得到的二进制文件使用 struct 也可以正确地进行反序列化。', 'F');
INSERT INTO `iqofpython` VALUES (50, '已知当前文件夹中有一个文件 readme.txt 具有只读属性，假设标准库 os 已正确导入，那么可以通过语句 os.chmod(\'readme.txt\', 0o777) 来删除该文件的只读属性。', 'T');
INSERT INTO `iqofpython` VALUES (51, 'Python 标准库 os 的函数 remove()不能删除具有只读属性的文件。', 'T');
INSERT INTO `iqofpython` VALUES (52, '在try...except...else 结构中，如果 try 块的语句引发了异常则会执行 else块中的代码。 ', 'F');
INSERT INTO `iqofpython` VALUES (53, ' 异常处理结构中的 finally 块中代码仍然有可能出错从而再次引发异常。', 'T');
INSERT INTO `iqofpython` VALUES (54, '程序中异常处理结构在大多数情况下是没必要的。', 'F');
INSERT INTO `iqofpython` VALUES (55, '带有 else 子句的异常处理结构，如果不发生异常则执行 else 子句中的代码。', 'T');
INSERT INTO `iqofpython` VALUES (56, '异常处理结构也不是万能的，处理异常的代码也有引发异常的可能。', 'T');
INSERT INTO `iqofpython` VALUES (57, '在异常处理结构中， 不论是否发生异常， finally 子句中的代码总是会执行的。', 'T');
INSERT INTO `iqofpython` VALUES (58, '由于异常处理结构 try...except...finally... 中 finally 里的语句块总是被执行的， 所以把关闭文件的代码放到 finally 块里肯定是万无一失， 一定能保证文件被正确关闭并且不会引发任何异常。', 'F');
INSERT INTO `iqofpython` VALUES (59, '在 GUI 设计中，复选框往往用来实现非互斥多选的功能，多个复选框之间的选择互不影响。', 'T');
INSERT INTO `iqofpython` VALUES (60, ' 在 GUI 设计中，单选按钮用来实现用户在多个选项中的互斥选择，在同一组内多个选项中只能选择一个，当选择发生变化之后，之前选中的选项自动失效。', 'T');
INSERT INTO `iqofpython` VALUES (61, 'Python 代码可以内嵌在 asp 文件中。', 'T');
INSERT INTO `iqofpython` VALUES (62, 'Python 代码可以内嵌在 asp 文件中。', 'T');
INSERT INTO `iqofpython` VALUES (63, '无法配置 IIS 来支持 Python 程序的运行。', 'F');
INSERT INTO `iqofpython` VALUES (64, '使用 TCP 协议进行通信时，必须首先建立连接，然后进行数据传输，最后再关闭连接。', 'T');
INSERT INTO `iqofpython` VALUES (65, 'TCP 是可以提供良好服务质量的传输层协议，所以在任何场合都应该优先考虑使用。', 'F');
INSERT INTO `iqofpython` VALUES (66, '可以使用 py2exe 或 pyinstaller 等扩展库把 Python 源程序打包成为 exe 文件，从而脱离 Python 环境在 Windows 平台上运行。', 'T');
INSERT INTO `iqofpython` VALUES (67, 'Python 程序只能在安装了 Python 环境的计算机上以源代码形式运行。', 'F');
INSERT INTO `iqofpython` VALUES (68, '继承自 threading.Thread 类的派生类中不能有普通的成员方法。', 'F');
INSERT INTO `iqofpython` VALUES (69, 'Python 标准库 threading 中的 Lock 、RLock 、Condition 、Event、Semaphore对象都可以用来实现线程同步。', 'T');
INSERT INTO `iqofpython` VALUES (70, '在编写应用程序时，应合理控制线程数量，线程并不是越多越好。', 'T');
INSERT INTO `iqofpython` VALUES (71, '在多线程编程时，当某子线程的 daemon 属性为 False 时，主线程结束时会检测该子线程是否结束， 如果该子线程尚未运行结束， 则主线程会等待它完成后再退出。 ', 'T');
INSERT INTO `iqofpython` VALUES (72, '在 4 核 CPU 平台上使用多线程编程技术可以很轻易地获得 400%的处理速度提升。', 'F');
INSERT INTO `iqofpython` VALUES (73, '多线程编程技术主要目的是为了提高计算机硬件的利用率， 没有别的作用了。', 'F');
INSERT INTO `iqofpython` VALUES (74, 'Python 只能使用内置数据库 SQLite，无法访问 MS SQLServer 、ACCESS 或 Oracle、MySQL 等数据库。', 'F');
INSERT INTO `iqofpython` VALUES (75, '使用 OpenGL 画图时，画点是最基本的操作，具体生成的图形由 glBegin() 函数指定的 mode 来决定。例如， mode 值为 GL_TRIANGLES 时表示将要绘制三角形。', 'T');

-- ----------------------------
-- Table structure for qbankcontext
-- ----------------------------
DROP TABLE IF EXISTS `qbankcontext`;
CREATE TABLE `qbankcontext`  (
  `bank_id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `back_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bank_type` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`bank_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1005 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qbankcontext
-- ----------------------------
INSERT INTO `qbankcontext` VALUES (1001, 'cqofpython', 'c');
INSERT INTO `qbankcontext` VALUES (1002, 'iqofpython', 'i');
INSERT INTO `qbankcontext` VALUES (1003, 'fqofpython', 'f');
INSERT INTO `qbankcontext` VALUES (1004, 'aqofpython', 'a');

-- ----------------------------
-- Table structure for unitinfo
-- ----------------------------
DROP TABLE IF EXISTS `unitinfo`;
CREATE TABLE `unitinfo`  (
  `class_id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `unit_type` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mange_teacher` int(0) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`class_id`) USING BTREE,
  INDEX `teacher_id`(`mange_teacher`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3002 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of unitinfo
-- ----------------------------
INSERT INTO `unitinfo` VALUES (1001, 'root', NULL);
INSERT INTO `unitinfo` VALUES (2001, 'teacher', NULL);
INSERT INTO `unitinfo` VALUES (2002, 'teacher', NULL);
INSERT INTO `unitinfo` VALUES (3001, 'student', 5210001);
INSERT INTO `unitinfo` VALUES (3002, 'student', 5210002);

-- ----------------------------
-- Table structure for usedinfo
-- ----------------------------
DROP TABLE IF EXISTS `usedinfo`;
CREATE TABLE `usedinfo`  (
  `info_id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(0) UNSIGNED NOT NULL,
  `start_exam_time` datetime(0) NOT NULL,
  `test_time` int(0) UNSIGNED NOT NULL,
  `exam_id` int(0) UNSIGNED NOT NULL,
  `exam_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `question_num` int(0) UNSIGNED NOT NULL,
  `start_id` int(0) UNSIGNED NOT NULL,
  `grade` int(0) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `user`(`user_id`) USING BTREE,
  INDEX `exam-ID`(`exam_id`) USING BTREE,
  INDEX `question`(`question_num`) USING BTREE,
  INDEX `suoying`(`start_id`) USING BTREE,
  CONSTRAINT `exam-ID` FOREIGN KEY (`exam_id`) REFERENCES `examinfo` (`exam_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `question` FOREIGN KEY (`question_num`) REFERENCES `examinfo` (`num_q`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `suoying` FOREIGN KEY (`start_id`) REFERENCES `examofa` (`order_number`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user` FOREIGN KEY (`user_id`) REFERENCES `userinfo` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of usedinfo
-- ----------------------------
INSERT INTO `usedinfo` VALUES (1, 1210001, '2021-08-21 11:33:02', 60, 100001, 'test01', 50, 1, 24);
INSERT INTO `usedinfo` VALUES (2, 1210002, '2021-08-21 11:33:02', 60, 100001, 'test01', 50, 1, 24);
INSERT INTO `usedinfo` VALUES (3, 1210003, '2021-08-21 11:33:02', 60, 100001, 'test01', 50, 1, 24);

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo`  (
  `user_id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `class_id` int(0) UNSIGNED NOT NULL,
  `sex` char(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '10010',
  `role` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  INDEX `class_id`(`class_id`) USING BTREE,
  CONSTRAINT `class_id` FOREIGN KEY (`class_id`) REFERENCES `unitinfo` (`class_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9210002 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES (1210001, 'studentrole', 3001, '男', '10010', 'student');
INSERT INTO `userinfo` VALUES (1210002, 'studentTest02', 3001, '男', '10010', 'student');
INSERT INTO `userinfo` VALUES (1210003, 'studentTest03', 3002, '男', '10010', 'student');
INSERT INTO `userinfo` VALUES (5210001, 'teacherrole', 2001, '女', '10010', 'teacher');
INSERT INTO `userinfo` VALUES (5210002, 'teacherTest02', 2002, '女', '10010', 'teacher');
INSERT INTO `userinfo` VALUES (9210001, 'rootrole', 1001, '男', '10010', 'root');

-- ----------------------------
-- View structure for classinfo
-- ----------------------------
DROP VIEW IF EXISTS `classinfo`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `classinfo` AS select `userinfo`.`user_id` AS `user_id`,`userinfo`.`class_id` AS `class_id` from (`userinfo` join `unitinfo` on((`userinfo`.`class_id` = `unitinfo`.`class_id`)));

-- ----------------------------
-- View structure for findexaminfo
-- ----------------------------
DROP VIEW IF EXISTS `findexaminfo`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `findexaminfo` AS select `classinfo`.`user_id` AS `user_id`,`classinfo`.`class_id` AS `class_id`,`examclass`.`exam_id` AS `exam_id`,`examinfo`.`exam_name` AS `exam_name`,`examinfo`.`start_time` AS `start_time`,`examinfo`.`end_time` AS `end_time`,`examinfo`.`user_time` AS `user_time`,`examinfo`.`t_score` AS `t_score`,`examinfo`.`num_q` AS `num_q`,`examinfo`.`start_id` AS `start_id` from ((`classinfo` join `examclass`) join `examinfo`) where ((`classinfo`.`class_id` = `examclass`.`class_id`) or (`examinfo`.`create_user` = `classinfo`.`user_id`));

-- ----------------------------
-- View structure for findteachermange
-- ----------------------------
DROP VIEW IF EXISTS `findteachermange`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `findteachermange` AS select `usedinfo`.`info_id` AS `info_id`,`usedinfo`.`user_id` AS `user_id`,`usedinfo`.`start_exam_time` AS `start_exam_time`,`usedinfo`.`test_time` AS `test_time`,`usedinfo`.`exam_name` AS `exam_name`,`usedinfo`.`question_num` AS `question_num`,`usedinfo`.`start_id` AS `start_id`,`userinfo`.`class_id` AS `class_id`,`unitinfo`.`mange_teacher` AS `mange_teacher`,`usedinfo`.`grade` AS `grade`,`usedinfo`.`exam_id` AS `exam_id` from ((`usedinfo` join `userinfo` on((`usedinfo`.`user_id` = `userinfo`.`user_id`))) join `unitinfo` on((`userinfo`.`class_id` = `unitinfo`.`class_id`)));

SET FOREIGN_KEY_CHECKS = 1;
