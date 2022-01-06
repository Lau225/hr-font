/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : localhost:3306
 Source Schema         : hr3

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 06/01/2022 16:14:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for add_position
-- ----------------------------
DROP TABLE IF EXISTS `add_position`;
CREATE TABLE `add_position`  (
  `id` int(0) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `number` int(0) NULL DEFAULT NULL,
  `PtypeId` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of add_position
-- ----------------------------
INSERT INTO `add_position` VALUES (16, '中级实验员', 0, 7);
INSERT INTO `add_position` VALUES (17, '低级实验员', 0, 7);

-- ----------------------------
-- Table structure for add_position_type
-- ----------------------------
DROP TABLE IF EXISTS `add_position_type`;
CREATE TABLE `add_position_type`  (
  `id` int(0) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `number` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of add_position_type
-- ----------------------------
INSERT INTO `add_position_type` VALUES (7, '实验员', 0);

-- ----------------------------
-- Table structure for add_second_institutions
-- ----------------------------
DROP TABLE IF EXISTS `add_second_institutions`;
CREATE TABLE `add_second_institutions`  (
  `Si_id` int(0) NOT NULL,
  `Si_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `FiId` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`Si_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of add_second_institutions
-- ----------------------------
INSERT INTO `add_second_institutions` VALUES (3, '生物科技公司', 1);

-- ----------------------------
-- Table structure for add_third_institutions
-- ----------------------------
DROP TABLE IF EXISTS `add_third_institutions`;
CREATE TABLE `add_third_institutions`  (
  `Ti_id` int(0) NOT NULL,
  `Ti_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SiId` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`Ti_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of add_third_institutions
-- ----------------------------
INSERT INTO `add_third_institutions` VALUES (9, '研发二组', 3);

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '住址',
  `uid` int(0) NULL DEFAULT NULL COMMENT '员工id',
  `rid` int(0) NULL DEFAULT 6 COMMENT '权限id',
  `registerTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `admin_user_id_fk`(`uid`) USING BTREE,
  INDEX `admin_role_id_fk`(`rid`) USING BTREE,
  CONSTRAINT `admin_role_id_fk` FOREIGN KEY (`rid`) REFERENCES `role` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `admin_user_id_fk` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', '123456', NULL, NULL, NULL, 1, '2022-01-02 11:12:36');
INSERT INTO `admin` VALUES (2, 'user', '123', NULL, NULL, NULL, 2, '2022-01-02 11:13:35');
INSERT INTO `admin` VALUES (3, 'zhangsan', '123', NULL, NULL, NULL, 6, '2022-01-05 21:14:35');
INSERT INTO `admin` VALUES (4, 'lisi', '123', NULL, NULL, NULL, 4, '2022-01-06 14:38:21');
INSERT INTO `admin` VALUES (5, 'wangwu', '123', NULL, NULL, NULL, 5, '2022-01-06 14:38:33');

-- ----------------------------
-- Table structure for first_institutions
-- ----------------------------
DROP TABLE IF EXISTS `first_institutions`;
CREATE TABLE `first_institutions`  (
  `Fi_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '一级机构id',
  `Fi_name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '一级机构名字',
  PRIMARY KEY (`Fi_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '一级机构表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of first_institutions
-- ----------------------------
INSERT INTO `first_institutions` VALUES (1, '集团');

-- ----------------------------
-- Table structure for position
-- ----------------------------
DROP TABLE IF EXISTS `position`;
CREATE TABLE `position`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '职位id',
  `name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '职位名称',
  `number` int(0) NULL DEFAULT 0 COMMENT '人数',
  `PtypeId` int(0) NULL DEFAULT NULL COMMENT '职位类型id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `position_position_type_id_fk`(`PtypeId`) USING BTREE,
  CONSTRAINT `position_position_type_id_fk` FOREIGN KEY (`PtypeId`) REFERENCES `position_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '职位表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of position
-- ----------------------------
INSERT INTO `position` VALUES (1, '高级工程师', 2, 1);
INSERT INTO `position` VALUES (2, '中级工程师', 1, 1);
INSERT INTO `position` VALUES (3, '低级工程师', 0, 1);
INSERT INTO `position` VALUES (4, '高级学徒', 0, 2);
INSERT INTO `position` VALUES (5, '中级学徒', 0, 2);
INSERT INTO `position` VALUES (15, '高级实验员', 0, 7);

-- ----------------------------
-- Table structure for position_type
-- ----------------------------
DROP TABLE IF EXISTS `position_type`;
CREATE TABLE `position_type`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '职位类型id',
  `name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '职位类型名称',
  `number` int(0) NULL DEFAULT 0 COMMENT '人数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '职位类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of position_type
-- ----------------------------
INSERT INTO `position_type` VALUES (1, '工程师', 0);
INSERT INTO `position_type` VALUES (2, '学徒', 0);
INSERT INTO `position_type` VALUES (7, '实验员', 0);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '权限id',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '管理员');
INSERT INTO `role` VALUES (2, '薪酬专员');
INSERT INTO `role` VALUES (3, '薪酬经理');
INSERT INTO `role` VALUES (4, '人事专员');
INSERT INTO `role` VALUES (5, '人事经理');
INSERT INTO `role` VALUES (6, '普通用户');

-- ----------------------------
-- Table structure for role_module
-- ----------------------------
DROP TABLE IF EXISTS `role_module`;
CREATE TABLE `role_module`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'id\n',
  `fileModule` int(0) NULL DEFAULT NULL COMMENT '档案管理模块\n',
  `fileRegister` int(0) NULL DEFAULT NULL COMMENT '档案登记',
  `fileUpdate` int(0) NULL DEFAULT NULL COMMENT '档案变更',
  `fileRegisterReview` int(0) NULL DEFAULT NULL COMMENT '档案登记复核',
  `fileSelect` int(0) NULL DEFAULT NULL COMMENT '档案查询',
  `fileDelete` int(0) NULL DEFAULT NULL COMMENT '档案删除',
  `fileRestore` int(0) NULL DEFAULT NULL COMMENT '档案恢复',
  `salaryStandard` int(0) NULL DEFAULT NULL COMMENT '薪酬标准',
  `salaryStandardRegister` int(0) NULL DEFAULT NULL COMMENT '薪酬标准登记',
  `salaryStandardUpdate` int(0) NULL DEFAULT NULL COMMENT '薪酬标准变更',
  `salaryStandardReview` int(0) NULL DEFAULT NULL COMMENT '薪酬标准复核',
  `salaryProvide` int(0) NULL DEFAULT NULL COMMENT '薪酬发放',
  `salaryProvideRegister` int(0) NULL DEFAULT NULL COMMENT '薪酬发放登记',
  `salaryProvideReview` int(0) NULL DEFAULT NULL COMMENT '薪酬发放复核',
  `systemModule` int(0) NULL DEFAULT NULL COMMENT '系统管理',
  `setAgencies` int(0) NULL DEFAULT NULL COMMENT '设置机构',
  `setPosition` int(0) NULL DEFAULT NULL COMMENT '设置职位',
  `limited` int(0) NULL DEFAULT NULL COMMENT '权限',
  `rid` int(0) NULL DEFAULT NULL COMMENT '权限id\n',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `role_module_role_id_fk`(`rid`) USING BTREE,
  CONSTRAINT `role_module_role_id_fk` FOREIGN KEY (`rid`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_module
-- ----------------------------
INSERT INTO `role_module` VALUES (1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6);
INSERT INTO `role_module` VALUES (2, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO `role_module` VALUES (3, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 2);
INSERT INTO `role_module` VALUES (4, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 3);
INSERT INTO `role_module` VALUES (5, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4);
INSERT INTO `role_module` VALUES (6, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5);

-- ----------------------------
-- Table structure for salary_standard
-- ----------------------------
DROP TABLE IF EXISTS `salary_standard`;
CREATE TABLE `salary_standard`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '薪酬标准编号',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职位名称（薪酬标准）',
  `totalSalary` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '薪酬总额',
  `developPeople` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '制定人',
  `registerPeople` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登记人',
  `registerTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `stateId` int(0) NULL DEFAULT 2 COMMENT '状态码id',
  `basicSalary` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0.00' COMMENT '基本工资',
  `trafficSalary` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0.00' COMMENT '交通补助',
  `lunchSalary` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0.00' COMMENT '午餐补助',
  `commSalary` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0.00' COMMENT '通信补助',
  `endowmentInsurance` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0.00' COMMENT '养老保险',
  `unemployInsurance` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0.00' COMMENT '失业保险',
  `medicalInsurance` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0.00' COMMENT '医疗保险',
  `housingProvidentFund` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0.00' COMMENT '住房公积金',
  `message` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '复核意见',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `salary_standard_state_id_fk`(`stateId`) USING BTREE,
  CONSTRAINT `salary_standard_state_id_fk` FOREIGN KEY (`stateId`) REFERENCES `state` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '薪酬标准表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of salary_standard
-- ----------------------------
INSERT INTO `salary_standard` VALUES (1, '薪酬标准3', '10483.00', 'admin', 'zzz', '2022-01-04 10:21:22', 1, '8000', '300', '500', '200', '640.00', '163.00', '40.00', '640.00', NULL);
INSERT INTO `salary_standard` VALUES (2, '薪酬标准2', '11400', 'admin', 'zzz', '2022-01-04 10:21:22', 1, '10000', '600', '800', '400', '100', '100', '100', '100', NULL);
INSERT INTO `salary_standard` VALUES (5, '哈哈', '5994.00', 'admin', 'undefined', '2022-01-05 08:43:37', 1, '5000.00', '22', '22', '22', '400', '103', '25', '400.00', '');
INSERT INTO `salary_standard` VALUES (6, '芜湖', '256.00', '121', '阿萨德', '2022-01-05 08:44:53', 2, '200.00', '11.00', '2.00', '3.00', '16.00', '7.00', '1.00', '16.00', NULL);
INSERT INTO `salary_standard` VALUES (7, '1221', '3557.00', 'admin', 'admin', '2022-01-06 08:46:52', 1, '4000', '100', '100', '100', '320.00', '83.00', '20.00', '320.00', '通过');
INSERT INTO `salary_standard` VALUES (8, '1111', '4081.00', 'admin', 'admin', '2022-01-06 15:02:57', 1, '5000.00', '3.00', '3.00', '3.00', '400.00', '103.00', '25.00', '400.00', '通过');

-- ----------------------------
-- Table structure for second_institutions
-- ----------------------------
DROP TABLE IF EXISTS `second_institutions`;
CREATE TABLE `second_institutions`  (
  `Si_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '二级机构id',
  `Si_name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '二级机构名字',
  `FiId` int(0) NULL DEFAULT NULL COMMENT '一级机构id',
  PRIMARY KEY (`Si_id`) USING BTREE,
  INDEX `second_institutions_first_institutions_id_fk`(`FiId`) USING BTREE,
  CONSTRAINT `second_institutions_first_institutions_id_fk` FOREIGN KEY (`FiId`) REFERENCES `first_institutions` (`Fi_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '二级机构表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of second_institutions
-- ----------------------------
INSERT INTO `second_institutions` VALUES (1, '软件公司', 1);
INSERT INTO `second_institutions` VALUES (3, '生物科技公司', 1);

-- ----------------------------
-- Table structure for serial
-- ----------------------------
DROP TABLE IF EXISTS `serial`;
CREATE TABLE `serial`  (
  `serialId` int(0) NOT NULL COMMENT '薪酬发放编号',
  `state` int(0) NULL DEFAULT 2 COMMENT '状态码',
  `affiliationId` int(0) NULL DEFAULT NULL COMMENT '所属三级机构id',
  `number` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '总人数',
  `basicSalaryTotal` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '基本薪酬总额',
  `time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`serialId`) USING BTREE,
  INDEX `serial_third_institutions_id_fk`(`affiliationId`) USING BTREE,
  INDEX `serial_state_id_fk`(`state`) USING BTREE,
  CONSTRAINT `serial_state_id_fk` FOREIGN KEY (`state`) REFERENCES `state` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `serial_third_institutions_id_fk` FOREIGN KEY (`affiliationId`) REFERENCES `third_institutions` (`Ti_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '薪酬发放表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for serial_item
-- ----------------------------
DROP TABLE IF EXISTS `serial_item`;
CREATE TABLE `serial_item`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `serialId` int(0) NULL DEFAULT NULL COMMENT '薪酬发放编号',
  `file_Id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '档案编号',
  `incentiveBonus` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '奖励奖金',
  `deductBonus` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '应扣奖金',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `serial_item_serial_serialId_fk`(`serialId`) USING BTREE,
  INDEX `serial_item_fileId_index`(`file_Id`) USING BTREE,
  CONSTRAINT `serial_item_serial_serialId_fk` FOREIGN KEY (`serialId`) REFERENCES `serial` (`serialId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `serial_item_user_fileId_fk` FOREIGN KEY (`file_Id`) REFERENCES `user` (`fileId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '薪酬发放人员明细' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for state
-- ----------------------------
DROP TABLE IF EXISTS `state`;
CREATE TABLE `state`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `state` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '状态码表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of state
-- ----------------------------
INSERT INTO `state` VALUES (1, '已通过');
INSERT INTO `state` VALUES (2, '待复核');
INSERT INTO `state` VALUES (3, '已删除');
INSERT INTO `state` VALUES (4, '复核驳回');

-- ----------------------------
-- Table structure for third_institutions
-- ----------------------------
DROP TABLE IF EXISTS `third_institutions`;
CREATE TABLE `third_institutions`  (
  `Ti_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '三级机构id',
  `Ti_name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '三级机构名字',
  `SiId` int(0) NULL DEFAULT NULL COMMENT '二级机构id',
  PRIMARY KEY (`Ti_id`) USING BTREE,
  INDEX `third_institutions_second_institutions_id_fk`(`SiId`) USING BTREE,
  CONSTRAINT `third_institutions_second_institutions_id_fk` FOREIGN KEY (`SiId`) REFERENCES `second_institutions` (`Si_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '三级机构表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of third_institutions
-- ----------------------------
INSERT INTO `third_institutions` VALUES (1, '测试组', 1);
INSERT INTO `third_institutions` VALUES (2, '开发一组', 1);
INSERT INTO `third_institutions` VALUES (7, '研发组', 3);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '员工id\n',
  `fileId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '档案编号',
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '员工姓名',
  `gender` char(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `email` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话号码',
  `qq` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'qq号',
  `mobilePhone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `address` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '住址',
  `zipCode` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮编',
  `picture` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '照片路径',
  `country` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍',
  `birth_place` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出生地',
  `birthday` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生日',
  `nation` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '民族',
  `religion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '宗教信仰',
  `politicsStatus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '政治面貌',
  `idCard` char(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `socialNumber` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '社会保障号码',
  `age` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `education` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学历',
  `educationYears` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '教育年限',
  `educationMajor` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学历专业',
  `compensationStandards` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '薪酬标准',
  `openBank` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开户行',
  `bankNumber` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行账号',
  `registrant` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登记人',
  `buildDate` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建档时间',
  `advantage` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '特长',
  `hobby` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '爱好',
  `resume` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '个人履历',
  `familyRelationship` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭关系信息',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `TiId` int(0) NULL DEFAULT NULL COMMENT '三级机构id\n',
  `salaryId` int(0) NULL DEFAULT NULL COMMENT '薪资标准对应id',
  `positionId` int(0) NULL DEFAULT NULL COMMENT '职位id',
  `stateId` int(0) NULL DEFAULT 2 COMMENT '状态码id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_third_institutions_id_fk`(`TiId`) USING BTREE,
  INDEX `user_position_id_fk`(`positionId`) USING BTREE,
  INDEX `user_salary_id_fk`(`salaryId`) USING BTREE,
  INDEX `user_state_id_fk`(`stateId`) USING BTREE,
  INDEX `user_fileId_fk`(`fileId`) USING BTREE,
  CONSTRAINT `user_position_id_fk` FOREIGN KEY (`positionId`) REFERENCES `position` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `user_salary_id_fk` FOREIGN KEY (`salaryId`) REFERENCES `salary_standard` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `user_state_id_fk` FOREIGN KEY (`stateId`) REFERENCES `state` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `user_third_institutions_id_fk` FOREIGN KEY (`TiId`) REFERENCES `third_institutions` (`Ti_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '档案登记表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (5, '202201010205', '阿萨德', '男', 'sss', '12', '21321', '213123', '123213', '123123', '123', '中国', '213', '123', '汉族', '佛教', '党员', '213123', '123123', '20', '小学', '12年', '软件工程', '1', '121', '1212', 'admin', '2022-01-04 11:39:13', '敲代码', '篮球', '1', '1', '1', 2, 1, 2, 1);
INSERT INTO `user` VALUES (8, '202201010108', '22', '男', '2', '2', '2', '2', '2', '2', '123', '中国', '2', '2', '汉族', '佛教', '党员', '2', '2', '2', '小学', '12年', '软件工程', '1', '1', '1', '', '2022-01-05 17:41:57', '敲代码', '篮球', '1', '1', '1', 1, 1, 1, 1);
INSERT INTO `user` VALUES (9, '202201010109', '123', '男', '7846@.com', '12456', '123456', '123456', '12345', '.1323', '123', '中国', '1223', '2323', '汉族', '佛教', '党员', '123123', '1231', '30', '研究生', '12年', '软件工程', '1', '2131', '213123', '1231', '2022-01-06 08:40:38', '敲代码', '篮球', '11', '11', '11', 1, 1, 1, 1);
INSERT INTO `user` VALUES (10, '202201010110', '11', '男', '11', '11', '11', '11', '11', '11', '123', '中国', '11', '11', '汉族', '佛教', '党员', '11', '11', '11', '初中', '12年', '软件工程', '1', '11', '11', '11', '2022-01-06 14:59:22', '敲代码', '篮球', '1', '1', '1', 1, 1, 1, 1);

-- ----------------------------
-- View structure for institutions_view
-- ----------------------------
DROP VIEW IF EXISTS `institutions_view`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `institutions_view` AS select `first_institutions`.`Fi_id` AS `Fi_id`,`first_institutions`.`Fi_name` AS `Fi_name`,`second_institutions`.`Si_id` AS `Si_id`,`second_institutions`.`Si_name` AS `Si_name`,`third_institutions`.`Ti_id` AS `Ti_id`,`third_institutions`.`Ti_name` AS `Ti_name` from ((`first_institutions` join `second_institutions`) join `third_institutions`) where ((`first_institutions`.`Fi_id` = `second_institutions`.`FiId`) and (`second_institutions`.`Si_id` = `third_institutions`.`SiId`));

-- ----------------------------
-- View structure for salary_view
-- ----------------------------
DROP VIEW IF EXISTS `salary_view`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `salary_view` AS select `user`.`fileId` AS `fileId`,`user`.`name` AS `name`,`salary_standard`.`basicSalary` AS `basicSalary`,`salary_standard`.`trafficSalary` AS `trafficSalary`,`salary_standard`.`lunchSalary` AS `lunchSalary`,`salary_standard`.`commSalary` AS `commSalary`,`salary_standard`.`endowmentInsurance` AS `endowmentInsurance`,`salary_standard`.`unemployInsurance` AS `unemployInsurance`,`salary_standard`.`medicalInsurance` AS `medicalInsurance`,`salary_standard`.`housingProvidentFund` AS `housingProvidentFund`,`salary_standard`.`totalSalary` AS `totalSalary`,`user`.`TiId` AS `TiId` from (`user` join `salary_standard`) where ((`user`.`salaryId` = `salary_standard`.`id`) and (`user`.`stateId` = 1));

SET FOREIGN_KEY_CHECKS = 1;
