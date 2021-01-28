/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : localhost:3306
 Source Schema         : account_manager

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 29/01/2021 10:27:43
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_flowable_form
-- ----------------------------
DROP TABLE IF EXISTS `t_flowable_form`;
CREATE TABLE `t_flowable_form` (
                                   `form_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '表单key',
                                   `form_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '表单名称',
                                   `form_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '表单内容json串',
                                   `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
                                   `create_date` date DEFAULT NULL COMMENT '创建日期',
                                   `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                                   `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
                                   `update_date` date DEFAULT NULL COMMENT '修改日期',
                                   `update_time` datetime DEFAULT NULL COMMENT '修改时间',
                                   PRIMARY KEY (`form_key`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='flowable_流程表单';

-- ----------------------------
-- Records of t_flowable_form
-- ----------------------------
BEGIN;
INSERT INTO `t_flowable_form` VALUES ('leaveApply', '请假表单', '{\"list\":[{\"type\":\"input\",\"icon\":\"icon-input\",\"options\":{\"width\":\"80%\",\"defaultValue\":\"\",\"required\":true,\"dataType\":\"string\",\"pattern\":\"\",\"placeholder\":\"\",\"disabled\":false,\"remoteFunc\":\"func_1607478581000_58879\"},\"name\":\"员工号\",\"key\":\"1607478581000_58879\",\"model\":\"userId\",\"rules\":[{\"type\":\"string\",\"message\":\"员工号格式不正确\"},{\"required\":true,\"message\":\"员工号必须填写\"}]},{\"type\":\"input\",\"icon\":\"icon-input\",\"options\":{\"width\":\"80%\",\"defaultValue\":\"\",\"required\":true,\"dataType\":\"string\",\"pattern\":\"\",\"placeholder\":\"\",\"disabled\":false,\"remoteFunc\":\"func_1607478586000_90043\"},\"name\":\"员工姓名\",\"key\":\"1607478586000_90043\",\"model\":\"userName\",\"rules\":[{\"type\":\"string\",\"message\":\"员工姓名格式不正确\"},{\"required\":true,\"message\":\"员工姓名必须填写\"}]},{\"type\":\"date\",\"icon\":\"icon-date\",\"options\":{\"defaultValue\":\"\",\"readonly\":false,\"disabled\":false,\"editable\":false,\"clearable\":true,\"placeholder\":\"\",\"startPlaceholder\":\"\",\"endPlaceholder\":\"\",\"type\":\"datetime\",\"format\":\"yyyy-MM-dd HH:mm:ss\",\"timestamp\":false,\"required\":true,\"width\":\"50%\",\"remoteFunc\":\"func_1607478591000_51493\"},\"name\":\"开始时间\",\"key\":\"1607478591000_51493\",\"model\":\"dateStart\",\"rules\":[{\"required\":true,\"message\":\"开始时间必须填写\"}]},{\"type\":\"date\",\"icon\":\"icon-date\",\"options\":{\"defaultValue\":\"\",\"readonly\":false,\"disabled\":false,\"editable\":false,\"clearable\":true,\"placeholder\":\"\",\"startPlaceholder\":\"\",\"endPlaceholder\":\"\",\"type\":\"datetime\",\"format\":\"yyyy-MM-dd HH:mm:ss\",\"timestamp\":false,\"required\":true,\"width\":\"50%\",\"remoteFunc\":\"func_1607478594000_24349\"},\"name\":\"结束时间\",\"key\":\"1607478594000_24349\",\"model\":\"dateEnd\",\"rules\":[{\"required\":true,\"message\":\"结束时间必须填写\"}]}],\"config\":{\"labelWidth\":100,\"labelPosition\":\"right\",\"size\":\"small\"}}', 'admin', '2020-12-09', '2020-12-09 09:49:09', 'admin', '2020-12-09', '2020-12-09 09:55:22');
INSERT INTO `t_flowable_form` VALUES ('notice', '部门通知', '{\"list\":[{\"type\":\"input\",\"icon\":\"icon-input\",\"options\":{\"width\":\"40%\",\"defaultValue\":\"\",\"required\":true,\"dataType\":\"string\",\"pattern\":\"\",\"placeholder\":\"\",\"disabled\":false,\"remoteFunc\":\"func_1607993807000_18915\"},\"name\":\"姓名\",\"key\":\"1607993807000_18915\",\"model\":\"input_1607993807000_18915\",\"rules\":[{\"type\":\"string\",\"message\":\"姓名格式不正确\"},{\"required\":true,\"message\":\"姓名必须填写\"}]},{\"type\":\"input\",\"icon\":\"icon-input\",\"options\":{\"width\":\"100%\",\"defaultValue\":\"\",\"required\":true,\"dataType\":\"string\",\"pattern\":\"\",\"placeholder\":\"\",\"disabled\":false,\"remoteFunc\":\"func_1607993809000_68225\"},\"name\":\"部门\",\"key\":\"1607993809000_68225\",\"model\":\"input_1607993809000_68225\",\"rules\":[{\"type\":\"string\",\"message\":\"部门格式不正确\"},{\"required\":true,\"message\":\"部门必须填写\"}]},{\"type\":\"textarea\",\"icon\":\"icon-diy-com-textarea\",\"options\":{\"width\":\"100%\",\"defaultValue\":\"\",\"required\":true,\"disabled\":false,\"pattern\":\"\",\"placeholder\":\"\",\"remoteFunc\":\"func_1607993810000_75259\"},\"name\":\"通知\",\"key\":\"1607993810000_75259\",\"model\":\"textarea_1607993810000_75259\",\"rules\":[{\"required\":true,\"message\":\"通知必须填写\"}]}],\"config\":{\"labelWidth\":100,\"labelPosition\":\"right\",\"size\":\"small\"}}', 'admin', '2020-12-15', '2020-12-15 08:53:31', 'admin', '2020-12-15', '2020-12-15 09:02:16');
COMMIT;

-- ----------------------------
-- Table structure for t_sys_balance_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_balance_detail`;
CREATE TABLE `t_sys_balance_detail` (
                                        `balance_detail_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键id',
                                        `account` decimal(12,2) NOT NULL COMMENT '账户余额',
                                        `balance_type` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账户类型',
                                        `balance_main_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主表id',
                                        `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所属用户id',
                                        `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
                                        `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
                                        `create_date` date DEFAULT NULL COMMENT '创建日期',
                                        `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                                        `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
                                        `update_date` date DEFAULT NULL COMMENT '修改日期',
                                        `update_time` datetime DEFAULT NULL COMMENT '修改时间',
                                        `delete_type` int(1) DEFAULT NULL COMMENT '0 不删除 1 删除',
                                        PRIMARY KEY (`balance_detail_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='SYS18_账户明细表';

-- ----------------------------
-- Records of t_sys_balance_detail
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_sys_balance_main
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_balance_main`;
CREATE TABLE `t_sys_balance_main` (
                                      `balance_main_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键id',
                                      `account` decimal(12,2) NOT NULL COMMENT '账户余额',
                                      `account_date` date NOT NULL COMMENT '记录时间',
                                      `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所属用户',
                                      `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
                                      `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
                                      `create_date` date DEFAULT NULL COMMENT '创建日期',
                                      `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                                      `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
                                      `update_date` date DEFAULT NULL COMMENT '修改日期',
                                      `update_time` datetime DEFAULT NULL COMMENT '修改时间',
                                      `delete_type` int(1) DEFAULT NULL COMMENT '0 不删除 1 删除',
                                      PRIMARY KEY (`balance_main_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='SYS17_账户余额主表';

-- ----------------------------
-- Records of t_sys_balance_main
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_sys_code_create
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_code_create`;
CREATE TABLE `t_sys_code_create` (
                                     `code_create_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键id',
                                     `code_create_tablename` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '表名',
                                     `code_create_module` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '模块名',
                                     `code_create_filename` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件名',
                                     `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
                                     `create_date` date DEFAULT NULL COMMENT '创建日期',
                                     `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                                     `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
                                     `update_date` date DEFAULT NULL COMMENT '修改日期',
                                     `update_time` datetime DEFAULT NULL COMMENT '修改时间',
                                     PRIMARY KEY (`code_create_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='SYS19_代码在线生成';

-- ----------------------------
-- Records of t_sys_code_create
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_sys_code_info
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_code_info`;
CREATE TABLE `t_sys_code_info` (
                                   `code_info_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '代码信息ID',
                                   `code_type_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '代码类别ID',
                                   `value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '下拉框值',
                                   `content` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '下拉框内容',
                                   `parent_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '上级联动下拉框值',
                                   `sort_no` int(11) NOT NULL COMMENT '排序号',
                                   `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
                                   `is_ok` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否显示',
                                   `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
                                   `create_date` date DEFAULT NULL COMMENT '创建日期',
                                   `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
                                   `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
                                   `update_date` date DEFAULT NULL COMMENT '修改日期',
                                   `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
                                   PRIMARY KEY (`code_info_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='SYS03_代码信息表';

-- ----------------------------
-- Records of t_sys_code_info
-- ----------------------------
BEGIN;
INSERT INTO `t_sys_code_info` VALUES ('1a6624861756622589d2887c19186d12', 'balanceType', '10', '住房公积金', '', 10, '', '1', 'admin', '2020-08-04', '2020-08-04 21:56:21', 'admin', '2020-08-04', '2020-08-04 21:56:44');
INSERT INTO `t_sys_code_info` VALUES ('556439c2e0bcfce0b89f575ef7e58067', 'balanceType', '11', '现金', '', 11, '', '1', 'admin', '2020-10-01', '2020-10-01 21:28:38', 'admin', '2020-10-01', '2020-10-01 21:28:47');
INSERT INTO `t_sys_code_info` VALUES ('5ca5cd0b9c956316bd22b392d45084db', 'processCategory', '2', '审阅', '', 2, '', '1', 'admin', '2020-12-09', '2020-12-09 09:58:42', NULL, NULL, NULL);
INSERT INTO `t_sys_code_info` VALUES ('7c67331a479127d2e89f08f3e1daca43', 'processCategory', '1', '审批', '', 1, '', '1', 'admin', '2020-12-09', '2020-12-09 09:58:32', NULL, NULL, NULL);
INSERT INTO `t_sys_code_info` VALUES ('balanceType-0', 'balanceType', '0', '支付宝', '', 0, '', '1', 'admin', '2020-06-08', '2020-06-08 08:57:50', NULL, NULL, NULL);
INSERT INTO `t_sys_code_info` VALUES ('balanceType-1', 'balanceType', '1', '微信钱包', '', 1, '', '1', 'admin', '2020-06-08', '2020-06-08 08:58:26', NULL, NULL, NULL);
INSERT INTO `t_sys_code_info` VALUES ('balanceType-2', 'balanceType', '2', '京东金融', '', 2, '', '1', 'admin', '2020-06-08', '2020-06-08 08:58:26', NULL, NULL, NULL);
INSERT INTO `t_sys_code_info` VALUES ('balanceType-3', 'balanceType', '3', '翼支付', '', 3, '', '1', 'admin', '2020-06-08', '2020-06-08 08:58:26', NULL, NULL, NULL);
INSERT INTO `t_sys_code_info` VALUES ('balanceType-4', 'balanceType', '4', '招商银行', '', 4, '', '1', 'admin', '2020-06-08', '2020-06-08 08:58:26', NULL, NULL, NULL);
INSERT INTO `t_sys_code_info` VALUES ('balanceType-5', 'balanceType', '5', '建设银行', '', 5, '', '1', 'admin', '2020-06-08', '2020-06-08 08:58:26', NULL, NULL, NULL);
INSERT INTO `t_sys_code_info` VALUES ('balanceType-6', 'balanceType', '6', '农业银行', '', 6, '', '1', 'admin', '2020-06-08', '2020-06-08 08:58:26', NULL, NULL, NULL);
INSERT INTO `t_sys_code_info` VALUES ('balanceType-7', 'balanceType', '7', '工商银行', '', 7, '', '1', 'admin', '2020-06-08', '2020-06-08 08:58:26', NULL, NULL, NULL);
INSERT INTO `t_sys_code_info` VALUES ('balanceType-8', 'balanceType', '8', '邮储银行', '', 8, '', '1', 'admin', '2020-06-08', '2020-06-08 08:58:26', NULL, NULL, NULL);
INSERT INTO `t_sys_code_info` VALUES ('balanceType-9', 'balanceType', '9', '平安银行', '', 9, '', '1', 'admin', '2020-06-08', '2020-06-08 08:58:26', NULL, NULL, NULL);
INSERT INTO `t_sys_code_info` VALUES ('entityType-1', 'entityType', '1', '角色', '', 1, '', '1', 'admin', '2019-09-01', '2019-09-01 11:40:55', NULL, NULL, NULL);
INSERT INTO `t_sys_code_info` VALUES ('entityType-2', 'entityType', '2', '用户', '', 2, '', '1', 'admin', '2019-09-01', '2019-09-01 11:41:12', NULL, NULL, NULL);
INSERT INTO `t_sys_code_info` VALUES ('identityType-1', 'identityType', '1', '用户', '', 1, '', '1', 'admin', '2020-03-01', '2020-03-01 19:14:27', NULL, NULL, NULL);
INSERT INTO `t_sys_code_info` VALUES ('identityType-2', 'identityType', '2', '岗位', '', 2, '', '1', 'admin', '2020-03-01', '2020-03-01 19:14:53', 'admin', '2020-04-20', '2020-04-20 20:31:24');
INSERT INTO `t_sys_code_info` VALUES ('logType-1', 'logType', '1', '登录日志', '', 1, '', '1', 'user2', '2019-09-03', '2019-09-03 00:52:34', NULL, NULL, NULL);
INSERT INTO `t_sys_code_info` VALUES ('logType-2', 'logType', '2', '操作日志', '', 2, '', '1', 'user2', '2019-09-03', '2019-09-03 00:52:56', NULL, NULL, NULL);
INSERT INTO `t_sys_code_info` VALUES ('misfirePolicy-0', 'misfirePolicy', '0', '默认', '', 0, '', '1', 'admin', '2020-04-26', '2020-04-26 23:56:39', NULL, NULL, NULL);
INSERT INTO `t_sys_code_info` VALUES ('misfirePolicy-1', 'misfirePolicy', '1', '立即触发执行', '', 1, '', '1', 'admin', '2020-04-26', '2020-04-26 23:57:25', NULL, NULL, NULL);
INSERT INTO `t_sys_code_info` VALUES ('misfirePolicy-2', 'misfirePolicy', '2', '触发一次执行', '', 2, '', '1', 'admin', '2020-04-26', '2020-04-26 23:57:41', NULL, NULL, NULL);
INSERT INTO `t_sys_code_info` VALUES ('misfirePolicy-3', 'misfirePolicy', '3', '不触发立即执行', '', 3, '', '1', 'admin', '2020-04-26', '2020-04-26 23:58:03', NULL, NULL, NULL);
INSERT INTO `t_sys_code_info` VALUES ('orgLevel-1', 'orgLevel', '1', '一级', NULL, 1, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_code_info` VALUES ('orgLevel-2', 'orgLevel', '2', '二级', '', 2, '', '1', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_code_info` VALUES ('orgLevel-3', 'orgLevel', '3', '三级', '', 3, '', '1', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_code_info` VALUES ('orgLevel-4', 'orgLevel', '4', '四级', '', 4, '', '1', 'admin', '2019-09-07', '2019-09-07 21:09:18', NULL, NULL, NULL);
INSERT INTO `t_sys_code_info` VALUES ('orgType-1', 'orgType', '1', '普通机构', NULL, 1, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_code_info` VALUES ('orgType-2', 'orgType', '2', '部门', '', 2, '', '1', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_code_info` VALUES ('sourceStrategy-1', 'sourceStrategy', '1', '用户录入', '', 1, '', '1', 'admin', '2019-09-01', '2019-09-01 13:58:04', NULL, NULL, NULL);
INSERT INTO `t_sys_code_info` VALUES ('sourceStrategy-2', 'sourceStrategy', '2', '系统提供', '', 2, '', '1', 'admin', '2019-09-01', '2019-09-01 11:40:19', NULL, NULL, NULL);
INSERT INTO `t_sys_code_info` VALUES ('suspended-false', 'suspended', 'false', '激活', '', 2, '', '1', 'admin', '2020-01-12', '2020-01-12 22:01:35', NULL, NULL, NULL);
INSERT INTO `t_sys_code_info` VALUES ('suspended-true', 'suspended', 'true', '挂起', '', 1, '', '1', 'admin', '2020-01-12', '2020-01-12 22:01:15', NULL, NULL, NULL);
INSERT INTO `t_sys_code_info` VALUES ('trueOrFalse-0', 'trueOrFalse', 'false', '否', '', 2, '', '1', 'admin', '2020-01-06', '2020-01-06 20:32:22', NULL, NULL, NULL);
INSERT INTO `t_sys_code_info` VALUES ('trueOrFalse-1', 'trueOrFalse', 'true', '是', '', 1, '', '1', 'admin', '2020-01-06', '2020-01-06 20:32:08', NULL, NULL, NULL);
INSERT INTO `t_sys_code_info` VALUES ('userSex-1', 'userSex', '1', '男', '', 1, '', '1', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_code_info` VALUES ('userSex-2', 'userSex', '2', '女', '', 2, '', '1', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_code_info` VALUES ('userSex-3', 'userSex', '3', '保密', '', 3, '', '1', NULL, NULL, NULL, 'admin', '2020-05-28', '2020-05-28 08:49:44');
INSERT INTO `t_sys_code_info` VALUES ('userStatus-1', 'userStatus', '1', '正常', '', 1, '', '1', NULL, NULL, NULL, 'admin', '2020-03-30', '2020-03-30 22:28:23');
INSERT INTO `t_sys_code_info` VALUES ('userStatus-2', 'userStatus', '2', '锁定', '', 2, '', '1', NULL, NULL, NULL, 'admin', '2020-03-30', '2020-03-30 22:28:30');
INSERT INTO `t_sys_code_info` VALUES ('yesOrNo-0', 'yesOrNo', '0', '否', '', 2, '', '1', 'admin', '2020-01-09', '2020-01-09 23:08:54', NULL, NULL, NULL);
INSERT INTO `t_sys_code_info` VALUES ('yesOrNo-1', 'yesOrNo', '1', '是', '', 1, '', '1', NULL, NULL, NULL, 'admin', '2020-01-09', '2020-01-09 23:08:35');
COMMIT;

-- ----------------------------
-- Table structure for t_sys_code_type
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_code_type`;
CREATE TABLE `t_sys_code_type` (
                                   `code_type_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '代码类别ID',
                                   `code_type_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '代码类别名称',
                                   `sort_no` int(11) NOT NULL COMMENT '排序号',
                                   `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
                                   `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
                                   `create_date` date DEFAULT NULL COMMENT '创建日期',
                                   `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
                                   `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
                                   `update_date` date DEFAULT NULL COMMENT '修改日期',
                                   `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
                                   PRIMARY KEY (`code_type_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='SYS02_代码类别表';

-- ----------------------------
-- Records of t_sys_code_type
-- ----------------------------
BEGIN;
INSERT INTO `t_sys_code_type` VALUES ('balanceType', '账户类型', 13, '', 'admin', '2020-06-08', '2020-06-08 08:56:34', NULL, NULL, NULL);
INSERT INTO `t_sys_code_type` VALUES ('entityType', '实体类型', 5, '', 'admin', '2019-09-01', '2019-09-01 11:40:19', NULL, NULL, NULL);
INSERT INTO `t_sys_code_type` VALUES ('identityType', '授权类型', 10, '', 'admin', '2020-03-01', '2020-03-01 19:13:55', NULL, NULL, NULL);
INSERT INTO `t_sys_code_type` VALUES ('logType', '日志类型', 7, '', 'user2', '2019-09-03', '2019-09-03 00:52:09', NULL, NULL, NULL);
INSERT INTO `t_sys_code_type` VALUES ('misfirePolicy', '计划执行错误策略', 12, '', 'admin', '2020-04-26', '2020-04-26 23:54:48', NULL, NULL, NULL);
INSERT INTO `t_sys_code_type` VALUES ('orgLevel', '机构级别', 3, NULL, NULL, NULL, NULL, 'admin', '2019-09-01', '2019-09-01 17:06:53');
INSERT INTO `t_sys_code_type` VALUES ('orgType', '机构类型', 4, NULL, NULL, NULL, NULL, 'admin', '2019-09-01', '2019-09-01 17:01:27');
INSERT INTO `t_sys_code_type` VALUES ('processCategory', '模型类型', 14, '', 'admin', '2020-12-09', '2020-12-09 09:58:05', NULL, NULL, NULL);
INSERT INTO `t_sys_code_type` VALUES ('sourceStrategy', '数据源策略', 6, '', 'admin', '2019-09-01', '2019-09-01 13:04:14', 'admin', '2019-09-01', '2019-09-01 17:06:49');
INSERT INTO `t_sys_code_type` VALUES ('suspended', '状态', 9, '', 'admin', '2020-01-12', '2020-01-12 22:00:28', NULL, NULL, NULL);
INSERT INTO `t_sys_code_type` VALUES ('trueOrFalse', '是否', 8, '', 'admin', '2020-01-06', '2020-01-06 20:28:43', 'admin', '2020-01-06', '2020-01-06 20:31:31');
INSERT INTO `t_sys_code_type` VALUES ('userSex', '用户性别', 2, '', NULL, NULL, NULL, 'admin', '2019-08-21', '2019-08-21 23:27:09');
INSERT INTO `t_sys_code_type` VALUES ('userStatus', '用户状态', 11, NULL, NULL, NULL, NULL, 'admin', '2019-09-08', '2019-09-08 14:34:34');
INSERT INTO `t_sys_code_type` VALUES ('yesOrNo', '是否', 1, NULL, NULL, NULL, NULL, 'admin', '2019-09-08', '2019-09-08 14:34:34');
COMMIT;

-- ----------------------------
-- Table structure for t_sys_config
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_config`;
CREATE TABLE `t_sys_config` (
                                `config_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '系统参数ID',
                                `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '系统参数名称',
                                `config_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '系统参数值',
                                `sort_no` int(11) NOT NULL COMMENT '排序号',
                                `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
                                `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
                                `create_date` date DEFAULT NULL COMMENT '创建日期',
                                `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
                                `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
                                `update_date` date DEFAULT NULL COMMENT '修改日期',
                                `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
                                PRIMARY KEY (`config_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='SYS01_系统参数表';

-- ----------------------------
-- Records of t_sys_config
-- ----------------------------
BEGIN;
INSERT INTO `t_sys_config` VALUES ('defaultPassword', '新建用户默认密码', '1', 1, '', 'admin', '2019-09-11', '2019-09-11 23:03:25', 'admin', '2019-09-21', '2019-09-21 12:22:34');
INSERT INTO `t_sys_config` VALUES ('expireTime', 'token过期时间', '604800', 3, '秒为单位', 'admin', '2020-10-30', '2020-10-30 15:02:29', 'admin', '2020-10-30', '2020-10-30 15:05:52');
INSERT INTO `t_sys_config` VALUES ('loginCount', '登录次数限制', '3', 4, '', 'admin', '2020-11-18', '2020-11-18 17:20:40', NULL, NULL, NULL);
INSERT INTO `t_sys_config` VALUES ('useCaptcha', '是否使用验证码', '1', 2, '0 使用 1不使用', 'admin', '2020-07-22', '2020-07-22 22:10:48', 'admin', '2020-11-17', '2020-11-17 12:18:43');
COMMIT;

-- ----------------------------
-- Table structure for t_sys_func
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_func`;
CREATE TABLE `t_sys_func` (
                              `func_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '功能ID',
                              `func_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '功能名称',
                              `menu_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单ID',
                              `func_permissions` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '可访问路径',
                              `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
                              `sort_no` int(11) DEFAULT NULL COMMENT '排序号',
                              `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
                              `create_date` date DEFAULT NULL COMMENT '创建日期',
                              `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
                              `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
                              `update_date` date DEFAULT NULL COMMENT '修改日期',
                              `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
                              PRIMARY KEY (`func_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='SYS05_功能表';

-- ----------------------------
-- Records of t_sys_func
-- ----------------------------
BEGIN;
INSERT INTO `t_sys_func` VALUES ('flowableForm-1', '新增', 'flowableForm', 'flowable:form:save', '', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func` VALUES ('flowableForm-2', '修改', 'flowableForm', 'flowable:form:update', '', 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func` VALUES ('flowableForm-3', '删除', 'flowableForm', 'flowable:form:delete', '', 3, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func` VALUES ('flowableModel-1', '新增', 'flowableModel', 'flowable:model:save', '', 1, 'admin', '2020-08-30', '2020-08-30 19:13:50', NULL, NULL, NULL);
INSERT INTO `t_sys_func` VALUES ('flowableModel-2', '修改', 'flowableModel', 'flowable:model:update', '', 2, 'admin', '2020-08-30', '2020-08-30 19:14:25', NULL, NULL, NULL);
INSERT INTO `t_sys_func` VALUES ('flowableModel-3', '删除', 'flowableModel', 'flowable:model:delete', '', 3, 'admin', '2020-08-30', '2020-08-30 19:14:40', 'admin', '2020-08-30', '2020-08-30 19:14:47');
INSERT INTO `t_sys_func` VALUES ('flowableModel-4', '流程设计', 'flowableModel', 'flowable:model:saveModelEditor', '', 4, 'admin', '2020-08-30', '2020-08-30 21:57:22', 'admin', '2020-08-30', '2020-08-30 22:16:53');
INSERT INTO `t_sys_func` VALUES ('flowableModel-5', '部署', 'flowableModel', 'flowable:model:deploy', '', 5, 'admin', '2020-08-30', '2020-08-30 22:17:16', NULL, NULL, NULL);
INSERT INTO `t_sys_func` VALUES ('flowableModel-6', '导入', 'flowableModel', 'flowable:model:import', '', 6, 'admin', '2020-09-20', '2020-09-20 13:57:24', 'admin', '2020-09-20', '2020-09-20 13:59:04');
INSERT INTO `t_sys_func` VALUES ('flowableProcessDefinition-1', '导入', 'flowableProcessDefinition', 'flowable:processDefinition:import', '', 1, NULL, NULL, NULL, 'admin', '2020-03-07', '2020-03-07 12:15:53');
INSERT INTO `t_sys_func` VALUES ('flowableProcessDefinition-2', '流程授权', 'flowableProcessDefinition', 'flowable:processDefinitionIdentityLink:list,flowable:processDefinitionIdentityLink:save,flowable:processDefinitionIdentityLink:delete', '', 3, NULL, NULL, NULL, 'admin', '2020-03-07', '2020-03-07 12:19:14');
INSERT INTO `t_sys_func` VALUES ('flowableProcessDefinition-3', '导出', 'flowableProcessDefinition', 'flowable:processDefinition:xml', '', 4, 'admin', '2020-03-07', '2020-03-07 12:19:55', 'admin', '2020-03-07', '2020-03-07 12:20:34');
INSERT INTO `t_sys_func` VALUES ('flowableProcessDefinition-4', '挂起/激活', 'flowableProcessDefinition', 'flowable:processDefinition:suspendOrActivate', '', 6, 'admin', '2020-03-07', '2020-03-07 12:21:51', 'admin', '2020-03-07', '2020-03-07 12:22:28');
INSERT INTO `t_sys_func` VALUES ('flowableProcessDefinition-5', '删除', 'flowableProcessDefinition', 'flowable:processDefinition:delete', '', 7, 'admin', '2020-03-07', '2020-03-07 12:23:05', 'admin', '2020-03-07', '2020-03-07 12:23:17');
INSERT INTO `t_sys_func` VALUES ('flowableProcessInstance-1', '流程图', 'flowableProcessInstance', 'flowable:processInstanceImage', '', 2, 'admin', '2020-03-07', '2020-03-07 12:59:30', NULL, NULL, NULL);
INSERT INTO `t_sys_func` VALUES ('flowableProcessInstance-2', '删除', 'flowableProcessInstance', 'flowable:processInstance:delete', '', 3, 'admin', '2020-03-07', '2020-03-07 12:59:51', 'admin', '2020-03-07', '2020-03-07 13:00:25');
INSERT INTO `t_sys_func` VALUES ('flowableProcessInstance-3', '挂起/激活', 'flowableProcessInstance', 'flowable:processInstance:suspendOrActivate', '', 4, 'admin', '2020-03-07', '2020-03-07 12:59:51', 'admin', '2020-03-07', '2020-03-07 13:00:25');
INSERT INTO `t_sys_func` VALUES ('flowableTask-1', '认领/取消认领', 'flowableTask', 'flowable:task:execute', '', 1, 'admin', '2020-03-07', '2020-03-07 13:09:23', 'admin', '2020-03-07', '2020-03-07 13:11:57');
INSERT INTO `t_sys_func` VALUES ('sysBalanceMain-1', '新增', 'sysBalanceMain', 'sys:balanceMain:save', '', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func` VALUES ('sysBalanceMain-2', '修改', 'sysBalanceMain', 'sys:balanceMain:update', '', 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func` VALUES ('sysBalanceMain-3', '删除', 'sysBalanceMain', 'sys:balanceMain:delete', '', 3, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func` VALUES ('sysBalanceMain-4', '导出', 'sysBalanceMain', 'sys:balanceMain:export', '', 4, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func` VALUES ('sysBalanceMain-5', '导入', 'sysBalanceMain', 'sys:balanceMain:import', '', 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func` VALUES ('sysCodeCreate-1', '新增', 'sysCodeCreate', 'sys:codeCreate:save', '', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func` VALUES ('sysCodeCreate-2', '修改', 'sysCodeCreate', 'sys:codeCreate:update', '', 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func` VALUES ('sysCodeCreate-3', '删除', 'sysCodeCreate', 'sys:codeCreate:delete', '', 3, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func` VALUES ('sysCodeCreate-4', '下载', 'sysCodeCreate', 'sys:codeCreate:export', '', 4, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func` VALUES ('sysCodeInfo-1', '字典内容新增', 'sysCodeType', 'sys:codeInfo:save', '', 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func` VALUES ('sysCodeInfo-2', '字典内容修改', 'sysCodeType', 'sys:codeInfo:update', '', 6, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func` VALUES ('sysCodeInfo-3', '字典内容删除', 'sysCodeType', 'sys:codeInfo:delete', '', 7, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func` VALUES ('sysCodeInfo-4', '字典内容列表', 'sysCodeType', 'sys:codeInfo:list', '', 4, NULL, NULL, NULL, 'admin', '2020-07-06', '2020-07-06 22:20:57');
INSERT INTO `t_sys_func` VALUES ('sysCodeType-1', '数据字典新增', 'sysCodeType', 'sys:codeType:save', '', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func` VALUES ('sysCodeType-2', '数据字典修改', 'sysCodeType', 'sys:codeType:update', '', 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func` VALUES ('sysCodeType-3', '数据字典删除', 'sysCodeType', 'sys:codeType:delete', '', 3, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func` VALUES ('sysConfig-1', '新增', 'sysConfig', 'sys:config:save', '', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func` VALUES ('sysConfig-2', '修改', 'sysConfig', 'sys:config:update', '', 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func` VALUES ('sysConfig-3', '删除', 'sysConfig', 'sys:config:delete', '', 3, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func` VALUES ('sysFunc-1', '新增', 'sysFunc', 'sys:func:save', '', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func` VALUES ('sysFunc-2', '修改', 'sysFunc', 'sys:func:update', '', 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func` VALUES ('sysFunc-3', '删除', 'sysFunc', 'sys:func:delete', '', 3, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func` VALUES ('sysJob-1', '新增', 'sysJob', 'sys:job:save', '', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func` VALUES ('sysJob-2', '修改', 'sysJob', 'sys:job:update', '', 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func` VALUES ('sysJob-3', '删除', 'sysJob', 'sys:job:delete', '', 3, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func` VALUES ('sysJob-4', '激活/挂起', 'sysJob', 'sys:job:changeStatus', '', 4, 'admin', '2020-04-27', '2020-04-27 22:33:30', NULL, NULL, NULL);
INSERT INTO `t_sys_func` VALUES ('sysJob-5', '立即执行', 'sysJob', 'sys:job:run', '', 5, 'admin', '2020-04-27', '2020-04-27 23:29:17', NULL, NULL, NULL);
INSERT INTO `t_sys_func` VALUES ('sysMenu-1', '新增', 'sysMenu', 'sys:menu:save', '', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func` VALUES ('sysMenu-2', '修改', 'sysMenu', 'sys:menu:update', '', 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func` VALUES ('sysMenu-3', '删除', 'sysMenu', 'sys:menu:delete', '', 3, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func` VALUES ('sysOrg-1', '新增', 'sysOrg', 'sys:org:save', '', 1, NULL, NULL, NULL, 'admin', '2020-05-27', '2020-05-27 18:23:00');
INSERT INTO `t_sys_func` VALUES ('sysOrg-2', '修改', 'sysOrg', 'sys:org:update', '', 2, NULL, NULL, NULL, 'admin', '2020-05-27', '2020-05-27 18:23:09');
INSERT INTO `t_sys_func` VALUES ('sysOrg-3', '删除', 'sysOrg', 'sys:org:delete', '', 3, NULL, NULL, NULL, 'admin', '2020-05-27', '2020-05-27 18:23:16');
INSERT INTO `t_sys_func` VALUES ('sysPost-1', '新增', 'sysPost', 'sys:post:save', '', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func` VALUES ('sysPost-2', '修改', 'sysPost', 'sys:post:update', '', 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func` VALUES ('sysPost-3', '删除', 'sysPost', 'sys:post:delete', '', 3, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func` VALUES ('sysPost-4', '分配用户', 'sysPost', 'sys:post:getPostUser,sys:post:savePostUsers,sys:post:deletePostUsers', '', 4, 'admin', '2020-04-12', '2020-04-12 21:35:50', NULL, NULL, NULL);
INSERT INTO `t_sys_func` VALUES ('sysRole-1', '新增', 'sysRole', 'sys:role:save', '', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func` VALUES ('sysRole-2', '修改', 'sysRole', 'sys:role:update', '', 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func` VALUES ('sysRole-3', '删除', 'sysRole', 'sys:role:delete', '', 3, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func` VALUES ('sysRole-4', '角色授权', 'sysRole', 'sys:role:getRolePermissions,sys:role:saveRolePermissions', '', 4, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func` VALUES ('sysRole-5', '分配用户', 'sysRole', 'sys:role:getRoleUser,sys:role:saveRoleUsers,sys:role:deleteRoleUsers', '', 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func` VALUES ('sysUser-1', '新增', 'sysUser', 'sys:user:save,sys:org:getTreeData', '', 1, NULL, NULL, NULL, 'admin', '2019-09-08', '2019-09-08 17:51:12');
INSERT INTO `t_sys_func` VALUES ('sysUser-2', '修改', 'sysUser', 'sys:user:update,sys:org:getTreeData', '', 2, NULL, NULL, NULL, 'admin', '2019-09-08', '2019-09-08 17:51:19');
INSERT INTO `t_sys_func` VALUES ('sysUser-3', '删除', 'sysUser', 'sys:user:delete', '', 3, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func` VALUES ('sysUser-4', '导出', 'sysUser', 'sys:user:export', '', 4, 'admin', '2020-05-03', '2020-05-03 11:48:01', 'admin', '2020-05-03', '2020-05-03 11:48:14');
COMMIT;

-- ----------------------------
-- Table structure for t_sys_job
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_job`;
CREATE TABLE `t_sys_job` (
                             `job_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务ID',
                             `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
                             `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
                             `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
                             `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'cron执行表达式',
                             `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '计划执行错误策略',
                             `concurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否并发执行',
                             `status` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否正常状态',
                             `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
                             `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
                             `create_date` date DEFAULT NULL COMMENT '创建日期',
                             `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                             `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
                             `update_date` date DEFAULT NULL COMMENT '修改日期',
                             `update_time` datetime DEFAULT NULL COMMENT '修改时间',
                             PRIMARY KEY (`job_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='SYS15_定时任务表';

-- ----------------------------
-- Records of t_sys_job
-- ----------------------------
BEGIN;
INSERT INTO `t_sys_job` VALUES ('1', '测试1', '测试1', 'balanceJob.hasNoParam()', '0 0/1 * * * ?', '0', '1', '0', '', 'admin', '2020-04-27', '2020-04-27 00:00:21', 'admin', '2020-12-12', '2020-12-12 16:05:31');
INSERT INTO `t_sys_job` VALUES ('2', '测试2', '测试2', 'balanceJob.hasParam(\'123\')', '0 0/1 * * * ?', '0', '1', '0', '', 'admin', '2020-04-27', '2020-04-27 22:02:27', 'admin', '2020-12-12', '2020-12-12 16:00:06');
INSERT INTO `t_sys_job` VALUES ('3', '测试3', '测试3', 'balanceJob.hasMultipleParams(\'321\', true, 2000L, 316.50D, 100)', '0 0/1 * * * ?', '0', '1', '0', '', 'admin', '2020-04-27', '2020-04-27 22:03:01', 'admin', '2020-05-06', '2020-05-06 23:25:12');
INSERT INTO `t_sys_job` VALUES ('4', '测试4', '测试4', 'balanceJob.saveTest()', '0/15 * * * * ?', '0', '1', '0', '', 'admin', '2020-04-27', '2020-04-27 22:03:19', 'admin', '2020-04-27', '2020-04-27 22:03:28');
COMMIT;

-- ----------------------------
-- Table structure for t_sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_job_log`;
CREATE TABLE `t_sys_job_log` (
                                 `job_log_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日志ID',
                                 `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
                                 `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
                                 `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
                                 `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '日志信息',
                                 `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否正常执行',
                                 `exception_info` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '异常信息',
                                 `start_time` datetime DEFAULT NULL COMMENT '开始时间',
                                 `stop_time` datetime DEFAULT NULL COMMENT '结束时间',
                                 `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
                                 `create_date` date DEFAULT NULL COMMENT '创建日期',
                                 `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                                 `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
                                 `update_date` date DEFAULT NULL COMMENT '修改日期',
                                 `update_time` datetime DEFAULT NULL COMMENT '修改时间',
                                 PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='SYS16_定时任务执行日志表';

-- ----------------------------
-- Records of t_sys_job_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_sys_log
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_log`;
CREATE TABLE `t_sys_log` (
                             `log_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'UUID',
                             `log_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日志类型',
                             `log_content` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日志内容',
                             `operate_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '操作类型',
                             `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '操作用户',
                             `user_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '操作用户姓名',
                             `ip` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'IP地址',
                             `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '请求方法',
                             `request_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '请求路径',
                             `request_param` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '请求参数',
                             `request_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '请求类型',
                             `operate_result` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '操作结果',
                             `success` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '操作结果是否成功 0否 1是',
                             `cost_time` bigint(20) DEFAULT NULL COMMENT '耗时',
                             `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
                             `create_date` date DEFAULT NULL COMMENT '创建日期',
                             `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                             `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
                             `update_date` date DEFAULT NULL COMMENT '修改日期',
                             `update_time` datetime DEFAULT NULL COMMENT '修改时间',
                             PRIMARY KEY (`log_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='SYS12_系统日志表';

-- ----------------------------
-- Records of t_sys_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_menu`;
CREATE TABLE `t_sys_menu` (
                              `menu_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单ID',
                              `menu_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
                              `parent_menu_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '上级菜单ID',
                              `menu_icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '图标',
                              `menu_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '菜单URL',
                              `menu_permissions` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '授权',
                              `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组件',
                              `redirect` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '重定向URL',
                              `hidden` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否隐藏',
                              `is_route` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否路由',
                              `route_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '路由名称',
                              `is_cache` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'tagsView是否缓存 1-缓存 0-不缓存',
                              `affix` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否常驻菜单1-是0-否',
                              `is_leaf` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否叶子节点',
                              `sort_no` int(11) DEFAULT NULL COMMENT '排序号',
                              `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
                              `create_date` date DEFAULT NULL COMMENT '创建日期',
                              `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
                              `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
                              `update_date` date DEFAULT NULL COMMENT '修改日期',
                              `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
                              PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='SYS04_菜单表';

-- ----------------------------
-- Records of t_sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `t_sys_menu` VALUES ('balance', '账户余额', '', 'accountbook-fill', '/balance', '', '', '', '0', '1', '', '0', '0', '0', 30000, 'admin', '2020-06-11', '2020-06-11 02:27:46', 'admin', '2020-06-14', '2020-06-14 10:31:12');
INSERT INTO `t_sys_menu` VALUES ('base', '基础资源', '', 'jichuziyuan', '/base', '', '', '', '0', '1', '', '0', '0', '0', 20000, 'admin', '2020-06-14', '2020-06-14 00:51:18', 'admin', '2020-10-23', '2020-10-23 23:17:41');
INSERT INTO `t_sys_menu` VALUES ('flowable', '流程管理', '', 'liuchengguanli', '/flowable', '', '', '', '0', '1', 'Flowable', '0', '0', '0', 500, 'admin', '2020-01-04', '2020-01-04 20:04:12', 'admin', '2020-12-04', '2020-12-04 09:41:44');
INSERT INTO `t_sys_menu` VALUES ('flowableForm', '表单管理', 'flowable', 'biaodanguanli', 'form', 'flowable:form:list', 'views/flowable/form/index', NULL, '0', '1', 'FlowableForm', '0', '0', '1', 30100, 'admin', NULL, NULL, 'admin', '2020-12-04', '2020-12-04 09:41:11');
INSERT INTO `t_sys_menu` VALUES ('flowableModel', '模型管理', 'flowable', 'daima', 'model', 'flowable:model:list', 'views/flowable/model/index', '', '0', '1', 'FlowableModel', '0', '0', '1', 30200, 'admin', '2020-08-30', '2020-08-30 09:08:27', 'admin', '2020-12-04', '2020-12-04 09:45:09');
INSERT INTO `t_sys_menu` VALUES ('flowableProcessDefinition', '流程定义', 'flowable', 'liuchengdingyi', 'processDefinition', 'flowable:processDefinition:list', 'views/flowable/processDefinition/index', NULL, '0', '1', 'FlowableProcessDefinition', '0', '0', '1', 30300, 'admin', NULL, NULL, 'admin', '2020-12-04', '2020-12-04 09:15:01');
INSERT INTO `t_sys_menu` VALUES ('flowableProcessInstance', '流程实例', 'flowable', 'liuchengshili', 'processInstance', 'flowable:processInstance:list', 'views/flowable/processInstance/index', '', '0', '1', 'FlowableProcessInstance', '0', '0', '1', 30400, 'admin', '2020-01-07', '2020-01-07 20:12:58', 'admin', '2020-12-04', '2020-12-04 09:15:16');
INSERT INTO `t_sys_menu` VALUES ('flowableTask', '任务管理', 'flowable', 'renwuguanli', 'task', 'flowable:task:list', 'views/flowable/task/index', NULL, '0', '1', 'FlowableTask', '0', '0', '1', 30500, 'admin', NULL, NULL, 'admin', '2020-12-04', '2020-12-04 09:34:45');
INSERT INTO `t_sys_menu` VALUES ('job', '定时任务', '', 'time-circle-fill', '/job', '', '', '', '0', '1', '', '0', '0', '0', 40000, 'admin', '2020-06-14', '2020-06-14 00:44:51', 'admin', '2020-06-14', '2020-06-14 10:29:24');
INSERT INTO `t_sys_menu` VALUES ('monitor', '监控管理', '', 'funnelplot-fill', '/monitor', '', '', '', '0', '1', '', '0', '0', '0', 50000, 'admin', '2020-04-13', '2020-04-13 23:13:17', 'admin', '2020-06-14', '2020-06-14 10:29:12');
INSERT INTO `t_sys_menu` VALUES ('monitorDruid', '数据监控', 'monitor', 'database-fill', 'druid', 'monitor:druid:list', 'views/sys/monitor/druid/index', '', '0', '1', 'MonitorDruid', '0', '0', '1', 51000, 'admin', '2020-04-13', '2020-04-13 23:17:22', 'admin', '2020-06-14', '2020-06-14 10:28:49');
INSERT INTO `t_sys_menu` VALUES ('monitorServer', '服务监控', 'monitor', 'dashboard', 'server', 'monitor:server:getServerInfo', 'views/sys/monitor/server/index', '', '0', '1', 'MonitorServer', '0', '0', '1', 52000, 'admin', '2020-04-14', '2020-04-14 00:06:38', 'admin', '2020-06-14', '2020-06-14 00:52:38');
INSERT INTO `t_sys_menu` VALUES ('monitorSwagger', 'Swagger', 'monitor', 'swagger', 'swagger', 'monitor:swagger', 'views/sys/monitor/swagger/index', '', '0', '1', 'MonitorSwagger', '0', '0', '1', 53000, 'admin', '2020-07-01', '2020-07-01 15:34:12', 'admin', NULL, NULL);
INSERT INTO `t_sys_menu` VALUES ('statement', '报表管理', '', 'pie_chart', '/statement', '', '', '', '0', '1', '', '0', '0', '0', 60000, 'admin', '2020-10-23', '2020-10-23 23:19:58', 'admin', '2020-10-23', '2020-10-23 23:22:32');
INSERT INTO `t_sys_menu` VALUES ('statementTable', '账户报表', 'statement', 'line_chart', 'table', 'sys:statement:query', 'views/statement/table/index', '', '0', '1', 'StatementTable', '0', '0', '1', 61000, 'admin', '2020-10-23', '2020-10-23 23:22:32', 'admin', NULL, NULL);
INSERT INTO `t_sys_menu` VALUES ('sys', '系统管理', '', 'setting-fill', '/sys', NULL, '', '', '0', '1', '', '0', '0', '0', 10000, 'admin', NULL, NULL, 'admin', '2020-06-14', '2020-06-14 10:36:55');
INSERT INTO `t_sys_menu` VALUES ('sysBalanceMain', '余额列表', 'balance', 'orderedlist', 'balanceMain', 'sys:balanceMain:list', 'views/sys/balanceMain/index', NULL, '0', '1', 'SysBalanceMain', '0', '0', '1', 31000, 'admin', NULL, NULL, 'admin', '2020-06-14', '2020-06-14 10:31:26');
INSERT INTO `t_sys_menu` VALUES ('sysCodeCreate', '代码生成', 'sys', 'list', 'codeCreate', 'sys:codeCreate:list', 'views/sys/codeCreate/index', NULL, '0', '1', 'SysCodeCreate', '0', '0', '1', 11000, 'admin', NULL, NULL, 'admin', NULL, NULL);
INSERT INTO `t_sys_menu` VALUES ('sysCodeType', '数据字典', 'sys', 'code', 'codeType', 'sys:codeType:list', 'views/sys/codeType/index', NULL, '0', '1', 'SysCodeType', '0', '0', '1', 10200, 'admin', NULL, NULL, 'admin', '2020-07-06', '2020-07-06 21:40:28');
INSERT INTO `t_sys_menu` VALUES ('sysConfig', '参数管理', 'sys', 'link', 'config', 'sys:config:list', 'views/sys/config/index', NULL, '0', '1', 'SysConfig', '0', '0', '1', 10100, 'admin', NULL, NULL, 'admin', '2020-06-14', '2020-06-14 10:47:06');
INSERT INTO `t_sys_menu` VALUES ('sysFunc', '功能管理', 'sys', 'form', 'func', 'sys:func:list,sys:menu:getTreeData', 'views/sys/func/index', NULL, '0', '1', 'SysFunc', '0', '0', '1', 10500, 'admin', NULL, NULL, 'admin', '2020-11-09', '2020-11-09 16:51:18');
INSERT INTO `t_sys_menu` VALUES ('sysJob', '定时任务', 'job', 'build-fill', 'sysJob', 'sys:job:list', 'views/sys/job/index', NULL, '0', '1', 'SysJob', '0', '0', '1', 41000, 'admin', NULL, NULL, 'admin', '2020-06-14', '2020-06-14 10:30:55');
INSERT INTO `t_sys_menu` VALUES ('sysJobLog', '定时任务日志', 'job', 'list', 'sysJobLog', 'sys:jobLog:list', 'views/sys/jobLog/index', NULL, '0', '1', 'SysJobLog', '0', '0', '1', 42000, 'admin', NULL, NULL, 'admin', '2020-06-14', '2020-06-14 10:30:18');
INSERT INTO `t_sys_menu` VALUES ('sysLog', '系统日志', 'sys', 'read-fill', 'log', 'sys:log:list', 'views/sys/log/index', NULL, '0', '1', 'SysLog', '0', '0', '1', 10900, 'admin', NULL, NULL, 'admin', '2020-06-14', '2020-06-14 10:43:00');
INSERT INTO `t_sys_menu` VALUES ('sysMenu', '菜单管理', 'sys', 'menu', 'menu', 'sys:menu:list,sys:menu:getTreeData', 'views/sys/menu/index', NULL, '0', '1', 'SysMenu', '0', '0', '1', 10400, 'admin', NULL, NULL, 'admin', '2020-11-09', '2020-11-09 16:50:34');
INSERT INTO `t_sys_menu` VALUES ('sysOrg', '机构管理', 'base', 'tree', 'org', 'sys:org:list,sys:org:getTreeData', 'views/sys/org/index', NULL, '0', '1', 'SysOrg', '0', '0', '1', 21000, 'admin', NULL, NULL, 'admin', '2020-06-14', '2020-06-14 10:35:48');
INSERT INTO `t_sys_menu` VALUES ('sysPicUpDown', '图片上传下载', 'sys', 'list', 'picUpDown', 'sys:picUpDown:list', 'views/sys/picUpDown/index', NULL, '0', '1', 'SysPicUpDown', '1', '0', '1', 11100, NULL, NULL, NULL, 'admin', '2021-01-08', '2021-01-08 00:26:25');
INSERT INTO `t_sys_menu` VALUES ('sysPost', '岗位管理', 'base', 'tools', 'post', 'sys:post:list', 'views/sys/post/index', NULL, '0', '1', 'SysPost', '0', '0', '1', 22000, 'admin', NULL, NULL, 'admin', '2020-06-14', '2020-06-14 10:36:19');
INSERT INTO `t_sys_menu` VALUES ('sysRole', '角色管理', 'sys', 'highlight-fill', 'role', 'sys:role:list', 'views/sys/role/index', NULL, '0', '1', 'SysRole', '0', '0', '1', 10700, 'admin', NULL, NULL, 'admin', '2020-06-14', '2020-06-14 10:41:45');
INSERT INTO `t_sys_menu` VALUES ('sysUser', '用户管理', 'sys', 'user', 'user', 'sys:user:list,sys:role:listAll', 'views/sys/user/index', NULL, '0', '1', 'SysUser', '0', '0', '1', 10800, 'admin', NULL, NULL, 'admin', '2020-06-14', '2020-06-14 10:40:19');
COMMIT;

-- ----------------------------
-- Table structure for t_sys_org
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_org`;
CREATE TABLE `t_sys_org` (
                             `org_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '机构ID',
                             `org_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '机构名称',
                             `parent_org_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '上级机构ID',
                             `short_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '机构简称',
                             `org_type` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '机构类型',
                             `org_level` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '机构级次',
                             `org_level_code` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织机构路径',
                             `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
                             `is_leaf` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否叶子节点',
                             `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
                             `create_date` date DEFAULT NULL COMMENT '创建日期',
                             `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
                             `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
                             `update_date` date DEFAULT NULL COMMENT '修改日期',
                             `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
                             PRIMARY KEY (`org_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='SYS06_机构表';

-- ----------------------------
-- Records of t_sys_org
-- ----------------------------
BEGIN;
INSERT INTO `t_sys_org` VALUES ('1000000000', '公司总部', '', '总部', '2', '1', '1000000000', '', '0', NULL, NULL, NULL, 'admin', '2020-10-30', '2020-10-30 14:38:57');
INSERT INTO `t_sys_org` VALUES ('1100000000', '信息中心', '1000000000', '信息中心', '1', '2', '1000000000,1100000000', '', '1', 'admin', '2020-10-30', '2020-10-30 11:45:59', 'admin', '2020-10-30', '2020-10-30 11:46:27');
INSERT INTO `t_sys_org` VALUES ('1200000000', '人力资源部', '1000000000', '人力', '1', '2', '1000000000,1200000000', '', '1', 'admin', '2020-10-30', '2020-10-30 11:59:27', 'admin', '2020-10-30', '2020-10-30 14:38:33');
INSERT INTO `t_sys_org` VALUES ('1300000000', '财务部', '1000000000', '财务', '1', '2', '1000000000,1300000000', '', '0', 'admin', '2020-10-30', '2020-10-30 14:37:50', 'admin', '2020-10-30', '2020-10-30 14:38:40');
INSERT INTO `t_sys_org` VALUES ('1310000000', '财务一组', '1300000000', '财务一组', '1', '3', '1000000000,1300000000,1310000000', NULL, '1', 'admin', '2020-10-30', '2020-10-30 23:47:35', NULL, NULL, NULL);
INSERT INTO `t_sys_org` VALUES ('1320000000', '财务二组', '1300000000', '财务二组', '1', '3', '1000000000,1300000000,1320000000', NULL, '1', 'admin', '2020-10-30', '2020-10-30 23:48:23', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_sys_pic_up_down
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_pic_up_down`;
CREATE TABLE `t_sys_pic_up_down` (
                                     `pic_up_down_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键id',
                                     `pic_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '图片名',
                                     `pic` mediumblob NOT NULL COMMENT '图片',
                                     `md5` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'md5',
                                     `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
                                     `create_date` date DEFAULT NULL COMMENT '创建日期',
                                     `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                                     `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
                                     `update_date` date DEFAULT NULL COMMENT '修改日期',
                                     `update_time` datetime DEFAULT NULL COMMENT '修改时间',
                                     PRIMARY KEY (`pic_up_down_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='SYS20_图片上传下载表';

-- ----------------------------
-- Records of t_sys_pic_up_down
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_sys_post
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_post`;
CREATE TABLE `t_sys_post` (
                              `post_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位ID',
                              `post_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
                              `post_status` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '状态',
                              `sort_no` int(11) DEFAULT NULL COMMENT '排序号',
                              `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
                              `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
                              `create_date` date DEFAULT NULL COMMENT '创建日期',
                              `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                              `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
                              `update_date` date DEFAULT NULL COMMENT '修改日期',
                              `update_time` datetime DEFAULT NULL COMMENT '修改时间',
                              PRIMARY KEY (`post_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='SYS13_岗位表';

-- ----------------------------
-- Records of t_sys_post
-- ----------------------------
BEGIN;
INSERT INTO `t_sys_post` VALUES ('boss', '老板', '1', 1, '', 'admin', '2020-04-12', '2020-04-12 20:45:42', NULL, NULL, NULL);
INSERT INTO `t_sys_post` VALUES ('employee', '普通员工', '1', 3, '', 'admin', '2020-04-25', '2020-04-25 12:00:50', NULL, NULL, NULL);
INSERT INTO `t_sys_post` VALUES ('manager', '经理', '1', 2, '', 'admin', '2020-04-12', '2020-04-12 20:45:24', 'admin', '2020-04-12', '2020-04-12 20:45:50');
COMMIT;

-- ----------------------------
-- Table structure for t_sys_post_user
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_post_user`;
CREATE TABLE `t_sys_post_user` (
                                   `post_user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'UUID',
                                   `post_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位ID',
                                   `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户ID',
                                   `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
                                   `create_date` date DEFAULT NULL COMMENT '创建日期',
                                   `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                                   `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
                                   `update_date` date DEFAULT NULL COMMENT '修改日期',
                                   `update_time` datetime DEFAULT NULL COMMENT '修改时间',
                                   PRIMARY KEY (`post_user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='SYS14_岗位和用户关系表';

-- ----------------------------
-- Records of t_sys_post_user
-- ----------------------------
BEGIN;
INSERT INTO `t_sys_post_user` VALUES ('033bb6acb25f7d0ad1a326cbdf5b82f7', 'manager', 'monezhao', 'admin', '2020-12-15', '2020-12-15 09:17:54', NULL, NULL, NULL);
INSERT INTO `t_sys_post_user` VALUES ('398b12f5e2fe5ae1ced7bb47fbdc27d2', 'employee', 'monezhao', 'admin', '2020-12-09', '2020-12-09 10:16:03', NULL, NULL, NULL);
INSERT INTO `t_sys_post_user` VALUES ('ba2133f55f0027f7b630e3b8fb6b26d5', 'manager', 'admin', 'admin', '2020-12-15', '2020-12-15 09:17:54', NULL, NULL, NULL);
INSERT INTO `t_sys_post_user` VALUES ('boss-admin', 'boss', 'admin', 'admin', '2020-05-27', '2020-05-27 17:46:37', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_sys_role
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_role`;
CREATE TABLE `t_sys_role` (
                              `role_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色ID',
                              `role_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
                              `sort_no` int(11) NOT NULL COMMENT '排序号',
                              `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
                              `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
                              `create_date` date DEFAULT NULL COMMENT '创建日期',
                              `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
                              `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
                              `update_date` date DEFAULT NULL COMMENT '修改日期',
                              `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
                              PRIMARY KEY (`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='SYS07_角色表';

-- ----------------------------
-- Records of t_sys_role
-- ----------------------------
BEGIN;
INSERT INTO `t_sys_role` VALUES ('admin', '系统管理员', 1, '', NULL, NULL, NULL, 'admin', '2020-06-17', '2020-06-17 06:50:53');
INSERT INTO `t_sys_role` VALUES ('queryRole', '用户', 2, '', 'admin', '2019-09-07', '2019-09-07 21:10:19', 'admin', '2020-06-17', '2020-06-17 06:50:46');
COMMIT;

-- ----------------------------
-- Table structure for t_sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_role_permission`;
CREATE TABLE `t_sys_role_permission` (
                                         `role_permission_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作权限ID',
                                         `role_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色ID',
                                         `permission_type` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '权限类型',
                                         `menu_or_func_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单或功能ID',
                                         `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
                                         `create_date` date DEFAULT NULL COMMENT '创建日期',
                                         `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
                                         `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
                                         `update_date` date DEFAULT NULL COMMENT '修改日期',
                                         `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
                                         PRIMARY KEY (`role_permission_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='SYS08_操作权限表';

-- ----------------------------
-- Records of t_sys_role_permission
-- ----------------------------
BEGIN;
INSERT INTO `t_sys_role_permission` VALUES ('00a494e9e0771bb7ca3c2a5c6232e6a9', 'admin', '1', 'sys', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('012876c31d86bfd24fb94f1cb541f727', 'admin', '2', 'flowableModel-5', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('042b3baacadd2436343d4dde020224b4', 'admin', '2', 'sysCodeInfo-4', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('097864a6c76d4f6a62da01e4370a5d85', 'admin', '2', 'flowableProcessDefinition-5', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('09a24e4a879830925d035e861bb78e46', 'admin', '2', 'flowableProcessInstance-1', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('100011bf19190fc80711f58aefd6e58e', 'admin', '2', 'sysRole-5', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('143b288938e516b4674c1e4be363b96d', 'admin', '1', 'flowable', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('164703b3f30d9308fb2a9900282c78f3', 'admin', '2', 'sysRole-2', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('1749ce90a8db43b7c87cf17dd7e7d4f6', 'admin', '2', 'flowableModel-3', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('1760fe0fb2dcf0b892a0cb105bb6fdfc', 'admin', '1', 'flowableTask', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('192e72bfe09fac7d80a8f411fc7bf446', 'queryRole', '2', 'sysBalanceMain-1', 'admin', '2021-01-21', '2021-01-21 15:58:05', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('1955439fdca44e3689b8a76b92352ef9', 'admin', '1', 'sysLog', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('1a26a87234ec03b762c02804f2d91aa9', 'admin', '2', 'sysBalanceMain-4', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('1ad8d8ddeb854447995ddc2d0b63ede0', 'admin', '2', 'sysCodeType-3', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('1bce451c3b87d5ab65d268796566e40e', 'admin', '2', 'sysJob-4', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('1e90dbd3631240ee0befc21346a34b98', 'admin', '1', 'sysUser', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('2067756e4e958cbd3b004a4892d419a7', 'admin', '1', 'monitor', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('21b38906b2b910f6c73016ba2d63deed', 'admin', '2', 'sysBalanceMain-2', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('23b57c1b42190d0b054e2b9364b62d95', 'admin', '1', 'base', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('2983d8d46ae5f871fbd3578251bd45e2', 'admin', '2', 'flowableModel-2', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('2c0a61b3ff5bb477163559e3161b8d02', 'admin', '1', 'sysFunc', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('2f3dfc36f54bb0cc07b48b1f394d4fde', 'admin', '2', 'sysFunc-1', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('30bc7f664d125902c96d66b0364cc828', 'admin', '1', 'flowableForm', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('3190bff6ed527c6c10c05d23c1974cff', 'admin', '2', 'sysUser-4', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('322497bfe5add2b677dc3eb49b67a41b', 'admin', '1', 'monitorSwagger', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('35e9086eadec182290941629471d74dd', 'admin', '2', 'sysPost-1', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('3a4601768b1c6af340167652d1173bda', 'queryRole', '1', 'sysBalanceMain', 'admin', '2021-01-21', '2021-01-21 15:58:05', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('3c02b50785fdac275ef1f1f86b63c23f', 'admin', '2', 'sysUser-1', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('3e4b1cb4b6891d9ecf2d25215aad83c9', 'queryRole', '1', 'balance', 'admin', '2021-01-21', '2021-01-21 15:58:05', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('44638cccca211b623bd3204ee7bb3e8c', 'admin', '2', 'sysCodeCreate-4', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('458a8332009f3ba8fb1e0f08a122a252', 'admin', '2', 'flowableProcessInstance-3', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('47bd5c7f64c399492a97edc3e4a79a8b', 'admin', '2', 'sysPost-4', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('4a47cb4538e9495aa5f43c196daea7df', 'admin', '1', 'sysPicUpDown', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('4bccb8d1793017029698d09c249e0090', 'admin', '2', 'flowableProcessDefinition-4', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('4c0c33ee533a8f6bfba806d3d14bdc4a', 'admin', '2', 'sysJob-3', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('4f33c907e1ba3d32fb2d020d0a57074b', 'queryRole', '2', 'sysBalanceMain-2', 'admin', '2021-01-21', '2021-01-21 15:58:05', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('53a99cd457b1f2bde6dc1f8159187771', 'admin', '2', 'sysOrg-1', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('582973045bd6df253e75b1359ba7e5c5', 'admin', '2', 'sysCodeInfo-3', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('583fd273fabb234d722b7c80cf8b772c', 'admin', '1', 'job', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('58bc765afbb6c111689cdeff6923b8ff', 'admin', '2', 'flowableProcessDefinition-2', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('58ffe15dcbaa3a26de5e3e330aa438c8', 'admin', '2', 'sysOrg-3', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('5bc79c964eb0c541c80c5e587a39e283', 'admin', '2', 'sysUser-2', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('5e00e4b179069a8b41ece666a95e95c3', 'admin', '2', 'sysOrg-2', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('5e878d5a3f504b3257df0a8d55426d58', 'admin', '1', 'balance', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('5f4743836eaa94701f6d3e7bf69b6b18', 'admin', '2', 'sysJob-2', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('618647a3fad9712cb43e0d8b4cf5d3ba', 'admin', '2', 'sysBalanceMain-5', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('6244b36f34ef6e0173d8180fff79f035', 'admin', '1', 'flowableModel', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('632bc7c76fe9c0432ab9ce1d5260036c', 'admin', '1', 'sysJob', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('6363e14c9520490fb9fc0a77595c4230', 'admin', '2', 'sysMenu-2', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('658afd2400337f97a7614570beb0f20c', 'queryRole', '1', 'statement', 'admin', '2021-01-21', '2021-01-21 15:58:05', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('65dd83ebcb0aefd4f7b83fcd84e7422d', 'admin', '2', 'sysJob-1', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('68908516b60776e5f68068f3753aa4f3', 'admin', '1', 'sysMenu', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('6cb921f0e2e3c216f4713c15bb8018ab', 'admin', '2', 'sysJob-5', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('6d06e623619bd41a3da9e12606a41535', 'admin', '1', 'sysCodeCreate', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('6ee6e1861bf021a0933b016d1f8f15b9', 'admin', '1', 'sysJobLog', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('77f6a9df9a5ec9096187405a58c45ab7', 'queryRole', '2', 'sysBalanceMain-3', 'admin', '2021-01-21', '2021-01-21 15:58:05', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('7b73e497041f0810b71df8f9027fcc9b', 'admin', '2', 'flowableProcessDefinition-1', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('7dcca175ec561e31987f18c308a0a167', 'admin', '2', 'sysRole-3', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('7dd6fd44b7a924f786d3f5443b105f06', 'admin', '1', 'sysBalanceMain', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('7eea409167abc0e45ff11336cba83b46', 'admin', '1', 'flowableProcessDefinition', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('7f7d5b7c54ddee0133cc6259d52a979a', 'admin', '2', 'sysBalanceMain-1', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('80fa53e2a1c8ba691fe604aad4556055', 'admin', '2', 'sysUser-3', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('81e7e64d677e973271bb6aa77421bf18', 'admin', '2', 'sysMenu-3', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('823cd52d8f247d10b95d5050ea77de18', 'admin', '2', 'flowableForm-2', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('85572230604188b8dac5b4503e095480', 'admin', '2', 'flowableTask-1', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('8a890ad367c4682e93f3af66a1ca67f8', 'admin', '1', 'flowableProcessInstance', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('907aa711a8660591d51a25fc0adb996c', 'admin', '2', 'flowableProcessDefinition-3', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('914c10a89dcc0a910c8401fa6c25a049', 'admin', '2', 'sysFunc-3', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('9221d99ad9c9633135f6ce0a8fa46346', 'admin', '1', 'statement', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('9561cbba561f54477c6acb6e39393e52', 'admin', '1', 'monitorDruid', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('957c2b2df6c25053817eebe04918b468', 'admin', '2', 'sysCodeCreate-1', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('96f202ccb485ec6564a39918d867f062', 'admin', '2', 'sysCodeCreate-3', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('a60ffa7dfb12cc5ab7a4b5101a708d9f', 'admin', '1', 'sysCodeType', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('a70cbc2fdfcd23a5d71ff63303afec87', 'admin', '2', 'sysCodeCreate-2', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('a7af8aeb141849f9180f5cd965b92ad6', 'admin', '2', 'sysRole-4', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('a8c8888ae1a50cc8ad24f26574f251cb', 'admin', '1', 'sysOrg', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('aa791ef0ac207f14817d320e95624df3', 'admin', '2', 'flowableProcessInstance-2', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('be320819be9b276b8091ae42208d2230', 'admin', '2', 'flowableForm-1', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('bfe403c223def9e8f1916054d90e8a58', 'admin', '2', 'sysConfig-3', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('c13abee54eb129d495a2e194619c4ffa', 'admin', '2', 'flowableModel-6', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('cb74402b4ccdbc21e0f86690081df9d4', 'queryRole', '1', 'statementTable', 'admin', '2021-01-21', '2021-01-21 15:58:05', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('cc9f913a6ad938925c771c15387dd4d4', 'admin', '2', 'flowableModel-1', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('d1a0f97e93ecdde9d501af207b6e737b', 'admin', '1', 'sysRole', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('d4d89e56ec432e79438c0650ccaeef7f', 'admin', '2', 'sysPost-2', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('d7400c48601d95a37da0f7833bbb6d04', 'admin', '2', 'sysRole-1', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('d9e17c4a9f10795bd06f290043fa6236', 'admin', '2', 'sysMenu-1', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('e19a801065933932d5e34c5d3b10d4ae', 'admin', '2', 'sysPost-3', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('e24a6ee73604bc2d834b20cff2522ee5', 'admin', '1', 'monitorServer', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('e3b1931bbcbd700c2dc1845c4f75e75b', 'admin', '2', 'sysCodeType-1', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('e4c1a614f8664fd07e1e73982ac710d7', 'admin', '2', 'sysCodeType-2', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('ead8b4924fa7a8060392f814aa614edd', 'admin', '2', 'sysFunc-2', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('ed338eb3f3e4d49c69a6ee0c80fac999', 'admin', '1', 'statementTable', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('ee08c138887fce43e942149ecae4af35', 'admin', '2', 'sysCodeInfo-2', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('ee66c16e6bdcf03b07b772c4053049b0', 'admin', '2', 'sysCodeInfo-1', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('f629d6dd6c58ea425242dc727aad563c', 'admin', '2', 'flowableForm-3', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('f7cb5c956624a0b04866a03bb115d30f', 'admin', '1', 'sysConfig', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('f9e76b767ab1e615c3fc3230c5719eb9', 'admin', '2', 'flowableModel-4', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('fb0b890cfe7117748b2fbb33e90d0632', 'admin', '1', 'sysPost', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('fd004b0809fac404c301d77bacd15274', 'admin', '2', 'sysConfig-1', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('fd990a37a4880f592970ce0891ced6d2', 'admin', '2', 'sysConfig-2', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` VALUES ('fe4bba176ed08147dcb2a9cf97a7f109', 'admin', '2', 'sysBalanceMain-3', 'admin', '2021-01-07', '2021-01-07 23:10:19', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_sys_role_user
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_role_user`;
CREATE TABLE `t_sys_role_user` (
                                   `role_user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'UUID',
                                   `role_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色ID',
                                   `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户ID',
                                   `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
                                   `create_date` date DEFAULT NULL COMMENT '创建日期',
                                   `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
                                   `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
                                   `update_date` date DEFAULT NULL COMMENT '修改日期',
                                   `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
                                   PRIMARY KEY (`role_user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='SYS11_角色和用户关系表';

-- ----------------------------
-- Records of t_sys_role_user
-- ----------------------------
BEGIN;
INSERT INTO `t_sys_role_user` VALUES ('admin-admin', 'admin', 'admin', 'admin', '2020-03-17', '2020-03-17 14:11:29', NULL, NULL, NULL);
INSERT INTO `t_sys_role_user` VALUES ('queryRole-monezhao', 'queryRole', 'monezhao', 'admin', '2020-06-12', '2020-06-12 11:07:42', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_sys_user
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_user`;
CREATE TABLE `t_sys_user` (
                              `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户ID',
                              `user_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户姓名',
                              `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
                              `salt` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '密码盐',
                              `sex` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '性别',
                              `role_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '所属角色ID',
                              `org_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '所属机构ID',
                              `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '手机号码',
                              `id_card_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '身份证号码',
                              `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
                              `status` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户状态',
                              `sort_no` int(11) DEFAULT NULL COMMENT '排序号',
                              `pic_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '头像id',
                              `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
                              `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
                              `create_date` date DEFAULT NULL COMMENT '创建日期',
                              `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
                              `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
                              `update_date` date DEFAULT NULL COMMENT '修改日期',
                              `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
                              PRIMARY KEY (`user_id`) USING BTREE,
                              UNIQUE KEY `unique_user_name` (`user_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='SYS10_用户表';

-- ----------------------------
-- Records of t_sys_user
-- ----------------------------
BEGIN;
INSERT INTO `t_sys_user` VALUES ('admin', 'admin', '4560a01246015a762ccb8c449fd7e9415858a98e99ccbc1f9e5dc1bf992560cc', 'RPOT6fZi', '1', 'admin', '1000000000', '18888888888', 'xxx', 'xxx@yyy.zz', '1', 1, '', '1', NULL, NULL, NULL, 'admin', '2021-01-08', '2021-01-08 00:16:13');
INSERT INTO `t_sys_user` VALUES ('monezhao', 'monezhao', 'af083312ff190e98531786fb5912dadb12cdad917e6267f15fbadecd1d0ae81c', 'jhqF75Xr', '1', 'queryRole', '1000000000', 'x', 'x', 'x', '1', 2, '', '', 'admin', '2020-06-12', '2020-06-12 11:07:42', 'admin', '2020-11-18', '2020-11-18 17:21:13');
COMMIT;

-- ----------------------------
-- Table structure for t_sys_user_short_cut
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_user_short_cut`;
CREATE TABLE `t_sys_user_short_cut` (
                                        `user_short_cut_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作权限ID',
                                        `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户ID',
                                        `menu_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单ID',
                                        `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
                                        `create_date` date DEFAULT NULL COMMENT '创建日期',
                                        `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                                        `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
                                        `update_date` date DEFAULT NULL COMMENT '修改日期',
                                        `update_time` datetime DEFAULT NULL COMMENT '修改时间',
                                        PRIMARY KEY (`user_short_cut_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='shortcut_用户与快捷方式表';

-- ----------------------------
-- Records of t_sys_user_short_cut
-- ----------------------------
BEGIN;
INSERT INTO `t_sys_user_short_cut` VALUES ('1280856268906434562', 'monezhao', 'sysBalanceMain', 'monezhao', '2020-07-08', '2020-07-08 21:28:26', NULL, NULL, NULL);
INSERT INTO `t_sys_user_short_cut` VALUES ('1281223747671429122', 'admin', 'sysCodeType', 'admin', '2020-07-09', '2020-07-09 21:48:40', NULL, NULL, NULL);
INSERT INTO `t_sys_user_short_cut` VALUES ('1281223747713372162', 'admin', 'sysMenu', 'admin', '2020-07-09', '2020-07-09 21:48:40', NULL, NULL, NULL);
INSERT INTO `t_sys_user_short_cut` VALUES ('1281223747738537986', 'admin', 'sysFunc', 'admin', '2020-07-09', '2020-07-09 21:48:40', NULL, NULL, NULL);
INSERT INTO `t_sys_user_short_cut` VALUES ('1281223747759509505', 'admin', 'sysUser', 'admin', '2020-07-09', '2020-07-09 21:48:40', NULL, NULL, NULL);
INSERT INTO `t_sys_user_short_cut` VALUES ('1281223747788869634', 'admin', 'monitorSwagger', 'admin', '2020-07-09', '2020-07-09 21:48:40', NULL, NULL, NULL);
INSERT INTO `t_sys_user_short_cut` VALUES ('2b26b87faf20c863ab20b4da8d24181d', 'admin', 'monitorServer', 'admin', '2020-11-26', '2020-11-26 10:21:54', NULL, NULL, NULL);
INSERT INTO `t_sys_user_short_cut` VALUES ('7c0514be37718e4ad3f91730e4310961', 'monezhao', 'statementTable', 'admin', '2020-10-23', '2020-10-23 23:25:18', NULL, NULL, NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
