/*
 Navicat Premium Dump SQL

 Source Server         : LinuxXX
 Source Server Type    : MySQL
 Source Server Version : 80039 (8.0.39)
 Source Host           : 192.168.43.10:3306
 Source Schema         : ry-vue

 Target Server Type    : MySQL
 Target Server Version : 80039 (8.0.39)
 File Encoding         : 65001

 Date: 17/10/2024 20:59:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for balance
-- ----------------------------
DROP TABLE IF EXISTS `balance`;
CREATE TABLE `balance`  (
  `balance_id` int NOT NULL AUTO_INCREMENT COMMENT '余额信息编号',
  `user_id` int NULL DEFAULT NULL COMMENT '病人id',
  `balance_sum` double NULL DEFAULT NULL COMMENT '余额总数',
  `balance_top_up` double NULL DEFAULT NULL COMMENT '充值余额',
  PRIMARY KEY (`balance_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '余额信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of balance
-- ----------------------------
INSERT INTO `balance` VALUES (1, 1, 3000, 0);

-- ----------------------------
-- Table structure for bingli_case
-- ----------------------------
DROP TABLE IF EXISTS `bingli_case`;
CREATE TABLE `bingli_case`  (
  `bingli_case_id` int NOT NULL AUTO_INCREMENT COMMENT '病例订单编号',
  `user_id` int NULL DEFAULT NULL COMMENT '病人编号',
  `sickbed_id` int NULL DEFAULT NULL COMMENT '病床编号',
  `user_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '病人姓名',
  `case_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '病例名称',
  `medicine_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '药品名称',
  `case_status` int NULL DEFAULT NULL COMMENT '状态（0正常 1停用）',
  `nurse_id` int NULL DEFAULT NULL COMMENT '护士编号',
  `doctor_id` int NULL DEFAULT NULL COMMENT '医生编号',
  PRIMARY KEY (`bingli_case_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '病例订单信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bingli_case
-- ----------------------------
INSERT INTO `bingli_case` VALUES (1, 1, 1, '付子墨', '小儿麻痹', '头孢', NULL, 1, 1);

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `department_id` int NOT NULL AUTO_INCREMENT COMMENT '科室ID',
  `department_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '科室名称',
  `department_num` int NOT NULL COMMENT '科室楼层',
  `department_category` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '科室类别',
  PRIMARY KEY (`department_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '科室信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES (1, '儿科', 3, '儿童');

-- ----------------------------
-- Table structure for dingdan
-- ----------------------------
DROP TABLE IF EXISTS `dingdan`;
CREATE TABLE `dingdan`  (
  `dingdan_id` int NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `sickbed_id` int NULL DEFAULT NULL COMMENT '病床ID',
  `nurse_id` int NULL DEFAULT NULL COMMENT '护士ID',
  `doctor_id` int NULL DEFAULT NULL COMMENT '医生ID',
  `user_id` int NULL DEFAULT NULL COMMENT '用户ID',
  `jiage_id` int NULL DEFAULT NULL COMMENT '价格ID',
  `UpdateDataTime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `dingdan_status` int NULL DEFAULT 0 COMMENT '订单状态',
  PRIMARY KEY (`dingdan_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '订单信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of dingdan
-- ----------------------------
INSERT INTO `dingdan` VALUES (1, 1, 1, 1, 1, 1, '2024-09-02 00:00:00', 0);

-- ----------------------------
-- Table structure for doctor
-- ----------------------------
DROP TABLE IF EXISTS `doctor`;
CREATE TABLE `doctor`  (
  `doctor_id` int NOT NULL AUTO_INCREMENT COMMENT '医生ID',
  `doctor_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '医生名称',
  `doctor_age` int NULL DEFAULT NULL COMMENT '年龄',
  `doctor_sex` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '性别（0男 1女 2未知）',
  `doctor_status` int NULL DEFAULT 0 COMMENT '状态（0正常 1停用）',
  `doctor_birthday` datetime NULL DEFAULT NULL COMMENT '生日',
  `id_card` varchar(18) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '身份证号',
  `department_id` int NULL DEFAULT NULL COMMENT '科室ID',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `department_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '科室名称',
  `doctor_phone` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '医生电话',
  `doctor_zhanghao` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '医生账号',
  `doctor_password` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '医生密码',
  `doctor_email` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '医生邮箱',
  `doctor_position` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '医生职位',
  `doctor_score` int NULL DEFAULT NULL COMMENT '医生评分',
  PRIMARY KEY (`doctor_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '医生信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of doctor
-- ----------------------------
INSERT INTO `doctor` VALUES (1, '胡思淼', 66, '0', 1, '2024-07-09 00:00:00', '1111111', 111, '2024-07-07 14:04:30', '妇产科', '15547681692', '111111', '111111', '1944590962@qq.com', '医生', 5);
INSERT INTO `doctor` VALUES (2, '华佗', 22, '0', 1, '2024-09-16 00:00:00', '150421200212121122', 1234323, '2024-09-02 15:06:16', '儿科', '15547681693', '111111', '111111', '1944590963@qq.com', '医生', 5);

-- ----------------------------
-- Table structure for examine
-- ----------------------------
DROP TABLE IF EXISTS `examine`;
CREATE TABLE `examine`  (
  `examine_id` int NOT NULL AUTO_INCREMENT COMMENT '检查ID',
  `examine_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '检查名称',
  `examine_price` int NOT NULL COMMENT '检查价格',
  `examine_type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '检查类型',
  PRIMARY KEY (`examine_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '检查信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of examine
-- ----------------------------
INSERT INTO `examine` VALUES (1, '抽血', 300, '');

-- ----------------------------
-- Table structure for examine_treatment_case
-- ----------------------------
DROP TABLE IF EXISTS `examine_treatment_case`;
CREATE TABLE `examine_treatment_case`  (
  `examine_treatment_case_id` int NOT NULL AUTO_INCREMENT COMMENT '检查或者手术订单编号',
  `examine_treatment_category` int NULL DEFAULT NULL COMMENT '检查或者手术订单类别（0检查 1手术）',
  `doctor_id` int NULL DEFAULT NULL COMMENT '医生ID',
  `doctor_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '医生姓名',
  `doctor_status` int NULL DEFAULT NULL COMMENT '医生状态（0已满 1未满）',
  `user_id` int NULL DEFAULT NULL COMMENT '病人ID',
  `case_status` int NULL DEFAULT NULL COMMENT '订单状态（0停用 1启用 3同意 4拒绝）',
  `examine_treatment_date` date NULL DEFAULT NULL COMMENT '检查或者手术日期',
  PRIMARY KEY (`examine_treatment_case_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '检查或手术订单信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of examine_treatment_case
-- ----------------------------
INSERT INTO `examine_treatment_case` VALUES (8, 1, 1, '胡思淼', 1, 1, 3, '2024-10-16');
INSERT INTO `examine_treatment_case` VALUES (9, 1, 1, '胡思淼', 1, 1, 3, '2024-10-12');
INSERT INTO `examine_treatment_case` VALUES (10, 1, 1, '胡思淼', 1, 1, 1, '2024-10-12');

-- ----------------------------
-- Table structure for examine_treatment_case_history
-- ----------------------------
DROP TABLE IF EXISTS `examine_treatment_case_history`;
CREATE TABLE `examine_treatment_case_history`  (
  `examine_treatment_case_id` int NOT NULL AUTO_INCREMENT COMMENT '编号',
  `examine_treatment_category` int NULL DEFAULT NULL COMMENT '预约类别',
  `doctor_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '主治医师名称',
  `doctor_id` int NULL DEFAULT NULL COMMENT '医生Id',
  `user_id` int NULL DEFAULT NULL COMMENT '病人Id',
  `nurse_id` int NULL DEFAULT NULL COMMENT '护士Id',
  `case_status` int NULL DEFAULT NULL COMMENT '状态（0失败 1正在挂号 3成功挂号 4被拒绝挂号）',
  `examine_treatment_date` datetime NULL DEFAULT NULL COMMENT '预约时间',
  PRIMARY KEY (`examine_treatment_case_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '历史挂号信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of examine_treatment_case_history
-- ----------------------------
INSERT INTO `examine_treatment_case_history` VALUES (7, 1, '胡思淼', 1, 2, 1, 3, '2024-10-11 00:00:00');
INSERT INTO `examine_treatment_case_history` VALUES (8, 1, '胡思淼', 1, 2, 1, 4, '2024-10-11 00:00:00');
INSERT INTO `examine_treatment_case_history` VALUES (9, 1, '胡思淼', 1, 31, 1, 4, '2024-10-11 00:00:00');
INSERT INTO `examine_treatment_case_history` VALUES (10, 1, '胡思淼', 1, 4, 1, 3, '2024-10-11 00:00:00');
INSERT INTO `examine_treatment_case_history` VALUES (11, 1, '胡思淼', 1, 5, 1, 4, '2024-10-11 00:00:00');
INSERT INTO `examine_treatment_case_history` VALUES (12, 1, '胡思淼', 1, 8, 1, 3, '2024-10-16 00:00:00');
INSERT INTO `examine_treatment_case_history` VALUES (13, 1, '胡思淼', 1, 1, 1, 3, '2024-10-16 00:00:00');

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'department', '科室信息表', NULL, NULL, 'Department', 'crud', 'element-ui', 'com.ruoyi.department', 'department', 'department', '科室信息', 'gsq', '0', '/', '{\"parentMenuId\":\"1068\"}', 'admin', '2024-07-07 13:29:10', '', '2024-07-07 13:49:54', NULL);
INSERT INTO `gen_table` VALUES (2, 'dingdan', '订单信息表', NULL, NULL, 'Dingdan', 'crud', 'element-ui', 'com.ruoyi.dingdan', 'dingdan', 'dingdan', '订单信息', 'gsq', '0', '/', '{\"parentMenuId\":\"1066\"}', 'admin', '2024-07-07 13:29:10', '', '2024-07-07 13:50:08', NULL);
INSERT INTO `gen_table` VALUES (3, 'doctor', '医生信息表', NULL, NULL, 'Doctor', 'crud', 'element-ui', 'com.ruoyi.doctor', 'doctor', 'doctor', '医生信息', 'gsq', '0', '/', '{\"parentMenuId\":1062}', 'admin', '2024-07-07 13:29:10', '', '2024-07-07 13:42:22', NULL);
INSERT INTO `gen_table` VALUES (4, 'examine', '检查信息表', NULL, NULL, 'Examine', 'crud', 'element-ui', 'com.ruoyi.examine', 'examine', 'examine', '检查信息', 'gsq', '0', '/', '{\"parentMenuId\":1070}', 'admin', '2024-07-07 13:29:10', '', '2024-07-07 13:42:49', NULL);
INSERT INTO `gen_table` VALUES (5, 'jiage', '价格信息表', NULL, NULL, 'Jiage', 'crud', 'element-ui', 'com.ruoyi.jiage', 'jiage', 'jiage', '价格信息', 'gsq', '0', '/', '{\"parentMenuId\":1067}', 'admin', '2024-07-07 13:29:10', '', '2024-07-07 13:43:13', NULL);
INSERT INTO `gen_table` VALUES (6, 'medicine', '药品信息表', NULL, NULL, 'Medicine', 'crud', 'element-ui', 'com.ruoyi.medicine', 'medicine', 'medicine', '药品信息', 'gsq', '0', '/', '{\"parentMenuId\":1069}', 'admin', '2024-07-07 13:29:10', '', '2024-07-07 13:43:37', NULL);
INSERT INTO `gen_table` VALUES (7, 'nurse', '护士信息表', NULL, NULL, 'Nurse', 'crud', 'element-ui', 'com.ruoyi.nurse', 'nurse', 'nurse', '护士信息', 'gsq', '0', '/', '{\"parentMenuId\":1063}', 'admin', '2024-07-07 13:29:10', '', '2024-07-07 13:44:14', NULL);
INSERT INTO `gen_table` VALUES (8, 'sickbed', '病床信息表', NULL, NULL, 'Sickbed', 'crud', 'element-ui', 'com.ruoyi.sickbed', 'sickbed', 'sickbed', '病床信息', 'gsq', '0', '/', '{\"parentMenuId\":1065}', 'admin', '2024-07-07 13:29:10', '', '2024-07-07 13:45:11', NULL);
INSERT INTO `gen_table` VALUES (9, 'treatment', '治疗信息表', NULL, NULL, 'Treatment', 'crud', 'element-ui', 'com.ruoyi.treatment', 'treatment', 'treatment', '治疗信息', 'gsq', '0', '/', '{\"parentMenuId\":1071}', 'admin', '2024-07-07 13:29:10', '', '2024-07-07 13:45:45', NULL);
INSERT INTO `gen_table` VALUES (10, 'ward', '病房信息表', NULL, NULL, 'Ward', 'crud', 'element-ui', 'com.ruoyi.ward', 'ward', 'ward', '病房信息', 'gsq', '0', '/', '{\"parentMenuId\":1064}', 'admin', '2024-07-07 13:29:10', '', '2024-07-07 13:47:27', NULL);
INSERT INTO `gen_table` VALUES (11, 'user', '病人信息表', NULL, NULL, 'User', 'crud', 'element-ui', 'com.ruoyi.user', 'user', 'user', '病人信息', 'gsq', '0', '/', '{\"parentMenuId\":1061}', 'admin', '2024-07-07 13:29:18', '', '2024-07-07 13:49:01', NULL);
INSERT INTO `gen_table` VALUES (12, 'sys_transfer_order', '转院订单信息表', NULL, NULL, 'SysTransferOrder', 'crud', 'element-ui', 'com.ruoyi.transfer', 'transfer', 'order', '转院订单信息', 'kda', '0', '/', '{\"parentMenuId\":\"1066\"}', 'admin', '2024-08-27 09:52:10', '', '2024-08-27 09:54:09', NULL);
INSERT INTO `gen_table` VALUES (13, 'sys_user_hospital', '病人所处医院信息表', NULL, NULL, 'SysUserHospital', 'crud', 'element-ui', 'com.ruoyi.hospital', 'hospital', 'hospital', '病人所处医院信息', 'kda', '0', '/', '{\"parentMenuId\":1138}', 'admin', '2024-08-27 09:52:10', '', '2024-08-27 09:54:39', NULL);
INSERT INTO `gen_table` VALUES (16, 'payment_record', '缴费记录信息表', NULL, NULL, 'PaymentRecord', 'crud', 'element-ui', 'com.ruoyi.payment', 'payment', 'record', '缴费记录信息', 'kda', '0', '/', '{\"parentMenuId\":\"1066\"}', 'admin', '2024-09-03 16:51:14', '', '2024-09-03 16:52:10', NULL);
INSERT INTO `gen_table` VALUES (17, 'bingli_case', '病例订单信息表', NULL, NULL, 'BingliCase', 'crud', 'element-ui', 'com.ruoyi.case', 'case', 'case', '病例订单信息', 'kda', '0', '/', '{\"parentMenuId\":1066}', 'admin', '2024-09-12 20:09:21', '', '2024-09-12 20:10:03', NULL);
INSERT INTO `gen_table` VALUES (18, 'examine_treatment_case', '检查或手术订单信息表', NULL, NULL, 'ExamineTreatmentCase', 'crud', 'element-ui', 'com.ruoyi.ExamineTreatmentCase', 'ExamineTreatmentCase', 'ExamineTreatmentCase', '检查或手术订单信息', 'kda', '0', '/', '{\"parentMenuId\":1066}', 'admin', '2024-09-14 10:52:32', '', '2024-09-14 10:54:13', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 134 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, 1, 'department_id', '科室ID', 'int(11)', 'Long', 'departmentId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-07-07 13:29:10', '', '2024-07-07 13:49:54');
INSERT INTO `gen_table_column` VALUES (2, 1, 'department_name', '科室名称', 'varchar(20)', 'String', 'departmentName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-07-07 13:29:10', '', '2024-07-07 13:49:54');
INSERT INTO `gen_table_column` VALUES (3, 1, 'department_num', '科室楼层', 'int(11)', 'Long', 'departmentNum', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-07-07 13:29:10', '', '2024-07-07 13:49:54');
INSERT INTO `gen_table_column` VALUES (4, 1, 'department_category', '科室类别', 'varchar(20)', 'String', 'departmentCategory', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-07-07 13:29:10', '', '2024-07-07 13:49:54');
INSERT INTO `gen_table_column` VALUES (5, 2, 'dingdan_id', '订单ID', 'int(11)', 'Long', 'dingdanId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-07-07 13:29:10', '', '2024-07-07 13:50:08');
INSERT INTO `gen_table_column` VALUES (6, 2, 'sickbed_id', '病床ID', 'int(11)', 'Long', 'sickbedId', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 2, 'admin', '2024-07-07 13:29:10', '', '2024-07-07 13:50:08');
INSERT INTO `gen_table_column` VALUES (7, 2, 'nurse_id', '护士ID', 'int(11)', 'Long', 'nurseId', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 3, 'admin', '2024-07-07 13:29:10', '', '2024-07-07 13:50:08');
INSERT INTO `gen_table_column` VALUES (8, 2, 'doctor_id', '医生ID', 'int(11)', 'Long', 'doctorId', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 4, 'admin', '2024-07-07 13:29:10', '', '2024-07-07 13:50:08');
INSERT INTO `gen_table_column` VALUES (9, 2, 'user_id', '用户ID', 'int(11)', 'Long', 'userId', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 5, 'admin', '2024-07-07 13:29:10', '', '2024-07-07 13:50:08');
INSERT INTO `gen_table_column` VALUES (10, 2, 'jiage_id', '价格ID', 'int(11)', 'Long', 'jiageId', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 6, 'admin', '2024-07-07 13:29:10', '', '2024-07-07 13:50:08');
INSERT INTO `gen_table_column` VALUES (11, 2, 'UpdateDataTime', '创建时间', 'datetime', 'Date', 'UpdateDataTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 7, 'admin', '2024-07-07 13:29:10', '', '2024-07-07 13:50:08');
INSERT INTO `gen_table_column` VALUES (12, 2, 'dingdan_status', '订单状态', 'int(1)', 'Integer', 'dingdanStatus', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', 'sys_show_hide', 8, 'admin', '2024-07-07 13:29:10', '', '2024-07-07 13:50:08');
INSERT INTO `gen_table_column` VALUES (13, 3, 'doctor_id', '医生ID', 'int(11)', 'Long', 'doctorId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-07-07 13:29:10', '', '2024-07-07 13:42:22');
INSERT INTO `gen_table_column` VALUES (14, 3, 'doctor_name', '医生名称', 'varchar(30)', 'String', 'doctorName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-07-07 13:29:10', '', '2024-07-07 13:42:22');
INSERT INTO `gen_table_column` VALUES (15, 3, 'doctor_age', '年龄', 'int(3)', 'Integer', 'doctorAge', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-07-07 13:29:10', '', '2024-07-07 13:42:22');
INSERT INTO `gen_table_column` VALUES (16, 3, 'doctor_sex', '性别（0男 1女 2未知）', 'char(1)', 'String', 'doctorSex', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', 'sys_user_sex', 4, 'admin', '2024-07-07 13:29:10', '', '2024-07-07 13:42:22');
INSERT INTO `gen_table_column` VALUES (17, 3, 'doctor_status', '状态（0正常 1停用）', 'char(1)', 'String', 'doctorStatus', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', 'sys_show_hide', 5, 'admin', '2024-07-07 13:29:10', '', '2024-07-07 13:42:22');
INSERT INTO `gen_table_column` VALUES (18, 3, 'doctor_birthday', '生日', 'datetime', 'Date', 'doctorBirthday', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 6, 'admin', '2024-07-07 13:29:10', '', '2024-07-07 13:42:22');
INSERT INTO `gen_table_column` VALUES (19, 3, 'id_card', '身份证号', 'varchar(18)', 'String', 'idCard', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-07-07 13:29:10', '', '2024-07-07 13:42:22');
INSERT INTO `gen_table_column` VALUES (20, 3, 'department_id', '科室ID', 'int(11)', 'Long', 'departmentId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-07-07 13:29:10', '', '2024-07-07 13:42:22');
INSERT INTO `gen_table_column` VALUES (21, 3, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2024-07-07 13:29:10', '', '2024-07-07 13:42:22');
INSERT INTO `gen_table_column` VALUES (22, 4, 'examine_id', '检查ID', 'int(11)', 'Long', 'examineId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-07-07 13:29:10', '', '2024-07-07 13:42:49');
INSERT INTO `gen_table_column` VALUES (23, 4, 'examine_name', '检查名称', 'varchar(20)', 'String', 'examineName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-07-07 13:29:10', '', '2024-07-07 13:42:49');
INSERT INTO `gen_table_column` VALUES (24, 4, 'examine_price', '检查价格', 'int(11)', 'Long', 'examinePrice', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-07-07 13:29:10', '', '2024-07-07 13:42:49');
INSERT INTO `gen_table_column` VALUES (25, 4, 'examine_type', '检查类型', 'varchar(20)', 'String', 'examineType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 4, 'admin', '2024-07-07 13:29:10', '', '2024-07-07 13:42:49');
INSERT INTO `gen_table_column` VALUES (26, 5, 'jiage_id', '价格ID', 'int(11)', 'Long', 'jiageId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-07-07 13:29:10', '', '2024-07-07 13:43:13');
INSERT INTO `gen_table_column` VALUES (27, 5, 'sum_money', '总金额', 'decimal(10,2)', 'BigDecimal', 'sumMoney', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-07-07 13:29:10', '', '2024-07-07 13:43:13');
INSERT INTO `gen_table_column` VALUES (28, 5, 'medicine_id', '药品ID', 'int(11)', 'Long', 'medicineId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-07-07 13:29:10', '', '2024-07-07 13:43:13');
INSERT INTO `gen_table_column` VALUES (29, 5, 'examine_id', '检查ID', 'int(11)', 'Long', 'examineId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-07-07 13:29:10', '', '2024-07-07 13:43:13');
INSERT INTO `gen_table_column` VALUES (30, 5, 'treatment_id', '治疗ID', 'int(11)', 'Long', 'treatmentId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-07-07 13:29:10', '', '2024-07-07 13:43:13');
INSERT INTO `gen_table_column` VALUES (31, 5, 'sickbed_id', '病床ID', 'int(11)', 'Long', 'sickbedId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-07-07 13:29:10', '', '2024-07-07 13:43:13');
INSERT INTO `gen_table_column` VALUES (32, 6, 'medicine_id', '药品ID', 'int(11)', 'Long', 'medicineId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-07-07 13:29:10', '', '2024-07-07 13:43:37');
INSERT INTO `gen_table_column` VALUES (33, 6, 'medicine_name', '药品名称', 'varchar(20)', 'String', 'medicineName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-07-07 13:29:10', '', '2024-07-07 13:43:37');
INSERT INTO `gen_table_column` VALUES (34, 6, 'medicine_price', '药品价格', 'int(11)', 'Long', 'medicinePrice', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-07-07 13:29:10', '', '2024-07-07 13:43:37');
INSERT INTO `gen_table_column` VALUES (35, 6, 'medicine_datetime', '药品生产日期', 'datetime', 'Date', 'medicineDatetime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 4, 'admin', '2024-07-07 13:29:10', '', '2024-07-07 13:43:37');
INSERT INTO `gen_table_column` VALUES (36, 6, 'medicine_count', '药品数量', 'int(11)', 'Long', 'medicineCount', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-07-07 13:29:10', '', '2024-07-07 13:43:37');
INSERT INTO `gen_table_column` VALUES (37, 6, 'medicine_type', '药品类型', 'varchar(20)', 'String', 'medicineType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 6, 'admin', '2024-07-07 13:29:10', '', '2024-07-07 13:43:37');
INSERT INTO `gen_table_column` VALUES (38, 6, 'medicine_num', '药品保质期', 'int(11)', 'Long', 'medicineNum', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-07-07 13:29:10', '', '2024-07-07 13:43:37');
INSERT INTO `gen_table_column` VALUES (39, 6, 'medicine_purpose', '药品用途', 'varchar(20)', 'String', 'medicinePurpose', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-07-07 13:29:10', '', '2024-07-07 13:43:37');
INSERT INTO `gen_table_column` VALUES (40, 7, 'nurse_id', '护士ID', 'int(11)', 'Long', 'nurseId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-07-07 13:29:10', '', '2024-07-07 13:44:14');
INSERT INTO `gen_table_column` VALUES (41, 7, 'nurse_name', '护士名称', 'varchar(30)', 'String', 'nurseName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-07-07 13:29:10', '', '2024-07-07 13:44:14');
INSERT INTO `gen_table_column` VALUES (42, 7, 'nurse_age', '年龄', 'int(3)', 'Integer', 'nurseAge', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-07-07 13:29:10', '', '2024-07-07 13:44:14');
INSERT INTO `gen_table_column` VALUES (43, 7, 'nurse_sex', '性别（0男 1女 2未知）', 'char(1)', 'String', 'nurseSex', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', 'sys_user_sex', 4, 'admin', '2024-07-07 13:29:10', '', '2024-07-07 13:44:14');
INSERT INTO `gen_table_column` VALUES (44, 7, 'nurse_status', '状态（0正常 1停用）', 'char(1)', 'String', 'nurseStatus', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', 'sys_show_hide', 5, 'admin', '2024-07-07 13:29:10', '', '2024-07-07 13:44:14');
INSERT INTO `gen_table_column` VALUES (45, 7, 'nurse_birthday', '生日', 'datetime', 'Date', 'nurseBirthday', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 6, 'admin', '2024-07-07 13:29:10', '', '2024-07-07 13:44:14');
INSERT INTO `gen_table_column` VALUES (46, 7, 'id_card', '身份证号', 'varchar(18)', 'String', 'idCard', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-07-07 13:29:10', '', '2024-07-07 13:44:14');
INSERT INTO `gen_table_column` VALUES (47, 7, 'department_id', '科室ID', 'int(11)', 'Long', 'departmentId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-07-07 13:29:10', '', '2024-07-07 13:44:14');
INSERT INTO `gen_table_column` VALUES (48, 7, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2024-07-07 13:29:10', '', '2024-07-07 13:44:14');
INSERT INTO `gen_table_column` VALUES (49, 8, 'sickbed_id', '病床ID', 'int(11)', 'Long', 'sickbedId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-07-07 13:29:10', '', '2024-07-07 13:45:11');
INSERT INTO `gen_table_column` VALUES (50, 8, 'sickbed_information', '病床信息', 'varchar(30)', 'String', 'sickbedInformation', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-07-07 13:29:10', '', '2024-07-07 13:45:11');
INSERT INTO `gen_table_column` VALUES (51, 8, 'sickbed_status', '状态（0正常 1停用）', 'char(1)', 'String', 'sickbedStatus', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', 'sys_show_hide', 3, 'admin', '2024-07-07 13:29:10', '', '2024-07-07 13:45:11');
INSERT INTO `gen_table_column` VALUES (52, 8, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 4, 'admin', '2024-07-07 13:29:10', '', '2024-07-07 13:45:11');
INSERT INTO `gen_table_column` VALUES (53, 8, 'ward_id', '病房ID', 'int(11)', 'Long', 'wardId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-07-07 13:29:10', '', '2024-07-07 13:45:11');
INSERT INTO `gen_table_column` VALUES (54, 8, 'sickbed_price', '床位价格', 'decimal(10,2)', 'BigDecimal', 'sickbedPrice', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-07-07 13:29:10', '', '2024-07-07 13:45:11');
INSERT INTO `gen_table_column` VALUES (55, 9, 'treatment_id', '治疗ID', 'int(11)', 'Long', 'treatmentId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-07-07 13:29:10', '', '2024-07-07 13:45:45');
INSERT INTO `gen_table_column` VALUES (56, 9, 'treatment_name', '治疗名称', 'varchar(20)', 'String', 'treatmentName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-07-07 13:29:10', '', '2024-07-07 13:45:45');
INSERT INTO `gen_table_column` VALUES (57, 9, 'treatment_price', '治疗价格', 'int(11)', 'Long', 'treatmentPrice', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-07-07 13:29:10', '', '2024-07-07 13:45:45');
INSERT INTO `gen_table_column` VALUES (58, 9, 'treatment_type', '治疗类型', 'varchar(20)', 'String', 'treatmentType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 4, 'admin', '2024-07-07 13:29:10', '', '2024-07-07 13:45:45');
INSERT INTO `gen_table_column` VALUES (59, 9, 'doctor_id', '医生ID', 'int(11)', 'Long', 'doctorId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-07-07 13:29:10', '', '2024-07-07 13:45:45');
INSERT INTO `gen_table_column` VALUES (60, 10, 'ward_id', '病房ID', 'int(11)', 'Long', 'wardId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-07-07 13:29:10', '', '2024-07-07 13:47:27');
INSERT INTO `gen_table_column` VALUES (61, 10, 'ward_information', '病房信息', 'varchar(30)', 'String', 'wardInformation', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-07-07 13:29:10', '', '2024-07-07 13:47:27');
INSERT INTO `gen_table_column` VALUES (62, 10, 'ward_status', '状态（0正常 1停用）', 'char(1)', 'String', 'wardStatus', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', 'sys_show_hide', 3, 'admin', '2024-07-07 13:29:10', '', '2024-07-07 13:47:27');
INSERT INTO `gen_table_column` VALUES (63, 10, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 4, 'admin', '2024-07-07 13:29:10', '', '2024-07-07 13:47:27');
INSERT INTO `gen_table_column` VALUES (64, 11, 'user_id', '病人编号', 'int(11)', 'Long', 'userId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-07-07 13:29:18', '', '2024-07-07 13:49:01');
INSERT INTO `gen_table_column` VALUES (65, 11, 'user_name', '病人名称', 'varchar(30)', 'String', 'userName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-07-07 13:29:18', '', '2024-07-07 13:49:01');
INSERT INTO `gen_table_column` VALUES (66, 11, 'user_age', '病人年龄', 'int(3)', 'Integer', 'userAge', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-07-07 13:29:18', '', '2024-07-07 13:49:01');
INSERT INTO `gen_table_column` VALUES (67, 11, 'user_sex', '性别（0男 1女 2未知）', 'char(1)', 'String', 'userSex', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', 'sys_user_sex', 4, 'admin', '2024-07-07 13:29:18', '', '2024-07-07 13:49:01');
INSERT INTO `gen_table_column` VALUES (68, 11, 'user_status', '状态（0正常 1停用）', 'char(1)', 'String', 'userStatus', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', 'sys_show_hide', 5, 'admin', '2024-07-07 13:29:18', '', '2024-07-07 13:49:01');
INSERT INTO `gen_table_column` VALUES (69, 11, 'user_birthday', '生日', 'datetime', 'Date', 'userBirthday', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 6, 'admin', '2024-07-07 13:29:18', '', '2024-07-07 13:49:01');
INSERT INTO `gen_table_column` VALUES (70, 11, 'user_case', '病人病例', 'varchar(30)', 'String', 'userCase', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-07-07 13:29:18', '', '2024-07-07 13:49:01');
INSERT INTO `gen_table_column` VALUES (71, 11, 'user_order', '病人医嘱', 'varchar(30)', 'String', 'userOrder', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-07-07 13:29:18', '', '2024-07-07 13:49:01');
INSERT INTO `gen_table_column` VALUES (72, 11, 'doctor_id', '医生编号', 'int(11)', 'Long', 'doctorId', '0', '0', '0', '1', '0', '0', '0', 'EQ', 'input', '', 9, 'admin', '2024-07-07 13:29:18', '', '2024-07-07 13:49:01');
INSERT INTO `gen_table_column` VALUES (73, 11, 'nurse_id', '护士编号', 'int(11)', 'Long', 'nurseId', '0', '0', '0', '1', '0', '0', '0', 'EQ', 'input', '', 10, 'admin', '2024-07-07 13:29:18', '', '2024-07-07 13:49:01');
INSERT INTO `gen_table_column` VALUES (74, 11, 'sickbed_id', '病床编号', 'int(11)', 'Long', 'sickbedId', '0', '0', '0', '1', '0', '0', '0', 'EQ', 'input', '', 11, 'admin', '2024-07-07 13:29:18', '', '2024-07-07 13:49:01');
INSERT INTO `gen_table_column` VALUES (75, 11, 'ward_id', '病房编号', 'int(11)', 'Long', 'wardId', '0', '0', '0', '1', '0', '0', '0', 'EQ', 'input', '', 12, 'admin', '2024-07-07 13:29:18', '', '2024-07-07 13:49:01');
INSERT INTO `gen_table_column` VALUES (76, 11, 'id_card', '身份证号', 'varchar(18)', 'String', 'idCard', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2024-07-07 13:29:18', '', '2024-07-07 13:49:01');
INSERT INTO `gen_table_column` VALUES (77, 11, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 14, 'admin', '2024-07-07 13:29:18', '', '2024-07-07 13:49:01');
INSERT INTO `gen_table_column` VALUES (78, 11, 'user_phone', '电话号码', 'varchar(15)', 'String', 'userPhone', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 15, 'admin', '2024-07-07 13:29:18', '', '2024-07-07 13:49:01');
INSERT INTO `gen_table_column` VALUES (79, 11, 'dingdan_id', '订单编号', 'int(11)', 'Long', 'dingdanId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 16, 'admin', '2024-07-07 13:29:18', '', '2024-07-07 13:49:01');
INSERT INTO `gen_table_column` VALUES (80, 11, 'user_zhanghao', '病人账号', 'varchar(30)', 'String', 'userZhanghao', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 17, 'admin', '2024-07-07 13:29:18', '', '2024-07-07 13:49:01');
INSERT INTO `gen_table_column` VALUES (81, 11, 'user_password', '病人密码', 'varchar(30)', 'String', 'userPassword', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 18, 'admin', '2024-07-07 13:29:18', '', '2024-07-07 13:49:01');
INSERT INTO `gen_table_column` VALUES (82, 12, 'transfer_order_id', '转院订单ID', 'int(11)', 'Long', 'transferOrderId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-08-27 09:52:10', '', '2024-08-27 09:54:09');
INSERT INTO `gen_table_column` VALUES (83, 12, 'user_id', '病人ID', 'int(11)', 'Long', 'userId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-08-27 09:52:10', '', '2024-08-27 09:54:09');
INSERT INTO `gen_table_column` VALUES (84, 12, 'hospital_id', '所在医院ID', 'int(11)', 'Long', 'hospitalId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-08-27 09:52:10', '', '2024-08-27 09:54:09');
INSERT INTO `gen_table_column` VALUES (85, 12, 'new_hospital_id', '欲转医院ID', 'int(11)', 'Long', 'newHospitalId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-08-27 09:52:10', '', '2024-08-27 09:54:09');
INSERT INTO `gen_table_column` VALUES (86, 12, 'transfer_order_time', '订单创建时间', 'datetime', 'Date', 'transferOrderTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 5, 'admin', '2024-08-27 09:52:10', '', '2024-08-27 09:54:09');
INSERT INTO `gen_table_column` VALUES (87, 12, 'transfer_order_condition', '转院原因', 'varchar(60)', 'String', 'transferOrderCondition', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-08-27 09:52:10', '', '2024-08-27 09:54:09');
INSERT INTO `gen_table_column` VALUES (88, 12, 'order_status', '状态（0正常 1停用）', 'int(11)', 'Long', 'orderStatus', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 7, 'admin', '2024-08-27 09:52:10', '', '2024-08-27 09:54:09');
INSERT INTO `gen_table_column` VALUES (89, 13, 'user_id', '病人编号', 'int(11)', 'Long', 'userId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-08-27 09:52:10', '', '2024-08-27 09:54:39');
INSERT INTO `gen_table_column` VALUES (90, 13, 'hospital_id', '医院编号', 'int(11)', 'Long', 'hospitalId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-08-27 09:52:10', '', '2024-08-27 09:54:39');
INSERT INTO `gen_table_column` VALUES (91, 13, 'hospital_name', '医院名称', 'varchar(30)', 'String', 'hospitalName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2024-08-27 09:52:10', '', '2024-08-27 09:54:39');
INSERT INTO `gen_table_column` VALUES (92, 13, 'hospital_dizhi', '医院地址', 'varchar(60)', 'String', 'hospitalDizhi', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-08-27 09:52:10', '', '2024-08-27 09:54:39');
INSERT INTO `gen_table_column` VALUES (93, 13, 'hospital_status', '状态（0正常 1停用）', 'int(11)', 'Long', 'hospitalStatus', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 5, 'admin', '2024-08-27 09:52:10', '', '2024-08-27 09:54:39');
INSERT INTO `gen_table_column` VALUES (109, 16, 'record_id', '订单ID', 'int(11)', 'Long', 'recordId', '1', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-09-03 16:51:14', '', '2024-09-03 16:52:10');
INSERT INTO `gen_table_column` VALUES (110, 16, 'user_id', '病人ID', 'int(11)', 'Long', 'userId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-09-03 16:51:14', '', '2024-09-03 16:52:10');
INSERT INTO `gen_table_column` VALUES (111, 16, 'user_name', '病人名称', 'varchar(30)', 'String', 'userName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2024-09-03 16:51:14', '', '2024-09-03 16:52:10');
INSERT INTO `gen_table_column` VALUES (112, 16, 'project_name', '项目名称', 'int(1)', 'Integer', 'projectName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2024-09-03 16:51:14', '', '2024-09-03 16:52:10');
INSERT INTO `gen_table_column` VALUES (113, 16, 'payment_method', '支付方式（1微信 0支付宝）', 'int(1)', 'Integer', 'paymentMethod', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-09-03 16:51:14', '', '2024-09-03 16:52:10');
INSERT INTO `gen_table_column` VALUES (114, 16, 'sum', '金额', 'int(11)', 'Long', 'sum', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-09-03 16:51:14', '', '2024-09-03 16:52:10');
INSERT INTO `gen_table_column` VALUES (115, 16, 'status', '支付状态（0待支付 1已支付）', 'int(1)', 'Integer', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 7, 'admin', '2024-09-03 16:51:14', '', '2024-09-03 16:52:10');
INSERT INTO `gen_table_column` VALUES (116, 16, 'payment_date', '缴费日期', 'datetime', 'Date', 'paymentDate', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 8, 'admin', '2024-09-03 16:51:14', '', '2024-09-03 16:52:10');
INSERT INTO `gen_table_column` VALUES (117, 17, 'bingli_case_id', '病例订单编号', 'int(11)', 'Long', 'bingliCaseId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-09-12 20:09:21', '', '2024-09-12 20:10:03');
INSERT INTO `gen_table_column` VALUES (118, 17, 'user_id', '病人编号', 'int(11)', 'Long', 'userId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-09-12 20:09:21', '', '2024-09-12 20:10:03');
INSERT INTO `gen_table_column` VALUES (119, 17, 'sickbed_id', '病床编号', 'int(11)', 'Long', 'sickbedId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-09-12 20:09:21', '', '2024-09-12 20:10:03');
INSERT INTO `gen_table_column` VALUES (120, 17, 'user_name', '病人姓名', 'varchar(30)', 'String', 'userName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2024-09-12 20:09:21', '', '2024-09-12 20:10:03');
INSERT INTO `gen_table_column` VALUES (121, 17, 'case_name', '病例名称', 'varchar(30)', 'String', 'caseName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', '2024-09-12 20:09:21', '', '2024-09-12 20:10:03');
INSERT INTO `gen_table_column` VALUES (122, 17, 'medicine_id', '药品名称', 'varchar(30)', 'String', 'medicineId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-09-12 20:09:21', '', '2024-09-12 20:10:03');
INSERT INTO `gen_table_column` VALUES (123, 17, 'case_status', '状态（0正常 1停用）', 'int(1)', 'Integer', 'caseStatus', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 7, 'admin', '2024-09-12 20:09:21', '', '2024-09-12 20:10:03');
INSERT INTO `gen_table_column` VALUES (124, 17, 'nurse_id', '护士编号', 'int(11)', 'Long', 'nurseId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-09-12 20:09:21', '', '2024-09-12 20:10:03');
INSERT INTO `gen_table_column` VALUES (125, 17, 'doctor_id', '医生编号', 'int(11)', 'Long', 'doctorId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2024-09-12 20:09:21', '', '2024-09-12 20:10:03');
INSERT INTO `gen_table_column` VALUES (126, 18, 'examine_treatment_case_id', '检查或者手术订单编号', 'int(11)', 'Long', 'examineTreatmentCaseId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-09-14 10:52:32', '', '2024-09-14 10:54:13');
INSERT INTO `gen_table_column` VALUES (127, 18, 'examine_treatment_category', '检查或者手术订单类别（0检查 1手术）', 'int(1)', 'Integer', 'examineTreatmentCategory', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-09-14 10:52:32', '', '2024-09-14 10:54:13');
INSERT INTO `gen_table_column` VALUES (128, 18, 'doctor_id', '医生ID', 'int(11)', 'Long', 'doctorId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-09-14 10:52:32', '', '2024-09-14 10:54:13');
INSERT INTO `gen_table_column` VALUES (129, 18, 'doctor_name', '医生姓名', 'varchar(30)', 'String', 'doctorName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2024-09-14 10:52:32', '', '2024-09-14 10:54:13');
INSERT INTO `gen_table_column` VALUES (130, 18, 'doctor_status', '医生状态（0已满 1未满）', 'int(1)', 'Integer', 'doctorStatus', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', 'sys_show_hide', 5, 'admin', '2024-09-14 10:52:32', '', '2024-09-14 10:54:13');
INSERT INTO `gen_table_column` VALUES (131, 18, 'user_id', '病人ID', 'int(11)', 'Long', 'userId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-09-14 10:52:32', '', '2024-09-14 10:54:13');
INSERT INTO `gen_table_column` VALUES (132, 18, 'case_status', '订单状态（0停用 1启用）', 'int(1)', 'Integer', 'caseStatus', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', 'sys_show_hide', 7, 'admin', '2024-09-14 10:52:32', '', '2024-09-14 10:54:13');
INSERT INTO `gen_table_column` VALUES (133, 18, 'examine_treatment_date', '检查或者手术日期', 'datetime', 'Date', 'examineTreatmentDate', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 8, 'admin', '2024-09-14 10:52:32', '', '2024-09-14 10:54:13');

-- ----------------------------
-- Table structure for jiage
-- ----------------------------
DROP TABLE IF EXISTS `jiage`;
CREATE TABLE `jiage`  (
  `jiage_id` int NOT NULL AUTO_INCREMENT COMMENT '价格ID',
  `sum_money` decimal(10, 2) NULL DEFAULT NULL COMMENT '总金额',
  `medicine_id` int NULL DEFAULT NULL COMMENT '药品ID',
  `examine_id` int NULL DEFAULT NULL COMMENT '检查ID',
  `treatment_id` int NULL DEFAULT NULL COMMENT '治疗ID',
  `sickbed_id` int NULL DEFAULT NULL COMMENT '病床ID',
  PRIMARY KEY (`jiage_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '价格信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jiage
-- ----------------------------
INSERT INTO `jiage` VALUES (1, 10000.00, 1, 1, 1, 1);

-- ----------------------------
-- Table structure for medicine
-- ----------------------------
DROP TABLE IF EXISTS `medicine`;
CREATE TABLE `medicine`  (
  `medicine_id` int NOT NULL AUTO_INCREMENT COMMENT '药品ID',
  `medicine_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '药品名称',
  `medicine_price` int NOT NULL COMMENT '药品价格',
  `medicine_datetime` datetime NOT NULL COMMENT '药品生产日期',
  `medicine_count` int NOT NULL COMMENT '药品数量',
  `medicine_type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '药品单位',
  `medicine_num` int NOT NULL COMMENT '药品保质期',
  `medicine_purpose` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '药品用途',
  PRIMARY KEY (`medicine_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '药品信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of medicine
-- ----------------------------
INSERT INTO `medicine` VALUES (1, '头孢', 100, '2024-09-02 00:00:00', 100, '盒', 100, '防喝酒');
INSERT INTO `medicine` VALUES (2, '阿莫西林', 200, '2024-10-17 15:23:46', 300, '盒', 20, '啊啊');
INSERT INTO `medicine` VALUES (3, '连花清瘟胶囊', 300, '2024-10-17 15:24:19', 120, '盒', 45, '哦哦');

-- ----------------------------
-- Table structure for nurse
-- ----------------------------
DROP TABLE IF EXISTS `nurse`;
CREATE TABLE `nurse`  (
  `nurse_id` int NOT NULL AUTO_INCREMENT COMMENT '护士ID',
  `nurse_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '护士名称',
  `nurse_age` int NULL DEFAULT NULL COMMENT '年龄',
  `nurse_sex` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '性别（0男 1女 2未知）',
  `nurse_status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `nurse_birthday` datetime NULL DEFAULT NULL COMMENT '生日',
  `id_card` varchar(18) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '身份证号',
  `department_id` int NULL DEFAULT NULL COMMENT '科室ID',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `nurse_email` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '护士邮箱',
  `nurse_position` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '护士职位',
  `nurse_score` int NULL DEFAULT NULL COMMENT '护士评分',
  `nurse_zhanghao` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '护士账号',
  `nurse_password` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '护士密码',
  `nurse_phone` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '护士电话号',
  PRIMARY KEY (`nurse_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '护士信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of nurse
-- ----------------------------
INSERT INTO `nurse` VALUES (1, '刘江华', 44, '0', '0', '2024-09-17 00:00:00', '150421201011110011', 1122, '2024-09-02 15:06:56', '1944590961@qq.com', '护士长', 5, '111111', '111111', '15547681691');

-- ----------------------------
-- Table structure for payment_record
-- ----------------------------
DROP TABLE IF EXISTS `payment_record`;
CREATE TABLE `payment_record`  (
  `record_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL COMMENT '病人ID',
  `user_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '病人名称',
  `project_name` int NULL DEFAULT NULL COMMENT '项目名称',
  `payment_method` int NULL DEFAULT NULL COMMENT '支付方式（1微信 0支付宝）',
  `sum` int NULL DEFAULT NULL COMMENT '金额',
  `status` int NULL DEFAULT NULL COMMENT '支付状态（0待支付 1已支付）',
  `payment_date` datetime NULL DEFAULT NULL COMMENT '缴费日期',
  PRIMARY KEY (`record_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '缴费记录信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of payment_record
-- ----------------------------
INSERT INTO `payment_record` VALUES (1, 1, '付子墨', 1, 1, 100, 1, '2024-09-03 00:00:00');
INSERT INTO `payment_record` VALUES (2, 1, '付子墨', 2, 1, 1000, 1, '2024-09-04 08:36:10');
INSERT INTO `payment_record` VALUES (3, 1, '付子墨', 3, 1, 3000, 1, '2024-06-04 08:36:54');
INSERT INTO `payment_record` VALUES (4, 1, '付子墨', 4, 1, 2000, 1, '2024-05-04 08:37:31');
INSERT INTO `payment_record` VALUES (5, 1, '付子墨', 2, 0, 1500, 1, '2024-02-04 19:23:36');
INSERT INTO `payment_record` VALUES (6, 1, '付子墨', 1, 1, 1000, 1, '2024-06-07 11:17:58');
INSERT INTO `payment_record` VALUES (7, 1, '付子墨', 3, 1, 3000, 1, '2024-02-17 11:18:03');
INSERT INTO `payment_record` VALUES (8, 1, '付子墨', 2, NULL, 2000, 0, '2024-01-01 11:18:10');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '日历信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '已触发的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '任务详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '暂停的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '调度器状态表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name` ASC, `job_name` ASC, `job_group` ASC) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '触发器详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sickbed
-- ----------------------------
DROP TABLE IF EXISTS `sickbed`;
CREATE TABLE `sickbed`  (
  `sickbed_id` int NOT NULL AUTO_INCREMENT COMMENT '病床ID',
  `sickbed_information` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '病床信息',
  `sickbed_status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `ward_id` int NULL DEFAULT NULL COMMENT '病房ID',
  `sickbed_price` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '床位价格',
  PRIMARY KEY (`sickbed_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '病床信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sickbed
-- ----------------------------
INSERT INTO `sickbed` VALUES (1, '一号床', '0', '2024-09-02 15:09:13', 112233, 100.00);

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '参数配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2024-06-28 19:33:13', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2024-06-28 19:33:13', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2024-06-28 19:33:13', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2024-06-28 19:33:13', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2024-06-28 19:33:13', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2024-06-28 19:33:13', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-06-28 19:33:07', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-06-28 19:33:07', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-06-28 19:33:07', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-06-28 19:33:07', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-06-28 19:33:07', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-06-28 19:33:07', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-06-28 19:33:07', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-06-28 19:33:07', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-06-28 19:33:07', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-06-28 19:33:07', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2024-06-28 19:33:12', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-06-28 19:33:12', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-06-28 19:33:12', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2024-06-28 19:33:12', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2024-06-28 19:33:12', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2024-06-28 19:33:12', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2024-06-28 19:33:12', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2024-06-28 19:33:13', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2024-06-28 19:33:13', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2024-06-28 19:33:13', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2024-06-28 19:33:13', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2024-06-28 19:33:13', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2024-06-28 19:33:13', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2024-06-28 19:33:13', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2024-06-28 19:33:13', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2024-06-28 19:33:13', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2024-06-28 19:33:13', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-06-28 19:33:13', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-06-28 19:33:13', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-06-28 19:33:13', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-06-28 19:33:13', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2024-06-28 19:33:13', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-06-28 19:33:13', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-06-28 19:33:13', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-06-28 19:33:13', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-06-28 19:33:13', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-06-28 19:33:13', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2024-06-28 19:33:13', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2024-06-28 19:33:13', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2024-06-28 19:33:12', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2024-06-28 19:33:12', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2024-06-28 19:33:12', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2024-06-28 19:33:12', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2024-06-28 19:33:12', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2024-06-28 19:33:12', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2024-06-28 19:33:12', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2024-06-28 19:33:12', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2024-06-28 19:33:12', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2024-06-28 19:33:12', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2024-06-28 19:33:13', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2024-06-28 19:33:13', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2024-06-28 19:33:13', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 121 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-28 19:44:58');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-07 12:16:01');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-07 13:28:44');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-07 14:02:45');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-07 19:37:04');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-27 09:36:04');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-09-02 14:43:52');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-02 14:59:57');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-09-02 14:59:57');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-02 15:00:16');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-09-02 15:00:16');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-02 15:03:20');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-02 19:08:19');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-02 20:22:41');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-03 09:32:23');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-03 10:17:55');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-03 16:15:55');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-07 17:13:36');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-12 20:08:20');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-14 10:51:21');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-14 10:58:43');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1187 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 22, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2024-06-28 19:33:08', 'admin', '2024-07-07 12:18:02', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 33, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2024-06-28 19:33:08', 'admin', '2024-07-07 12:18:41', '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 244, 'http://ruoyi.vip', NULL, '', 0, 0, 'M', '1', '0', '', 'guide', 'admin', '2024-06-28 19:33:08', 'admin', '2024-07-07 12:18:48', '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2024-06-28 19:33:08', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2024-06-28 19:33:08', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2024-06-28 19:33:08', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2024-06-28 19:33:08', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2024-06-28 19:33:08', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2024-06-28 19:33:08', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2024-06-28 19:33:08', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2024-06-28 19:33:08', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2024-06-28 19:33:08', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2024-06-28 19:33:08', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2024-06-28 19:33:08', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2024-06-28 19:33:08', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2024-06-28 19:33:08', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2024-06-28 19:33:08', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2024-06-28 19:33:08', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2024-06-28 19:33:08', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2024-06-28 19:33:08', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2024-06-28 19:33:08', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2024-06-28 19:33:08', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2024-06-28 19:33:08', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2024-06-28 19:33:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2024-06-28 19:33:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2024-06-28 19:33:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2024-06-28 19:33:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2024-06-28 19:33:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2024-06-28 19:33:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2024-06-28 19:33:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2024-06-28 19:33:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2024-06-28 19:33:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2024-06-28 19:33:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2024-06-28 19:33:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2024-06-28 19:33:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2024-06-28 19:33:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2024-06-28 19:33:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2024-06-28 19:33:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2024-06-28 19:33:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2024-06-28 19:33:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2024-06-28 19:33:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2024-06-28 19:33:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2024-06-28 19:33:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2024-06-28 19:33:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2024-06-28 19:33:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2024-06-28 19:33:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2024-06-28 19:33:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2024-06-28 19:33:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2024-06-28 19:33:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2024-06-28 19:33:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2024-06-28 19:33:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2024-06-28 19:33:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2024-06-28 19:33:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2024-06-28 19:33:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2024-06-28 19:33:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2024-06-28 19:33:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2024-06-28 19:33:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2024-06-28 19:33:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2024-06-28 19:33:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2024-06-28 19:33:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2024-06-28 19:33:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2024-06-28 19:33:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2024-06-28 19:33:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2024-06-28 19:33:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2024-06-28 19:33:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2024-06-28 19:33:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2024-06-28 19:33:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2024-06-28 19:33:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2024-06-28 19:33:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2024-06-28 19:33:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2024-06-28 19:33:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2024-06-28 19:33:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2024-06-28 19:33:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2024-06-28 19:33:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2024-06-28 19:33:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2024-06-28 19:33:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2024-06-28 19:33:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2024-06-28 19:33:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2024-06-28 19:33:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2024-06-28 19:33:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2024-06-28 19:33:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1061, '病人操作管理', 0, 2, 'user', NULL, NULL, 1, 0, 'M', '0', '0', NULL, '#', 'admin', '2024-07-07 12:19:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1062, '医生操作管理', 0, 3, 'doctor', NULL, NULL, 1, 0, 'M', '0', '0', NULL, '#', 'admin', '2024-07-07 12:19:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1063, '护士操作管理', 0, 4, 'nurse', NULL, NULL, 1, 0, 'M', '0', '0', NULL, '#', 'admin', '2024-07-07 12:22:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1064, '病房操作管理', 0, 5, 'ward', NULL, NULL, 1, 0, 'M', '0', '0', NULL, '#', 'admin', '2024-07-07 12:22:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1065, '病床操作管理', 0, 6, 'sickbed', NULL, NULL, 1, 0, 'M', '0', '0', NULL, '#', 'admin', '2024-07-07 12:23:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1066, '订单操作管理', 0, 7, 'dingdan', NULL, NULL, 1, 0, 'M', '0', '0', NULL, '#', 'admin', '2024-07-07 12:23:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1067, '价格操作管理', 0, 8, 'jiage', NULL, NULL, 1, 0, 'M', '0', '0', NULL, '#', 'admin', '2024-07-07 12:24:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1068, '科室操作管理', 0, 9, 'department', NULL, NULL, 1, 0, 'M', '0', '0', NULL, '#', 'admin', '2024-07-07 12:24:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1069, '药品价格操作管理', 0, 10, 'medicine', NULL, NULL, 1, 0, 'M', '0', '0', NULL, '#', 'admin', '2024-07-07 12:25:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1070, '检查价格操作管理', 0, 11, 'examine', NULL, NULL, 1, 0, 'M', '0', '0', NULL, '#', 'admin', '2024-07-07 12:25:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1071, '治疗价格操作管理', 0, 12, 'treatment', NULL, NULL, 1, 0, 'M', '0', '0', NULL, '#', 'admin', '2024-07-07 12:25:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1072, '科室信息', 1068, 1, 'department', 'department/department/index', NULL, 1, 0, 'C', '0', '0', 'department:department:list', '#', 'admin', '2024-07-07 13:55:05', '', NULL, '科室信息菜单');
INSERT INTO `sys_menu` VALUES (1073, '科室信息查询', 1072, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'department:department:query', '#', 'admin', '2024-07-07 13:55:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1074, '科室信息新增', 1072, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'department:department:add', '#', 'admin', '2024-07-07 13:55:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1075, '科室信息修改', 1072, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'department:department:edit', '#', 'admin', '2024-07-07 13:55:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1076, '科室信息删除', 1072, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'department:department:remove', '#', 'admin', '2024-07-07 13:55:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1077, '科室信息导出', 1072, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'department:department:export', '#', 'admin', '2024-07-07 13:55:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1078, '订单信息', 1066, 1, 'dingdan', 'dingdan/dingdan/index', NULL, 1, 0, 'C', '0', '0', 'dingdan:dingdan:list', '#', 'admin', '2024-07-07 13:55:33', '', NULL, '订单信息菜单');
INSERT INTO `sys_menu` VALUES (1079, '订单信息查询', 1078, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'dingdan:dingdan:query', '#', 'admin', '2024-07-07 13:55:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1080, '订单信息新增', 1078, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'dingdan:dingdan:add', '#', 'admin', '2024-07-07 13:55:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1081, '订单信息修改', 1078, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'dingdan:dingdan:edit', '#', 'admin', '2024-07-07 13:55:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1082, '订单信息删除', 1078, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'dingdan:dingdan:remove', '#', 'admin', '2024-07-07 13:55:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1083, '订单信息导出', 1078, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'dingdan:dingdan:export', '#', 'admin', '2024-07-07 13:55:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1084, '医生信息', 1062, 1, 'doctor', 'doctor/doctor/index', NULL, 1, 0, 'C', '0', '0', 'doctor:doctor:list', '#', 'admin', '2024-07-07 13:56:01', '', NULL, '医生信息菜单');
INSERT INTO `sys_menu` VALUES (1085, '医生信息查询', 1084, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'doctor:doctor:query', '#', 'admin', '2024-07-07 13:56:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1086, '医生信息新增', 1084, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'doctor:doctor:add', '#', 'admin', '2024-07-07 13:56:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1087, '医生信息修改', 1084, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'doctor:doctor:edit', '#', 'admin', '2024-07-07 13:56:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1088, '医生信息删除', 1084, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'doctor:doctor:remove', '#', 'admin', '2024-07-07 13:56:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1089, '医生信息导出', 1084, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'doctor:doctor:export', '#', 'admin', '2024-07-07 13:56:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1090, '检查信息', 1070, 1, 'examine', 'examine/examine/index', NULL, 1, 0, 'C', '0', '0', 'examine:examine:list', '#', 'admin', '2024-07-07 13:56:31', '', NULL, '检查信息菜单');
INSERT INTO `sys_menu` VALUES (1091, '检查信息查询', 1090, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'examine:examine:query', '#', 'admin', '2024-07-07 13:56:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1092, '检查信息新增', 1090, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'examine:examine:add', '#', 'admin', '2024-07-07 13:56:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1093, '检查信息修改', 1090, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'examine:examine:edit', '#', 'admin', '2024-07-07 13:56:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1094, '检查信息删除', 1090, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'examine:examine:remove', '#', 'admin', '2024-07-07 13:56:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1095, '检查信息导出', 1090, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'examine:examine:export', '#', 'admin', '2024-07-07 13:56:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1096, '价格信息', 1067, 1, 'jiage', 'jiage/jiage/index', NULL, 1, 0, 'C', '0', '0', 'jiage:jiage:list', '#', 'admin', '2024-07-07 13:57:04', '', NULL, '价格信息菜单');
INSERT INTO `sys_menu` VALUES (1097, '价格信息查询', 1096, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'jiage:jiage:query', '#', 'admin', '2024-07-07 13:57:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1098, '价格信息新增', 1096, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'jiage:jiage:add', '#', 'admin', '2024-07-07 13:57:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1099, '价格信息修改', 1096, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'jiage:jiage:edit', '#', 'admin', '2024-07-07 13:57:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1100, '价格信息删除', 1096, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'jiage:jiage:remove', '#', 'admin', '2024-07-07 13:57:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1101, '价格信息导出', 1096, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'jiage:jiage:export', '#', 'admin', '2024-07-07 13:57:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1102, '药品信息', 1069, 1, 'medicine', 'medicine/medicine/index', NULL, 1, 0, 'C', '0', '0', 'medicine:medicine:list', '#', 'admin', '2024-07-07 13:57:30', '', NULL, '药品信息菜单');
INSERT INTO `sys_menu` VALUES (1103, '药品信息查询', 1102, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'medicine:medicine:query', '#', 'admin', '2024-07-07 13:57:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1104, '药品信息新增', 1102, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'medicine:medicine:add', '#', 'admin', '2024-07-07 13:57:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1105, '药品信息修改', 1102, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'medicine:medicine:edit', '#', 'admin', '2024-07-07 13:57:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1106, '药品信息删除', 1102, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'medicine:medicine:remove', '#', 'admin', '2024-07-07 13:57:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1107, '药品信息导出', 1102, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'medicine:medicine:export', '#', 'admin', '2024-07-07 13:57:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1108, '护士信息', 1063, 1, 'nurse', 'nurse/nurse/index', NULL, 1, 0, 'C', '0', '0', 'nurse:nurse:list', '#', 'admin', '2024-07-07 13:57:53', '', NULL, '护士信息菜单');
INSERT INTO `sys_menu` VALUES (1109, '护士信息查询', 1108, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'nurse:nurse:query', '#', 'admin', '2024-07-07 13:57:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1110, '护士信息新增', 1108, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'nurse:nurse:add', '#', 'admin', '2024-07-07 13:57:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1111, '护士信息修改', 1108, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'nurse:nurse:edit', '#', 'admin', '2024-07-07 13:57:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1112, '护士信息删除', 1108, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'nurse:nurse:remove', '#', 'admin', '2024-07-07 13:57:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1113, '护士信息导出', 1108, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'nurse:nurse:export', '#', 'admin', '2024-07-07 13:57:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1114, '病床信息', 1065, 1, 'sickbed', 'sickbed/sickbed/index', NULL, 1, 0, 'C', '0', '0', 'sickbed:sickbed:list', '#', 'admin', '2024-07-07 13:58:21', '', NULL, '病床信息菜单');
INSERT INTO `sys_menu` VALUES (1115, '病床信息查询', 1114, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'sickbed:sickbed:query', '#', 'admin', '2024-07-07 13:58:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1116, '病床信息新增', 1114, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'sickbed:sickbed:add', '#', 'admin', '2024-07-07 13:58:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1117, '病床信息修改', 1114, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'sickbed:sickbed:edit', '#', 'admin', '2024-07-07 13:58:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1118, '病床信息删除', 1114, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'sickbed:sickbed:remove', '#', 'admin', '2024-07-07 13:58:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1119, '病床信息导出', 1114, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'sickbed:sickbed:export', '#', 'admin', '2024-07-07 13:58:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1120, '治疗信息', 1071, 1, 'treatment', 'treatment/treatment/index', NULL, 1, 0, 'C', '0', '0', 'treatment:treatment:list', '#', 'admin', '2024-07-07 13:58:49', '', NULL, '治疗信息菜单');
INSERT INTO `sys_menu` VALUES (1121, '治疗信息查询', 1120, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'treatment:treatment:query', '#', 'admin', '2024-07-07 13:58:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1122, '治疗信息新增', 1120, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'treatment:treatment:add', '#', 'admin', '2024-07-07 13:58:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1123, '治疗信息修改', 1120, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'treatment:treatment:edit', '#', 'admin', '2024-07-07 13:58:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1124, '治疗信息删除', 1120, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'treatment:treatment:remove', '#', 'admin', '2024-07-07 13:58:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1125, '治疗信息导出', 1120, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'treatment:treatment:export', '#', 'admin', '2024-07-07 13:58:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1126, '病房信息', 1064, 1, 'ward', 'ward/ward/index', NULL, 1, 0, 'C', '0', '0', 'ward:ward:list', '#', 'admin', '2024-07-07 13:59:08', '', NULL, '病房信息菜单');
INSERT INTO `sys_menu` VALUES (1127, '病房信息查询', 1126, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'ward:ward:query', '#', 'admin', '2024-07-07 13:59:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1128, '病房信息新增', 1126, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'ward:ward:add', '#', 'admin', '2024-07-07 13:59:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1129, '病房信息修改', 1126, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'ward:ward:edit', '#', 'admin', '2024-07-07 13:59:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1130, '病房信息删除', 1126, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'ward:ward:remove', '#', 'admin', '2024-07-07 13:59:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1131, '病房信息导出', 1126, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'ward:ward:export', '#', 'admin', '2024-07-07 13:59:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1132, '病人信息', 1061, 1, 'user', 'user/user/index', NULL, 1, 0, 'C', '0', '0', 'user:user:list', '#', 'admin', '2024-07-07 14:01:30', '', NULL, '病人信息菜单');
INSERT INTO `sys_menu` VALUES (1133, '病人信息查询', 1132, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'user:user:query', '#', 'admin', '2024-07-07 14:01:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1134, '病人信息新增', 1132, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'user:user:add', '#', 'admin', '2024-07-07 14:01:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1135, '病人信息修改', 1132, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'user:user:edit', '#', 'admin', '2024-07-07 14:01:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1136, '病人信息删除', 1132, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'user:user:remove', '#', 'admin', '2024-07-07 14:01:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1137, '病人信息导出', 1132, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'user:user:export', '#', 'admin', '2024-07-07 14:01:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1138, '医院管理', 0, 13, 'hospital', NULL, NULL, 1, 0, 'M', '0', '0', NULL, '#', 'admin', '2024-08-27 09:37:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1139, '病人所处医院信息', 1138, 1, 'hospital', 'hospital/hospital/index', NULL, 1, 0, 'C', '0', '0', 'hospital:hospital:list', '#', 'admin', '2024-08-27 09:57:02', '', NULL, '病人所处医院信息菜单');
INSERT INTO `sys_menu` VALUES (1140, '病人所处医院信息查询', 1139, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'hospital:hospital:query', '#', 'admin', '2024-08-27 09:57:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1141, '病人所处医院信息新增', 1139, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'hospital:hospital:add', '#', 'admin', '2024-08-27 09:57:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1142, '病人所处医院信息修改', 1139, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'hospital:hospital:edit', '#', 'admin', '2024-08-27 09:57:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1143, '病人所处医院信息删除', 1139, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'hospital:hospital:remove', '#', 'admin', '2024-08-27 09:57:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1144, '病人所处医院信息导出', 1139, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'hospital:hospital:export', '#', 'admin', '2024-08-27 09:57:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1145, '转院订单信息', 1066, 1, 'order', 'transfer/order/index', NULL, 1, 0, 'C', '0', '0', 'transfer:order:list', '#', 'admin', '2024-08-27 09:57:23', '', NULL, '转院订单信息菜单');
INSERT INTO `sys_menu` VALUES (1146, '转院订单信息查询', 1145, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'transfer:order:query', '#', 'admin', '2024-08-27 09:57:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1147, '转院订单信息新增', 1145, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'transfer:order:add', '#', 'admin', '2024-08-27 09:57:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1148, '转院订单信息修改', 1145, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'transfer:order:edit', '#', 'admin', '2024-08-27 09:57:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1149, '转院订单信息删除', 1145, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'transfer:order:remove', '#', 'admin', '2024-08-27 09:57:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1150, '转院订单信息导出', 1145, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'transfer:order:export', '#', 'admin', '2024-08-27 09:57:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1169, '缴费记录信息', 1066, 1, 'record', 'payment/record/index', NULL, 1, 0, 'C', '0', '0', 'payment:record:list', '#', 'admin', '2024-09-03 16:53:52', '', NULL, '缴费记录信息菜单');
INSERT INTO `sys_menu` VALUES (1170, '缴费记录信息查询', 1169, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'payment:record:query', '#', 'admin', '2024-09-03 16:53:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1171, '缴费记录信息新增', 1169, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'payment:record:add', '#', 'admin', '2024-09-03 16:53:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1172, '缴费记录信息修改', 1169, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'payment:record:edit', '#', 'admin', '2024-09-03 16:53:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1173, '缴费记录信息删除', 1169, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'payment:record:remove', '#', 'admin', '2024-09-03 16:53:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1174, '缴费记录信息导出', 1169, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'payment:record:export', '#', 'admin', '2024-09-03 16:53:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1175, '病例订单信息', 1066, 1, 'case', 'case/case/index', NULL, 1, 0, 'C', '0', '0', 'case:case:list', '#', 'admin', '2024-09-12 20:11:08', '', NULL, '病例订单信息菜单');
INSERT INTO `sys_menu` VALUES (1176, '病例订单信息查询', 1175, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'case:case:query', '#', 'admin', '2024-09-12 20:11:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1177, '病例订单信息新增', 1175, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'case:case:add', '#', 'admin', '2024-09-12 20:11:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1178, '病例订单信息修改', 1175, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'case:case:edit', '#', 'admin', '2024-09-12 20:11:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1179, '病例订单信息删除', 1175, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'case:case:remove', '#', 'admin', '2024-09-12 20:11:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1180, '病例订单信息导出', 1175, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'case:case:export', '#', 'admin', '2024-09-12 20:11:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1181, '检查或手术订单信息', 1066, 1, 'ExamineTreatmentCase', 'ExamineTreatmentCase/ExamineTreatmentCase/index', NULL, 1, 0, 'C', '0', '0', 'ExamineTreatmentCase:ExamineTreatmentCase:list', '#', 'admin', '2024-09-14 10:57:39', '', NULL, '检查或手术订单信息菜单');
INSERT INTO `sys_menu` VALUES (1182, '检查或手术订单信息查询', 1181, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'ExamineTreatmentCase:ExamineTreatmentCase:query', '#', 'admin', '2024-09-14 10:57:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1183, '检查或手术订单信息新增', 1181, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'ExamineTreatmentCase:ExamineTreatmentCase:add', '#', 'admin', '2024-09-14 10:57:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1184, '检查或手术订单信息修改', 1181, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'ExamineTreatmentCase:ExamineTreatmentCase:edit', '#', 'admin', '2024-09-14 10:57:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1185, '检查或手术订单信息删除', 1181, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'ExamineTreatmentCase:ExamineTreatmentCase:remove', '#', 'admin', '2024-09-14 10:57:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1186, '检查或手术订单信息导出', 1181, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'ExamineTreatmentCase:ExamineTreatmentCase:export', '#', 'admin', '2024-09-14 10:57:39', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '通知公告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2024-06-28 19:33:14', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2024-06-28 19:33:14', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 117 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (1, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-06-28 19:33:08\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":22,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-07 12:18:02', 36);
INSERT INTO `sys_oper_log` VALUES (2, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2024-07-07 12:18:13', 14);
INSERT INTO `sys_oper_log` VALUES (3, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-06-28 19:33:08\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-07 12:18:22', 12);
INSERT INTO `sys_oper_log` VALUES (4, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-06-28 19:33:08\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":24,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-07 12:18:34', 13);
INSERT INTO `sys_oper_log` VALUES (5, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-06-28 19:33:08\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":33,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-07 12:18:41', 13);
INSERT INTO `sys_oper_log` VALUES (6, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-06-28 19:33:08\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":244,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-07 12:18:48', 13);
INSERT INTO `sys_oper_log` VALUES (7, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"病人操作管理\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"user\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-07 12:19:12', 13);
INSERT INTO `sys_oper_log` VALUES (8, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"医生操作管理\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"doctor\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-07 12:19:58', 12);
INSERT INTO `sys_oper_log` VALUES (9, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"护士操作管理\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"nurse\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-07 12:22:29', 12);
INSERT INTO `sys_oper_log` VALUES (10, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"病房操作管理\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"ward\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-07 12:22:54', 10);
INSERT INTO `sys_oper_log` VALUES (11, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"病床操作管理\",\"menuType\":\"M\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"sickbed\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-07 12:23:14', 9);
INSERT INTO `sys_oper_log` VALUES (12, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"订单操作管理\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"dingdan\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-07 12:23:45', 8);
INSERT INTO `sys_oper_log` VALUES (13, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"价格操作管理\",\"menuType\":\"M\",\"orderNum\":8,\"params\":{},\"parentId\":0,\"path\":\"jiage\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-07 12:24:09', 10);
INSERT INTO `sys_oper_log` VALUES (14, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"科室操作管理\",\"menuType\":\"M\",\"orderNum\":9,\"params\":{},\"parentId\":0,\"path\":\"department\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-07 12:24:33', 10);
INSERT INTO `sys_oper_log` VALUES (15, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"药品价格操作管理\",\"menuType\":\"M\",\"orderNum\":10,\"params\":{},\"parentId\":0,\"path\":\"medicine\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-07 12:25:01', 9);
INSERT INTO `sys_oper_log` VALUES (16, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"检查价格操作管理\",\"menuType\":\"M\",\"orderNum\":11,\"params\":{},\"parentId\":0,\"path\":\"examine\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-07 12:25:36', 10);
INSERT INTO `sys_oper_log` VALUES (17, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"治疗价格操作管理\",\"menuType\":\"M\",\"orderNum\":12,\"params\":{},\"parentId\":0,\"path\":\"treatment\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-07 12:25:59', 9);
INSERT INTO `sys_oper_log` VALUES (18, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"treatment,examine,medicine,department,jiage,dingdan,sickbed,ward,nurse,doctor\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-07 13:29:10', 280);
INSERT INTO `sys_oper_log` VALUES (19, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"user\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-07 13:29:18', 65);
INSERT INTO `sys_oper_log` VALUES (20, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"department\",\"className\":\"Department\",\"columns\":[{\"capJavaField\":\"DepartmentId\",\"columnComment\":\"科室ID\",\"columnId\":1,\"columnName\":\"department_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 13:29:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"departmentId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DepartmentName\",\"columnComment\":\"科室名称\",\"columnId\":2,\"columnName\":\"department_name\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 13:29:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"departmentName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DepartmentNum\",\"columnComment\":\"科室楼层\",\"columnId\":3,\"columnName\":\"department_num\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 13:29:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"departmentNum\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DepartmentCategory\",\"columnComment\":\"科室类别\",\"columnId\":4,\"columnName\":\"department_category\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 13:29:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-07 13:38:01', 32);
INSERT INTO `sys_oper_log` VALUES (21, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"dingdan\",\"className\":\"Dingdan\",\"columns\":[{\"capJavaField\":\"DingdanId\",\"columnComment\":\"订单ID\",\"columnId\":5,\"columnName\":\"dingdan_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 13:29:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"dingdanId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SickbedId\",\"columnComment\":\"病床ID\",\"columnId\":6,\"columnName\":\"sickbed_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 13:29:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"sickbedId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"NurseId\",\"columnComment\":\"护士ID\",\"columnId\":7,\"columnName\":\"nurse_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 13:29:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"nurseId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DoctorId\",\"columnComment\":\"医生ID\",\"columnId\":8,\"columnName\":\"doctor_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 13:29:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"ja', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-07 13:39:46', 39);
INSERT INTO `sys_oper_log` VALUES (22, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"dingdan\",\"className\":\"Dingdan\",\"columns\":[{\"capJavaField\":\"DingdanId\",\"columnComment\":\"订单ID\",\"columnId\":5,\"columnName\":\"dingdan_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 13:29:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"dingdanId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-07-07 13:39:46\",\"usableColumn\":false},{\"capJavaField\":\"SickbedId\",\"columnComment\":\"病床ID\",\"columnId\":6,\"columnName\":\"sickbed_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 13:29:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"sickbedId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-07-07 13:39:46\",\"usableColumn\":false},{\"capJavaField\":\"NurseId\",\"columnComment\":\"护士ID\",\"columnId\":7,\"columnName\":\"nurse_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 13:29:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"nurseId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-07-07 13:39:46\",\"usableColumn\":false},{\"capJavaField\":\"DoctorId\",\"columnComment\":\"医生ID\",\"columnId\":8,\"columnName\":\"doctor_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 13:29:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-07 13:41:00', 26);
INSERT INTO `sys_oper_log` VALUES (23, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"department\",\"className\":\"Department\",\"columns\":[{\"capJavaField\":\"DepartmentId\",\"columnComment\":\"科室ID\",\"columnId\":1,\"columnName\":\"department_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 13:29:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"departmentId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-07-07 13:38:01\",\"usableColumn\":false},{\"capJavaField\":\"DepartmentName\",\"columnComment\":\"科室名称\",\"columnId\":2,\"columnName\":\"department_name\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 13:29:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"departmentName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-07-07 13:38:01\",\"usableColumn\":false},{\"capJavaField\":\"DepartmentNum\",\"columnComment\":\"科室楼层\",\"columnId\":3,\"columnName\":\"department_num\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 13:29:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"departmentNum\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-07-07 13:38:01\",\"usableColumn\":false},{\"capJavaField\":\"DepartmentCategory\",\"columnComment\":\"科室类别\",\"columnId\":4,\"columnName\":\"department_category\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 13:29:10\",', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-07 13:41:09', 17);
INSERT INTO `sys_oper_log` VALUES (24, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"doctor\",\"className\":\"Doctor\",\"columns\":[{\"capJavaField\":\"DoctorId\",\"columnComment\":\"医生ID\",\"columnId\":13,\"columnName\":\"doctor_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 13:29:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"doctorId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DoctorName\",\"columnComment\":\"医生名称\",\"columnId\":14,\"columnName\":\"doctor_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 13:29:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"doctorName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DoctorAge\",\"columnComment\":\"年龄\",\"columnId\":15,\"columnName\":\"doctor_age\",\"columnType\":\"int(3)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 13:29:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"doctorAge\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DoctorSex\",\"columnComment\":\"性别（0男 1女 2未知）\",\"columnId\":16,\"columnName\":\"doctor_sex\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 13:29:10\",\"dictType\":\"sys_user_sex\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-07 13:42:22', 46);
INSERT INTO `sys_oper_log` VALUES (25, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"examine\",\"className\":\"Examine\",\"columns\":[{\"capJavaField\":\"ExamineId\",\"columnComment\":\"检查ID\",\"columnId\":22,\"columnName\":\"examine_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 13:29:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"examineId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ExamineName\",\"columnComment\":\"检查名称\",\"columnId\":23,\"columnName\":\"examine_name\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 13:29:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"examineName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ExaminePrice\",\"columnComment\":\"检查价格\",\"columnId\":24,\"columnName\":\"examine_price\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 13:29:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"examinePrice\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ExamineType\",\"columnComment\":\"检查类型\",\"columnId\":25,\"columnName\":\"examine_type\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 13:29:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-07 13:42:49', 28);
INSERT INTO `sys_oper_log` VALUES (26, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"jiage\",\"className\":\"Jiage\",\"columns\":[{\"capJavaField\":\"JiageId\",\"columnComment\":\"价格ID\",\"columnId\":26,\"columnName\":\"jiage_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 13:29:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"jiageId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SumMoney\",\"columnComment\":\"总金额\",\"columnId\":27,\"columnName\":\"sum_money\",\"columnType\":\"decimal(10,2)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 13:29:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"sumMoney\",\"javaType\":\"BigDecimal\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"MedicineId\",\"columnComment\":\"药品ID\",\"columnId\":28,\"columnName\":\"medicine_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 13:29:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"medicineId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ExamineId\",\"columnComment\":\"检查ID\",\"columnId\":29,\"columnName\":\"examine_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 13:29:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequir', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-07 13:43:13', 32);
INSERT INTO `sys_oper_log` VALUES (27, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"medicine\",\"className\":\"Medicine\",\"columns\":[{\"capJavaField\":\"MedicineId\",\"columnComment\":\"药品ID\",\"columnId\":32,\"columnName\":\"medicine_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 13:29:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"medicineId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"MedicineName\",\"columnComment\":\"药品名称\",\"columnId\":33,\"columnName\":\"medicine_name\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 13:29:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"medicineName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"MedicinePrice\",\"columnComment\":\"药品价格\",\"columnId\":34,\"columnName\":\"medicine_price\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 13:29:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"medicinePrice\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"MedicineDatetime\",\"columnComment\":\"药品生产日期\",\"columnId\":35,\"columnName\":\"medicine_datetime\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 13:29:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-07 13:43:37', 40);
INSERT INTO `sys_oper_log` VALUES (28, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"nurse\",\"className\":\"Nurse\",\"columns\":[{\"capJavaField\":\"NurseId\",\"columnComment\":\"护士ID\",\"columnId\":40,\"columnName\":\"nurse_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 13:29:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"nurseId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"NurseName\",\"columnComment\":\"护士名称\",\"columnId\":41,\"columnName\":\"nurse_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 13:29:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"nurseName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"NurseAge\",\"columnComment\":\"年龄\",\"columnId\":42,\"columnName\":\"nurse_age\",\"columnType\":\"int(3)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 13:29:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"nurseAge\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"NurseSex\",\"columnComment\":\"性别（0男 1女 2未知）\",\"columnId\":43,\"columnName\":\"nurse_sex\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 13:29:10\",\"dictType\":\"sys_user_sex\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-07 13:44:14', 49);
INSERT INTO `sys_oper_log` VALUES (29, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"sickbed\",\"className\":\"Sickbed\",\"columns\":[{\"capJavaField\":\"SickbedId\",\"columnComment\":\"病床ID\",\"columnId\":49,\"columnName\":\"sickbed_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 13:29:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"sickbedId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SickbedInformation\",\"columnComment\":\"病床信息\",\"columnId\":50,\"columnName\":\"sickbed_information\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 13:29:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"sickbedInformation\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SickbedStatus\",\"columnComment\":\"状态（0正常 1停用）\",\"columnId\":51,\"columnName\":\"sickbed_status\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 13:29:10\",\"dictType\":\"sys_show_hide\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"sickbedStatus\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":52,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 13:29:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"i', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-07 13:45:11', 31);
INSERT INTO `sys_oper_log` VALUES (30, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"treatment\",\"className\":\"Treatment\",\"columns\":[{\"capJavaField\":\"TreatmentId\",\"columnComment\":\"治疗ID\",\"columnId\":55,\"columnName\":\"treatment_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 13:29:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"treatmentId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TreatmentName\",\"columnComment\":\"治疗名称\",\"columnId\":56,\"columnName\":\"treatment_name\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 13:29:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"treatmentName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TreatmentPrice\",\"columnComment\":\"治疗价格\",\"columnId\":57,\"columnName\":\"treatment_price\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 13:29:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"treatmentPrice\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TreatmentType\",\"columnComment\":\"治疗类型\",\"columnId\":58,\"columnName\":\"treatment_type\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 13:29:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInse', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-07 13:45:45', 32);
INSERT INTO `sys_oper_log` VALUES (31, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"ward\",\"className\":\"Ward\",\"columns\":[{\"capJavaField\":\"WardId\",\"columnComment\":\"病房ID\",\"columnId\":60,\"columnName\":\"ward_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 13:29:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"wardId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"WardInformation\",\"columnComment\":\"病房信息\",\"columnId\":61,\"columnName\":\"ward_information\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 13:29:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"wardInformation\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"WardStatus\",\"columnComment\":\"状态（0正常 1停用）\",\"columnId\":62,\"columnName\":\"ward_status\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 13:29:10\",\"dictType\":\"sys_show_hide\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"wardStatus\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":63,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 13:29:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isReq', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-07 13:47:27', 38);
INSERT INTO `sys_oper_log` VALUES (32, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"department\",\"className\":\"Department\",\"columns\":[{\"capJavaField\":\"DepartmentId\",\"columnComment\":\"科室ID\",\"columnId\":1,\"columnName\":\"department_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 13:29:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"departmentId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-07-07 13:41:09\",\"usableColumn\":false},{\"capJavaField\":\"DepartmentName\",\"columnComment\":\"科室名称\",\"columnId\":2,\"columnName\":\"department_name\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 13:29:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"departmentName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-07-07 13:41:09\",\"usableColumn\":false},{\"capJavaField\":\"DepartmentNum\",\"columnComment\":\"科室楼层\",\"columnId\":3,\"columnName\":\"department_num\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 13:29:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"departmentNum\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-07-07 13:41:09\",\"usableColumn\":false},{\"capJavaField\":\"DepartmentCategory\",\"columnComment\":\"科室类别\",\"columnId\":4,\"columnName\":\"department_category\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 13:29:10\",', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-07 13:47:43', 28);
INSERT INTO `sys_oper_log` VALUES (33, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"user\",\"className\":\"User\",\"columns\":[{\"capJavaField\":\"UserId\",\"columnComment\":\"病人编号\",\"columnId\":64,\"columnName\":\"user_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 13:29:18\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserName\",\"columnComment\":\"病人名称\",\"columnId\":65,\"columnName\":\"user_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 13:29:18\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"userName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserAge\",\"columnComment\":\"病人年龄\",\"columnId\":66,\"columnName\":\"user_age\",\"columnType\":\"int(3)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 13:29:18\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"userAge\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserSex\",\"columnComment\":\"性别（0男 1女 2未知）\",\"columnId\":67,\"columnName\":\"user_sex\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 13:29:18\",\"dictType\":\"sys_user_sex\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"is', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-07 13:49:01', 76);
INSERT INTO `sys_oper_log` VALUES (34, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"department\",\"className\":\"Department\",\"columns\":[{\"capJavaField\":\"DepartmentId\",\"columnComment\":\"科室ID\",\"columnId\":1,\"columnName\":\"department_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 13:29:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"departmentId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-07-07 13:47:42\",\"usableColumn\":false},{\"capJavaField\":\"DepartmentName\",\"columnComment\":\"科室名称\",\"columnId\":2,\"columnName\":\"department_name\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 13:29:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"departmentName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-07-07 13:47:42\",\"usableColumn\":false},{\"capJavaField\":\"DepartmentNum\",\"columnComment\":\"科室楼层\",\"columnId\":3,\"columnName\":\"department_num\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 13:29:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"departmentNum\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-07-07 13:47:42\",\"usableColumn\":false},{\"capJavaField\":\"DepartmentCategory\",\"columnComment\":\"科室类别\",\"columnId\":4,\"columnName\":\"department_category\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 13:29:10\",', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-07 13:49:54', 24);
INSERT INTO `sys_oper_log` VALUES (35, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"dingdan\",\"className\":\"Dingdan\",\"columns\":[{\"capJavaField\":\"DingdanId\",\"columnComment\":\"订单ID\",\"columnId\":5,\"columnName\":\"dingdan_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 13:29:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"dingdanId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-07-07 13:41:00\",\"usableColumn\":false},{\"capJavaField\":\"SickbedId\",\"columnComment\":\"病床ID\",\"columnId\":6,\"columnName\":\"sickbed_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 13:29:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"sickbedId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-07-07 13:41:00\",\"usableColumn\":false},{\"capJavaField\":\"NurseId\",\"columnComment\":\"护士ID\",\"columnId\":7,\"columnName\":\"nurse_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 13:29:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"nurseId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-07-07 13:41:00\",\"usableColumn\":false},{\"capJavaField\":\"DoctorId\",\"columnComment\":\"医生ID\",\"columnId\":8,\"columnName\":\"doctor_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-07 13:29:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-07 13:50:08', 39);
INSERT INTO `sys_oper_log` VALUES (36, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"department,dingdan,doctor,examine,jiage,medicine,nurse,sickbed,treatment,ward\"}', NULL, 0, NULL, '2024-07-07 13:51:12', 806);
INSERT INTO `sys_oper_log` VALUES (37, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"user\"}', NULL, 0, NULL, '2024-07-07 13:59:24', 121);
INSERT INTO `sys_oper_log` VALUES (38, '病人信息', 1, 'com.ruoyi.user.controller.UserController.add()', 'POST', 1, 'admin', '研发部门', '/user/user', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-07-07 14:03:54\",\"dingdanId\":11111111,\"doctorId\":111,\"idCard\":\"11111\",\"nurseId\":111111,\"params\":{},\"sickbedId\":11111,\"userAge\":11,\"userBirthday\":\"2024-07-10\",\"userCase\":\"无\",\"userId\":1,\"userName\":\"付子墨\",\"userOrder\":\"无\",\"userPassword\":\"111111\",\"userPhone\":\"111111111\",\"userSex\":\"0\",\"userStatus\":\"0\",\"userZhanghao\":\"11111111\",\"wardId\":11111}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-07 14:03:54', 20);
INSERT INTO `sys_oper_log` VALUES (39, '病人信息', 2, 'com.ruoyi.user.controller.UserController.edit()', 'PUT', 1, 'admin', '研发部门', '/user/user', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-07-07 14:03:55\",\"dingdanId\":11111111,\"doctorId\":111,\"idCard\":\"11111\",\"nurseId\":111111,\"params\":{},\"sickbedId\":11111,\"userAge\":11,\"userBirthday\":\"2024-07-10\",\"userCase\":\"无\",\"userId\":1,\"userName\":\"付子墨\",\"userOrder\":\"无\",\"userPassword\":\"111111\",\"userPhone\":\"1111111\",\"userSex\":\"0\",\"userStatus\":\"0\",\"userZhanghao\":\"11111111\",\"wardId\":11111}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-07 14:04:04', 10);
INSERT INTO `sys_oper_log` VALUES (40, '医生信息', 1, 'com.ruoyi.doctor.controller.DoctorController.add()', 'POST', 1, 'admin', '研发部门', '/doctor/doctor', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-07-07 14:04:29\",\"departmentId\":111,\"doctorAge\":66,\"doctorBirthday\":\"2024-07-09\",\"doctorId\":1,\"doctorName\":\"胡思淼\",\"doctorSex\":\"0\",\"doctorStatus\":\"0\",\"idCard\":\"1111111\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-07 14:04:29', 11);
INSERT INTO `sys_oper_log` VALUES (41, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"医院管理\",\"menuType\":\"M\",\"orderNum\":13,\"params\":{},\"parentId\":0,\"path\":\"hospital\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-27 09:37:05', 30);
INSERT INTO `sys_oper_log` VALUES (42, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"sys_transfer_order,sys_user_hospital\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-27 09:52:10', 291);
INSERT INTO `sys_oper_log` VALUES (43, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"order\",\"className\":\"SysTransferOrder\",\"columns\":[{\"capJavaField\":\"TransferOrderId\",\"columnComment\":\"转院订单ID\",\"columnId\":82,\"columnName\":\"transfer_order_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-27 09:52:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"transferOrderId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"病人ID\",\"columnId\":83,\"columnName\":\"user_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-27 09:52:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"HospitalId\",\"columnComment\":\"所在医院ID\",\"columnId\":84,\"columnName\":\"hospital_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-27 09:52:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"hospitalId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"NewHospitalId\",\"columnComment\":\"欲转医院ID\",\"columnId\":85,\"columnName\":\"new_hospital_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-27 09:52:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-27 09:53:45', 40);
INSERT INTO `sys_oper_log` VALUES (44, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"order\",\"className\":\"SysTransferOrder\",\"columns\":[{\"capJavaField\":\"TransferOrderId\",\"columnComment\":\"转院订单ID\",\"columnId\":82,\"columnName\":\"transfer_order_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-27 09:52:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"transferOrderId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"updateTime\":\"2024-08-27 09:53:45\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"病人ID\",\"columnId\":83,\"columnName\":\"user_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-27 09:52:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"updateTime\":\"2024-08-27 09:53:45\",\"usableColumn\":false},{\"capJavaField\":\"HospitalId\",\"columnComment\":\"所在医院ID\",\"columnId\":84,\"columnName\":\"hospital_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-27 09:52:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"hospitalId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"updateTime\":\"2024-08-27 09:53:45\",\"usableColumn\":false},{\"capJavaField\":\"NewHospitalId\",\"columnComment\":\"欲转医院ID\",\"columnId\":85,\"columnName\":\"new_hospital_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-27 09:52:10\",\"dictType\":\"\",\"edit\":true,\"h', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-27 09:54:09', 32);
INSERT INTO `sys_oper_log` VALUES (45, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"hospital\",\"className\":\"SysUserHospital\",\"columns\":[{\"capJavaField\":\"UserId\",\"columnComment\":\"病人编号\",\"columnId\":89,\"columnName\":\"user_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-27 09:52:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":13,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"HospitalId\",\"columnComment\":\"医院编号\",\"columnId\":90,\"columnName\":\"hospital_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-27 09:52:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"hospitalId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":13,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"HospitalName\",\"columnComment\":\"医院名称\",\"columnId\":91,\"columnName\":\"hospital_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-27 09:52:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"hospitalName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":13,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"HospitalDizhi\",\"columnComment\":\"医院地址\",\"columnId\":92,\"columnName\":\"hospital_dizhi\",\"columnType\":\"varchar(60)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-27 09:52:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-27 09:54:39', 25);
INSERT INTO `sys_oper_log` VALUES (46, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_user_hospital,sys_transfer_order\"}', NULL, 0, NULL, '2024-08-27 09:54:49', 285);
INSERT INTO `sys_oper_log` VALUES (47, '价格信息', 1, 'com.ruoyi.jiage.controller.JiageController.add()', 'POST', 1, 'admin', '研发部门', '/jiage/jiage', '127.0.0.1', '内网IP', '{\"examineId\":233333,\"jiageId\":1,\"medicineId\":123333,\"params\":{},\"sickbedId\":443555,\"sumMoney\":10000,\"treatmentId\":444433}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-02 15:03:49', 15);
INSERT INTO `sys_oper_log` VALUES (48, '病人信息', 1, 'com.ruoyi.user.controller.UserController.add()', 'POST', 1, 'admin', '研发部门', '/user/user', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-09-02 15:05:35\",\"dingdanId\":11111,\"doctorId\":1233342,\"idCard\":\"150421111111110089\",\"nurseId\":1433523,\"params\":{},\"sickbedId\":111222,\"userAge\":11,\"userBirthday\":\"2024-09-23\",\"userCase\":\"夜盲症\",\"userId\":2,\"userName\":\"功夫熊猫\",\"userOrder\":\"注射叶绿素\",\"userPassword\":\"111111\",\"userPhone\":\"111111111\",\"userSex\":\"1\",\"userStatus\":\"0\",\"userZhanghao\":\"123456\",\"wardId\":112334}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-02 15:05:36', 28);
INSERT INTO `sys_oper_log` VALUES (49, '医生信息', 1, 'com.ruoyi.doctor.controller.DoctorController.add()', 'POST', 1, 'admin', '研发部门', '/doctor/doctor', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-09-02 15:06:16\",\"departmentId\":1234323,\"doctorAge\":22,\"doctorBirthday\":\"2024-09-16\",\"doctorId\":2,\"doctorName\":\"华佗\",\"doctorSex\":\"0\",\"doctorStatus\":\"0\",\"idCard\":\"150421200212121122\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-02 15:06:16', 20);
INSERT INTO `sys_oper_log` VALUES (50, '护士信息', 1, 'com.ruoyi.nurse.controller.NurseController.add()', 'POST', 1, 'admin', '研发部门', '/nurse/nurse', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-09-02 15:06:55\",\"departmentId\":1122,\"idCard\":\"150421201011110011\",\"nurseAge\":44,\"nurseBirthday\":\"2024-09-17\",\"nurseId\":1,\"nurseName\":\"刘江华\",\"nurseSex\":\"0\",\"nurseStatus\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-02 15:06:55', 17);
INSERT INTO `sys_oper_log` VALUES (51, '病房信息', 1, 'com.ruoyi.ward.controller.WardController.add()', 'POST', 1, 'admin', '研发部门', '/ward/ward', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-09-02 15:07:19\",\"params\":{},\"wardId\":1,\"wardInformation\":\"儿童病房\",\"wardStatus\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-02 15:07:19', 17);
INSERT INTO `sys_oper_log` VALUES (52, '转院订单信息', 3, 'com.ruoyi.transfer.controller.SysTransferOrderController.remove()', 'DELETE', 1, 'admin', '研发部门', '/transfer/order/4286448997495', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-02 15:08:34', 8);
INSERT INTO `sys_oper_log` VALUES (53, '转院订单信息', 3, 'com.ruoyi.transfer.controller.SysTransferOrderController.remove()', 'DELETE', 1, 'admin', '研发部门', '/transfer/order/4291977134069', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-02 15:08:36', 6);
INSERT INTO `sys_oper_log` VALUES (54, '转院订单信息', 3, 'com.ruoyi.transfer.controller.SysTransferOrderController.remove()', 'DELETE', 1, 'admin', '研发部门', '/transfer/order/4298430647893', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-02 15:08:38', 7);
INSERT INTO `sys_oper_log` VALUES (55, '转院订单信息', 3, 'com.ruoyi.transfer.controller.SysTransferOrderController.remove()', 'DELETE', 1, 'admin', '研发部门', '/transfer/order/4302235769624', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-02 15:08:39', 7);
INSERT INTO `sys_oper_log` VALUES (56, '病床信息', 1, 'com.ruoyi.sickbed.controller.SickbedController.add()', 'POST', 1, 'admin', '研发部门', '/sickbed/sickbed', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-09-02 15:09:13\",\"params\":{},\"sickbedId\":1,\"sickbedInformation\":\"一号床\",\"sickbedPrice\":100,\"sickbedStatus\":\"0\",\"wardId\":112233}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-02 15:09:13', 9);
INSERT INTO `sys_oper_log` VALUES (57, '订单信息', 1, 'com.ruoyi.dingdan.controller.DingdanController.add()', 'POST', 1, 'admin', '研发部门', '/dingdan/dingdan', '127.0.0.1', '内网IP', '{\"dingdanId\":1,\"dingdanStatus\":0,\"doctorId\":1,\"jiageId\":1,\"nurseId\":1,\"params\":{},\"sickbedId\":1,\"updateDataTime\":\"2024-09-02\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-02 15:10:59', 14);
INSERT INTO `sys_oper_log` VALUES (58, '价格信息', 2, 'com.ruoyi.jiage.controller.JiageController.edit()', 'PUT', 1, 'admin', '研发部门', '/jiage/jiage', '127.0.0.1', '内网IP', '{\"examineId\":1,\"jiageId\":1,\"medicineId\":1,\"params\":{},\"sickbedId\":1,\"sumMoney\":10000,\"treatmentId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-02 15:11:22', 7);
INSERT INTO `sys_oper_log` VALUES (59, '治疗信息', 1, 'com.ruoyi.treatment.controller.TreatmentController.add()', 'POST', 1, 'admin', '研发部门', '/treatment/treatment', '127.0.0.1', '内网IP', '{\"doctorId\":111,\"params\":{},\"treatmentName\":\"脑瘤\",\"treatmentPrice\":100}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'treatment_type\' doesn\'t have a default value\r\n### The error may exist in file [D:\\毕业设计\\RuoYi-Vue\\ruoyi-admin\\target\\classes\\mapper\\treatment\\TreatmentMapper.xml]\r\n### The error may involve com.ruoyi.treatment.mapper.TreatmentMapper.insertTreatment-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into treatment          ( treatment_name,             treatment_price,                          doctor_id )           values ( ?,             ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'treatment_type\' doesn\'t have a default value\n; Field \'treatment_type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'treatment_type\' doesn\'t have a default value', '2024-09-02 15:11:52', 87);
INSERT INTO `sys_oper_log` VALUES (60, '检查信息', 1, 'com.ruoyi.examine.controller.ExamineController.add()', 'POST', 1, 'admin', '研发部门', '/examine/examine', '127.0.0.1', '内网IP', '{\"examineName\":\"抽血\",\"examinePrice\":100,\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'examine_type\' doesn\'t have a default value\r\n### The error may exist in file [D:\\毕业设计\\RuoYi-Vue\\ruoyi-admin\\target\\classes\\mapper\\examine\\ExamineMapper.xml]\r\n### The error may involve com.ruoyi.examine.mapper.ExamineMapper.insertExamine-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into examine          ( examine_name,             examine_price )           values ( ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'examine_type\' doesn\'t have a default value\n; Field \'examine_type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'examine_type\' doesn\'t have a default value', '2024-09-02 15:12:23', 5);
INSERT INTO `sys_oper_log` VALUES (61, '药品信息', 1, 'com.ruoyi.medicine.controller.MedicineController.add()', 'POST', 1, 'admin', '研发部门', '/medicine/medicine', '127.0.0.1', '内网IP', '{\"medicineCount\":1,\"medicineDatetime\":\"2024-09-04\",\"medicineName\":\"头孢\",\"medicineNum\":100,\"medicinePrice\":22,\"medicinePurpose\":\"没用\",\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'medicine_type\' doesn\'t have a default value\r\n### The error may exist in file [D:\\毕业设计\\RuoYi-Vue\\ruoyi-admin\\target\\classes\\mapper\\medicine\\MedicineMapper.xml]\r\n### The error may involve com.ruoyi.medicine.mapper.MedicineMapper.insertMedicine-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into medicine          ( medicine_name,             medicine_price,             medicine_datetime,             medicine_count,                          medicine_num,             medicine_purpose )           values ( ?,             ?,             ?,             ?,                          ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'medicine_type\' doesn\'t have a default value\n; Field \'medicine_type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'medicine_type\' doesn\'t have a default value', '2024-09-02 15:13:31', 12);
INSERT INTO `sys_oper_log` VALUES (62, '药品信息', 1, 'com.ruoyi.medicine.controller.MedicineController.add()', 'POST', 1, 'admin', '研发部门', '/medicine/medicine', '127.0.0.1', '内网IP', '{\"medicineCount\":1,\"medicineDatetime\":\"2024-09-10\",\"medicineName\":\"1\",\"medicineNum\":1,\"medicinePrice\":1,\"medicinePurpose\":\"1\",\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'medicine_type\' doesn\'t have a default value\r\n### The error may exist in file [D:\\毕业设计\\RuoYi-Vue\\ruoyi-admin\\target\\classes\\mapper\\medicine\\MedicineMapper.xml]\r\n### The error may involve com.ruoyi.medicine.mapper.MedicineMapper.insertMedicine-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into medicine          ( medicine_name,             medicine_price,             medicine_datetime,             medicine_count,                          medicine_num,             medicine_purpose )           values ( ?,             ?,             ?,             ?,                          ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'medicine_type\' doesn\'t have a default value\n; Field \'medicine_type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'medicine_type\' doesn\'t have a default value', '2024-09-02 15:14:50', 5);
INSERT INTO `sys_oper_log` VALUES (63, '药品信息', 1, 'com.ruoyi.medicine.controller.MedicineController.add()', 'POST', 1, 'admin', '研发部门', '/medicine/medicine', '127.0.0.1', '内网IP', '{\"medicineCount\":100,\"medicineDatetime\":\"2024-09-02\",\"medicineId\":1,\"medicineName\":\"头孢\",\"medicineNum\":100,\"medicinePrice\":100,\"medicinePurpose\":\"防喝酒\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-02 15:24:07', 113);
INSERT INTO `sys_oper_log` VALUES (64, '检查信息', 1, 'com.ruoyi.examine.controller.ExamineController.add()', 'POST', 1, 'admin', '研发部门', '/examine/examine', '127.0.0.1', '内网IP', '{\"examineName\":\"1\",\"examinePrice\":1,\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'examine_type\' doesn\'t have a default value\r\n### The error may exist in file [D:\\毕业设计\\RuoYi-Vue\\ruoyi-admin\\target\\classes\\mapper\\examine\\ExamineMapper.xml]\r\n### The error may involve com.ruoyi.examine.mapper.ExamineMapper.insertExamine-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into examine          ( examine_name,             examine_price )           values ( ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'examine_type\' doesn\'t have a default value\n; Field \'examine_type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'examine_type\' doesn\'t have a default value', '2024-09-02 15:24:19', 39);
INSERT INTO `sys_oper_log` VALUES (65, '科室信息', 1, 'com.ruoyi.department.controller.DepartmentController.add()', 'POST', 1, 'admin', '研发部门', '/department/department', '127.0.0.1', '内网IP', '{\"departmentCategory\":\"儿童\",\"departmentId\":1,\"departmentName\":\"儿科\",\"departmentNum\":3,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-02 15:25:09', 19);
INSERT INTO `sys_oper_log` VALUES (66, '治疗信息', 1, 'com.ruoyi.treatment.controller.TreatmentController.add()', 'POST', 1, 'admin', '研发部门', '/treatment/treatment', '127.0.0.1', '内网IP', '{\"doctorId\":1,\"params\":{},\"treatmentName\":\"1\",\"treatmentPrice\":1}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'treatment_type\' doesn\'t have a default value\r\n### The error may exist in file [D:\\毕业设计\\RuoYi-Vue\\ruoyi-admin\\target\\classes\\mapper\\treatment\\TreatmentMapper.xml]\r\n### The error may involve com.ruoyi.treatment.mapper.TreatmentMapper.insertTreatment-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into treatment          ( treatment_name,             treatment_price,                          doctor_id )           values ( ?,             ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'treatment_type\' doesn\'t have a default value\n; Field \'treatment_type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'treatment_type\' doesn\'t have a default value', '2024-09-02 15:25:27', 14);
INSERT INTO `sys_oper_log` VALUES (67, '治疗信息', 1, 'com.ruoyi.treatment.controller.TreatmentController.add()', 'POST', 1, 'admin', '研发部门', '/treatment/treatment', '127.0.0.1', '内网IP', '{\"doctorId\":121212,\"params\":{},\"treatmentId\":1,\"treatmentName\":\"化疗\",\"treatmentPrice\":1000}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-02 15:26:26', 238);
INSERT INTO `sys_oper_log` VALUES (68, '检查信息', 1, 'com.ruoyi.examine.controller.ExamineController.add()', 'POST', 1, 'admin', '研发部门', '/examine/examine', '127.0.0.1', '内网IP', '{\"examineId\":1,\"examineName\":\"抽血\",\"examinePrice\":300,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-02 15:26:39', 16);
INSERT INTO `sys_oper_log` VALUES (69, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"payment_record\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-03 10:18:13', 76);
INSERT INTO `sys_oper_log` VALUES (70, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"record\",\"className\":\"PaymentRecord\",\"columns\":[{\"capJavaField\":\"UserId\",\"columnComment\":\"病人ID\",\"columnId\":94,\"columnName\":\"userId\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-03 10:18:13\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":14,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserName\",\"columnComment\":\"病人名称\",\"columnId\":95,\"columnName\":\"userName\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-03 10:18:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"userName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":14,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ProjectName\",\"columnComment\":\"项目名称\",\"columnId\":96,\"columnName\":\"projectName\",\"columnType\":\"int(1)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-03 10:18:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"projectName\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":14,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PaymentMethod\",\"columnComment\":\"支付方式（1微信 0支付宝）\",\"columnId\":97,\"columnName\":\"paymentMethod\",\"columnType\":\"int(1)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-03 10:18:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-03 10:19:25', 43);
INSERT INTO `sys_oper_log` VALUES (71, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"payment_record\"}', NULL, 0, NULL, '2024-09-03 10:19:29', 206);
INSERT INTO `sys_oper_log` VALUES (72, '缴费记录信息', 1, 'com.ruoyi.payment.controller.PaymentRecordController.add()', 'POST', 1, 'admin', '研发部门', '/payment/record', '127.0.0.1', '内网IP', '{\"params\":{},\"paymentDate\":\"2024-09-01\",\"paymentMethod\":1,\"projectName\":1,\"sum\":100,\"userName\":\"付子墨\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'userId\' doesn\'t have a default value\r\n### The error may exist in file [D:\\毕业设计\\RuoYi-Vue\\ruoyi-admin\\target\\classes\\mapper\\payment\\PaymentRecordMapper.xml]\r\n### The error may involve com.ruoyi.payment.mapper.PaymentRecordMapper.insertPaymentRecord-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into payment_record          ( userName,             projectName,             paymentMethod,             sum,                          paymentDate )           values ( ?,             ?,             ?,             ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'userId\' doesn\'t have a default value\n; Field \'userId\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'userId\' doesn\'t have a default value', '2024-09-03 10:36:01', 407);
INSERT INTO `sys_oper_log` VALUES (73, '缴费记录信息', 1, 'com.ruoyi.payment.controller.PaymentRecordController.add()', 'POST', 1, 'admin', '研发部门', '/payment/record', '127.0.0.1', '内网IP', '{\"params\":{},\"paymentDate\":\"2024-09-01\",\"paymentMethod\":1,\"projectName\":1,\"sum\":1,\"userName\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-03 10:38:55', 12);
INSERT INTO `sys_oper_log` VALUES (74, '缴费记录信息', 3, 'com.ruoyi.payment.controller.PaymentRecordController.remove()', 'DELETE', 1, 'admin', '研发部门', '/payment/record/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-03 10:39:05', 10);
INSERT INTO `sys_oper_log` VALUES (75, '缴费记录信息', 1, 'com.ruoyi.payment.controller.PaymentRecordController.add()', 'POST', 1, 'admin', '研发部门', '/payment/record', '127.0.0.1', '内网IP', '{\"params\":{},\"paymentDate\":\"2024-09-01\",\"paymentMethod\":1,\"projectName\":1,\"sum\":100,\"userName\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-03 10:39:13', 7);
INSERT INTO `sys_oper_log` VALUES (76, '缴费记录信息', 3, 'com.ruoyi.payment.controller.PaymentRecordController.remove()', 'DELETE', 1, 'admin', '研发部门', '/payment/record/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-03 10:39:16', 8);
INSERT INTO `sys_oper_log` VALUES (77, '缴费记录信息', 1, 'com.ruoyi.payment.controller.PaymentRecordController.add()', 'POST', 1, 'admin', '研发部门', '/payment/record', '127.0.0.1', '内网IP', '{\"params\":{},\"paymentDate\":\"2024-09-01\",\"paymentMethod\":1,\"projectName\":1,\"sum\":100,\"userName\":\"付子墨\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-03 10:43:03', 9);
INSERT INTO `sys_oper_log` VALUES (78, '缴费记录信息', 1, 'com.ruoyi.payment.controller.PaymentRecordController.add()', 'POST', 1, 'admin', '研发部门', '/payment/record', '127.0.0.1', '内网IP', '{\"params\":{},\"paymentDate\":\"2024-09-01\",\"paymentMethod\":0,\"projectName\":2,\"sum\":1000,\"userName\":\"付子墨\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-03 10:43:39', 8);
INSERT INTO `sys_oper_log` VALUES (79, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/14', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-03 10:59:07', 53);
INSERT INTO `sys_oper_log` VALUES (80, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"payment_record\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-03 10:59:15', 116);
INSERT INTO `sys_oper_log` VALUES (81, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"record\",\"className\":\"PaymentRecord\",\"columns\":[{\"capJavaField\":\"RecordId\",\"columnComment\":\"订单ID\",\"columnId\":101,\"columnName\":\"recordId\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-03 10:59:15\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"recordId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"病人ID\",\"columnId\":102,\"columnName\":\"userId\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-03 10:59:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserName\",\"columnComment\":\"病人名称\",\"columnId\":103,\"columnName\":\"userName\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-03 10:59:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"userName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ProjectName\",\"columnComment\":\"项目名称\",\"columnId\":104,\"columnName\":\"projectName\",\"columnType\":\"int(1)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-03 10:59:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRe', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-03 10:59:52', 110);
INSERT INTO `sys_oper_log` VALUES (82, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"payment_record\"}', NULL, 0, NULL, '2024-09-03 10:59:56', 430);
INSERT INTO `sys_oper_log` VALUES (83, '缴费记录信息', 1, 'com.ruoyi.record.controller.PaymentRecordController.add()', 'POST', 1, 'admin', '研发部门', '/record/record', '127.0.0.1', '内网IP', '{\"params\":{},\"paymentDate\":\"2024-09-01\",\"paymentMethod\":1,\"projectName\":1,\"sum\":100,\"userId\":1,\"userName\":\"付子墨\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'recordId\' doesn\'t have a default value\r\n### The error may exist in file [D:\\毕业设计\\RuoYi-Vue\\ruoyi-admin\\target\\classes\\mapper\\record\\PaymentRecordMapper.xml]\r\n### The error may involve com.ruoyi.record.mapper.PaymentRecordMapper.insertPaymentRecord-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into payment_record          ( userId,             userName,             projectName,             paymentMethod,             sum,                          paymentDate )           values ( ?,             ?,             ?,             ?,             ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'recordId\' doesn\'t have a default value\n; Field \'recordId\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'recordId\' doesn\'t have a default value', '2024-09-03 11:07:35', 371);
INSERT INTO `sys_oper_log` VALUES (84, '缴费记录信息', 1, 'com.ruoyi.record.controller.PaymentRecordController.add()', 'POST', 1, 'admin', '研发部门', '/record/record', '127.0.0.1', '内网IP', '{\"params\":{},\"paymentDate\":\"2024-09-01\",\"paymentMethod\":1,\"projectName\":1,\"sum\":100,\"userId\":1,\"userName\":\"付子墨\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'recordId\' doesn\'t have a default value\r\n### The error may exist in file [D:\\毕业设计\\RuoYi-Vue\\ruoyi-admin\\target\\classes\\mapper\\record\\PaymentRecordMapper.xml]\r\n### The error may involve com.ruoyi.record.mapper.PaymentRecordMapper.insertPaymentRecord-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into payment_record          ( userId,             userName,             projectName,             paymentMethod,             sum,                          paymentDate )           values ( ?,             ?,             ?,             ?,             ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'recordId\' doesn\'t have a default value\n; Field \'recordId\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'recordId\' doesn\'t have a default value', '2024-09-03 11:08:38', 13);
INSERT INTO `sys_oper_log` VALUES (85, '缴费记录信息', 1, 'com.ruoyi.record.controller.PaymentRecordController.add()', 'POST', 1, 'admin', '研发部门', '/record/record', '127.0.0.1', '内网IP', '{\"params\":{},\"paymentDate\":\"2024-09-01\",\"paymentMethod\":1,\"projectName\":1,\"sum\":100,\"userId\":1,\"userName\":\"付子墨\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'userId\' in \'field list\'\r\n### The error may exist in file [D:\\毕业设计\\RuoYi-Vue\\ruoyi-admin\\target\\classes\\mapper\\record\\PaymentRecordMapper.xml]\r\n### The error may involve com.ruoyi.record.mapper.PaymentRecordMapper.insertPaymentRecord-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into payment_record          ( userId,             userName,             projectName,             paymentMethod,             sum,                          paymentDate )           values ( ?,             ?,             ?,             ?,             ?,                          ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'userId\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'userId\' in \'field list\'', '2024-09-03 11:11:03', 390);
INSERT INTO `sys_oper_log` VALUES (86, '缴费记录信息', 1, 'com.ruoyi.record.controller.PaymentRecordController.add()', 'POST', 1, 'admin', '研发部门', '/record/record', '127.0.0.1', '内网IP', '{\"params\":{},\"paymentDate\":\"2024-09-01\",\"paymentMethod\":1,\"projectName\":1,\"sum\":100,\"userId\":1,\"userName\":\"付子墨\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'userId\' in \'field list\'\r\n### The error may exist in file [D:\\毕业设计\\RuoYi-Vue\\ruoyi-admin\\target\\classes\\mapper\\record\\PaymentRecordMapper.xml]\r\n### The error may involve com.ruoyi.record.mapper.PaymentRecordMapper.insertPaymentRecord-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into payment_record          ( userId,             userName,             projectName,             paymentMethod,             sum,                          paymentDate )           values ( ?,             ?,             ?,             ?,             ?,                          ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'userId\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'userId\' in \'field list\'', '2024-09-03 11:20:22', 482);
INSERT INTO `sys_oper_log` VALUES (87, '缴费记录信息', 1, 'com.ruoyi.record.controller.PaymentRecordController.add()', 'POST', 1, 'admin', '研发部门', '/record/record', '127.0.0.1', '内网IP', '{\"params\":{},\"paymentDate\":\"2024-09-01\",\"paymentMethod\":1,\"projectName\":1,\"sum\":100,\"userId\":1,\"userName\":\"付子墨\"}', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'user_id\' in \'class com.ruoyi.record.domain.PaymentRecord\'', '2024-09-03 11:22:34', 26);
INSERT INTO `sys_oper_log` VALUES (88, '缴费记录信息', 1, 'com.ruoyi.record.controller.PaymentRecordController.add()', 'POST', 1, 'admin', '研发部门', '/record/record', '127.0.0.1', '内网IP', '{\"params\":{},\"paymentDate\":\"2024-09-01\",\"paymentMethod\":1,\"projectName\":1,\"sum\":100,\"userId\":1,\"userName\":\"付子墨\"}', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'user_id\' in \'class com.ruoyi.record.domain.PaymentRecord\'', '2024-09-03 11:24:04', 26);
INSERT INTO `sys_oper_log` VALUES (89, '缴费记录信息', 1, 'com.ruoyi.record.controller.PaymentRecordController.add()', 'POST', 1, 'admin', '研发部门', '/record/record', '127.0.0.1', '内网IP', '{\"params\":{},\"paymentDate\":\"2024-09-01\",\"paymentMethod\":1,\"projectName\":1,\"sum\":100,\"userId\":1,\"userName\":\"付子墨\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'recordId\' doesn\'t have a default value\r\n### The error may exist in file [D:\\毕业设计\\RuoYi-Vue\\ruoyi-admin\\target\\classes\\mapper\\record\\PaymentRecordMapper.xml]\r\n### The error may involve com.ruoyi.record.mapper.PaymentRecordMapper.insertPaymentRecord-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into payment_record          ( userId,             userName,             projectName,             paymentMethod,             sum,                          paymentDate )           values ( ?,             ?,             ?,             ?,             ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'recordId\' doesn\'t have a default value\n; Field \'recordId\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'recordId\' doesn\'t have a default value', '2024-09-03 11:31:57', 153);
INSERT INTO `sys_oper_log` VALUES (90, '缴费记录信息', 1, 'com.ruoyi.record.controller.PaymentRecordController.add()', 'POST', 1, 'admin', '研发部门', '/record/record', '127.0.0.1', '内网IP', '{\"params\":{},\"paymentDate\":\"2024-09-01\",\"paymentMethod\":1,\"projectName\":1,\"sum\":100,\"userId\":1,\"userName\":\"付子墨\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'recordId\' doesn\'t have a default value\r\n### The error may exist in file [D:\\毕业设计\\RuoYi-Vue\\ruoyi-admin\\target\\classes\\mapper\\record\\PaymentRecordMapper.xml]\r\n### The error may involve com.ruoyi.record.mapper.PaymentRecordMapper.insertPaymentRecord-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into payment_record          ( userId,             userName,             projectName,             paymentMethod,             sum,                          paymentDate )           values ( ?,             ?,             ?,             ?,             ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'recordId\' doesn\'t have a default value\n; Field \'recordId\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'recordId\' doesn\'t have a default value', '2024-09-03 16:16:20', 4);
INSERT INTO `sys_oper_log` VALUES (91, '缴费记录信息', 1, 'com.ruoyi.record.controller.PaymentRecordController.add()', 'POST', 1, 'admin', '研发部门', '/record/record', '127.0.0.1', '内网IP', '{\"params\":{},\"paymentDate\":\"2024-09-03\",\"paymentMethod\":1,\"projectName\":1,\"sum\":1,\"userId\":1,\"userName\":\"1\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'userId\' in \'field list\'\r\n### The error may exist in file [D:\\毕业设计\\RuoYi-Vue\\ruoyi-admin\\target\\classes\\mapper\\record\\PaymentRecordMapper.xml]\r\n### The error may involve com.ruoyi.record.mapper.PaymentRecordMapper.insertPaymentRecord-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into payment_record          ( userId,             userName,             projectName,             paymentMethod,             sum,                          paymentDate )           values ( ?,             ?,             ?,             ?,             ?,                          ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'userId\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'userId\' in \'field list\'', '2024-09-03 16:19:45', 7);
INSERT INTO `sys_oper_log` VALUES (92, '缴费记录信息', 1, 'com.ruoyi.record.controller.PaymentRecordController.add()', 'POST', 1, 'admin', '研发部门', '/record/record', '127.0.0.1', '内网IP', '{\"params\":{},\"paymentDate\":\"2024-09-03\",\"paymentMethod\":1,\"projectName\":1,\"sum\":1,\"userId\":1,\"userName\":\"1\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'userId\' in \'field list\'\r\n### The error may exist in file [D:\\毕业设计\\RuoYi-Vue\\ruoyi-admin\\target\\classes\\mapper\\record\\PaymentRecordMapper.xml]\r\n### The error may involve com.ruoyi.record.mapper.PaymentRecordMapper.insertPaymentRecord-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into payment_record          ( userId,             userName,             projectName,             paymentMethod,             sum,                          paymentDate )           values ( ?,             ?,             ?,             ?,             ?,                          ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'userId\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'userId\' in \'field list\'', '2024-09-03 16:27:33', 177);
INSERT INTO `sys_oper_log` VALUES (93, '缴费记录信息', 1, 'com.ruoyi.record.controller.PaymentRecordController.add()', 'POST', 1, 'admin', '研发部门', '/record/record', '127.0.0.1', '内网IP', '{\"params\":{},\"paymentDate\":\"2024-09-03\",\"paymentMethod\":1,\"projectName\":1,\"sum\":1,\"userId\":1,\"userName\":\"1\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'userId\' in \'field list\'\r\n### The error may exist in file [D:\\毕业设计\\RuoYi-Vue\\ruoyi-admin\\target\\classes\\mapper\\record\\PaymentRecordMapper.xml]\r\n### The error may involve com.ruoyi.record.mapper.PaymentRecordMapper.insertPaymentRecord-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into payment_record          ( userId,             userName,             projectName,             paymentMethod,             sum,                          paymentDate )           values ( ?,             ?,             ?,             ?,             ?,                          ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'userId\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'userId\' in \'field list\'', '2024-09-03 16:27:33', 3);
INSERT INTO `sys_oper_log` VALUES (94, '缴费记录信息', 1, 'com.ruoyi.record.controller.PaymentRecordController.add()', 'POST', 1, 'admin', '研发部门', '/record/record', '127.0.0.1', '内网IP', '{\"params\":{},\"paymentDate\":\"2024-09-03\",\"paymentMethod\":1,\"projectName\":1,\"sum\":1,\"userId\":1,\"userName\":\"1\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'recordId\' doesn\'t have a default value\r\n### The error may exist in file [D:\\毕业设计\\RuoYi-Vue\\ruoyi-admin\\target\\classes\\mapper\\record\\PaymentRecordMapper.xml]\r\n### The error may involve com.ruoyi.record.mapper.PaymentRecordMapper.insertPaymentRecord-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into payment_record          ( user_id,             userName,             projectName,             paymentMethod,             sum,                          paymentDate )           values ( ?,             ?,             ?,             ?,             ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'recordId\' doesn\'t have a default value\n; Field \'recordId\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'recordId\' doesn\'t have a default value', '2024-09-03 16:31:24', 128);
INSERT INTO `sys_oper_log` VALUES (95, '缴费记录信息', 1, 'com.ruoyi.record.controller.PaymentRecordController.add()', 'POST', 1, 'admin', '研发部门', '/record/record', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\r\n### The error may exist in file [D:\\毕业设计\\RuoYi-Vue\\ruoyi-admin\\target\\classes\\mapper\\record\\PaymentRecordMapper.xml]\r\n### The error may involve com.ruoyi.record.mapper.PaymentRecordMapper.insertPaymentRecord-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into payment_record\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1', '2024-09-03 16:34:23', 49);
INSERT INTO `sys_oper_log` VALUES (96, '缴费记录信息', 1, 'com.ruoyi.record.controller.PaymentRecordController.add()', 'POST', 1, 'admin', '研发部门', '/record/record', '127.0.0.1', '内网IP', '{\"params\":{},\"paymentDate\":\"2024-09-03\",\"paymentMethod\":1,\"projectName\":1,\"sum\":1,\"userId\":1,\"userName\":\"1\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'recordId\' doesn\'t have a default value\r\n### The error may exist in file [D:\\毕业设计\\RuoYi-Vue\\ruoyi-admin\\target\\classes\\mapper\\record\\PaymentRecordMapper.xml]\r\n### The error may involve com.ruoyi.record.mapper.PaymentRecordMapper.insertPaymentRecord-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into payment_record          ( user_id,             userName,             projectName,             paymentMethod,             sum,                          paymentDate )           values ( ?,             ?,             ?,             ?,             ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'recordId\' doesn\'t have a default value\n; Field \'recordId\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'recordId\' doesn\'t have a default value', '2024-09-03 16:34:43', 7);
INSERT INTO `sys_oper_log` VALUES (97, '缴费记录信息', 1, 'com.ruoyi.record.controller.PaymentRecordController.add()', 'POST', 1, 'admin', '研发部门', '/record/record', '127.0.0.1', '内网IP', '{\"params\":{},\"paymentDate\":\"2024-09-03\",\"paymentMethod\":1,\"projectName\":1,\"sum\":1,\"userId\":1,\"userName\":\"1\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'recordId\' doesn\'t have a default value\r\n### The error may exist in file [D:\\毕业设计\\RuoYi-Vue\\ruoyi-admin\\target\\classes\\mapper\\record\\PaymentRecordMapper.xml]\r\n### The error may involve com.ruoyi.record.mapper.PaymentRecordMapper.insertPaymentRecord-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO payment_record (user_id, userName, projectName, paymentMethod, sum, paymentDate)         VALUES (?, ?, ?, ?, ?, ?)\r\n### Cause: java.sql.SQLException: Field \'recordId\' doesn\'t have a default value\n; Field \'recordId\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'recordId\' doesn\'t have a default value', '2024-09-03 16:37:49', 243);
INSERT INTO `sys_oper_log` VALUES (98, '缴费记录信息', 1, 'com.ruoyi.record.controller.PaymentRecordController.add()', 'POST', 1, 'admin', '研发部门', '/record/record', '127.0.0.1', '内网IP', '{\"params\":{},\"paymentDate\":\"2024-09-03\",\"paymentMethod\":1,\"projectName\":1,\"sum\":1,\"userId\":1,\"userName\":\"1\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'recordId\' doesn\'t have a default value\r\n### The error may exist in file [D:\\毕业设计\\RuoYi-Vue\\ruoyi-admin\\target\\classes\\mapper\\record\\PaymentRecordMapper.xml]\r\n### The error may involve com.ruoyi.record.mapper.PaymentRecordMapper.insertPaymentRecord-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO payment_record (user_id, userName, projectName, paymentMethod, sum, paymentDate)         VALUES (?, ?, ?, ?, ?, ?)\r\n### Cause: java.sql.SQLException: Field \'recordId\' doesn\'t have a default value\n; Field \'recordId\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'recordId\' doesn\'t have a default value', '2024-09-03 16:37:49', 6);
INSERT INTO `sys_oper_log` VALUES (99, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"record\",\"className\":\"PaymentRecord\",\"columns\":[{\"capJavaField\":\"RecordId\",\"columnComment\":\"订单ID\",\"columnId\":101,\"columnName\":\"recordId\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-03 10:59:15\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"recordId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"updateTime\":\"2024-09-03 10:59:51\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"病人ID\",\"columnId\":102,\"columnName\":\"userId\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-03 10:59:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"updateTime\":\"2024-09-03 10:59:51\",\"usableColumn\":false},{\"capJavaField\":\"UserName\",\"columnComment\":\"病人名称\",\"columnId\":103,\"columnName\":\"userName\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-03 10:59:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"userName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"updateTime\":\"2024-09-03 10:59:51\",\"usableColumn\":false},{\"capJavaField\":\"ProjectName\",\"columnComment\":\"项目名称\",\"columnId\":104,\"columnName\":\"projectName\",\"columnType\":\"int(1)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-03 10:59:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":fals', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-03 16:42:56', 92);
INSERT INTO `sys_oper_log` VALUES (100, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"payment_record\"}', NULL, 0, NULL, '2024-09-03 16:43:01', 283);
INSERT INTO `sys_oper_log` VALUES (101, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/15', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-03 16:51:07', 18);
INSERT INTO `sys_oper_log` VALUES (102, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"payment_record\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-03 16:51:14', 67);
INSERT INTO `sys_oper_log` VALUES (103, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"record\",\"className\":\"PaymentRecord\",\"columns\":[{\"capJavaField\":\"RecordId\",\"columnComment\":\"订单ID\",\"columnId\":109,\"columnName\":\"record_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-03 16:51:14\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"recordId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":16,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"病人ID\",\"columnId\":110,\"columnName\":\"user_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-03 16:51:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":16,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserName\",\"columnComment\":\"病人名称\",\"columnId\":111,\"columnName\":\"user_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-03 16:51:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"userName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":16,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ProjectName\",\"columnComment\":\"项目名称\",\"columnId\":112,\"columnName\":\"project_name\",\"columnType\":\"int(1)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-03 16:51:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-03 16:51:41', 29);
INSERT INTO `sys_oper_log` VALUES (104, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"record\",\"className\":\"PaymentRecord\",\"columns\":[{\"capJavaField\":\"RecordId\",\"columnComment\":\"订单ID\",\"columnId\":109,\"columnName\":\"record_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-03 16:51:14\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"recordId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":16,\"updateBy\":\"\",\"updateTime\":\"2024-09-03 16:51:41\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"病人ID\",\"columnId\":110,\"columnName\":\"user_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-03 16:51:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":16,\"updateBy\":\"\",\"updateTime\":\"2024-09-03 16:51:41\",\"usableColumn\":false},{\"capJavaField\":\"UserName\",\"columnComment\":\"病人名称\",\"columnId\":111,\"columnName\":\"user_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-03 16:51:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"userName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":16,\"updateBy\":\"\",\"updateTime\":\"2024-09-03 16:51:41\",\"usableColumn\":false},{\"capJavaField\":\"ProjectName\",\"columnComment\":\"项目名称\",\"columnId\":112,\"columnName\":\"project_name\",\"columnType\":\"int(1)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-03 16:51:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-03 16:52:10', 25);
INSERT INTO `sys_oper_log` VALUES (105, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"payment_record\"}', NULL, 0, NULL, '2024-09-03 16:52:13', 41);
INSERT INTO `sys_oper_log` VALUES (106, '缴费记录信息', 1, 'com.ruoyi.payment.controller.PaymentRecordController.add()', 'POST', 1, 'admin', '研发部门', '/payment/record', '127.0.0.1', '内网IP', '{\"params\":{},\"paymentDate\":\"2024-09-01\",\"paymentMethod\":1,\"projectName\":1,\"sum\":1,\"userId\":1,\"userName\":\"付子墨\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'record_id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\毕业设计\\RuoYi-Vue\\ruoyi-admin\\target\\classes\\mapper\\payment\\PaymentRecordMapper.xml]\r\n### The error may involve com.ruoyi.payment.mapper.PaymentRecordMapper.insertPaymentRecord-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into payment_record          ( user_id,             user_name,             project_name,             payment_method,             sum,                          payment_date )           values ( ?,             ?,             ?,             ?,             ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'record_id\' doesn\'t have a default value\n; Field \'record_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'record_id\' doesn\'t have a default value', '2024-09-03 16:58:57', 403);
INSERT INTO `sys_oper_log` VALUES (107, '缴费记录信息', 1, 'com.ruoyi.payment.controller.PaymentRecordController.add()', 'POST', 1, 'admin', '研发部门', '/payment/record', '127.0.0.1', '内网IP', '{\"params\":{},\"paymentDate\":\"2024-09-03\",\"paymentMethod\":1,\"projectName\":1,\"sum\":1,\"userId\":1,\"userName\":\"付子墨\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-03 17:00:40', 360);
INSERT INTO `sys_oper_log` VALUES (108, '缴费记录信息', 2, 'com.ruoyi.payment.controller.PaymentRecordController.edit()', 'PUT', 1, 'admin', '研发部门', '/payment/record', '127.0.0.1', '内网IP', '{\"params\":{},\"paymentDate\":\"2024-09-03\",\"paymentMethod\":1,\"projectName\":1,\"recordId\":1,\"sum\":100,\"userId\":1,\"userName\":\"付子墨\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-03 17:00:46', 12);
INSERT INTO `sys_oper_log` VALUES (109, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"bingli_case\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-12 20:09:21', 93);
INSERT INTO `sys_oper_log` VALUES (110, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"case\",\"className\":\"BingliCase\",\"columns\":[{\"capJavaField\":\"BingliCaseId\",\"columnComment\":\"病例订单编号\",\"columnId\":117,\"columnName\":\"bingli_case_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-12 20:09:21\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"bingliCaseId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":17,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"病人编号\",\"columnId\":118,\"columnName\":\"user_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-12 20:09:21\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":17,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SickbedId\",\"columnComment\":\"病床编号\",\"columnId\":119,\"columnName\":\"sickbed_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-12 20:09:21\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"sickbedId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":17,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserName\",\"columnComment\":\"病人姓名\",\"columnId\":120,\"columnName\":\"user_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-12 20:09:21\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-12 20:10:03', 62);
INSERT INTO `sys_oper_log` VALUES (111, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"bingli_case\"}', NULL, 0, NULL, '2024-09-12 20:10:13', 293);
INSERT INTO `sys_oper_log` VALUES (112, '病例订单信息', 1, 'com.ruoyi.caseCC.controller.BingliCaseController.add()', 'POST', 1, 'admin', '研发部门', '/case/case', '127.0.0.1', '内网IP', '{\"bingliCaseId\":1,\"caseName\":\"小儿麻痹\",\"doctorId\":1,\"medicineId\":\"头孢\",\"nurseId\":1,\"params\":{},\"sickbedId\":1,\"userId\":1,\"userName\":\"付子墨\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-12 20:29:45', 141);
INSERT INTO `sys_oper_log` VALUES (113, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"examine_treatment_case\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-14 10:52:32', 169);
INSERT INTO `sys_oper_log` VALUES (114, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"ExamineTreatmentCase\",\"className\":\"ExamineTreatmentCase\",\"columns\":[{\"capJavaField\":\"ExamineTreatmentCaseId\",\"columnComment\":\"检查或者手术订单编号\",\"columnId\":126,\"columnName\":\"examine_treatment_case_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-14 10:52:32\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"examineTreatmentCaseId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":18,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ExamineTreatmentCategory\",\"columnComment\":\"检查或者手术订单类别（0检查 1手术）\",\"columnId\":127,\"columnName\":\"examine_treatment_category\",\"columnType\":\"int(1)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-14 10:52:32\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"examineTreatmentCategory\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":18,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DoctorId\",\"columnComment\":\"医生ID\",\"columnId\":128,\"columnName\":\"doctor_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-14 10:52:32\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"doctorId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":18,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DoctorName\",\"columnComment\":\"医生姓名\",\"columnId\":129,\"columnName\":\"doctor_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-14 10:52:32\",\"dictType\":\"\",\"edit\":true', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-14 10:54:13', 100);
INSERT INTO `sys_oper_log` VALUES (115, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"examine_treatment_case\"}', NULL, 0, NULL, '2024-09-14 10:54:20', 392);
INSERT INTO `sys_oper_log` VALUES (116, '检查或手术订单信息', 1, 'com.ruoyi.ExamineTreatmentCase.controller.ExamineTreatmentCaseController.add()', 'POST', 1, 'admin', '研发部门', '/ExamineTreatmentCase/ExamineTreatmentCase', '127.0.0.1', '内网IP', '{\"caseStatus\":0,\"doctorId\":2,\"doctorName\":\"华佗\",\"doctorStatus\":0,\"examineTreatmentCaseId\":1,\"examineTreatmentCategory\":1,\"examineTreatmentDate\":\"2024-09-05\",\"params\":{},\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-14 11:01:06', 43);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '岗位信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2024-06-28 19:33:07', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2024-06-28 19:33:07', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2024-06-28 19:33:07', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2024-06-28 19:33:07', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2024-06-28 19:33:08', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2024-06-28 19:33:08', '', NULL, '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 117);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);

-- ----------------------------
-- Table structure for sys_transfer_order
-- ----------------------------
DROP TABLE IF EXISTS `sys_transfer_order`;
CREATE TABLE `sys_transfer_order`  (
  `transfer_order_id` bigint NOT NULL AUTO_INCREMENT COMMENT '转院订单ID',
  `user_id` int NULL DEFAULT NULL COMMENT '病人ID',
  `hospital_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '所在医院ID',
  `new_hospital_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '欲转医院ID',
  `transfer_order_time` datetime NULL DEFAULT NULL COMMENT '订单创建时间',
  `transfer_order_condition` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '转院原因',
  `order_status` int NULL DEFAULT 0 COMMENT '状态（0正常 1停用）',
  `user_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`transfer_order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6712621013850 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '转院订单信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_transfer_order
-- ----------------------------
INSERT INTO `sys_transfer_order` VALUES (82532524095, 1, '阳光医院', '开学医院', '2024-08-30 14:53:45', '态度差', 1, '付子墨');
INSERT INTO `sys_transfer_order` VALUES (1272113039541, 1, '光明医院', '北京医院', '2024-10-11 10:12:01', '111', 1, NULL);
INSERT INTO `sys_transfer_order` VALUES (4372016343038, 1, '阳光医院', '开学医院', '2024-09-02 10:22:00', '态度差', 1, '付子墨');
INSERT INTO `sys_transfer_order` VALUES (4563083684327, 1, '实验医院', '北京医院', '2024-09-02 10:53:51', '太花钱', 1, '付子墨');
INSERT INTO `sys_transfer_order` VALUES (6583215003592, 2, '阳光医院1', '开学医院2', '2024-09-15 10:03:52', '态度差', 1, '功夫熊猫');
INSERT INTO `sys_transfer_order` VALUES (6709630471484, 3, '阳光医院1', '开学医院2', '2024-09-15 10:24:56', '态度差', 0, '李连杰');
INSERT INTO `sys_transfer_order` VALUES (6712621013849, 1, '34', '324', '2024-09-15 10:25:26', '45', 1, '付子墨');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-09-14 10:58:43', 'admin', '2024-06-28 19:33:07', '', '2024-09-14 10:58:42', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-06-28 19:33:07', 'admin', '2024-06-28 19:33:07', '', NULL, '测试员');

-- ----------------------------
-- Table structure for sys_user_hospital
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_hospital`;
CREATE TABLE `sys_user_hospital`  (
  `user_id` int NOT NULL AUTO_INCREMENT COMMENT '病人床号',
  `hospital_id` int NULL DEFAULT NULL COMMENT '医院编号',
  `hospital_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '医院名称',
  `hospital_dizhi` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '医院地址',
  `hospital_status` int NULL DEFAULT 0 COMMENT '状态（0正常 1停用）',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '病人所处医院信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_hospital
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

-- ----------------------------
-- Table structure for transfer_order_scora
-- ----------------------------
DROP TABLE IF EXISTS `transfer_order_scora`;
CREATE TABLE `transfer_order_scora`  (
  `transfer_order_scora_id` int NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` int NULL DEFAULT NULL COMMENT '病人编号',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '病人名称',
  `hospital_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '现所在医院',
  `new_hospital_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '新转医院',
  `transfer_order_condition` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '转院原因',
  `order_status` int NULL DEFAULT NULL COMMENT '状态',
  `transfer_order_time` datetime NULL DEFAULT NULL COMMENT '拒绝转院申请时间',
  `transfer_order_not_condition` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '护士拒绝转院申请的理由',
  PRIMARY KEY (`transfer_order_scora_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '拒绝转院信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of transfer_order_scora
-- ----------------------------
INSERT INTO `transfer_order_scora` VALUES (1, 3, '李连杰', '火气医院', '红旗医院', '住着不舒服', 0, '2024-10-09 10:31:31', NULL);
INSERT INTO `transfer_order_scora` VALUES (2, 3, '李连杰', '火气医院', '红旗医院', '住着不舒服', 0, '2024-10-09 10:34:40', NULL);
INSERT INTO `transfer_order_scora` VALUES (3, 3, '李连杰', '火气医院', '红旗医院', '住着不舒服', 0, '2024-10-09 10:35:07', '心情不好');
INSERT INTO `transfer_order_scora` VALUES (4, 3, '李连杰', '阳光医院1', '开学医院2', '态度差', 0, '2024-10-09 10:39:18', '颗粒');
INSERT INTO `transfer_order_scora` VALUES (5, 1, '付子墨', '阳光医院', '开学医院', '态度差', 0, '2024-10-09 10:41:12', '11');
INSERT INTO `transfer_order_scora` VALUES (6, 3, '李连杰', '阳光医院1', '开学医院2', '态度差', 0, '2024-10-11 10:19:32', '不支持');

-- ----------------------------
-- Table structure for treatment
-- ----------------------------
DROP TABLE IF EXISTS `treatment`;
CREATE TABLE `treatment`  (
  `treatment_id` int NOT NULL AUTO_INCREMENT COMMENT '治疗ID',
  `treatment_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '治疗名称',
  `treatment_price` int NOT NULL COMMENT '治疗价格',
  `treatment_type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '治疗类型',
  `doctor_id` int NOT NULL COMMENT '医生ID',
  PRIMARY KEY (`treatment_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '治疗信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of treatment
-- ----------------------------
INSERT INTO `treatment` VALUES (1, '化疗', 1000, '', 121212);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int NOT NULL AUTO_INCREMENT COMMENT '病人编号',
  `user_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '病人名称',
  `user_age` int NULL DEFAULT NULL COMMENT '病人年龄',
  `user_sex` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '性别（0男 1女 2未知）',
  `user_status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `user_birthday` datetime NULL DEFAULT NULL COMMENT '生日',
  `user_case` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '病人病例',
  `user_order` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '病人医嘱',
  `doctor_id` int NULL DEFAULT NULL COMMENT '医生编号',
  `nurse_id` int NULL DEFAULT NULL COMMENT '护士编号',
  `sickbed_id` int NULL DEFAULT NULL COMMENT '病床编号',
  `ward_id` int NULL DEFAULT NULL COMMENT '病房编号',
  `id_card` varchar(18) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '身份证号',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `user_phone` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '电话号码',
  `dingdan_id` int NULL DEFAULT NULL COMMENT '订单编号',
  `user_zhanghao` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '病人账号',
  `user_password` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '病人密码',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '病人信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '付子墨', 11, '0', '0', '2024-07-10 00:00:00', '夜盲症', '注释色素', 1, 1, 11111, 1111, '11111', '2024-07-07 14:03:55', '15547681690', 11111111, '15547681690', '111111');
INSERT INTO `user` VALUES (2, '功夫熊猫', 11, '1', '0', '2024-09-23 00:00:00', '夜盲症', '注射叶绿素', 1, 1433523, 111222, 112334, '150421111111110089', '2024-09-02 15:05:36', '111111111', 11111, '123456', '111111');
INSERT INTO `user` VALUES (3, '李连杰', 31, '1', '0', '2024-10-08 19:43:47', '失眠', '复用布洛芬', 1, 1, 10023, 1002, '150421200211110010', '2024-10-08 19:45:01', '15547688892', 11111, '111111', '111111');

-- ----------------------------
-- Table structure for ward
-- ----------------------------
DROP TABLE IF EXISTS `ward`;
CREATE TABLE `ward`  (
  `ward_id` int NOT NULL AUTO_INCREMENT COMMENT '病房ID',
  `ward_information` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '病房信息',
  `ward_status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`ward_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '病房信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ward
-- ----------------------------
INSERT INTO `ward` VALUES (1, '儿童病房', '0', '2024-09-02 15:07:19');

SET FOREIGN_KEY_CHECKS = 1;
