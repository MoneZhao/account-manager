/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80018 (8.0.18)
 Source Host           : localhost:3306
 Source Schema         : account_manager

 Target Server Type    : MySQL
 Target Server Version : 80018 (8.0.18)
 File Encoding         : 65001

 Date: 22/12/2022 14:09:46
*/

SET NAMES utf8mb4;
SET
FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_flowable_form
-- ----------------------------
DROP TABLE IF EXISTS `t_flowable_form`;
CREATE TABLE `t_flowable_form`
(
    `form_key`    varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '表单key',
    `form_name`   varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '表单名称',
    `form_json`   longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '表单内容json串',
    `create_by`   varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
    `create_date` date                                                         DEFAULT NULL COMMENT '创建日期',
    `create_time` datetime                                                     DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
    `update_date` date                                                         DEFAULT NULL COMMENT '修改日期',
    `update_time` datetime                                                     DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`form_key`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='flowable_流程表单';

-- ----------------------------
-- Records of t_flowable_form
-- ----------------------------
BEGIN;
INSERT INTO `t_flowable_form` (`form_key`, `form_name`, `form_json`, `create_by`, `create_date`, `create_time`,
                               `update_by`, `update_date`, `update_time`)
VALUES ('leaveApply', '请假表单',
        '{\"list\":[{\"type\":\"input\",\"icon\":\"icon-input\",\"options\":{\"width\":\"80%\",\"defaultValue\":\"\",\"required\":true,\"dataType\":\"string\",\"pattern\":\"\",\"placeholder\":\"\",\"disabled\":false,\"remoteFunc\":\"func_1607478581000_58879\"},\"name\":\"员工号\",\"key\":\"1607478581000_58879\",\"model\":\"userId\",\"rules\":[{\"type\":\"string\",\"message\":\"员工号格式不正确\"},{\"required\":true,\"message\":\"员工号必须填写\"}]},{\"type\":\"input\",\"icon\":\"icon-input\",\"options\":{\"width\":\"80%\",\"defaultValue\":\"\",\"required\":true,\"dataType\":\"string\",\"pattern\":\"\",\"placeholder\":\"\",\"disabled\":false,\"remoteFunc\":\"func_1607478586000_90043\"},\"name\":\"员工姓名\",\"key\":\"1607478586000_90043\",\"model\":\"userName\",\"rules\":[{\"type\":\"string\",\"message\":\"员工姓名格式不正确\"},{\"required\":true,\"message\":\"员工姓名必须填写\"}]},{\"type\":\"date\",\"icon\":\"icon-date\",\"options\":{\"defaultValue\":\"\",\"readonly\":false,\"disabled\":false,\"editable\":false,\"clearable\":true,\"placeholder\":\"\",\"startPlaceholder\":\"\",\"endPlaceholder\":\"\",\"type\":\"datetime\",\"format\":\"yyyy-MM-dd HH:mm:ss\",\"timestamp\":false,\"required\":true,\"width\":\"50%\",\"remoteFunc\":\"func_1607478591000_51493\"},\"name\":\"开始时间\",\"key\":\"1607478591000_51493\",\"model\":\"dateStart\",\"rules\":[{\"required\":true,\"message\":\"开始时间必须填写\"}]},{\"type\":\"date\",\"icon\":\"icon-date\",\"options\":{\"defaultValue\":\"\",\"readonly\":false,\"disabled\":false,\"editable\":false,\"clearable\":true,\"placeholder\":\"\",\"startPlaceholder\":\"\",\"endPlaceholder\":\"\",\"type\":\"datetime\",\"format\":\"yyyy-MM-dd HH:mm:ss\",\"timestamp\":false,\"required\":true,\"width\":\"50%\",\"remoteFunc\":\"func_1607478594000_24349\"},\"name\":\"结束时间\",\"key\":\"1607478594000_24349\",\"model\":\"dateEnd\",\"rules\":[{\"required\":true,\"message\":\"结束时间必须填写\"}]}],\"config\":{\"labelWidth\":100,\"labelPosition\":\"right\",\"size\":\"small\"}}',
        'admin', '2020-12-09', '2020-12-09 09:49:09', 'admin', '2020-12-09', '2020-12-09 09:55:22');
INSERT INTO `t_flowable_form` (`form_key`, `form_name`, `form_json`, `create_by`, `create_date`, `create_time`,
                               `update_by`, `update_date`, `update_time`)
VALUES ('notice', '部门通知',
        '{\"list\":[{\"type\":\"input\",\"icon\":\"icon-input\",\"options\":{\"width\":\"40%\",\"defaultValue\":\"\",\"required\":true,\"dataType\":\"string\",\"pattern\":\"\",\"placeholder\":\"\",\"disabled\":false,\"remoteFunc\":\"func_1607993807000_18915\"},\"name\":\"姓名\",\"key\":\"1607993807000_18915\",\"model\":\"input_1607993807000_18915\",\"rules\":[{\"type\":\"string\",\"message\":\"姓名格式不正确\"},{\"required\":true,\"message\":\"姓名必须填写\"}]},{\"type\":\"input\",\"icon\":\"icon-input\",\"options\":{\"width\":\"100%\",\"defaultValue\":\"\",\"required\":true,\"dataType\":\"string\",\"pattern\":\"\",\"placeholder\":\"\",\"disabled\":false,\"remoteFunc\":\"func_1607993809000_68225\"},\"name\":\"部门\",\"key\":\"1607993809000_68225\",\"model\":\"input_1607993809000_68225\",\"rules\":[{\"type\":\"string\",\"message\":\"部门格式不正确\"},{\"required\":true,\"message\":\"部门必须填写\"}]},{\"type\":\"textarea\",\"icon\":\"icon-diy-com-textarea\",\"options\":{\"width\":\"100%\",\"defaultValue\":\"\",\"required\":true,\"disabled\":false,\"pattern\":\"\",\"placeholder\":\"\",\"remoteFunc\":\"func_1607993810000_75259\"},\"name\":\"通知\",\"key\":\"1607993810000_75259\",\"model\":\"textarea_1607993810000_75259\",\"rules\":[{\"required\":true,\"message\":\"通知必须填写\"}]}],\"config\":{\"labelWidth\":100,\"labelPosition\":\"right\",\"size\":\"small\"}}',
        'admin', '2020-12-15', '2020-12-15 08:53:31', 'admin', '2020-12-15', '2020-12-15 09:02:16');
COMMIT;

-- ----------------------------
-- Table structure for t_sys_balance_count
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_balance_count`;
CREATE TABLE `t_sys_balance_count`
(
    `balance_count_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键id',
    `code_info_id`     varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账户类型id',
    `count_type`       varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '是否计入总资产',
    `user_id`          varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所属用户',
    `create_by`        varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
    `create_date`      date                                                         DEFAULT NULL COMMENT '创建日期',
    `create_time`      datetime                                                     DEFAULT NULL COMMENT '创建时间',
    `update_by`        varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
    `update_date`      date                                                         DEFAULT NULL COMMENT '修改日期',
    `update_time`      datetime                                                     DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`balance_count_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='SYS21_计入总资产表';

-- ----------------------------
-- Records of t_sys_balance_count
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_sys_balance_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_balance_detail`;
CREATE TABLE `t_sys_balance_detail`
(
    `balance_detail_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键id',
    `account`           decimal(12, 2)                                               NOT NULL COMMENT '账户余额',
    `balance_type`      varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '账户类型',
    `balance_main_id`   varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主表id',
    `user_id`           varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所属用户id',
    `remark`            varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
    `create_by`         varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '创建人',
    `create_date`       date                                                          DEFAULT NULL COMMENT '创建日期',
    `create_time`       datetime                                                      DEFAULT NULL COMMENT '创建时间',
    `update_by`         varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '修改人',
    `update_date`       date                                                          DEFAULT NULL COMMENT '修改日期',
    `update_time`       datetime                                                      DEFAULT NULL COMMENT '修改时间',
    `version`           int(6) NOT NULL DEFAULT '1' COMMENT '乐观锁',
    `delete_type`       int(1) DEFAULT NULL COMMENT '0 不删除 1 删除',
    PRIMARY KEY (`balance_detail_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='SYS18_账户明细表';

-- ----------------------------
-- Records of t_sys_balance_detail
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_sys_balance_main
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_balance_main`;
CREATE TABLE `t_sys_balance_main`
(
    `balance_main_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键id',
    `account`         decimal(12, 2)                                               NOT NULL COMMENT '账户余额',
    `account_date`    date                                                         NOT NULL COMMENT '记录时间',
    `user_id`         varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所属用户',
    `remark`          varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
    `create_by`       varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '创建人',
    `create_date`     date                                                          DEFAULT NULL COMMENT '创建日期',
    `create_time`     datetime                                                      DEFAULT NULL COMMENT '创建时间',
    `update_by`       varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '修改人',
    `update_date`     date                                                          DEFAULT NULL COMMENT '修改日期',
    `update_time`     datetime                                                      DEFAULT NULL COMMENT '修改时间',
    `version`         int(6) NOT NULL DEFAULT '1' COMMENT '乐观锁',
    `delete_type`     int(1) DEFAULT NULL COMMENT '0 不删除 1 删除',
    PRIMARY KEY (`balance_main_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='SYS17_账户余额主表';

-- ----------------------------
-- Records of t_sys_balance_main
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_sys_code_create
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_code_create`;
CREATE TABLE `t_sys_code_create`
(
    `code_create_id`        varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '主键id',
    `code_create_tablename` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '表名',
    `code_create_module`    varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '模块名',
    `code_create_filename`  varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件名',
    `create_by`             varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
    `create_date`           date                                                         DEFAULT NULL COMMENT '创建日期',
    `create_time`           datetime                                                     DEFAULT NULL COMMENT '创建时间',
    `update_by`             varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
    `update_date`           date                                                         DEFAULT NULL COMMENT '修改日期',
    `update_time`           datetime                                                     DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`code_create_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='SYS19_代码在线生成';

-- ----------------------------
-- Records of t_sys_code_create
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_sys_code_info
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_code_info`;
CREATE TABLE `t_sys_code_info`
(
    `code_info_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '代码信息ID',
    `code_type_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '代码类别ID',
    `value`        varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '下拉框值',
    `content`      varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '下拉框内容',
    `parent_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '上级联动下拉框值',
    `sort_no`      int(11) NOT NULL COMMENT '排序号',
    `remark`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
    `is_ok`        varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   DEFAULT NULL COMMENT '是否显示',
    `create_by`    varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '创建人',
    `create_date`  date                                                          DEFAULT NULL COMMENT '创建日期',
    `create_time`  timestamp NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`    varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '修改人',
    `update_date`  date                                                          DEFAULT NULL COMMENT '修改日期',
    `update_time`  timestamp NULL DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`code_info_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='SYS03_代码信息表';

-- ----------------------------
-- Records of t_sys_code_info
-- ----------------------------
BEGIN;
INSERT INTO `t_sys_code_info` (`code_info_id`, `code_type_id`, `value`, `content`, `parent_value`, `sort_no`, `remark`,
                               `is_ok`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                               `update_time`)
VALUES ('16f779dd94f813adffee5d756c166ee7', 'balanceType', '12', '股票', '', 3, '', '1', 'monezhao', '2022-08-11',
        '2022-08-11 22:55:48', 'monezhao', '2022-09-03', '2022-09-03 09:10:34');
INSERT INTO `t_sys_code_info` (`code_info_id`, `code_type_id`, `value`, `content`, `parent_value`, `sort_no`, `remark`,
                               `is_ok`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                               `update_time`)
VALUES ('1a6624861756622589d2887c19186d12', 'balanceType', '10', '住房公积金', '', 12, '', '1', 'admin', '2020-08-04',
        '2020-08-04 21:56:21', 'monezhao', '2022-09-03', '2022-09-03 09:10:29');
INSERT INTO `t_sys_code_info` (`code_info_id`, `code_type_id`, `value`, `content`, `parent_value`, `sort_no`, `remark`,
                               `is_ok`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                               `update_time`)
VALUES ('20a0ad6baf6502f8d6790057a7ea6cbd', 'balanceType', '13', '医保', '', 13, '', '1', 'monezhao', '2022-08-31',
        '2022-08-31 08:45:31', NULL, NULL, NULL);
INSERT INTO `t_sys_code_info` (`code_info_id`, `code_type_id`, `value`, `content`, `parent_value`, `sort_no`, `remark`,
                               `is_ok`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                               `update_time`)
VALUES ('556439c2e0bcfce0b89f575ef7e58067', 'balanceType', '11', '现金', '', 4, '', '1', 'admin', '2020-10-01',
        '2020-10-01 21:28:38', 'monezhao', '2022-09-03', '2022-09-03 09:10:12');
INSERT INTO `t_sys_code_info` (`code_info_id`, `code_type_id`, `value`, `content`, `parent_value`, `sort_no`, `remark`,
                               `is_ok`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                               `update_time`)
VALUES ('5ca5cd0b9c956316bd22b392d45084db', 'processCategory', '2', '审阅', '', 2, '', '1', 'admin', '2020-12-09',
        '2020-12-09 09:58:42', NULL, NULL, NULL);
INSERT INTO `t_sys_code_info` (`code_info_id`, `code_type_id`, `value`, `content`, `parent_value`, `sort_no`, `remark`,
                               `is_ok`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                               `update_time`)
VALUES ('7c67331a479127d2e89f08f3e1daca43', 'processCategory', '1', '审批', '', 1, '', '1', 'admin', '2020-12-09',
        '2020-12-09 09:58:32', NULL, NULL, NULL);
INSERT INTO `t_sys_code_info` (`code_info_id`, `code_type_id`, `value`, `content`, `parent_value`, `sort_no`, `remark`,
                               `is_ok`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                               `update_time`)
VALUES ('balanceType-0', 'balanceType', '0', '支付宝', '', 0, '', '1', 'admin', '2020-06-08', '2020-06-08 08:57:50',
        NULL, NULL, NULL);
INSERT INTO `t_sys_code_info` (`code_info_id`, `code_type_id`, `value`, `content`, `parent_value`, `sort_no`, `remark`,
                               `is_ok`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                               `update_time`)
VALUES ('balanceType-1', 'balanceType', '1', '微信钱包', '', 2, '', '1', 'admin', '2020-06-08', '2020-06-08 08:58:26',
        'monezhao', '2022-06-30', '2022-06-30 08:02:47');
INSERT INTO `t_sys_code_info` (`code_info_id`, `code_type_id`, `value`, `content`, `parent_value`, `sort_no`, `remark`,
                               `is_ok`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                               `update_time`)
VALUES ('balanceType-2', 'balanceType', '2', '京东金融', '', 10, '', '1', 'admin', '2020-06-08', '2020-06-08 08:58:26',
        'monezhao', '2022-06-30', '2022-06-30 08:04:49');
INSERT INTO `t_sys_code_info` (`code_info_id`, `code_type_id`, `value`, `content`, `parent_value`, `sort_no`, `remark`,
                               `is_ok`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                               `update_time`)
VALUES ('balanceType-3', 'balanceType', '3', '翼支付', '', 11, '', '1', 'admin', '2020-06-08', '2020-06-08 08:58:26',
        'monezhao', '2022-06-30', '2022-06-30 08:04:54');
INSERT INTO `t_sys_code_info` (`code_info_id`, `code_type_id`, `value`, `content`, `parent_value`, `sort_no`, `remark`,
                               `is_ok`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                               `update_time`)
VALUES ('balanceType-4', 'balanceType', '4', '招商银行', '', 1, '', '1', 'admin', '2020-06-08', '2020-06-08 08:58:26',
        'monezhao', '2022-06-30', '2022-06-30 08:02:28');
INSERT INTO `t_sys_code_info` (`code_info_id`, `code_type_id`, `value`, `content`, `parent_value`, `sort_no`, `remark`,
                               `is_ok`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                               `update_time`)
VALUES ('balanceType-5', 'balanceType', '5', '建设银行', '', 5, '', '1', 'admin', '2020-06-08', '2020-06-08 08:58:26',
        NULL, NULL, NULL);
INSERT INTO `t_sys_code_info` (`code_info_id`, `code_type_id`, `value`, `content`, `parent_value`, `sort_no`, `remark`,
                               `is_ok`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                               `update_time`)
VALUES ('balanceType-6', 'balanceType', '6', '农业银行', '', 6, '', '1', 'admin', '2020-06-08', '2020-06-08 08:58:26',
        NULL, NULL, NULL);
INSERT INTO `t_sys_code_info` (`code_info_id`, `code_type_id`, `value`, `content`, `parent_value`, `sort_no`, `remark`,
                               `is_ok`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                               `update_time`)
VALUES ('balanceType-7', 'balanceType', '7', '工商银行', '', 7, '', '1', 'admin', '2020-06-08', '2020-06-08 08:58:26',
        NULL, NULL, NULL);
INSERT INTO `t_sys_code_info` (`code_info_id`, `code_type_id`, `value`, `content`, `parent_value`, `sort_no`, `remark`,
                               `is_ok`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                               `update_time`)
VALUES ('balanceType-8', 'balanceType', '8', '邮储银行', '', 8, '', '1', 'admin', '2020-06-08', '2020-06-08 08:58:26',
        NULL, NULL, NULL);
INSERT INTO `t_sys_code_info` (`code_info_id`, `code_type_id`, `value`, `content`, `parent_value`, `sort_no`, `remark`,
                               `is_ok`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                               `update_time`)
VALUES ('balanceType-9', 'balanceType', '9', '平安银行', '', 9, '', '1', 'admin', '2020-06-08', '2020-06-08 08:58:26',
        NULL, NULL, NULL);
INSERT INTO `t_sys_code_info` (`code_info_id`, `code_type_id`, `value`, `content`, `parent_value`, `sort_no`, `remark`,
                               `is_ok`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                               `update_time`)
VALUES ('entityType-1', 'entityType', '1', '角色', '', 1, '', '1', 'admin', '2019-09-01', '2019-09-01 11:40:55', NULL,
        NULL, NULL);
INSERT INTO `t_sys_code_info` (`code_info_id`, `code_type_id`, `value`, `content`, `parent_value`, `sort_no`, `remark`,
                               `is_ok`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                               `update_time`)
VALUES ('entityType-2', 'entityType', '2', '用户', '', 2, '', '1', 'admin', '2019-09-01', '2019-09-01 11:41:12', NULL,
        NULL, NULL);
INSERT INTO `t_sys_code_info` (`code_info_id`, `code_type_id`, `value`, `content`, `parent_value`, `sort_no`, `remark`,
                               `is_ok`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                               `update_time`)
VALUES ('identityType-1', 'identityType', '1', '用户', '', 1, '', '1', 'admin', '2020-03-01', '2020-03-01 19:14:27',
        NULL, NULL, NULL);
INSERT INTO `t_sys_code_info` (`code_info_id`, `code_type_id`, `value`, `content`, `parent_value`, `sort_no`, `remark`,
                               `is_ok`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                               `update_time`)
VALUES ('identityType-2', 'identityType', '2', '岗位', '', 2, '', '1', 'admin', '2020-03-01', '2020-03-01 19:14:53',
        'admin', '2020-04-20', '2020-04-20 20:31:24');
INSERT INTO `t_sys_code_info` (`code_info_id`, `code_type_id`, `value`, `content`, `parent_value`, `sort_no`, `remark`,
                               `is_ok`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                               `update_time`)
VALUES ('logType-1', 'logType', '1', '登录日志', '', 1, '', '1', 'user2', '2019-09-03', '2019-09-03 00:52:34', NULL,
        NULL, NULL);
INSERT INTO `t_sys_code_info` (`code_info_id`, `code_type_id`, `value`, `content`, `parent_value`, `sort_no`, `remark`,
                               `is_ok`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                               `update_time`)
VALUES ('logType-2', 'logType', '2', '操作日志', '', 2, '', '1', 'user2', '2019-09-03', '2019-09-03 00:52:56', NULL,
        NULL, NULL);
INSERT INTO `t_sys_code_info` (`code_info_id`, `code_type_id`, `value`, `content`, `parent_value`, `sort_no`, `remark`,
                               `is_ok`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                               `update_time`)
VALUES ('misfirePolicy-0', 'misfirePolicy', '0', '默认', '', 0, '', '1', 'admin', '2020-04-26', '2020-04-26 23:56:39',
        NULL, NULL, NULL);
INSERT INTO `t_sys_code_info` (`code_info_id`, `code_type_id`, `value`, `content`, `parent_value`, `sort_no`, `remark`,
                               `is_ok`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                               `update_time`)
VALUES ('misfirePolicy-1', 'misfirePolicy', '1', '立即触发执行', '', 1, '', '1', 'admin', '2020-04-26',
        '2020-04-26 23:57:25', NULL, NULL, NULL);
INSERT INTO `t_sys_code_info` (`code_info_id`, `code_type_id`, `value`, `content`, `parent_value`, `sort_no`, `remark`,
                               `is_ok`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                               `update_time`)
VALUES ('misfirePolicy-2', 'misfirePolicy', '2', '触发一次执行', '', 2, '', '1', 'admin', '2020-04-26',
        '2020-04-26 23:57:41', NULL, NULL, NULL);
INSERT INTO `t_sys_code_info` (`code_info_id`, `code_type_id`, `value`, `content`, `parent_value`, `sort_no`, `remark`,
                               `is_ok`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                               `update_time`)
VALUES ('misfirePolicy-3', 'misfirePolicy', '3', '不触发立即执行', '', 3, '', '1', 'admin', '2020-04-26',
        '2020-04-26 23:58:03', NULL, NULL, NULL);
INSERT INTO `t_sys_code_info` (`code_info_id`, `code_type_id`, `value`, `content`, `parent_value`, `sort_no`, `remark`,
                               `is_ok`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                               `update_time`)
VALUES ('orgLevel-1', 'orgLevel', '1', '一级', NULL, 1, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_code_info` (`code_info_id`, `code_type_id`, `value`, `content`, `parent_value`, `sort_no`, `remark`,
                               `is_ok`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                               `update_time`)
VALUES ('orgLevel-2', 'orgLevel', '2', '二级', '', 2, '', '1', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_code_info` (`code_info_id`, `code_type_id`, `value`, `content`, `parent_value`, `sort_no`, `remark`,
                               `is_ok`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                               `update_time`)
VALUES ('orgLevel-3', 'orgLevel', '3', '三级', '', 3, '', '1', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_code_info` (`code_info_id`, `code_type_id`, `value`, `content`, `parent_value`, `sort_no`, `remark`,
                               `is_ok`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                               `update_time`)
VALUES ('orgLevel-4', 'orgLevel', '4', '四级', '', 4, '', '1', 'admin', '2019-09-07', '2019-09-07 21:09:18', NULL, NULL,
        NULL);
INSERT INTO `t_sys_code_info` (`code_info_id`, `code_type_id`, `value`, `content`, `parent_value`, `sort_no`, `remark`,
                               `is_ok`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                               `update_time`)
VALUES ('orgType-1', 'orgType', '1', '普通机构', NULL, 1, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_code_info` (`code_info_id`, `code_type_id`, `value`, `content`, `parent_value`, `sort_no`, `remark`,
                               `is_ok`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                               `update_time`)
VALUES ('orgType-2', 'orgType', '2', '部门', '', 2, '', '1', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_code_info` (`code_info_id`, `code_type_id`, `value`, `content`, `parent_value`, `sort_no`, `remark`,
                               `is_ok`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                               `update_time`)
VALUES ('sourceStrategy-1', 'sourceStrategy', '1', '用户录入', '', 1, '', '1', 'admin', '2019-09-01',
        '2019-09-01 13:58:04', NULL, NULL, NULL);
INSERT INTO `t_sys_code_info` (`code_info_id`, `code_type_id`, `value`, `content`, `parent_value`, `sort_no`, `remark`,
                               `is_ok`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                               `update_time`)
VALUES ('sourceStrategy-2', 'sourceStrategy', '2', '系统提供', '', 2, '', '1', 'admin', '2019-09-01',
        '2019-09-01 11:40:19', NULL, NULL, NULL);
INSERT INTO `t_sys_code_info` (`code_info_id`, `code_type_id`, `value`, `content`, `parent_value`, `sort_no`, `remark`,
                               `is_ok`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                               `update_time`)
VALUES ('suspended-false', 'suspended', 'false', '激活', '', 2, '', '1', 'admin', '2020-01-12', '2020-01-12 22:01:35',
        NULL, NULL, NULL);
INSERT INTO `t_sys_code_info` (`code_info_id`, `code_type_id`, `value`, `content`, `parent_value`, `sort_no`, `remark`,
                               `is_ok`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                               `update_time`)
VALUES ('suspended-true', 'suspended', 'true', '挂起', '', 1, '', '1', 'admin', '2020-01-12', '2020-01-12 22:01:15',
        NULL, NULL, NULL);
INSERT INTO `t_sys_code_info` (`code_info_id`, `code_type_id`, `value`, `content`, `parent_value`, `sort_no`, `remark`,
                               `is_ok`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                               `update_time`)
VALUES ('trueOrFalse-0', 'trueOrFalse', 'false', '否', '', 2, '', '1', 'admin', '2020-01-06', '2020-01-06 20:32:22',
        NULL, NULL, NULL);
INSERT INTO `t_sys_code_info` (`code_info_id`, `code_type_id`, `value`, `content`, `parent_value`, `sort_no`, `remark`,
                               `is_ok`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                               `update_time`)
VALUES ('trueOrFalse-1', 'trueOrFalse', 'true', '是', '', 1, '', '1', 'admin', '2020-01-06', '2020-01-06 20:32:08',
        NULL, NULL, NULL);
INSERT INTO `t_sys_code_info` (`code_info_id`, `code_type_id`, `value`, `content`, `parent_value`, `sort_no`, `remark`,
                               `is_ok`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                               `update_time`)
VALUES ('userSex-1', 'userSex', '1', '男', '', 1, '', '1', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_code_info` (`code_info_id`, `code_type_id`, `value`, `content`, `parent_value`, `sort_no`, `remark`,
                               `is_ok`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                               `update_time`)
VALUES ('userSex-2', 'userSex', '2', '女', '', 2, '', '1', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_code_info` (`code_info_id`, `code_type_id`, `value`, `content`, `parent_value`, `sort_no`, `remark`,
                               `is_ok`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                               `update_time`)
VALUES ('userSex-3', 'userSex', '3', '保密', '', 3, '', '1', NULL, NULL, NULL, 'admin', '2020-05-28',
        '2020-05-28 08:49:44');
INSERT INTO `t_sys_code_info` (`code_info_id`, `code_type_id`, `value`, `content`, `parent_value`, `sort_no`, `remark`,
                               `is_ok`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                               `update_time`)
VALUES ('userStatus-1', 'userStatus', '1', '正常', '', 1, '', '1', NULL, NULL, NULL, 'admin', '2020-03-30',
        '2020-03-30 22:28:23');
INSERT INTO `t_sys_code_info` (`code_info_id`, `code_type_id`, `value`, `content`, `parent_value`, `sort_no`, `remark`,
                               `is_ok`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                               `update_time`)
VALUES ('userStatus-2', 'userStatus', '2', '锁定', '', 2, '', '1', NULL, NULL, NULL, 'admin', '2020-03-30',
        '2020-03-30 22:28:30');
INSERT INTO `t_sys_code_info` (`code_info_id`, `code_type_id`, `value`, `content`, `parent_value`, `sort_no`, `remark`,
                               `is_ok`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                               `update_time`)
VALUES ('yesOrNo-0', 'yesOrNo', '0', '否', '', 2, '', '1', 'admin', '2020-01-09', '2020-01-09 23:08:54', NULL, NULL,
        NULL);
INSERT INTO `t_sys_code_info` (`code_info_id`, `code_type_id`, `value`, `content`, `parent_value`, `sort_no`, `remark`,
                               `is_ok`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                               `update_time`)
VALUES ('yesOrNo-1', 'yesOrNo', '1', '是', '', 1, '', '1', NULL, NULL, NULL, 'admin', '2020-01-09',
        '2020-01-09 23:08:35');
COMMIT;

-- ----------------------------
-- Table structure for t_sys_code_type
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_code_type`;
CREATE TABLE `t_sys_code_type`
(
    `code_type_id`   varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '代码类别ID',
    `code_type_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '代码类别名称',
    `sort_no`        int(11) NOT NULL COMMENT '排序号',
    `remark`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
    `create_by`      varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '创建人',
    `create_date`    date                                                          DEFAULT NULL COMMENT '创建日期',
    `create_time`    timestamp NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`      varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '修改人',
    `update_date`    date                                                          DEFAULT NULL COMMENT '修改日期',
    `update_time`    timestamp NULL DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`code_type_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='SYS02_代码类别表';

-- ----------------------------
-- Records of t_sys_code_type
-- ----------------------------
BEGIN;
INSERT INTO `t_sys_code_type` (`code_type_id`, `code_type_name`, `sort_no`, `remark`, `create_by`, `create_date`,
                               `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('balanceType', '账户类型', 13, '', 'admin', '2020-06-08', '2020-06-08 08:56:34', NULL, NULL, NULL);
INSERT INTO `t_sys_code_type` (`code_type_id`, `code_type_name`, `sort_no`, `remark`, `create_by`, `create_date`,
                               `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('entityType', '实体类型', 5, '', 'admin', '2019-09-01', '2019-09-01 11:40:19', NULL, NULL, NULL);
INSERT INTO `t_sys_code_type` (`code_type_id`, `code_type_name`, `sort_no`, `remark`, `create_by`, `create_date`,
                               `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('identityType', '授权类型', 10, '', 'admin', '2020-03-01', '2020-03-01 19:13:55', NULL, NULL, NULL);
INSERT INTO `t_sys_code_type` (`code_type_id`, `code_type_name`, `sort_no`, `remark`, `create_by`, `create_date`,
                               `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('logType', '日志类型', 7, '', 'user2', '2019-09-03', '2019-09-03 00:52:09', NULL, NULL, NULL);
INSERT INTO `t_sys_code_type` (`code_type_id`, `code_type_name`, `sort_no`, `remark`, `create_by`, `create_date`,
                               `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('misfirePolicy', '计划执行错误策略', 12, '', 'admin', '2020-04-26', '2020-04-26 23:54:48', NULL, NULL, NULL);
INSERT INTO `t_sys_code_type` (`code_type_id`, `code_type_name`, `sort_no`, `remark`, `create_by`, `create_date`,
                               `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('orgLevel', '机构级别', 3, NULL, NULL, NULL, NULL, 'admin', '2019-09-01', '2019-09-01 17:06:53');
INSERT INTO `t_sys_code_type` (`code_type_id`, `code_type_name`, `sort_no`, `remark`, `create_by`, `create_date`,
                               `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('orgType', '机构类型', 4, NULL, NULL, NULL, NULL, 'admin', '2019-09-01', '2019-09-01 17:01:27');
INSERT INTO `t_sys_code_type` (`code_type_id`, `code_type_name`, `sort_no`, `remark`, `create_by`, `create_date`,
                               `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('processCategory', '模型类型', 14, '', 'admin', '2020-12-09', '2020-12-09 09:58:05', NULL, NULL, NULL);
INSERT INTO `t_sys_code_type` (`code_type_id`, `code_type_name`, `sort_no`, `remark`, `create_by`, `create_date`,
                               `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('sourceStrategy', '数据源策略', 6, '', 'admin', '2019-09-01', '2019-09-01 13:04:14', 'admin', '2019-09-01',
        '2019-09-01 17:06:49');
INSERT INTO `t_sys_code_type` (`code_type_id`, `code_type_name`, `sort_no`, `remark`, `create_by`, `create_date`,
                               `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('suspended', '状态', 9, '', 'admin', '2020-01-12', '2020-01-12 22:00:28', NULL, NULL, NULL);
INSERT INTO `t_sys_code_type` (`code_type_id`, `code_type_name`, `sort_no`, `remark`, `create_by`, `create_date`,
                               `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('trueOrFalse', '是否', 8, '', 'admin', '2020-01-06', '2020-01-06 20:28:43', 'admin', '2020-01-06',
        '2020-01-06 20:31:31');
INSERT INTO `t_sys_code_type` (`code_type_id`, `code_type_name`, `sort_no`, `remark`, `create_by`, `create_date`,
                               `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('userSex', '用户性别', 2, '', NULL, NULL, NULL, 'admin', '2019-08-21', '2019-08-21 23:27:09');
INSERT INTO `t_sys_code_type` (`code_type_id`, `code_type_name`, `sort_no`, `remark`, `create_by`, `create_date`,
                               `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('userStatus', '用户状态', 11, NULL, NULL, NULL, NULL, 'admin', '2019-09-08', '2019-09-08 14:34:34');
INSERT INTO `t_sys_code_type` (`code_type_id`, `code_type_name`, `sort_no`, `remark`, `create_by`, `create_date`,
                               `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('yesOrNo', '是否', 1, NULL, NULL, NULL, NULL, 'admin', '2019-09-08', '2019-09-08 14:34:34');
COMMIT;

-- ----------------------------
-- Table structure for t_sys_config
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_config`;
CREATE TABLE `t_sys_config`
(
    `config_id`    varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '系统参数ID',
    `config_name`  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '系统参数名称',
    `config_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '系统参数值',
    `can_update`   varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NOT NULL DEFAULT '1' COMMENT '字段是否可以修改',
    `can_delete`   varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NOT NULL DEFAULT '1' COMMENT '字段是否可以删除',
    `sort_no`      int(11) NOT NULL COMMENT '排序号',
    `remark`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '备注',
    `create_by`    varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci           DEFAULT NULL COMMENT '创建人',
    `create_date`  date                                                                   DEFAULT NULL COMMENT '创建日期',
    `create_time`  timestamp NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`    varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci           DEFAULT NULL COMMENT '修改人',
    `update_date`  date                                                                   DEFAULT NULL COMMENT '修改日期',
    `update_time`  timestamp NULL DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`config_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='SYS01_系统参数表';

-- ----------------------------
-- Records of t_sys_config
-- ----------------------------
BEGIN;
INSERT INTO `t_sys_config` (`config_id`, `config_name`, `config_value`, `can_update`, `can_delete`, `sort_no`, `remark`,
                            `create_by`, `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('defaultPassword', '新建用户默认密码', '1', '1', '0', 1, '', 'admin', '2019-09-11', '2019-09-11 23:03:25',
        'admin', '2019-09-21', '2019-09-21 12:22:34');
INSERT INTO `t_sys_config` (`config_id`, `config_name`, `config_value`, `can_update`, `can_delete`, `sort_no`, `remark`,
                            `create_by`, `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('expireTime', 'token过期时间', '604800', '1', '0', 3, '秒为单位', 'admin', '2020-10-30', '2020-10-30 19:34:41',
        NULL, NULL, NULL);
INSERT INTO `t_sys_config` (`config_id`, `config_name`, `config_value`, `can_update`, `can_delete`, `sort_no`, `remark`,
                            `create_by`, `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('loginCount', '登录错误限制', '5', '1', '0', 4, '', 'admin', '2021-07-22', '2020-07-22 22:10:48', 'admin',
        '2021-07-28', '2021-07-28 19:15:33');
INSERT INTO `t_sys_config` (`config_id`, `config_name`, `config_value`, `can_update`, `can_delete`, `sort_no`, `remark`,
                            `create_by`, `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('useCaptcha', '是否使用验证码', '1', '1', '0', 2, '0 使用 1不使用', 'admin', '2020-07-22',
        '2020-07-22 22:10:48', 'admin', '2021-07-28', '2021-07-28 19:15:33');
COMMIT;

-- ----------------------------
-- Table structure for t_sys_func
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_func`;
CREATE TABLE `t_sys_func`
(
    `func_id`          varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '功能ID',
    `func_name`        varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '功能名称',
    `menu_id`          varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '菜单ID',
    `func_permissions` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '可访问路径',
    `remark`           varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
    `sort_no`          int(11) DEFAULT NULL COMMENT '排序号',
    `create_by`        varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '创建人',
    `create_date`      date                                                          DEFAULT NULL COMMENT '创建日期',
    `create_time`      timestamp NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`        varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '修改人',
    `update_date`      date                                                          DEFAULT NULL COMMENT '修改日期',
    `update_time`      timestamp NULL DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`func_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='SYS05_功能表';

-- ----------------------------
-- Records of t_sys_func
-- ----------------------------
BEGIN;
INSERT INTO `t_sys_func` (`func_id`, `func_name`, `menu_id`, `func_permissions`, `remark`, `sort_no`, `create_by`,
                          `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('98b38d14e31700a4e5b70967ba0d2db0', '删除', 'sysPicUpDown', 'sys:picUpDown:delete', '', 1, 'monezhao',
        '2022-07-07', '2022-07-07 16:15:28', NULL, NULL, NULL);
INSERT INTO `t_sys_func` (`func_id`, `func_name`, `menu_id`, `func_permissions`, `remark`, `sort_no`, `create_by`,
                          `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('a1544742d620b37a625117e358ba47c0', '上传', 'sysPicUpDown', 'sys:picUpDown:save', '', 2, 'monezhao',
        '2022-07-07', '2022-07-07 16:19:46', NULL, NULL, NULL);
INSERT INTO `t_sys_func` (`func_id`, `func_name`, `menu_id`, `func_permissions`, `remark`, `sort_no`, `create_by`,
                          `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('flowableForm-1', '新增', 'flowableForm', 'flowable:form:save', '', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func` (`func_id`, `func_name`, `menu_id`, `func_permissions`, `remark`, `sort_no`, `create_by`,
                          `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('flowableForm-2', '修改', 'flowableForm', 'flowable:form:update', '', 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func` (`func_id`, `func_name`, `menu_id`, `func_permissions`, `remark`, `sort_no`, `create_by`,
                          `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('flowableForm-3', '删除', 'flowableForm', 'flowable:form:delete', '', 3, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func` (`func_id`, `func_name`, `menu_id`, `func_permissions`, `remark`, `sort_no`, `create_by`,
                          `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('flowableModel-1', '新增', 'flowableModel', 'flowable:model:save', '', 1, 'admin', '2020-08-30',
        '2020-08-30 19:13:50', NULL, NULL, NULL);
INSERT INTO `t_sys_func` (`func_id`, `func_name`, `menu_id`, `func_permissions`, `remark`, `sort_no`, `create_by`,
                          `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('flowableModel-2', '修改', 'flowableModel', 'flowable:model:update', '', 2, 'admin', '2020-08-30',
        '2020-08-30 19:14:25', NULL, NULL, NULL);
INSERT INTO `t_sys_func` (`func_id`, `func_name`, `menu_id`, `func_permissions`, `remark`, `sort_no`, `create_by`,
                          `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('flowableModel-3', '删除', 'flowableModel', 'flowable:model:delete', '', 3, 'admin', '2020-08-30',
        '2020-08-30 19:14:40', 'admin', '2020-08-30', '2020-08-30 19:14:47');
INSERT INTO `t_sys_func` (`func_id`, `func_name`, `menu_id`, `func_permissions`, `remark`, `sort_no`, `create_by`,
                          `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('flowableModel-4', '流程设计', 'flowableModel', 'flowable:model:saveModelEditor', '', 4, 'admin', '2020-08-30',
        '2020-08-30 21:57:22', 'admin', '2020-08-30', '2020-08-30 22:16:53');
INSERT INTO `t_sys_func` (`func_id`, `func_name`, `menu_id`, `func_permissions`, `remark`, `sort_no`, `create_by`,
                          `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('flowableModel-5', '部署', 'flowableModel', 'flowable:model:deploy', '', 5, 'admin', '2020-08-30',
        '2020-08-30 22:17:16', NULL, NULL, NULL);
INSERT INTO `t_sys_func` (`func_id`, `func_name`, `menu_id`, `func_permissions`, `remark`, `sort_no`, `create_by`,
                          `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('flowableModel-6', '导入', 'flowableModel', 'flowable:model:import', '', 6, 'admin', '2020-09-20',
        '2020-09-20 13:57:24', 'admin', '2020-09-20', '2020-09-20 13:59:04');
INSERT INTO `t_sys_func` (`func_id`, `func_name`, `menu_id`, `func_permissions`, `remark`, `sort_no`, `create_by`,
                          `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('flowableProcessDefinition-1', '导入', 'flowableProcessDefinition', 'flowable:processDefinition:import', '', 1,
        NULL, NULL, NULL, 'admin', '2020-03-07', '2020-03-07 12:15:53');
INSERT INTO `t_sys_func` (`func_id`, `func_name`, `menu_id`, `func_permissions`, `remark`, `sort_no`, `create_by`,
                          `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('flowableProcessDefinition-2', '流程授权', 'flowableProcessDefinition',
        'flowable:processDefinitionIdentityLink:list,flowable:processDefinitionIdentityLink:save,flowable:processDefinitionIdentityLink:delete',
        '', 3, NULL, NULL, NULL, 'admin', '2020-03-07', '2020-03-07 12:19:14');
INSERT INTO `t_sys_func` (`func_id`, `func_name`, `menu_id`, `func_permissions`, `remark`, `sort_no`, `create_by`,
                          `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('flowableProcessDefinition-3', '导出', 'flowableProcessDefinition', 'flowable:processDefinition:xml', '', 4,
        'admin', '2020-03-07', '2020-03-07 12:19:55', 'admin', '2020-03-07', '2020-03-07 12:20:34');
INSERT INTO `t_sys_func` (`func_id`, `func_name`, `menu_id`, `func_permissions`, `remark`, `sort_no`, `create_by`,
                          `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('flowableProcessDefinition-4', '挂起/激活', 'flowableProcessDefinition',
        'flowable:processDefinition:suspendOrActivate', '', 6, 'admin', '2020-03-07', '2020-03-07 12:21:51', 'admin',
        '2020-03-07', '2020-03-07 12:22:28');
INSERT INTO `t_sys_func` (`func_id`, `func_name`, `menu_id`, `func_permissions`, `remark`, `sort_no`, `create_by`,
                          `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('flowableProcessDefinition-5', '删除', 'flowableProcessDefinition', 'flowable:processDefinition:delete', '', 7,
        'admin', '2020-03-07', '2020-03-07 12:23:05', 'admin', '2020-03-07', '2020-03-07 12:23:17');
INSERT INTO `t_sys_func` (`func_id`, `func_name`, `menu_id`, `func_permissions`, `remark`, `sort_no`, `create_by`,
                          `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('flowableProcessInstance-1', '流程图', 'flowableProcessInstance', 'flowable:processInstanceImage', '', 2,
        'admin', '2020-03-07', '2020-03-07 12:59:30', NULL, NULL, NULL);
INSERT INTO `t_sys_func` (`func_id`, `func_name`, `menu_id`, `func_permissions`, `remark`, `sort_no`, `create_by`,
                          `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('flowableProcessInstance-2', '删除', 'flowableProcessInstance', 'flowable:processInstance:delete', '', 3,
        'admin', '2020-03-07', '2020-03-07 12:59:51', 'admin', '2020-03-07', '2020-03-07 13:00:25');
INSERT INTO `t_sys_func` (`func_id`, `func_name`, `menu_id`, `func_permissions`, `remark`, `sort_no`, `create_by`,
                          `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('flowableProcessInstance-3', '挂起/激活', 'flowableProcessInstance',
        'flowable:processInstance:suspendOrActivate', '', 4, 'admin', '2020-03-07', '2020-03-07 12:59:51', 'admin',
        '2020-03-07', '2020-03-07 13:00:25');
INSERT INTO `t_sys_func` (`func_id`, `func_name`, `menu_id`, `func_permissions`, `remark`, `sort_no`, `create_by`,
                          `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('flowableTask-1', '认领/取消认领', 'flowableTask', 'flowable:task:execute', '', 1, 'admin', '2020-03-07',
        '2020-03-07 13:09:23', 'admin', '2020-03-07', '2020-03-07 13:11:57');
INSERT INTO `t_sys_func` (`func_id`, `func_name`, `menu_id`, `func_permissions`, `remark`, `sort_no`, `create_by`,
                          `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('sysBalanceCount-2', '修改', 'sysBalanceCount', 'sys:balanceCount:update', '', 2, NULL, NULL, NULL, NULL, NULL,
        NULL);
INSERT INTO `t_sys_func` (`func_id`, `func_name`, `menu_id`, `func_permissions`, `remark`, `sort_no`, `create_by`,
                          `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('sysBalanceMain-1', '新增', 'sysBalanceMain', 'sys:balanceMain:save', '', 1, NULL, NULL, NULL, NULL, NULL,
        NULL);
INSERT INTO `t_sys_func` (`func_id`, `func_name`, `menu_id`, `func_permissions`, `remark`, `sort_no`, `create_by`,
                          `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('sysBalanceMain-2', '修改', 'sysBalanceMain', 'sys:balanceMain:update', '', 2, NULL, NULL, NULL, NULL, NULL,
        NULL);
INSERT INTO `t_sys_func` (`func_id`, `func_name`, `menu_id`, `func_permissions`, `remark`, `sort_no`, `create_by`,
                          `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('sysBalanceMain-3', '删除', 'sysBalanceMain', 'sys:balanceMain:delete', '', 3, NULL, NULL, NULL, NULL, NULL,
        NULL);
INSERT INTO `t_sys_func` (`func_id`, `func_name`, `menu_id`, `func_permissions`, `remark`, `sort_no`, `create_by`,
                          `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('sysBalanceMain-4', '导出', 'sysBalanceMain', 'sys:balanceMain:export', '', 4, NULL, NULL, NULL, NULL, NULL,
        NULL);
INSERT INTO `t_sys_func` (`func_id`, `func_name`, `menu_id`, `func_permissions`, `remark`, `sort_no`, `create_by`,
                          `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('sysBalanceMain-5', '导入', 'sysBalanceMain', 'sys:balanceMain:import', '', 5, NULL, NULL, NULL, NULL, NULL,
        NULL);
INSERT INTO `t_sys_func` (`func_id`, `func_name`, `menu_id`, `func_permissions`, `remark`, `sort_no`, `create_by`,
                          `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('sysCodeCreate-1', '新增', 'sysCodeCreate', 'sys:codeCreate:save', '', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func` (`func_id`, `func_name`, `menu_id`, `func_permissions`, `remark`, `sort_no`, `create_by`,
                          `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('sysCodeCreate-2', '修改', 'sysCodeCreate', 'sys:codeCreate:update', '', 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func` (`func_id`, `func_name`, `menu_id`, `func_permissions`, `remark`, `sort_no`, `create_by`,
                          `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('sysCodeCreate-3', '删除', 'sysCodeCreate', 'sys:codeCreate:delete', '', 3, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func` (`func_id`, `func_name`, `menu_id`, `func_permissions`, `remark`, `sort_no`, `create_by`,
                          `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('sysCodeCreate-4', '下载', 'sysCodeCreate', 'sys:codeCreate:export', '', 4, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func` (`func_id`, `func_name`, `menu_id`, `func_permissions`, `remark`, `sort_no`, `create_by`,
                          `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('sysCodeInfo-1', '字典内容新增', 'sysCodeType', 'sys:codeInfo:save', '', 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func` (`func_id`, `func_name`, `menu_id`, `func_permissions`, `remark`, `sort_no`, `create_by`,
                          `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('sysCodeInfo-2', '字典内容修改', 'sysCodeType', 'sys:codeInfo:update', '', 6, NULL, NULL, NULL, NULL, NULL,
        NULL);
INSERT INTO `t_sys_func` (`func_id`, `func_name`, `menu_id`, `func_permissions`, `remark`, `sort_no`, `create_by`,
                          `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('sysCodeInfo-3', '字典内容删除', 'sysCodeType', 'sys:codeInfo:delete', '', 7, NULL, NULL, NULL, NULL, NULL,
        NULL);
INSERT INTO `t_sys_func` (`func_id`, `func_name`, `menu_id`, `func_permissions`, `remark`, `sort_no`, `create_by`,
                          `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('sysCodeInfo-4', '字典内容列表', 'sysCodeType', 'sys:codeInfo:list', '', 4, NULL, NULL, NULL, 'admin',
        '2020-07-06', '2020-07-06 22:20:57');
INSERT INTO `t_sys_func` (`func_id`, `func_name`, `menu_id`, `func_permissions`, `remark`, `sort_no`, `create_by`,
                          `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('sysCodeType-1', '数据字典新增', 'sysCodeType', 'sys:codeType:save', '', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func` (`func_id`, `func_name`, `menu_id`, `func_permissions`, `remark`, `sort_no`, `create_by`,
                          `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('sysCodeType-2', '数据字典修改', 'sysCodeType', 'sys:codeType:update', '', 2, NULL, NULL, NULL, NULL, NULL,
        NULL);
INSERT INTO `t_sys_func` (`func_id`, `func_name`, `menu_id`, `func_permissions`, `remark`, `sort_no`, `create_by`,
                          `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('sysCodeType-3', '数据字典删除', 'sysCodeType', 'sys:codeType:delete', '', 3, NULL, NULL, NULL, NULL, NULL,
        NULL);
INSERT INTO `t_sys_func` (`func_id`, `func_name`, `menu_id`, `func_permissions`, `remark`, `sort_no`, `create_by`,
                          `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('sysConfig-1', '新增', 'sysConfig', 'sys:config:save', '', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func` (`func_id`, `func_name`, `menu_id`, `func_permissions`, `remark`, `sort_no`, `create_by`,
                          `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('sysConfig-2', '修改', 'sysConfig', 'sys:config:update', '', 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func` (`func_id`, `func_name`, `menu_id`, `func_permissions`, `remark`, `sort_no`, `create_by`,
                          `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('sysConfig-3', '删除', 'sysConfig', 'sys:config:delete', '', 3, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func` (`func_id`, `func_name`, `menu_id`, `func_permissions`, `remark`, `sort_no`, `create_by`,
                          `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('sysFunc-1', '新增', 'sysFunc', 'sys:func:save', '', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func` (`func_id`, `func_name`, `menu_id`, `func_permissions`, `remark`, `sort_no`, `create_by`,
                          `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('sysFunc-2', '修改', 'sysFunc', 'sys:func:update', '', 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func` (`func_id`, `func_name`, `menu_id`, `func_permissions`, `remark`, `sort_no`, `create_by`,
                          `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('sysFunc-3', '删除', 'sysFunc', 'sys:func:delete', '', 3, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func` (`func_id`, `func_name`, `menu_id`, `func_permissions`, `remark`, `sort_no`, `create_by`,
                          `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('sysJob-1', '新增', 'sysJob', 'sys:job:save', '', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func` (`func_id`, `func_name`, `menu_id`, `func_permissions`, `remark`, `sort_no`, `create_by`,
                          `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('sysJob-2', '修改', 'sysJob', 'sys:job:update', '', 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func` (`func_id`, `func_name`, `menu_id`, `func_permissions`, `remark`, `sort_no`, `create_by`,
                          `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('sysJob-3', '删除', 'sysJob', 'sys:job:delete', '', 3, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func` (`func_id`, `func_name`, `menu_id`, `func_permissions`, `remark`, `sort_no`, `create_by`,
                          `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('sysJob-4', '激活/挂起', 'sysJob', 'sys:job:changeStatus', '', 4, 'admin', '2020-04-27', '2020-04-27 22:33:30',
        NULL, NULL, NULL);
INSERT INTO `t_sys_func` (`func_id`, `func_name`, `menu_id`, `func_permissions`, `remark`, `sort_no`, `create_by`,
                          `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('sysJob-5', '立即执行', 'sysJob', 'sys:job:run', '', 5, 'admin', '2020-04-27', '2020-04-27 23:29:17', NULL,
        NULL, NULL);
INSERT INTO `t_sys_func` (`func_id`, `func_name`, `menu_id`, `func_permissions`, `remark`, `sort_no`, `create_by`,
                          `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('sysMenu-1', '新增', 'sysMenu', 'sys:menu:save', '', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func` (`func_id`, `func_name`, `menu_id`, `func_permissions`, `remark`, `sort_no`, `create_by`,
                          `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('sysMenu-2', '修改', 'sysMenu', 'sys:menu:update', '', 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func` (`func_id`, `func_name`, `menu_id`, `func_permissions`, `remark`, `sort_no`, `create_by`,
                          `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('sysMenu-3', '删除', 'sysMenu', 'sys:menu:delete', '', 3, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func` (`func_id`, `func_name`, `menu_id`, `func_permissions`, `remark`, `sort_no`, `create_by`,
                          `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('sysOrg-1', '新增', 'sysOrg', 'sys:org:save', '', 1, NULL, NULL, NULL, 'admin', '2020-05-27',
        '2020-05-27 18:23:00');
INSERT INTO `t_sys_func` (`func_id`, `func_name`, `menu_id`, `func_permissions`, `remark`, `sort_no`, `create_by`,
                          `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('sysOrg-2', '修改', 'sysOrg', 'sys:org:update', '', 2, NULL, NULL, NULL, 'admin', '2020-05-27',
        '2020-05-27 18:23:09');
INSERT INTO `t_sys_func` (`func_id`, `func_name`, `menu_id`, `func_permissions`, `remark`, `sort_no`, `create_by`,
                          `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('sysOrg-3', '删除', 'sysOrg', 'sys:org:delete', '', 3, NULL, NULL, NULL, 'admin', '2020-05-27',
        '2020-05-27 18:23:16');
INSERT INTO `t_sys_func` (`func_id`, `func_name`, `menu_id`, `func_permissions`, `remark`, `sort_no`, `create_by`,
                          `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('sysPost-1', '新增', 'sysPost', 'sys:post:save', '', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func` (`func_id`, `func_name`, `menu_id`, `func_permissions`, `remark`, `sort_no`, `create_by`,
                          `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('sysPost-2', '修改', 'sysPost', 'sys:post:update', '', 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func` (`func_id`, `func_name`, `menu_id`, `func_permissions`, `remark`, `sort_no`, `create_by`,
                          `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('sysPost-3', '删除', 'sysPost', 'sys:post:delete', '', 3, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func` (`func_id`, `func_name`, `menu_id`, `func_permissions`, `remark`, `sort_no`, `create_by`,
                          `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('sysPost-4', '分配用户', 'sysPost', 'sys:post:getPostUser,sys:post:savePostUsers,sys:post:deletePostUsers', '',
        4, 'admin', '2020-04-12', '2020-04-12 21:35:50', NULL, NULL, NULL);
INSERT INTO `t_sys_func` (`func_id`, `func_name`, `menu_id`, `func_permissions`, `remark`, `sort_no`, `create_by`,
                          `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('sysRole-1', '新增', 'sysRole', 'sys:role:save', '', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func` (`func_id`, `func_name`, `menu_id`, `func_permissions`, `remark`, `sort_no`, `create_by`,
                          `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('sysRole-2', '修改', 'sysRole', 'sys:role:update', '', 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func` (`func_id`, `func_name`, `menu_id`, `func_permissions`, `remark`, `sort_no`, `create_by`,
                          `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('sysRole-3', '删除', 'sysRole', 'sys:role:delete', '', 3, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func` (`func_id`, `func_name`, `menu_id`, `func_permissions`, `remark`, `sort_no`, `create_by`,
                          `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('sysRole-4', '角色授权', 'sysRole', 'sys:role:getRolePermissions,sys:role:saveRolePermissions', '', 4, NULL,
        NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func` (`func_id`, `func_name`, `menu_id`, `func_permissions`, `remark`, `sort_no`, `create_by`,
                          `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('sysRole-5', '分配用户', 'sysRole', 'sys:role:getRoleUser,sys:role:saveRoleUsers,sys:role:deleteRoleUsers', '',
        5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func` (`func_id`, `func_name`, `menu_id`, `func_permissions`, `remark`, `sort_no`, `create_by`,
                          `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('sysUser-1', '新增', 'sysUser', 'sys:user:save,sys:org:getTreeData', '', 1, NULL, NULL, NULL, 'admin',
        '2019-09-08', '2019-09-08 17:51:12');
INSERT INTO `t_sys_func` (`func_id`, `func_name`, `menu_id`, `func_permissions`, `remark`, `sort_no`, `create_by`,
                          `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('sysUser-2', '修改', 'sysUser', 'sys:user:update,sys:org:getTreeData', '', 2, NULL, NULL, NULL, 'admin',
        '2019-09-08', '2019-09-08 17:51:19');
INSERT INTO `t_sys_func` (`func_id`, `func_name`, `menu_id`, `func_permissions`, `remark`, `sort_no`, `create_by`,
                          `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('sysUser-3', '删除', 'sysUser', 'sys:user:delete', '', 3, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func` (`func_id`, `func_name`, `menu_id`, `func_permissions`, `remark`, `sort_no`, `create_by`,
                          `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('sysUser-4', '导出', 'sysUser', 'sys:user:export', '', 4, 'admin', '2020-05-03', '2020-05-03 11:48:01', 'admin',
        '2020-05-03', '2020-05-03 11:48:14');
COMMIT;

-- ----------------------------
-- Table structure for t_sys_job
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_job`;
CREATE TABLE `t_sys_job`
(
    `job_id`          varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '任务ID',
    `job_name`        varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '任务名称',
    `job_group`       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '任务组名',
    `invoke_target`   varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
    `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'cron执行表达式',
    `misfire_policy`  varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '计划执行错误策略',
    `concurrent`      varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   DEFAULT NULL COMMENT '是否并发执行',
    `status`          varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   DEFAULT NULL COMMENT '是否正常状态',
    `remark`          varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
    `create_by`       varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '创建人',
    `create_date`     date                                                          DEFAULT NULL COMMENT '创建日期',
    `create_time`     datetime                                                      DEFAULT NULL COMMENT '创建时间',
    `update_by`       varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '修改人',
    `update_date`     date                                                          DEFAULT NULL COMMENT '修改日期',
    `update_time`     datetime                                                      DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`job_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='SYS15_定时任务表';

-- ----------------------------
-- Records of t_sys_job
-- ----------------------------
BEGIN;
INSERT INTO `t_sys_job` (`job_id`, `job_name`, `job_group`, `invoke_target`, `cron_expression`, `misfire_policy`,
                         `concurrent`, `status`, `remark`, `create_by`, `create_date`, `create_time`, `update_by`,
                         `update_date`, `update_time`)
VALUES ('1', '测试1', '测试1', 'balanceJob.hasNoParam()', '0 0/1 * * * ?', '0', '1', '0', '', 'admin', '2020-04-27',
        '2020-04-27 00:00:21', 'admin', '2020-05-28', '2020-05-28 07:10:27');
INSERT INTO `t_sys_job` (`job_id`, `job_name`, `job_group`, `invoke_target`, `cron_expression`, `misfire_policy`,
                         `concurrent`, `status`, `remark`, `create_by`, `create_date`, `create_time`, `update_by`,
                         `update_date`, `update_time`)
VALUES ('2', '测试2', '测试2', 'balanceJob.hasParam(\'123\')', '0 0/1 * * * ?', '0', '1', '0', '', 'admin',
        '2020-04-27', '2020-04-27 22:02:27', 'admin', '2020-04-27', '2020-04-27 22:02:42');
INSERT INTO `t_sys_job` (`job_id`, `job_name`, `job_group`, `invoke_target`, `cron_expression`, `misfire_policy`,
                         `concurrent`, `status`, `remark`, `create_by`, `create_date`, `create_time`, `update_by`,
                         `update_date`, `update_time`)
VALUES ('3', '测试3', '测试3', 'balanceJob.hasMultipleParams(\'321\', true, 2000L, 316.50D, 100)', '0 0/1 * * * ?', '0',
        '1', '0', '', 'admin', '2020-04-27', '2020-04-27 22:03:01', 'admin', '2020-05-06', '2020-05-06 23:25:12');
INSERT INTO `t_sys_job` (`job_id`, `job_name`, `job_group`, `invoke_target`, `cron_expression`, `misfire_policy`,
                         `concurrent`, `status`, `remark`, `create_by`, `create_date`, `create_time`, `update_by`,
                         `update_date`, `update_time`)
VALUES ('4', '测试4', '测试4', 'balanceJob.saveTest()', '0/15 * * * * ?', '0', '1', '0', '', 'admin', '2020-04-27',
        '2020-04-27 22:03:19', 'admin', '2020-04-27', '2020-04-27 22:03:28');
COMMIT;

-- ----------------------------
-- Table structure for t_sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_job_log`;
CREATE TABLE `t_sys_job_log`
(
    `job_log_id`     varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '日志ID',
    `job_name`       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '任务名称',
    `job_group`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '任务组名',
    `invoke_target`  varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
    `job_message`    varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '日志信息',
    `status`         varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '是否正常执行',
    `exception_info` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '异常信息',
    `start_time`     datetime                                                      DEFAULT NULL COMMENT '开始时间',
    `stop_time`      datetime                                                      DEFAULT NULL COMMENT '结束时间',
    `create_by`      varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '创建人',
    `create_date`    date                                                          DEFAULT NULL COMMENT '创建日期',
    `create_time`    datetime                                                      DEFAULT NULL COMMENT '创建时间',
    `update_by`      varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '修改人',
    `update_date`    date                                                          DEFAULT NULL COMMENT '修改日期',
    `update_time`    datetime                                                      DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='SYS16_定时任务执行日志表';

-- ----------------------------
-- Records of t_sys_job_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_sys_log
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_log`;
CREATE TABLE `t_sys_log`
(
    `log_id`         varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT 'UUID',
    `log_type`       varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NOT NULL COMMENT '日志类型',
    `log_content`    varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日志内容',
    `operate_type`   varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   DEFAULT NULL COMMENT '操作类型',
    `user_id`        varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '操作用户',
    `user_name`      varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '操作用户姓名',
    `ip`             varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'IP地址',
    `method`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '请求方法',
    `request_url`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '请求路径',
    `request_param`  text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '请求参数',
    `request_type`   varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '请求类型',
    `operate_result` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '操作结果',
    `success`        varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   DEFAULT NULL COMMENT '操作结果是否成功 0否 1是',
    `cost_time`      bigint(20) DEFAULT NULL COMMENT '耗时',
    `create_by`      varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '创建人',
    `create_date`    date                                                          DEFAULT NULL COMMENT '创建日期',
    `create_time`    datetime                                                      DEFAULT NULL COMMENT '创建时间',
    `update_by`      varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '修改人',
    `update_date`    date                                                          DEFAULT NULL COMMENT '修改日期',
    `update_time`    datetime                                                      DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`log_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='SYS12_系统日志表';

-- ----------------------------
-- Records of t_sys_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_menu`;
CREATE TABLE `t_sys_menu`
(
    `menu_id`          varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '菜单ID',
    `menu_name`        varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
    `parent_menu_id`   varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '上级菜单ID',
    `menu_icon`        varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '图标',
    `menu_url`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '菜单URL',
    `menu_permissions` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '授权',
    `component`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组件',
    `redirect`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '重定向URL',
    `hidden`           varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   DEFAULT NULL COMMENT '是否隐藏',
    `is_route`         varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   DEFAULT NULL COMMENT '是否路由',
    `route_name`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '路由名称',
    `is_cache`         varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   DEFAULT NULL COMMENT 'tagsView是否缓存 1-缓存 0-不缓存',
    `affix`            varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   DEFAULT NULL COMMENT '是否常驻菜单1-是0-否',
    `is_leaf`          varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   DEFAULT NULL COMMENT '是否叶子节点',
    `sort_no`          int(11) DEFAULT NULL COMMENT '排序号',
    `create_by`        varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '创建人',
    `create_date`      date                                                          DEFAULT NULL COMMENT '创建日期',
    `create_time`      timestamp NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`        varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '修改人',
    `update_date`      date                                                          DEFAULT NULL COMMENT '修改日期',
    `update_time`      timestamp NULL DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='SYS04_菜单表';

-- ----------------------------
-- Records of t_sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `t_sys_menu` (`menu_id`, `menu_name`, `parent_menu_id`, `menu_icon`, `menu_url`, `menu_permissions`,
                          `component`, `redirect`, `hidden`, `is_route`, `route_name`, `is_cache`, `affix`, `is_leaf`,
                          `sort_no`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                          `update_time`)
VALUES ('balance', '账户余额', '', 'accountbook-fill', '/balance', '', '', '', '0', '1', '', '0', '0', '0', 30000,
        'admin', '2020-06-11', '2020-06-11 02:27:46', 'admin', '2020-06-14', '2020-06-14 10:31:12');
INSERT INTO `t_sys_menu` (`menu_id`, `menu_name`, `parent_menu_id`, `menu_icon`, `menu_url`, `menu_permissions`,
                          `component`, `redirect`, `hidden`, `is_route`, `route_name`, `is_cache`, `affix`, `is_leaf`,
                          `sort_no`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                          `update_time`)
VALUES ('base', '基础资源', '', 'jichuziyuan', '/base', '', '', '', '0', '1', '', '0', '0', '0', 20000, 'admin',
        '2020-06-14', '2020-06-14 00:51:18', 'admin', '2020-10-23', '2020-10-23 23:17:41');
INSERT INTO `t_sys_menu` (`menu_id`, `menu_name`, `parent_menu_id`, `menu_icon`, `menu_url`, `menu_permissions`,
                          `component`, `redirect`, `hidden`, `is_route`, `route_name`, `is_cache`, `affix`, `is_leaf`,
                          `sort_no`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                          `update_time`)
VALUES ('detailTable', '账户详情报表', 'statement', 'bar_chart', 'detailTable', 'sys:statement:detail:query',
        'views/statement/detail/index', '', '0', '1', 'DetailTable', '0', '0', '1', 62000, 'monezhao', '2022-06-29',
        '2022-06-29 10:57:32', 'monezhao', '2022-07-26', '2022-07-26 22:10:07');
INSERT INTO `t_sys_menu` (`menu_id`, `menu_name`, `parent_menu_id`, `menu_icon`, `menu_url`, `menu_permissions`,
                          `component`, `redirect`, `hidden`, `is_route`, `route_name`, `is_cache`, `affix`, `is_leaf`,
                          `sort_no`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                          `update_time`)
VALUES ('flowable', '流程管理', '', 'liuchengguanli', '/flowable', '', '', '', '0', '1', 'Flowable', '0', '0', '0', 500,
        'admin', '2020-01-04', '2020-01-04 20:04:12', 'admin', '2020-12-04', '2020-12-04 09:41:44');
INSERT INTO `t_sys_menu` (`menu_id`, `menu_name`, `parent_menu_id`, `menu_icon`, `menu_url`, `menu_permissions`,
                          `component`, `redirect`, `hidden`, `is_route`, `route_name`, `is_cache`, `affix`, `is_leaf`,
                          `sort_no`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                          `update_time`)
VALUES ('flowableForm', '表单管理', 'flowable', 'biaodanguanli', 'form', 'flowable:form:list',
        'views/flowable/form/index', NULL, '0', '1', 'FlowableForm', '0', '0', '1', 30100, 'admin', NULL, NULL, 'admin',
        '2020-12-04', '2020-12-04 09:41:11');
INSERT INTO `t_sys_menu` (`menu_id`, `menu_name`, `parent_menu_id`, `menu_icon`, `menu_url`, `menu_permissions`,
                          `component`, `redirect`, `hidden`, `is_route`, `route_name`, `is_cache`, `affix`, `is_leaf`,
                          `sort_no`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                          `update_time`)
VALUES ('flowableModel', '模型管理', 'flowable', 'daima', 'model', 'flowable:model:list', 'views/flowable/model/index',
        '', '0', '1', 'FlowableModel', '0', '0', '1', 30200, 'admin', '2020-08-30', '2020-08-30 09:08:27', 'admin',
        '2020-12-04', '2020-12-04 09:45:09');
INSERT INTO `t_sys_menu` (`menu_id`, `menu_name`, `parent_menu_id`, `menu_icon`, `menu_url`, `menu_permissions`,
                          `component`, `redirect`, `hidden`, `is_route`, `route_name`, `is_cache`, `affix`, `is_leaf`,
                          `sort_no`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                          `update_time`)
VALUES ('flowableProcessDefinition', '流程定义', 'flowable', 'liuchengdingyi', 'processDefinition',
        'flowable:processDefinition:list', 'views/flowable/processDefinition/index', NULL, '0', '1',
        'FlowableProcessDefinition', '0', '0', '1', 30300, 'admin', NULL, NULL, 'admin', '2020-12-04',
        '2020-12-04 09:15:01');
INSERT INTO `t_sys_menu` (`menu_id`, `menu_name`, `parent_menu_id`, `menu_icon`, `menu_url`, `menu_permissions`,
                          `component`, `redirect`, `hidden`, `is_route`, `route_name`, `is_cache`, `affix`, `is_leaf`,
                          `sort_no`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                          `update_time`)
VALUES ('flowableProcessInstance', '流程实例', 'flowable', 'liuchengshili', 'processInstance',
        'flowable:processInstance:list', 'views/flowable/processInstance/index', '', '0', '1',
        'FlowableProcessInstance', '0', '0', '1', 30400, 'admin', '2020-01-07', '2020-01-07 20:12:58', 'admin',
        '2020-12-04', '2020-12-04 09:15:16');
INSERT INTO `t_sys_menu` (`menu_id`, `menu_name`, `parent_menu_id`, `menu_icon`, `menu_url`, `menu_permissions`,
                          `component`, `redirect`, `hidden`, `is_route`, `route_name`, `is_cache`, `affix`, `is_leaf`,
                          `sort_no`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                          `update_time`)
VALUES ('flowableTask', '任务管理', 'flowable', 'renwuguanli', 'task', 'flowable:task:list',
        'views/flowable/task/index', NULL, '0', '1', 'FlowableTask', '0', '0', '1', 30500, 'admin', NULL, NULL, 'admin',
        '2020-12-04', '2020-12-04 09:34:45');
INSERT INTO `t_sys_menu` (`menu_id`, `menu_name`, `parent_menu_id`, `menu_icon`, `menu_url`, `menu_permissions`,
                          `component`, `redirect`, `hidden`, `is_route`, `route_name`, `is_cache`, `affix`, `is_leaf`,
                          `sort_no`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                          `update_time`)
VALUES ('job', '定时任务', '', 'time-circle-fill', '/job', '', '', '', '0', '1', '', '0', '0', '0', 40000, 'admin',
        '2020-06-14', '2020-06-14 00:44:51', 'admin', '2020-06-14', '2020-06-14 10:29:24');
INSERT INTO `t_sys_menu` (`menu_id`, `menu_name`, `parent_menu_id`, `menu_icon`, `menu_url`, `menu_permissions`,
                          `component`, `redirect`, `hidden`, `is_route`, `route_name`, `is_cache`, `affix`, `is_leaf`,
                          `sort_no`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                          `update_time`)
VALUES ('monitor', '监控管理', '', 'funnelplot-fill', '/monitor', '', '', '', '0', '1', '', '0', '0', '0', 50000,
        'admin', '2020-04-13', '2020-04-13 23:13:17', 'admin', '2020-06-14', '2020-06-14 10:29:12');
INSERT INTO `t_sys_menu` (`menu_id`, `menu_name`, `parent_menu_id`, `menu_icon`, `menu_url`, `menu_permissions`,
                          `component`, `redirect`, `hidden`, `is_route`, `route_name`, `is_cache`, `affix`, `is_leaf`,
                          `sort_no`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                          `update_time`)
VALUES ('monitorDruid', '数据监控', 'monitor', 'database-fill', 'druid', 'monitor:druid:list',
        'views/sys/monitor/druid/index', '', '0', '1', 'MonitorDruid', '0', '0', '1', 51000, 'admin', '2020-04-13',
        '2020-04-13 23:17:22', 'admin', '2020-06-14', '2020-06-14 10:28:49');
INSERT INTO `t_sys_menu` (`menu_id`, `menu_name`, `parent_menu_id`, `menu_icon`, `menu_url`, `menu_permissions`,
                          `component`, `redirect`, `hidden`, `is_route`, `route_name`, `is_cache`, `affix`, `is_leaf`,
                          `sort_no`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                          `update_time`)
VALUES ('monitorServer', '服务监控', 'monitor', 'dashboard', 'server', 'monitor:server:getServerInfo',
        'views/sys/monitor/server/index', '', '0', '1', 'MonitorServer', '0', '0', '1', 52000, 'admin', '2020-04-14',
        '2020-04-14 00:06:38', 'admin', '2020-06-14', '2020-06-14 00:52:38');
INSERT INTO `t_sys_menu` (`menu_id`, `menu_name`, `parent_menu_id`, `menu_icon`, `menu_url`, `menu_permissions`,
                          `component`, `redirect`, `hidden`, `is_route`, `route_name`, `is_cache`, `affix`, `is_leaf`,
                          `sort_no`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                          `update_time`)
VALUES ('monitorSwagger', 'Swagger', 'monitor', 'swagger', 'swagger', 'monitor:swagger',
        'views/sys/monitor/swagger/index', '', '0', '1', 'MonitorSwagger', '0', '0', '1', 53000, 'admin', '2020-07-01',
        '2020-07-01 15:34:12', NULL, NULL, NULL);
INSERT INTO `t_sys_menu` (`menu_id`, `menu_name`, `parent_menu_id`, `menu_icon`, `menu_url`, `menu_permissions`,
                          `component`, `redirect`, `hidden`, `is_route`, `route_name`, `is_cache`, `affix`, `is_leaf`,
                          `sort_no`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                          `update_time`)
VALUES ('statement', '报表管理', '', 'pie_chart', '/statement', '', '', '', '0', '1', '', '0', '0', '0', 60000, 'admin',
        '2020-10-23', '2020-10-23 23:19:58', 'admin', '2020-10-23', '2020-10-23 23:22:32');
INSERT INTO `t_sys_menu` (`menu_id`, `menu_name`, `parent_menu_id`, `menu_icon`, `menu_url`, `menu_permissions`,
                          `component`, `redirect`, `hidden`, `is_route`, `route_name`, `is_cache`, `affix`, `is_leaf`,
                          `sort_no`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                          `update_time`)
VALUES ('statementTable', '账户报表', 'statement', 'line_chart', 'table', 'sys:statement:query',
        'views/statement/table/index', '', '0', '1', 'StatementTable', '0', '0', '1', 61000, 'admin', '2020-10-23',
        '2020-10-23 23:22:32', 'monezhao', '2022-07-26', '2022-07-26 22:10:00');
INSERT INTO `t_sys_menu` (`menu_id`, `menu_name`, `parent_menu_id`, `menu_icon`, `menu_url`, `menu_permissions`,
                          `component`, `redirect`, `hidden`, `is_route`, `route_name`, `is_cache`, `affix`, `is_leaf`,
                          `sort_no`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                          `update_time`)
VALUES ('sys', '系统管理', '', 'setting-fill', '/sys', NULL, '', '', '0', '1', '', '0', '0', '0', 10000, NULL, NULL,
        NULL, 'admin', '2020-06-14', '2020-06-14 10:36:55');
INSERT INTO `t_sys_menu` (`menu_id`, `menu_name`, `parent_menu_id`, `menu_icon`, `menu_url`, `menu_permissions`,
                          `component`, `redirect`, `hidden`, `is_route`, `route_name`, `is_cache`, `affix`, `is_leaf`,
                          `sort_no`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                          `update_time`)
VALUES ('sysBalanceCount', '计入总资产', 'balance', 'liuchengshili', 'balanceCount', 'sys:balanceCount:list',
        'views/sys/balanceCount/index', NULL, '0', '1', 'SysBalanceCount', '0', '0', '1', 32000, NULL, NULL, NULL, NULL,
        NULL, NULL);
INSERT INTO `t_sys_menu` (`menu_id`, `menu_name`, `parent_menu_id`, `menu_icon`, `menu_url`, `menu_permissions`,
                          `component`, `redirect`, `hidden`, `is_route`, `route_name`, `is_cache`, `affix`, `is_leaf`,
                          `sort_no`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                          `update_time`)
VALUES ('sysBalanceMain', '余额列表', 'balance', 'orderedlist', 'balanceMain', 'sys:balanceMain:list',
        'views/sys/balanceMain/index', NULL, '0', '1', 'SysBalanceMain', '1', '0', '1', 31000, NULL, NULL, NULL,
        'monezhao', '2022-03-15', '2022-03-15 16:01:34');
INSERT INTO `t_sys_menu` (`menu_id`, `menu_name`, `parent_menu_id`, `menu_icon`, `menu_url`, `menu_permissions`,
                          `component`, `redirect`, `hidden`, `is_route`, `route_name`, `is_cache`, `affix`, `is_leaf`,
                          `sort_no`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                          `update_time`)
VALUES ('sysCodeCreate', '代码生成', 'sys', 'list', 'codeCreate', 'sys:codeCreate:list', 'views/sys/codeCreate/index',
        NULL, '0', '1', 'SysCodeCreate', '0', '0', '1', 11000, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_menu` (`menu_id`, `menu_name`, `parent_menu_id`, `menu_icon`, `menu_url`, `menu_permissions`,
                          `component`, `redirect`, `hidden`, `is_route`, `route_name`, `is_cache`, `affix`, `is_leaf`,
                          `sort_no`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                          `update_time`)
VALUES ('sysCodeType', '数据字典', 'sys', 'code', 'codeType', 'sys:codeType:list', 'views/sys/codeType/index', NULL,
        '0', '1', 'SysCodeType', '0', '0', '1', 10200, NULL, NULL, NULL, 'admin', '2020-07-06', '2020-07-06 21:40:28');
INSERT INTO `t_sys_menu` (`menu_id`, `menu_name`, `parent_menu_id`, `menu_icon`, `menu_url`, `menu_permissions`,
                          `component`, `redirect`, `hidden`, `is_route`, `route_name`, `is_cache`, `affix`, `is_leaf`,
                          `sort_no`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                          `update_time`)
VALUES ('sysConfig', '参数管理', 'sys', 'link', 'config', 'sys:config:list', 'views/sys/config/index', NULL, '0', '1',
        'SysConfig', '0', '0', '1', 10100, NULL, NULL, NULL, 'admin', '2020-06-14', '2020-06-14 10:47:06');
INSERT INTO `t_sys_menu` (`menu_id`, `menu_name`, `parent_menu_id`, `menu_icon`, `menu_url`, `menu_permissions`,
                          `component`, `redirect`, `hidden`, `is_route`, `route_name`, `is_cache`, `affix`, `is_leaf`,
                          `sort_no`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                          `update_time`)
VALUES ('sysFunc', '功能管理', 'sys', 'form', 'func', 'sys:func:list,sys:menu:getTreeData', 'views/sys/func/index',
        NULL, '0', '1', 'SysFunc', '0', '0', '1', 10500, NULL, NULL, NULL, 'admin', '2020-06-14',
        '2020-06-14 10:40:07');
INSERT INTO `t_sys_menu` (`menu_id`, `menu_name`, `parent_menu_id`, `menu_icon`, `menu_url`, `menu_permissions`,
                          `component`, `redirect`, `hidden`, `is_route`, `route_name`, `is_cache`, `affix`, `is_leaf`,
                          `sort_no`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                          `update_time`)
VALUES ('sysJob', '定时任务', 'job', 'build-fill', 'sysJob', 'sys:job:list', 'views/sys/job/index', NULL, '0', '1',
        'SysJob', '0', '0', '1', 41000, NULL, NULL, NULL, 'admin', '2020-06-14', '2020-06-14 10:30:55');
INSERT INTO `t_sys_menu` (`menu_id`, `menu_name`, `parent_menu_id`, `menu_icon`, `menu_url`, `menu_permissions`,
                          `component`, `redirect`, `hidden`, `is_route`, `route_name`, `is_cache`, `affix`, `is_leaf`,
                          `sort_no`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                          `update_time`)
VALUES ('sysJobLog', '定时任务日志', 'job', 'list', 'sysJobLog', 'sys:jobLog:list', 'views/sys/jobLog/index', NULL, '0',
        '1', 'SysJobLog', '0', '0', '1', 42000, NULL, NULL, NULL, 'admin', '2020-06-14', '2020-06-14 10:30:18');
INSERT INTO `t_sys_menu` (`menu_id`, `menu_name`, `parent_menu_id`, `menu_icon`, `menu_url`, `menu_permissions`,
                          `component`, `redirect`, `hidden`, `is_route`, `route_name`, `is_cache`, `affix`, `is_leaf`,
                          `sort_no`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                          `update_time`)
VALUES ('sysLog', '系统日志', 'sys', 'read-fill', 'log', 'sys:log:list', 'views/sys/log/index', NULL, '0', '1',
        'SysLog', '0', '0', '1', 10900, NULL, NULL, NULL, 'admin', '2020-06-14', '2020-06-14 10:43:00');
INSERT INTO `t_sys_menu` (`menu_id`, `menu_name`, `parent_menu_id`, `menu_icon`, `menu_url`, `menu_permissions`,
                          `component`, `redirect`, `hidden`, `is_route`, `route_name`, `is_cache`, `affix`, `is_leaf`,
                          `sort_no`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                          `update_time`)
VALUES ('sysMenu', '菜单管理', 'sys', 'menu', 'menu', 'sys:menu:list,sys:menu:getTreeData', 'views/sys/menu/index',
        NULL, '0', '1', 'SysMenu', '0', '0', '1', 10400, NULL, NULL, NULL, 'admin', '2020-06-14',
        '2020-06-14 10:39:13');
INSERT INTO `t_sys_menu` (`menu_id`, `menu_name`, `parent_menu_id`, `menu_icon`, `menu_url`, `menu_permissions`,
                          `component`, `redirect`, `hidden`, `is_route`, `route_name`, `is_cache`, `affix`, `is_leaf`,
                          `sort_no`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                          `update_time`)
VALUES ('sysOrg', '机构管理', 'base', 'tree', 'org', 'sys:org:list,sys:org:getTreeData', 'views/sys/org/index', NULL,
        '0', '1', 'SysOrg', '0', '0', '1', 21000, NULL, NULL, NULL, 'admin', '2020-06-14', '2020-06-14 10:35:48');
INSERT INTO `t_sys_menu` (`menu_id`, `menu_name`, `parent_menu_id`, `menu_icon`, `menu_url`, `menu_permissions`,
                          `component`, `redirect`, `hidden`, `is_route`, `route_name`, `is_cache`, `affix`, `is_leaf`,
                          `sort_no`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                          `update_time`)
VALUES ('sysPicUpDown', '图片上传', 'sys', 'list', 'picUpDown', 'sys:picUpDown:list', 'views/sys/picUpDown/index', NULL,
        '0', '1', 'SysPicUpDown', '1', '0', '1', 11100, NULL, NULL, NULL, 'monezhao', '2022-09-16',
        '2022-09-16 16:48:27');
INSERT INTO `t_sys_menu` (`menu_id`, `menu_name`, `parent_menu_id`, `menu_icon`, `menu_url`, `menu_permissions`,
                          `component`, `redirect`, `hidden`, `is_route`, `route_name`, `is_cache`, `affix`, `is_leaf`,
                          `sort_no`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                          `update_time`)
VALUES ('sysPost', '岗位管理', 'base', 'tools', 'post', 'sys:post:list', 'views/sys/post/index', NULL, '0', '1',
        'SysPost', '0', '0', '1', 22000, NULL, NULL, NULL, 'admin', '2020-06-14', '2020-06-14 10:36:19');
INSERT INTO `t_sys_menu` (`menu_id`, `menu_name`, `parent_menu_id`, `menu_icon`, `menu_url`, `menu_permissions`,
                          `component`, `redirect`, `hidden`, `is_route`, `route_name`, `is_cache`, `affix`, `is_leaf`,
                          `sort_no`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                          `update_time`)
VALUES ('sysRole', '角色管理', 'sys', 'highlight-fill', 'role', 'sys:role:list', 'views/sys/role/index', NULL, '0', '1',
        'SysRole', '0', '0', '1', 10700, NULL, NULL, NULL, 'admin', '2020-06-14', '2020-06-14 10:41:45');
INSERT INTO `t_sys_menu` (`menu_id`, `menu_name`, `parent_menu_id`, `menu_icon`, `menu_url`, `menu_permissions`,
                          `component`, `redirect`, `hidden`, `is_route`, `route_name`, `is_cache`, `affix`, `is_leaf`,
                          `sort_no`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                          `update_time`)
VALUES ('sysUser', '用户管理', 'sys', 'user', 'user', 'sys:user:list,sys:role:listAll', 'views/sys/user/index', NULL,
        '0', '1', 'SysUser', '0', '0', '1', 10800, NULL, NULL, NULL, 'admin', '2020-06-14', '2020-06-14 10:40:19');
COMMIT;

-- ----------------------------
-- Table structure for t_sys_org
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_org`;
CREATE TABLE `t_sys_org`
(
    `org_id`         varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '机构ID',
    `org_name`       varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '机构名称',
    `parent_org_id`  varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '上级机构ID',
    `short_name`     varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '机构简称',
    `org_type`       varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   DEFAULT NULL COMMENT '机构类型',
    `org_level`      varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NOT NULL COMMENT '机构级次',
    `org_level_code` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织机构路径',
    `remark`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
    `is_leaf`        varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   DEFAULT NULL COMMENT '是否叶子节点',
    `create_by`      varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '创建人',
    `create_date`    date                                                          DEFAULT NULL COMMENT '创建日期',
    `create_time`    timestamp NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`      varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '修改人',
    `update_date`    date                                                          DEFAULT NULL COMMENT '修改日期',
    `update_time`    timestamp NULL DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`org_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='SYS06_机构表';

-- ----------------------------
-- Records of t_sys_org
-- ----------------------------
BEGIN;
INSERT INTO `t_sys_org` (`org_id`, `org_name`, `parent_org_id`, `short_name`, `org_type`, `org_level`, `org_level_code`,
                         `remark`, `is_leaf`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                         `update_time`)
VALUES ('1000000000', '公司总部', '', '总部', '2', '1', '1000000000', '', '0', NULL, NULL, NULL, 'admin', '2020-10-30',
        '2020-10-30 23:02:57');
INSERT INTO `t_sys_org` (`org_id`, `org_name`, `parent_org_id`, `short_name`, `org_type`, `org_level`, `org_level_code`,
                         `remark`, `is_leaf`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                         `update_time`)
VALUES ('1100000000', '信息中心', '1000000000', '信息中心', '1', '2', '1000000000,1100000000', '', '1', 'admin',
        '2020-10-30', '2020-10-30 23:03:14', 'admin', '2020-10-30', '2020-10-30 23:03:31');
INSERT INTO `t_sys_org` (`org_id`, `org_name`, `parent_org_id`, `short_name`, `org_type`, `org_level`, `org_level_code`,
                         `remark`, `is_leaf`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                         `update_time`)
VALUES ('1200000000', '人力资源部', '1000000000', '人力', '1', '2', '1000000000,1200000000', '', '1', 'admin',
        '2020-10-30', '2020-10-30 23:04:03', 'admin', '2020-10-30', '2020-10-30 23:10:48');
INSERT INTO `t_sys_org` (`org_id`, `org_name`, `parent_org_id`, `short_name`, `org_type`, `org_level`, `org_level_code`,
                         `remark`, `is_leaf`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                         `update_time`)
VALUES ('1300000000', '财务部', '1000000000', '财务', '1', '2', '1000000000,1300000000', NULL, '1', 'admin',
        '2020-10-30', '2020-10-30 23:10:36', NULL, NULL, NULL);
INSERT INTO `t_sys_org` (`org_id`, `org_name`, `parent_org_id`, `short_name`, `org_type`, `org_level`, `org_level_code`,
                         `remark`, `is_leaf`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                         `update_time`)
VALUES ('1400000000', '销售部', '1000000000', '销售', '1', '2', '1000000000,1400000000', NULL, '0', 'admin',
        '2020-10-30', '2020-10-30 23:17:05', 'admin', '2020-10-30', '2020-10-30 23:17:33');
INSERT INTO `t_sys_org` (`org_id`, `org_name`, `parent_org_id`, `short_name`, `org_type`, `org_level`, `org_level_code`,
                         `remark`, `is_leaf`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                         `update_time`)
VALUES ('1410000000', '销售一组', '1400000000', '销售一组', '1', '3', '1000000000,1400000000,1410000000', NULL, '1',
        'admin', '2020-10-30', '2020-10-30 23:17:33', NULL, NULL, NULL);
INSERT INTO `t_sys_org` (`org_id`, `org_name`, `parent_org_id`, `short_name`, `org_type`, `org_level`, `org_level_code`,
                         `remark`, `is_leaf`, `create_by`, `create_date`, `create_time`, `update_by`, `update_date`,
                         `update_time`)
VALUES ('1420000000', '销售二组', '1400000000', '销售二组', '1', '3', '1000000000,1400000000,1420000000', NULL, '1',
        'admin', '2020-10-30', '2020-10-30 23:17:51', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_sys_pic_up_down
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_pic_up_down`;
CREATE TABLE `t_sys_pic_up_down`
(
    `pic_up_down_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '主键id',
    `pic_name`       varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '图片名',
    `pic`            mediumblob                                                    NOT NULL COMMENT '图片',
    `md5`            varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'md5',
    `create_by`      varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
    `create_date`    date                                                         DEFAULT NULL COMMENT '创建日期',
    `create_time`    datetime                                                     DEFAULT NULL COMMENT '创建时间',
    `update_by`      varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
    `update_date`    date                                                         DEFAULT NULL COMMENT '修改日期',
    `update_time`    datetime                                                     DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`pic_up_down_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='SYS20_图片上传下载表';

-- ----------------------------
-- Records of t_sys_pic_up_down
-- ----------------------------
BEGIN;
INSERT INTO `t_sys_pic_up_down` (`pic_up_down_id`, `pic_name`, `pic`, `md5`, `create_by`, `create_date`, `create_time`,
                                 `update_by`, `update_date`, `update_time`)
VALUES ('8a4579a1d8502b75d312a768e0bbd1c0', '赵一鸣20210108005801Profile Picture.png',
        0x89504E470D0A1A0A0000000D4948445200000100000001000802000000D3103F310000200049444154789CBCBD599324477226A8AA66EE71E65589ACCABAD140A3087483EC91617376646565F607CCC3FCD915D97D1DBE72D922E4B4B09BDD640FBA2E546565565E71F961A6FBF0B969585C8902C859434920D2C30F7335BD2FE3BFF9C55F79EF452484A0318A8888A82A111111338B1211B112110951483FD9C0C92242DB86506415665692C85199A253E54831123191302B71208A44422A3114ACC4AAAC244A3693C00DE6B3F61922313B65C718129855398610F2E9ADCD93959859ECBD94D4737A65CDEFAFBA7C2F1CD935BAF984A0AA44AAAA445109D38831786676CE39E7D39D55559B66C1CC2282E9DB3C9D73F6B8FC4B7A2FCC8A89885488482910E92A7C948842C04C184F21D2109AA86D0CEB33EFD62BADBE66237B22E12F3B277270C4CEE6CF1C4895A925F5B8555421BCB6A8AAF7458CB16D5B004A55F317B7C7711AAAAD1D71CE01C221840C3E4BD0E12600668CDD233AF0122951648A9410382A11F95D6BA9AA8E9856B17F0986D5B39780D9F2EB0A7C9931932D7F323311134562023C888939212E6642EB9F9195280A31132B2B91122993E215EC5DF22FB481CA9129FB5BF219E603D0DCFE9AD9AF781033ABDA4325849078044B1A441442B77EBB38C8DA23EEF8317F213C284D06BF774F677614633AE7871F61AF63EFB8150E1DBEA63FED61BA0ACC10428C7195B47E60E450CD8F6C7E5F1DC21C97EC8F28322913134752565226D65502C8EFE500BE0CF5BB3F3352CBAFDDF532226C530080BABF3B74DF7834303D284B47A3E917B7060E7CB2D6DCE13D8B02E0AA2B2C7C8518BACF345940E1DF6B6C01820A51A0B47E3146A28EF31919AC118061C6DDF4B66DC42573E09800E7984923B360FD81F7B28B00D65E640DDD57A99A3A9E4FBC39CF0ED44A9A890B556DDBE64761BFB170CA2003A0A517C99FC978AF355251559584B74CA41D2528E97609B07570260D8828679AAABA8369AECD4EC3B6E394E40033F893AA904432861254C5F82B2D3F49A9BB9A22332B7EA1C891981D6DE358F95245707BB6D7C9F9D75D0CF207F1323DD4A906264744DE7704802122CEB91823C47AA798654C6EEDA19F4009D9847975F22ACC44844FF789A84FABD8AF4B759473F41527B254583226ADD06E954D656226A2B66DF3FBE7AACBD6C9A8B28863060144D5985F9571434EDF97029CD951A78212334752ACB5AD3B13FB55E2FE012C4E48B63163660DDB57488548317D2222E82A910C593969AE4C9DC625DC71655526510AA4CC441294920C499FD4A9EC44442041F027630C39DEE46B63C3704188728944249D3EB6F5A5769301943A6393CC2E3DD7D4B0B59BACA8B09B0FFA91420097C90A0D7024956EDD399AA9F029C3CE8C516DCEF9A7702701D6EE29D4096603762065D518236763ED65971ACB0E086F32B21CFB6905C2784DF0C180294555E5A49E29116C80ADE0888CD720228A8A575CE1F26B57DDA11BE797AC515842FDE59F2031301D568A1D834EE648F756DD27AE51EA785EECA68C13961A45CEC9B62A3CABEFB246063BC78E455ADA1BF927145F5BF85CF9D9BC2D2867753E76DA2EFE9D99C5A4A4926C0052A54E23025459EF10026092F9AC12A331E1BDB6EEAED3822859DE1A4989650BF789A499A837E31178BF220AB64AEC1DF460BC7FF91963B4D3618341B3EE441825154E378CE0A54822A29C0C180A7976C29AB870DB7145298091BACCDE75CC815740D9518292BAC0BAB401EC95638CD49190DA271125DD8EC9D88D1211CBAAED9BE4F872CE26CA36C97265FE3F9207678294570FB6DC797B96781F6354951CA436D69EF909D3E01D9F2183801245E2B8AE236D8C25BF300BCC752A2525ECE95E9397D89F0F51E24E71225505799AE5638C207BDFED6F07E530971BC64AB277C4A4858858B66871AA8A198A26D2D76E923B6D005887204CEDB4B9D527AEAA4C772F4F2E3E38A3846D47023175D89FBD0C98E79A1644442499DED92D2C77B0D8E6085AF356ED98F6CA0CEF46BE5DBFF22A7CE0B6030110112C01552D8ACEBCA35502D8F5B89D23397988E30A0170ECEC3E924C3D88B481B2770CCECCD0350288AC4C4CBA05DAEB13CCEC57B362ED56BB00BCC4E04C5AE65262F9B9F14CD803384194222F31CD9C8ADE89902A47F5CCECBCC26923CC6DE7BBE0348FEEA62BC6566E6E6F993A11754A308708734405FEFE02301325292245550DD4466D41759188845893E54D24B2F2802561C4153F8E74ABBE22520DA5D4BCC28912444495638C55DB144521229D3C8F3146F5DEC7D8E6EBB47C50325B9999554CC9A1E4271111E74455E1F36661EF8BA2287ABDDE62B198CFE72202C606CFA04D0CC76360221247CC126308A111115F8890CFB42922E2105BF85881DF6BCC58959D732104A2D8B66D59966DD5C620F97A013EB9922622442E67D2CC924E0BB92EC751E159373CF1C42CEC1C83C89999493986EE7498831A542976784CCEB16A60166621B53054548D2174F81DA3C66816ADC4A8892B76C4D93901B7788DD839DFC446A332B347308182AAB2C80E09107F980325CDDB18FB8A832753A55CA79E743FC48E022DA012A3B2C61895D745A1AA6EE30B4BE4FE8119EE7068AC316C6665D67EBF8F73103D911412CA44FFCA6D739E142990A9CE8698E90BEEC3A231C6A669B0361008E611B23397227EF5714B069431C2FCC83ADC3266B9667E38E7B473C8D2DA7D366F9BDF7393EF6E70FAF5A5E960B56DC17E948CBB4308DF219C3F65F88E0B438A11515412CE571BBC3D9026444E2EC20EFBCDA22A764CA8A3E6F4A78006A22AA932A9322B8179465265E3F41911FE7885E007023A9B3F917054D8DF1D21269EBA5CF5FC7B59969ADC9AAA4ADCCD5C24790939468D8AF7E2A84A4DD3687283D0123597D203BE51E02822BEAA4B562D22C25E49452846CEDF0838BD150286C7BCB40E893630D8CE49A4E2B23B31118510727AA655A7CDB647AF52C2C6973B066F53A236D76E9317FC04D5D18B2EF5A724C197122D7F70B49558790A2CAAC8B28310A19B26AB4BA3C2090B1ED73122783D137054D548305BA198F964D69C06BA02E11DA84F49973554E87C4DCC44B458CC99D97BEFBD732486FDDAAEF3FEFC9E3912841002C59EEB775C21FD0AE48E1AEAB6565595A51EAC422A1C6304E545A6985405F15E5549489963D45663081A99BCF7AA60204C605A40DDD5088BCDAA284A66865EC00C4EC33192884BA0A3A44B40D3E89C0D09B73AA559330DDE4E5B45CA1CECF962919D199922AFE1CF129E444B1F31DFE999A01DD8FF13A4816766D6E5646354668ABCC2EDEC0138B2A4049BCDEA6457AF5AB97C534472E71D4B3FC4A5F4E7754DCCA298B4F4687DDA585321B0F650D6599454DBB6EDF2A09C2BBC3725B2C954859CB2E6D3852BBA506E135B304811518A49E553585C503A9B469D73C6E371A1F7FEF6F65A558BA2E8F7FB22D2B6ADAA7AEF436889483A1F5197A3057D2C4D26808974B4BAC15B8D068C4A9D73D0C1B248EA529733C8643A15673789405018F1CC9DE5AA4BFB95B3355A5998984889F33F290FAAA6E5E4151A5883798EE2B958B39FB2C968FA4C563F931299EF157F1293972E06BAEAF4D0E44FE6ECEE76C6AAD909AB99B458E2FDCAA49BF543B8AC93A4ACAA1C331BDF6451361F5A21AA3551B07DAC09F7E5DC970480BF23FC9265CF8B488CA169A338A2D869EAAB38B77C5C31289AA6A9AA8A885CE97BBD1E41CBAF3B160E592A09E9230565073B3B8420C222ECBD1FEA08C41349DBB6A9EB9A887C0C0947110464226627EC04AA51240D1A55955434CB9C33E5C4E6D9342D11C5189DF3CEF91062511422AE691A6861092C1D31670E4731ACCA21602A1C4E0A215097BAA53897570962792D13718ABB67EBB676DA56FD676D0932EEBF8C08A59F7E38A52A1F9E3A377FE7E7C70C973EF2D825514473A573C409ACC91850479D8AB275C0039CFF995B51441935F332DB71E5857FC2306E615FD2A7634E56AC68978E4A54F67B22B298CD9BA6298A8284286A5114767236E74E1928CB523C374DD3344DD0B6DFEFF70665D34C09A126F840223BE7945CDBB61032AA0AB70F11C518078301B223ABAA6ADB96998BA2F0490499B6864B628CD239D4BBFB1305E65293D19C634F4E0CB902E3BD5755889A35F86423F323ABC03E3195AF3B4304EB75B7EEA1AA4A8A3C0CE5E45EBF3305EB6E1AC8E7FC6F1FDEC2C24927C08CEF32AE4D018F2459647F574CADD9E4D31A993D1365313966810E9A1E417761FFBA8AB97D9EDB52808C616CCE166B6C6662A7B6AEA840EBBC308410599D7351C3743ED19996BE4744C069201924405DD7755D837DDA27741EE75CDBB6B3D92C84D0EBF570B273506FBC99C522521445D354445D7409F7D90AA535016840CE8D96B5D7CF341FA26D589843634D0321A25DB18598E0ADBC542B80FDB93D902B3FFF7F0E0F6B2A100953F79F706492A0CC8CB9A60802B2090D4851944854888934C46683911011B94E24758A440753E99C48DC39F8A133A812892BD6A6B8CB1AB1BF989CDD9F88608EC3BB8FD4AB5C7B0E4D1D63142FDEFBA6ADAAAA22D1B66DDB3A0C8743E79CF7BEAEEBC16050F47BCA04774862B79DE6D6B66D6C428C71381C7AD6DBDB5BE7FDB03F9C578BF97CDE34CD6030F0DE33F3743A6D9AA6D7EB01F3168B05101AE44144B79359C70B3528535555CA14542576864159969815772915D4B66DD334461551DB455513BBC279EF9C28C7366A8C24EC9CABDB80F34D9D9B4EA7C6B9ED8DA08679EF85BABCAD25AE8B3251D3D419D2C357CB9D3A4670162EF33E88A869A0FAA610322FD58AE54AE15E58979898DA3AD56D435BEA9ECBCC29EBB13375443AB775D2EE62A6352DFD60F6E7CE48F02E09B0769CB745E0768D6DBC27E7C7EB399877F336FB732BB7C33B9A7F100BCCCCE25C08010844587E8E44E4BD8706A2AACEB9E9748A952B8A8E2061B332735555755D17548848DDB64A5189EABA6E9AA6096DE165381C2E160B6686C5E9BD9FCFE7503C806A985CAFD72B8AA2AA5B0D2810D1363631C6481A894A712184F97C8EF9F4FBFDD168D4EFF7D3322F8515303B2AC718EB101CB163581D8A0099734E43C05BE73101F3BDDA9AAAE9521BD0FEC92A0742B04449F36144F289E14EDC4CA2F8B70DD3EB6C50526DB68EBB5221306276651660255A5527D600B4A6897EE2BC11BBDE75C9D6E346D0B42A2B34A4BC59ED32499C77CEB9D96CA6AAE238AA86D838E7CAD20FFB8318693A9DD675EDBD77CE2152DBEBF5E6F379AFD783D71F64232283C140822873D3D6755DB721544D1D62E3BD6FA2F498C8BBF96241446D5D79EF1B8D8BC51C77EECC8310176DA333ED17FDD886B66D43DB066D89BA0AA7459BDC35222DE964319F560B663E3A3AC21CC4099C9F08C51652200754A3B6DAF9EC231387E098D5394D313E004A8562D4A851133B8CACED9674F595B15B0EFFC058EAFDDAFDF9894377B9D7779D9F217D4E039CD539E6E307EA013ADADD95C5992B70AB93D835B98DA976B3350CDE64F077CF503625128E3B87BB19CF5BC28299889C088B0F214CA7D3B66D9D2B8AA2C0394DD38CC76394DE416F99CD6644549665AFD783ABA4F4BD18C262B1A8EA5A55DB588B48D1EB45D2D9626E6B20DE4DE733668EA44D689BD05AD60302C3DA92022F55999D3812EF949924395353C09F459879329B129173AE2CCBB22CBDF77850AB9123E227EAC067851D7355CDBDF7CC146308A1ED7CDCF82F591179664EE425CB14A5AD0C4E5723CDBB84C33ACE00F5BB5C15FB58F9F26F1F3B09605D41E8C64E02C8197F7EC5A60AC4ABA7E4BC7F03341910230C60CCB5BBC3364B683B9496A239B386F3C795DE773C2FA17E5BD7758CAE2854356A0821806CE1CF190C469C7C5055552D160BE8E8A087BAAE55D544415DD7E3E11E5C9CFDE1206ADBCE43D3B671362BFB3D24FF80F010D335230444654692732E0658582C92DC7B4803DF18780B483066868530180CA04A35551B42E03616DE4B5940F70B3152540D51B97B34F21A45A409B57254B6D26C21665DD567032D0BA2738CA76D8C49979EF88E746D98A58BF892FD69E7740E98E402CF0FFF7B5147167D5B31EE77AB4076FA6E63600DF5572E37169895BAE60F66D0804A2A1BE7B599AD5DB2B60036365708034618900C986D76A7F79E9D1311A228AA24029D07CA745DD7303AC7E3718CB1AEEBD1680432689A06C8DDB6EDED64D239CE39544DA3AADE7B57F8CBCB4B4809D89D21049804B82D3C39701F51429AAE5EABAB69860AC845510065CD310F485AC02E84309BCD9AA6E9F7FBBD5E0FCB2105B3508C6D8C2D0205BE10D5A831B66DD3C4C6B18B31B2F3260CCD34EC82091CC0FE3963FF6BEBBE4603770881B5214A216C2421DD397647847FD046E53B4EB3F1234A22371EB38A9A1BA12BDAA6D2EC1A9972B2F392ADC7F36751F6FEF5A282010AA92BC4BDA2F4E29AD0B66D1B42ABC2BD5E5114055174CE55DC5455C5C9197A7B7BDBC98DB6CD328197590C2252F44A166D9AAEBE7130EA03D7BDF72184BDBD3D6095B9FF0D7731C34E2C34C4491B5134A448188909D8E3C80826FD095284DD321A8D8AA2287DC9C44D483D1798C6BE07E3DEBC4055534B68D991722451E518506748E44490DBD965BF2F79F17A41C5272EAB0D4343352FF3A75DB8351DF2AE07312712B5D0C8167FAE1D713FBBFF08CA7CE790E2CE6385B81DAF725693DD9CE6C662354869C6ABEC61276F5003282B2DCB1D7E2C64ADBB863DBDFB53C990A64BF014298AA26EBAB4671621D2BAAE178B795DD7BD7E1F45BA40D68EA7328F46231C8F317AEFA16F38E7FAFDC1786FAF287D1B63082168548DAABA3FDE67A2D1705416A51359CC176DD30C0743EF3CAA079D3827C2C41A9554CBA2C7C4308B23B2EB542369AF2C3A6F2E112969D4D086B669BC73A4A4316A8C882F3191468D9DB54342CB343E25EA918BAAC0FEC170184298CEA6755D1765A159422BB435EF7D08910C5F77FA4E966BCD2B41C6CDE000D12A13CE039D1B2B6D6865BF2BBBED5370299CBA16FACDDBC9D843B64C291DF18149E097B79297B8B4BC5535C2F3EFC0F938849A8945C4A1B249A9CB795C8D956AB23EF35482D519AC5F8591B3DBDC88D9751F4A061CA7CAC3949E49242C2251B585E731B2D378797B8DBB4187F645CF17BD10C2CDCD8DDD676F6F0F5ECBC16070F6FE7C3C1EC7404CCE17BDD97C0141E1CAC587ABF3A228F6F7F7BDF7D5741A9A763CDCFBFEC3F9E9E969B5589C9F7D28CB3292B2739345A5211445C1AAD05EDA369465AFAEEBD0B4DEFB7EBF0F55A72CCBB66D2793C9A2AE8AA2188E474DD38410EABAAEEA6A381C52522C8BA298CFE700B7B0D4B78B56EAB6A8ABA2180E87FD7E9F44FA45B1A81765AF8402065E10DB2022D5BCAEAA4A5587C361511421867AD184267679196D009B6862F42C6DDB4AE1B16C5D2949A6915A601B3ADE8A25900DDA26DCED3ECCDEAEC2223A71DE1781B76706C4C8C96C68F39F44D62CDDAE461E751D9BCF75CF1F3C5AEA4AA6D4E716302BB3D5F1B195E5CB86E69333007B67F984763794C996CD57CD8F6C8EB8718432D51FC4001CAAAAAA699AF1DE18DC3DC6389BCD60EF8610426C390BE5C072159110E2E1E16197B01052C29C6A1BDA5EAF07E7FAC1C10122B85555ED1D1CB6755D385F14C56030882196651143702C655114BE60E2D170D8362D13F7CA323601746BA189A669F6F7F7175515831E1E1C95454FA316BE18F4874CA251855DE18B6A513BF165516A548D5DC01196CF62B1B8B9B909215C5F5F8736CCE78BC9643A9F2F42884DD3C6A865D963965ED96796DB9BC9EDED24466592B60D22DCB6AD38297C67274452EF5CEC5484AE66DBFEA5960D2CE2449C73DE8E7CCA3F3B33A384650998732EE5BBB26AA77374CFA5156CB121B2A24464AA01E5B3B2EF3F9D00D64C8CB5D96CE5EE6B186F5CC128E727289A71F739DEFBB22C815BF3F91C8CAA0D2D385F0801F62833B76DCB2CC24E2391F27CBE984E67A18D8B7985306A5DD7F3F9BC49BEF9A228CA7E9F594240A27F7B7575AD4ABD5EBFAAAA5EAF57F8A29E2F0AEF296ACF17A3F15892BA22CC1475341C92AA6389212E160B22827205EA9A4EA7CF9E3D1BF4FA97171F1F3D7C542FAA417F10DA40519BAA1E0F47870787D5A28A21C610296AE98BBAAAA0B9F5FBFDFDFD7D4DFE220D0AA71411C710ABAAAEEB26B481450683C168342E8A32466DDBB669DABA6E16F3C57432EBD45B71BD5E5F95DA189912A626044AEBD539EE98C575AE85EE785A7DFB675EBEE51D328CDC4100DA7983ACF43EFDFB8161189810696D3EDDF71F4D004BDB37FF5C4D82D00DB170C72CEF3E6D4D17DA220160C0A452C6042E55D2F962315F2C6E27B75135C458F64A71EEF67642C410F48B4545443146EF0BA46142B6A5C407467238D8AA73AEECF5A01A154541E2C4B918B5D7EBF77AFDC16018628C51A7D349BDA826D737077BFB6DD316BEA81655555542DD8217DE3B71FB7BFB1A753C1ADFBB777CEFDE3D33792D35E8E6FAF6FEC903279E89A793D9625E7D767C5257B5B01B0E46BDB207432DB43106D548CE31328BB0040866976529AE48F09116D5939DB9415555374DEB9C2F8A12E588DE1788D6317355D575553BE799A5695A119F58AF1031E8815914816B65261176302235129330C9D2A034B392B8FB695D142C112627008AA8D86356161260BFA4E63F39DA184FCE309FEC3B93B369DB347EA204B07B5336F75D1260D7B0F7DCFA1AB93E73F77D105DCFFD246606C049627783C3048F28CB12FD2591AD10424869AA0C6629E24288480976CE13715D37C40CA5C8391749520DB0DCDE4E0683E1C9C9FD10E2FDFBF78783616C03297971A434180EC7A3715335870787BDB2B7982FDAA69D4EA68BF942A32AE9975F7EC9CC9797978902B9DFEF8F87E3D974DAEFF58FEFDD7B70FFFE87B30F4C5C782F2C4C14DA301C0C4929B4AD468D218813EF0BD340DA360C8743A0382AD172EF93C1AA699AE9747A7B7B8B68A0AACE1795B040596ADA9694FBFD81CBDCA6B2B43E57C4359C5AB9B76A6DB96DD177E0C33A62708A9350AAD423132EDBEA1F36EFBFC288B7B58A62FEA91240B50B255A830B03CADD2C3F1F6BF8BD5580FC200DC03AA794336CBE73D36D4404AEC918635996B0D2EABA66E610425996D42584C5B66D620C6DDB309373A21ABDEF280413E8F57BE6C59FCCA608AF3A27655930D3E1E1418C61D1D44E5C88713E9D9D3E381D0E876551CC178B41BFFFE1C307D40FB46D3B1C0EE1B8BCBCBA42869C450940BAD5A2C22BBC7BF76E7F7F9F99AFAEAE8AA280FEA6AAA3D1A8AEEBAAEABCBD4A0AF6DFB62DB2007BBDDE6030403D0067E15E03ACC5460C624DD3D4CD4229366DE38445B8691BA5A8318A74DE154E77CB970C73300220DACE163797728933ABFE7E23801062AE4ED012C1B6EB0E3906AE7CDF4600F4138CE0A5F30A4EB41D78FF831220C7ECAD97AF7DE71D43BC27EA122411A8CA0DDFAE7C24A51FABEAC1C141599683C1008E205535CC036B74298702B7EDF57A48D607642C8085E75A58A02CCBBDBDBDC160F0FEE2C36C36DB1B8DF6F6F62693C9643ABDB9BDADEBFA7672FBF8C9E39BDB9B4555356D5337CDC1E1C16C3E3B393979F9F225E20648998606B2A8E6755355751535BC7AFDD2172EC49658AB7A41AC4A316A6CDAA60D0D7A29183F46046D7F7FBF6DDBC16050145E84630C31060848D528C221B4440AB70D8E3B27BD5E29296E48AA468DE2A4F0AE5374B873BCA5E6DA0A955C1C3B27691691BA8E7D6AFFBA9F28A2DB070BC1825836FF58459ECE09115B22CD2FE9AEDA31B6B2E38EC0BA0769FEDC7F0B0110596BEA6D847E37016C9DF7D65B6148D64D291FAE283AD655D7407A3C77369BC518C132A11C1F1C1CECEFEF23AC3B9D4EE7F379E7FF0901A1B1B66D89BA72C4186351F8BAAE54BB7C3BEF7D1BDA1002FA47CCEB45552D88D417BE2C8BB66D5EBF7E156378FAFCF99BB76FAF2FAFAE3E7E2C8B12AA1772162E2F2FEFDFBFAFAA903F48AFB09CFEC56201EE4E5D142C424F0BA1EDF5CA9B9BEBC1A00F833CA5EBCD7073001B9459962533F7FBFDE170787070707E7E0E5C6FDB86998BC233136800789062D2E0021C42DB861654116260A21823AAA587C34187E8DD62754A0BBAA46498A720B68C4FDB3FCA1DA16BEB9C234B4E00AD86A5EF476081DF554FB3269AF28965C89621DEFFFEF5AF8594598515FAB4B2531225A412A0222C76BD3345D19AA5E3FD246E55D2E57C1D9FC632ED13232FADC8F13ED788B2192F8BB52D1318819B7953C3FF886A1224B7E1E4F97C0E4E1F42582C16484F30F89A90CDA3B3F934301005C34F96970F241311A4467779F931121128ADAEEBABAB2B664696352A079879B158A00A4C554199F7EFDFBFBEBE5E2C1639CB80294C1B7C813337F95229CF749BD168D4B62D94AB7EBF7F73735355D56834FAF8F123842428A4280A68FC581D4CB26DDBF1780C22E4D48CDF52A6C7E371AFD78307D92C0A4D750B00B20525F18E760466430773B7D25422A6E2FAEDE8BC4DC33144B735CAB01C2E0D0F8D170CD1DE65EB70CFEE9F0A1171E4AE872DAFB889BAEC3D2526844092CF0B71802E1AB08B6DAFBD5B7E9ACD7BED73EBC9BCDAEAC8C22E4551845465321C0E61CE228107896B65592209BE2C4B049B34CB2630058632825C1BFD7EDF77BD22BA6C36E08AC5A410A5CAB52F90AB95B7C37184B98124721BD44A6D8CBAD62A36D6B07F0DAA3942C09DFAF39FFFFCDDBB7722B2BFBF8F4C21DC13F94E8092A4DAC865CC3891BA2116678145BC4E9E3A1A537910C5982F8DCDC7489488428C684A856CF03BB06573ACA1C1D6EF39944C74E46CEE8EE19EDF3F158ECC283655D4391AD62D519F237C8C49F3EFDCA89231EFAD2347F4ADEFB0F5A7CD333585D5F2C81A337362E1D3E9F4FCFC1CFA061AB0812B8324CC243045DFF0C0B40E238C5C0EA0400C4A4BBFDF073E354D737D7D0D2D0BF6ABF71EB5BC560909DAC071AC0AECE95CA44073B3D7B138C02E2871E63ACB171EBFE2A5DAB62D8AE2FAFA9A886E6E6EACE19785BA61D570E7D10A9A5245C0C561E5DB0C81C7C6A7254B6BC572F072479668A7A96AD534B97DB8CC5ADF862C7720E8567CB04B7435886470E0240D7202D8F26022F7FCF44458992313EC0C5122E2C85AC28E51568609C2842EB7D90C843F81A0F3296EFD72C7556BDF79A5492531F3ED745A5515D489F1785C1405F8F16C3643A097884C3FE9F57A316D03654F0798C07DEDCE38C77BDFF57D484A0E70C57B8FD870C82AAD38B1CC907A481937825CC6B5E0A66B2F629A46AE786C0542CEFB734235218380B788CCE7736883FD7EFFF6F6169166EFFDC9C90911995C02891A31C086CE997DAE11D9738D89A0F0C8188D090D20528851701F1162D2B8BB7FD427A0D0DA04D67E3580180BCB99C54E02F8FCE17DA1988C6B220BBAA566119A82108494B9D47796899832CADE31764980BBB17FF39D73B28E29CBC87B3FAF16D06B0114F882CCC14F1A4F4D5800002000494441542932601089AB15646B0C55569DD9405C4D794D86AC4071F8584DA50166E7FA8041008202BC36A4924893D4F68EC6CFAC66E00E78AE11003837947BE0A24D9288AAAA3287EFE3C78F89085111145BEEEDEDA1560E0C02EADCDA62C5D4C68252881D37AFAABA0D0169E251151149CD74F4987BF165CB4BADB1F0AD631367D6EE939F998325BFFF5634F322242A4A01C521B999CACCDD2736DD4A354ACB19E8F2FB2E3BC6506DEDCBDAC1B523770CBCA71903A3D1889991AA309D4E71B0AAAAA2288C60D01496929E43AB7CD4D03707A2A61C2FDD18405C54FD02FB739D818810CA0D6953302093A93A46CCA0165C92B72A01EAC86A09DF1D203275AB2C4B3C4593FBA1DFEFD7750DB0401F9BCD6667676744549625C4A6491E662ECB124223A6AEBDC6538DA443AAA8069C9BAAA654E86367C6180F0F0F8BA240453F65ED2436B2353F29E1853618E22E3CD93C6D5396E6033E8DD875315B994924EA7A6D73D71C074227F006F17DCAEC6D1E6B52295FDA3BEE605657CECB638C9174369B590A0056AEB38F4390145A3282B11A42CA5C28B804F733472A244C8ED9465194CC03CAF2B16D8D0D090C32B8AD4B3DE1F0AC5C1CD97C4075B2BA63520EA25C02D84F201E4BD9D054470F4C65666B4B2A22EFDEBD1B8D4660F6CC8C3616F01CC093B6C6A440F060289812744EBC947978C00EA04DC5186FA7937ED953D57EBF8F17BF637DEF4068DD66116DBDC3D60B79C36A5A1B7E79FDF224482BA5F5687347003F389B5D53CCE77137443687CB6A7C81259DCD5777F93C31E5EB4388BBD4D301F970941C386B5A87B983882857665270A08BA301DDB1BAB9990BD431F377CD10548BE72774CFCD6ECAE256C05D53B77285FB0719048E6302B9FE86B46D5069AFD7830F149250556F6F6F112EC8A97D3E9FE31D5DEA206DF2C18421C809EFE2BDD7B0D4FB6D86314625AD9A1A9044739722633D9F3E3E1DC77226F5E998C6FFE7AF7E2514B3FE45124928C3128800B5DD4E63863D3B6E9AF3AD35AE696A46CC1CC046A36A3E635EBE52D77B3AAD8169DE10FAEFCE3F609106830125EF04F0494426934951146084E3F1B8DFEF8375D575BDB7B787947A2202F3BBFB5DD6BEDCC1B1B6FEA999FB55939D8D08462ED3EC7C33DC25F3D2E2A019F166086ECE2AD7582C4D9F882019FAFDFED1D1515114171717D01E47A3D1643281ED04CA47A1993D14246466060485E17D4EF069D5B4F44508A15FF61E9C9CC41805696ABCD482AC90C078508E396BD26F2BC00DE9ED5793F0BA6AB9ED5229D74B22BBA6A13B9CF7BBC6DD44B6F6263FF03E71DD70918CA681FAE094F04E9A77054C1A8B6705C1960284741A68C3B809B2858DD9FB1DFC29F736FCDB87B962C162CD496592DAE8640D08F669FD85B0EA4551200E359FCFCD2B15B39886A1BE59C69A72E0E0309D4C26A3D108DDBB0E0F0FBDF7373737AAFAF1E347CBA253D5C56231180C20FA98193107006DEB30890D5A2ACB92A2C618C5AFB44833091C37E2309BDAF2DAAFB48D006807BEEDC24FAFAA81D56DA83B18CBDD7674C583FB296AD91DC3C0CA590D4AC7C3FC9213506A3B969F6302A4F33FCA329A5BD7358262BD5E2F2F06F0DE23EBC1C293100EC000E84EF902E80EFAFF14F1BD26826D15C15C8908313573BD43A699DBD1B4A05D84670E224000EFA5AAA6A34B6AE085A75B4FB8DCDE40D723CCE4C99327655982122E2F2F211EC7E331580633BF7FFF5E557BBDDE743A05B86875EBAE4D588191B193A22898F8763ADD87B9E5640D9E39D96F028D33CFD856386F12C056EC5F1BF9AFEEF98307C49A35A546D7426B61943D232381EEE0EA6B6F1DBB666F9C2987DADAC9217B1994DCB621C0DD862FC45C3735AA40E0C9460A00BA70822902B945E4F8F818F93F68A6106384124CB6894B9A00676317EC3EFDAD711F4C035F0C719D73F0DB743EF5643AE736400E2893E3B9CE03FCB63F653590A729DB8F88001C90CADEDEDED1D1D16030002DA10980889C9E9E227C0EC6D1B62DAAFBAD258C495AA42AE5AA0BAD62244C6752ADEBBAECF504EF25023F00F16A7DCB8682B015FE3672B0E45F3609600DCDD668C35BCBD225C848F5CE05FE51EC3FA7723B7F17ADD31AEFCFCED194621053AE3F16ECE8E808783F180C66B3199422A43D1F1C1C8808BC106FDEBC79FBF66D8CF1E8E8C8DA9C9847EF8E37DA14CD9F3878552D8CD6778448449054E3D2901465A3A415ECB24972C99043CCB0D3E20C36A084C0C363C041F6D1E9E929CA713825E7FDEE77BF13919B9B1BCB17AAEBFAE0E0E0C58B17DF7DF7DD643281F400F66F059A113CDE3A52A78B23E6EC53B8D03E3BF8FF48AD5BB7F9D3698704D88AFD9D647EF6E03E9162476F1546CE03A1A087977DD738155152FEAA3F49FFA1CCFB6E13B27963793421A5AA46D28846FBCE45ED6A5343B48D6F09C964707712D16834DADBDB434218781558FEFEFEFEE79F7F8EA7231BD49C3CB3D94CB2EC917CE486E98FA2FCCDF3CDC569634DEE5BDCA06BD1BE4D02E4A9449C9CAA883CE4B7B26154615A16FE4437F6F7EFDFBF7AF50AB208EACD93274F90416891630BA138E74000E66975DBB666CA9937083B6A646171A2A483E1804558D09A3244D54E026CD87EB8C95606B4C646D75028FF73EDD7CD3FF9FFF8ABBF248AB6F7A392A838D2AE351F73D798C8994B3BBB8BCB167893B6F2A9E4AA1E8673D6C577C5E42F7ABDFC926E1B88B4FC70DA484A2C8338063281A75655359FCFAFAEAE4208283A812E341A8D420867676780A9ADAEE5CFEC32828DBB6C7E6E1D9B6BA3C94D09BD0B0A3AF47E4CDBC49A014752561F6D78812C9D89937BCD84618E79F93DF3B919F198F079F1E285F7FEFBEFBF9FCFE7CCBCB7B7371C0E2793C9E3C78F178BC59B376FDAB65D2C168BC5E2C183074747471F3F7EFCFEFBEF013A041C7336914F00F737A36B341A79EF1175B684A2E5856125DE62F7B12ED3BB206C676EA58A3BF0B3BB7C9300220B29B34B290FBAE2F1FCB10480CF3500AD49002303226B84994C5BDFE9AF10D968ED8D383C0C3B247E5A5A254E8357B42CCBEBEB6B100054238B1250167C95AEEF7E73C7BBE40B433F890040AB60999CB5A9C21B1545311A8D90263D994C269309E71997190158912765F241B2FC8B5C64E5B0E52CBB133F21B2D1B6EDB367CF8808080D0B0A9CDB39F7F0E143048FAFAFAFAFAFAFF7F7F74F4F4F2F2E2EE04343AEF52683A364ACE3209E321C8F88A8AD1BEB74CD296D36C6588AA34F200083BCBDC526016C5D9D9D04F0BFFFEA2F45C904103B516116C1EDBB86A6081010D1CA8EE1B4F965D7E7E6C8396E4E00688C03F3979D94651934CEE7F3A6AAF340122EAFEB9A4354E6AAA9DB18A0E2D78B8AA2CEAB05C06772DF7C6DC042A8C54044CEF61FC7305C41BB1111091A212860B9E6158096F84EC99C4538A9AA2AF4FC99CFE78787879C327346A3D1C9C909F249417BCEB9E17038180C26938939762034DEBF7F8F6BA1A3C373656DD371ED6030806A0EB40357C6B3A04AE54ECC90ED0C20B6DD418C6559C225E09C3B3838B8B9B981ED1B633C3939C1F6C6EFDFBF47400D2FB8B7B7F7E73FFF19821777005347103A5F7D733A55550514DADFDFDFDFDF472187F7BE4865C76B928476AB405BF1DB7E5A433F118157D77C62D009FF4D047037D7BF9B00CCD1B1765AE7BB8458F78E99EBB669DB76D81FC0C7AF2936095F4A53D5CCAC4CBD411F8CFFE2C3F96C3255A6C16060DE0C4A3CD8F2D50C04F829572D38F7CA2BB9D430D415DE62C94893B6E02B33A30617062250676F6FCF7A381F1C1CA01A061E5844E8EEDFBF7F7575351E8F21C1CECECE80C4106BAA8A862EBD5ECF5A35E2A1F0E7E2E9966564F631676E0355C5A367B3594EB108697166990014B7B7B70829323364665555B3D9ACDFEF3F7EFCF8F0F0F0E6E6663E9F038F315BC40430138B6CE4C89A0B28551D0E87704C7BEF519F50148597157CB89B00F2B1460CBCEA4DC9090074BEE670FBD1BD4177F17EDA460FF984EEBE9B9DD671E524E3F0E7703814622427C3C5896B8BA298DE4ECA7E4FBC6B9AE6E6E68688EA4555380F64CD33B47435AA9F1F27224B19A2CCA1A6AA92DADD989420481EE6FDFD7D20F7D1D1D1A3478F86C3A1ED408162B4BDBD3D0456A1FB8AC893274F88E8ECEC2CC60833F4E1C3876DDBDEDCDC7CFBEDB760A8E0D945510C874394950D87C3E9740A920352DAA202BD00134DD115707AE7964AC5F1F1B1657098296212CF8C7255DDDFDF47881DC204C911878787AAFAF2E5CBD96CF6E0C1837EBF7F767666E1F65E32DB24EDB1371C0E416F9C2C2E2C16FACBC3F966F4DC2D4A66BAE70B615FEE40A1AD34B09512967465EAD68F95005BBD379B5F36917EED88EC08F480B5B731164551F44A550D1A9D73A169CD7D0E7B172D97A7D369D0D8C4D02547388FCDEDA0969833CEDADD1813355873EAD66F70CFFD33129544C0F08AA2081A0F0E0E4E4E4EBEF8E28BD3D3D3E3E3633051DCDF9C3C8BC5025E26F0C5F3F3F3C562F1F8F1E3E7CF9FDFDEDEBE7BF7AE699A8B8B8B83830354694D2693DBDB5BEFFDEDEDAD653141ED190E876FDEBC0921CCE7F3F1780C928033004B084D094A08A06A1B2881CF154571EFDE3D223A3F3FA7D45F9A3213020C05457365592E160B4B210155E0D1F8495547A3D1C1C101AA7966B3D9D1D111668EFDA020A5FBFD3E16DD2813203A3E3E9E4C2617171745518CC7634D1E82617F20A91C62850DADBA83D7341C5E35C90CBF7575D0365AC2D2FBD5F6BB4C640D8C7EC09ADECAF8377FCA27B74B44E4AF074625A904D10E86B6050A52D2B9A1C473E9A96D290682EF396D56955F8EFA1528A06BB3B5A71BCDD83274EE4896C56C36180C467B7B272727DF7CF3CD975F7E7978EF68341AD90BE6F7043E0D87C398D2B0BDF7A7A7A740BBB3B333B865118EA8AA6A3C1EBF7AF5EAF0F0308470797909076EDBB6FFFDBFFFF7FFF49FFED3C9C909331F1C1C5C5D5DF57ABDA74F9F56557575750536812CFF902A2D8DADE6980D2ABABEBE2ECBF2E8E8E8ECECCCDC9AB421B40D590F0E0EE03F003460C5C654E77979798947976579EFDEBDAAAADEBD7B4744C7C7C72104E450188B316253D51002AA0ECAB29C4C264484485C5555BDA2346CCEB1F607D16F9DA3EF76F9E7E2C548C53D7DF080A9C376E6B457A37445F7BCF9B9EAE558C3A7AD4FA5DD239F3427CF31C016639CCEA6F3F91C0D1B42BBDC7202D92FDD7A30212A2C22E29C923AE2982AA355154D508808CA03D2810C458C4998694899CFCA39D72F7BE3F1F82FFEE22F7EFDD77FFDBFFDE7FFFCE2C58BC160501645CCEA65917C61BB89A1DD2C7403F4A9851607A51FCED9F3F3F318235AA7E075A05140CA9D9C9C20470D199AC85D7BF6ECD9FBF7EF39F958CC87081DDA664E1BD10340E3EAEAEAF4F414469166E1E13C3E00A10ACDFEC9932745515C5D5DC5544C0741A72922098A85AD0CFE829C1FB416CE656C8ED088D8584535E4675114E284459C77C48C506C8787616903E4B8A4997BDAB0395F56DA5046F29F7E3A016CA2FB9A8859A3843506BF9506F217E8787C8CAA5AF67AE3F1B8D7EF17455157353C2A6018D334A4F02AAC44CE7B27A268011422330F06031407633EE86B0015C2CC209B40CCBA09C0B83C3A3A7AF0E0C15FFEF2972F5EBCF8E69B6F4E4F4FFB8301A6D7B6AD2487A6C8D24870D986D59667C1CCA001487C94A18071DEBF7FFFF4F4F4D5AB574F9F3E7DF2E449AFD7BBBEBE861366341ABD7EFDDA50676F6F0F3A528C11A20322C5EA8C4D16E96AB005CA1BA720FAD1D191A63D21D7A81D56B59931755DEFEFEF1F1F1F976589A49267CF9E1D1F1FC319050A04E9121158BED9972202150872038035BA85118F800054260BE7F9B419E6927B46DD4418DA50810C85642343D660623AF00A887E3201ECD225761DDF3C6D2B0573EA1D404465AF64E6F962319BCDCAA284D09F4C26373737304399997B85A6BC06568A313A9118227C32C6D70F0F0F8F8E8E2E2E2E902DA7AA309173ACB510ECC9C9C98B172FFEF22FFFF29B6FBED91B8DEEDDBB070CEE95253113515114BEE812CE9C731032586383B2C11AEA8A314578DF6113C39B5996E5CDCDCDC1C1C1D1D1D1CDCDCD743A1D0C06A7A7A7F3F9FCE3C78F7B7B7BF0C300E1F0A6B81BFC3F96156B4ABF31230822844D4404BDE51E3D7A747676065A8AA9D011734301971136F0753018FCFCE73FEFF7FBD7D7D74551FCFCE73F8782D734CD62B1004B82B301F486801A1C62C0690B7B01D7E19F85F2036AB9B9B9816B0861CD152D65830072FCD935341B76894B29272B2AD0F3070F809894320B4895622458C69AF65FD5B40344662CE6681D57DD55F95468430E7056264299F4109148E45288AA28CBB66DAFAFAEB0A7174ADDC141B96BE9CCFD41BF9ACFBDB8D27B8F0DB9BCF3BD726F38DADFDF9F4C2670CEC035F9DD77DF99716670C4DD60449E9E9EBE78F1E23FFEC7FFF8F9E79F8FC763E7DCE1FEC17038F4E2FABD9E40D58E4185B14902B039B73728591D00B77D6A884E1C130973E18BC217E3D1686F3C0E6D288B72341C5E5D5E3D3C7D78F9F132B461D01F28D1A3478F2693C9BB77EFF6F6F6B067595996F5A27AF5F215AAB6DBD06D186CF88709D88E6621358941FA37FCEEC7C7C7CEB9ABAB2BD046AE0A1A407CEAB7B7582CAEAFAFDFBE7DFB5FFECB7F79FCF8F1FBF7EFFFF8C73F1E1E1E22B271EFDEBD0F1F3E4C26931CAAB8155809921441F0D886D9C81837873480030384E19CB30846555529D8CA44442A2A42EC891D17B1D55635B2083B89DA3DD842E0B90E62E84E6957591314EE190860953D7724B16DF0F2F7159C5E23893562D83C689CC6925B00024DC54D31C6AAAE9179627E959852CA2C47A5D7EBB54DC344A52F42DBA20D7FE98BE16008DF05AA37F6F6F6DEBC79D3EFF7E1B4CE490E6AC9DEDEDE975F7EF91FFEC37F8043132185F178CC2116DE17E20AEF7B452922C4ECC5A1C9B377CEBB84EC2CC22CDC7DE95AA769D75749337F80AD8191CA7038FCFDEF7F5FD7F5C9C909B0E4D9F3679C5C9CD7D7D7F7EEDD5B2C16070707B737B7D0BFABAA6A4330EC1711A43F21B31FBC96B3E63F403211F9F0E1C35FFFF55F9F9D9D41DD87A313186F6009D90032FDDDDFFDDD7038FCEAABAF1E3C78309FCFEFDFBFFF3FFEC7FFB87FFFFEF3E7CFF7F6F6AEAFAFC1F52DBE8E89997D8280C66432912C918932A517B13344D328155253B7D17A87FD092D15190B314652157122F2839BD9D02A2518BAFE2F2780ADD84F596C1F52C92A2DAABA86232884309BCFA0E39A730DE7DB4D42085D37F418BDF34CD42B7BA41A52B22EB6FE25A2E9748A680E48081667511470577FF5D5577FF1177FF1FCF973A8BC780A92C34645CF3BE7BD17E6A2281C8B77AE28BA3EE24562F5F827CCDE3961B6122C61266C7394406FFAAE4942221A8FC7C7C7C7E7E7E7F7EFDF1F0C06B7B7B7E3D1F8607F7F3E9B0DFAFDDB9B9BC38383C383837FF9E31FF7F6F620069D738BAACAB5792282E2010AB1A01E1C5C2E355C190C06E7E7E77FF5577FF5A73FFD094E52F0DA1C5F4D7FE09481076FD51FFEF0877BF7EE1D1F1FBF7BF7EEF1E3C793C9E44F7FFAD393274F0E0F0F9BA6393F3F87CA871C214BB8B29B985A658F00FC5C56B366F40351E0A8245DB6B655A2AE07BE68C426518900E8CE8E0A39F6E79F4B0258BB7865F782ECDF56CCB63B6E8E5D13B24DB880FD40F118238B749D68559D774835410CD59650522306AC9C4F0DD52C548C1DD54163E6C203C4078301EECFCC4DD38CC7E39FFFFCE75F7FFDF5F1F131B452046BE03272CE8D7A7DD0438B3D8E987B45D9F3858860B72F7C4AB7DFC3F21FA4019AD90B8BA4A43DC93AAF000E94FA455755757D7D8D8488D034478787D562D1364DBFD7DB1B8FE7B3595D5593E9743C1EA3949192C2836C2800703018C08A0013454CBA93AEAA501D3F7EFCF8E2C50B11412E06160250B51E3300914B03D83C1A8DFEF8C73F5E5C5C3C7CF8F0F9F3E7A7A7A71F3E7CF87FFFFE37FD7E0FF91DCC3C994CC6E3B1B9138C796956CFCD4967C6D371329AF05900072454484159DAB172242234CA5D2300DECD6D69B567688EB7EED983077763EAAEB149003FEADA90F509B4AC84B22C8BB244D16A08A14E29FB21219F154FB1199A21C610BCF350396208655178E766F339408C3A01A03B3A84E27155551D1D1DFDEA57BFFAE28B2FD0460E7809B55553157CE90BEA22835AF44A1629C0F45319DA9A50CA7981317B18CA2012500B8C2B52C5BE77DEB9D974FAE8E1C3E9641243F8ECF8F8E2C379AFEC8D86A3E16030B99D90EA93C78F9BBA66E72E2F2F91DDD0864E4FC01B4154427081A19A7386B20A92F97C7E7474F4CFFFFCCF5F7FFDF5CDCD0D7A6A50E22C9BB6A3E9F4FD7EDFD266DFBD7B777171A1AA878787FB7B7B979797979797DEFBA74F9F76919C14920BA93D11347E4ED1896865F5C9276B9E34935DAAEABBBD30BA3C7DE5A4EB601340A5D4B79D7F9000D630B693C0CF4F4F7F14EEAEADF4E6F71FBC8A53FC121C029C09BEE1D16834994EE1B6AFEB7A517546126CAC2A497C4EAA73D334E25C1BDAA22C958885FB83C16038BCB9BDF1DE8F46239801701A5A760DA8687F7FFF97BFFCE5E79F7F0EEF2AF460D885C8CD44BC26AAB273EC9C94455196E21D3B2166EB9E60AB65486F5FF2E1522DAF199D313599A2648AC031309BCD46A3D160383CBFB850D25EBF5794C5E5D5D5786FEFC3F9B9384744D7D7D7C3E170369F03A52805F244E4E8E8081B9F2103DC3A058108C165F0740B4899688555609E09CEFA2FE165AD88743C1E2F168B0F1F3E8CC7E3A74F9F0E87C38F1F3FCE66B3F3F373141643A1C794E0818829B54E5324C1DCA69C12F8E03335352CC6E81D67FDD34367519112B4EE4F2680CD18F3BF3301EC1A9BFE229B90B1763819EBBA9E4C2665DA653AC6E80B0FD7014A19E1DC00D4E032039383F30E211E885130424E5579D6741FAAF06C363B3D3DFDC52F7E717A7A0ABB0D5701F5819145EA102885F365A15E8A5E29A52F8A829438B5D297A4FEA73D9AC8798F820F1C616162D294CA6F0E38D3B039198B000BA4DF6C36F3593B13A42188C883070FDEBC7D1B42B8BEBE9E4C269CD83C2807A8737171F1B39FFD0C153FC3E11059A2867648EA04367CFCF8F1F0F09088D00CCB9452235AE3563690AB0B4ED1EFF71F3D7AF40FFFF00F6767674747475F7CF1C5C5C5458CF1E3C78FD6722BA4F234F353999C31A48CAB6D18250B57C518BD8B44915951A8AB94A6940800F3359B75170DB8D52C664A51B3FFE51260ED91F6DD204244C822C4122EAACABAFA887388C25C5F5F871080E89C5CA8C0E679B570DED54DC3224559B2C86C3E47374A7B163CD3BD5E0FE2FEE0E0E09B6FBE79F4E8D16030409586A68D81415770CB2081220ABBB2084CBE2C84C5171D79785F74FE9EB43D19FE2502408B5586A35789843964952B9818A802F10ACB0025A2F1783CAF2AE73DFECD178BA37BF7DE9F9D3D7BFE7C3E9FBF7FFF1E4CC179672E7CDC0DF6F1FEFEFEF3E7CF5FBF7E4D44C04584CF01BA5EAF07CF4F5996B7B7B7272727C8F0B1FCF04DBCB7FB1BF38632399D4E4F4E4E66B319F49F5FFDEA57CE3964741B86718A96C86AA3174A9EC09872D4ED2065E94CC20DA5CD35087BF93211712E017E140118DFE934AEC7F7EF932AC5B42133A5264156179F96162B6D2BAA994D6C5AA33DDE44E71AEADB97983590320031B3EDFAE89C2366682FB08734A5739AB9D6B6AD1337E8F7BDF3D84BB457964D5D333114005B00B87DDAB61D8FC7BFFCE52FEFDFBF8F6EF7A0257C8120C6714D91AC9E2BBC48BF284B715E9C6719943D284C66FBE20B84015C0576DC89C04DC4A9858929D9C05DF002F34222C7A66DDB5E596A8CA16D6308971F3F92EA7030086D8B85BEB9B9198FC737B737B06E71F3984ACC2E2F2F3FFFFCF37EBFFFFEFDFBE3E36328DFF0AE12D170383C3F3F479E3311212C8020715EDE2529D882894D2613D8EB000B0AE78908BAD6D1D1D19FFFFCE7376FDE7CF5D55710E610C828F191CCB161AE55CA14124303787263D6F0C2177DE242C593142A8E484899230991E784FB29A10D88BD8684264C8CE71AB1894817095E520FA71D6238EDC641F69D8989728EBE4A649B9C23FF69ED8BD93DE605335D198CA1699A98F80D949F35CDCA629966E4197C4DD4C2C0882945B92CCB9FFDEC678F1E3D422A1BF2D12D00699CD2E6E3BDF7CE3BEF5CF2D6F9F42F9FCC1D40C899BDCBAECABD4066FC15A99FA9257A8C46A3B3B3B3939393D7AF5F0F87C3478F1ED54DF3DBDFFE16F877F1F123CC274A262CD43F2851A3D1C8BA04A086869987C3E1CDCD0DEA10B0CBD86C367BF2E4C962B178FDFAB58944343F84DE05F09A83D5EC6010003814C214655922D90E5E38885C4475A0A98694DAB9063D501ADEC5A56458ACAF2F8499C8F653222555CEF6FC2322E695CED55BB56EFB349E88937712806EA0BE2621F4930920FFD570CE10022364DE4C620A29EB337F61CD32F8F113903E6475B4208C98D2D371E6E3C78FEFDFBF8F1671A3D1084A3FEE86C5F6A9CDBFA4307EE13DFEE712A58200D6BC0A9B18BF36CC1DB4A961E72A0AE68904B88F1F3F3233CA7087C3215C9F65AF77737383E2E6D97C0E5B45B306D430939043414997402B5FDCEDB3CF3E033B8791A02935484490631242383939190E87086FE1E6F06C9A116C263B32AC66B3D9F1F1B1885C5F5F837949AAB486F0817F730D17F33FCD5F640E09C861871E3D165654255561CAFB12E2FB2EC8534618C67A4CF8AC24E5AF918E1DC98F6F9EF38363EBCC621AA60F60586B3E3B07FE1CF39DDB99B4D1F62C6685B3C0065C2222755D23A712B7328433FD21C74BC37E1B79B0261FF9911CD6770CC97CA3B0DD63CAC9B3780511354DF3ECD93314821D1C1C84B40154D3342842383E3EB67A37978AB3902205A4BFBCBC94D4C91479A9CE3964EF344DB3B7B7A7A934E2E6E6E6E4E4040110BC05DAC5FDFAD7BF46C60402EAE3F1783018809688082E23044F20DC10239B4EA78BC5E2E8E808594C2E2502193FDAC42E880B8306CE34C810ADD4A56C6057BEFD1153A657D32A535EC3C38E59E4128092724F0C6B63FD4A66CE7B837E8A04C88F6C9D4A3EDDEE85AC5F9A2AE4293C39B94AC7C99D079EA429802F2935D28C1E43ACFBF7EF3F78F0E0E0E0603C1E43F301DC2D16C3ABDB7D7634E0BC3891A4BDA464872E82BB29D9F2773472CAA9CB5ED6DEC5849BB92C67B3D9703884FE8DF481F3F3735C3B994E8F8E8EFEF11FFF3184301A8FAFAFAF41DE923243636ABF657D230D3E1845514C261364F35B46A0F71E31665545C2C8BFFCCBBFBC78F1E2BFFDB7FFF6E1C387B3B33378CF4E4E4E46A3114C5E788A2F2E2E50FE5696E5EF7FFFFBFDFDFD478F1E5D5E5E4E269367CF9E79EFD1910092CA4C9D4D3CB115845790AC613D45E1E50E33421DCF66164A1BF6A53F997630689300066DC3A2750258AA3A4494491EFB92C5606B460000200049444154D7C9ACED8EF18904C0BBAF6266491E1E22F2451726CBA3897607AC2B545E534F25CB7BA19452B2582C0E0F0F1F3F7E8C5475B03AAC195CE39A5A0B1A0180F11745813F24C91F336DDD469FFB3521609C3E51146806D22ECF05287CD6C531745BD82F4404CD48DEBF7FFFE1C387EFBEFB4E44DEBF7FFFF1F2F2F8F8F8FDFBF76FDEBC190C87D85BD2AD763EA4542686D7190E87B08343EAAAFDF9E79F5B7997D9514F9E3C814980D285A2287EF7BBDF0D87C3FFFA5FFFEB7C3E7FF9F2E56030A8EBFAC18307165FFBFAEBAF9109879A63D4702E160BD4822E168BCF3EFB0C569995D25B92CF1AEA0B71AF2C993886E8C4098BC6881D659881F69D2EDE6D1CCF7902E212857202C805EFF2419F420084E0C3561AC8C68F22805D9268EDCFA66D01A3B22C9D7748A20242E4728D52288D52E303534CC1D7893AFB014ACEBD7BF70E0E0EBAE06E59E2D3268CF5E6648902FBBBB08073CE7BE753C6BFA5FDECB601D6F41C53A224E5FCE564ECD2CE14D055A0F2CD66B3E9742A221F3E7C80860DF7E2D5D5D5E5D5D5E79F7FFEEAD5ABEBEBEB36B47068C6AC209852092838A8594A507E903CF2D5575F812B4FA7536CAB11631C0C064F9F3E7529DA8558CA6F7FFBDBEFBFFFFEDB6FBF85610DB504782F227FFEF39FBFFEFA6B945880E3208E311A8D706722BA77EF1E621178C13524B1358D61A59ED33ADFB012B1747E35B0FC6CBB9674AB9D04B0F67D8D1878778773921DFFF2F113EC81FCDA5CFBB73F6139D916779871CC7ADDE410D4D41F25A616FEE6FF819F04F7C7F6C0E0FACC3C1C0E51AA821328054A979EA8DD235766EE78BBAD64E0B272193B0D98019E0AB284F89ACD66373737E6420921FCFEF7BFB7CBD1A796B2DE163EEDF905DE1C53C614EA7499B9D7EBC14278F0E0C16F7EF31B14613E7FFEDC7B7F7E7E0E867D7171F1F5D75FFFE10F7FE8F57A4891FAF2CB2FDFBC79F39BDFFCE6E9D3A78F1F3FEEF7FB575757B3D9ECDB6FBF3D3E3E1E0E87FFFAAFFFFAF4E95358C3D8AD07F1E0FBF7EFA33612D972F02FBBD5ED4A736DD076706266C485DAAED71D9332DB5EC1CB4D8397C0DEC4ABCDB5D8857E560FB0BC2D6F207A7E4D9E24471BDABCBD43EE4BB619E45FEC4F5E35257B6529CC28386C9108A4519C688AAB43AD87CE0044C786B89C0264E07393C9048A8D881C1F1F1F1E1E42F5476AB429C778A865A4982B8653508C94A2465445305B8ADB1633C6E06E4A5491FA8E10916A404905DB4EEB4C221C82C2410980C00CF8FEFBEF17B3790C61301C7CF8F0A16A9A8F9797F3BA9ACE6783E1E077BFFFDDC3470FA7B3192AE89BD43A0ACC3B660531929AE11C1E1E420542862C7477A4C77EF3CD37BD5EEFCD9B3783C1E0E8E8C839F7E2C58B7FF8877FF89BBFF91B6C375F55D56FFFE9774E3884F0F4E9D3D3D3D3C964B2BFBF0FC71476A6E214E5C00E0C755DDFDCDC7CFEF9E71F3F7E0C21A0DF3A1A1F0150D815C19C7522A2A4E244854938845057B54495A0DC2BEAD090B0381743D4A8DE39268ECC2C4EB23715628D9A6F43967358F374D16A26F24A3AF4A78C4DB1B2F6EB9A8EA5BAC398DE71CF2E3684046952E71C215920A188266716BEA09399A6E41628C458362CFFDEDEDE679F7D866C0294E1D96ECF40715D0B0D667B9E3AE798A8AB92EBC89719A9B2DB32C039A5F781EB73B28089A86996E91894FCDC441442477898CFEDED2DA67D757919637CFDE6B588BC7CF5AAD7EBF50783B76FDFDEDEDED675FDF4E9D3F3F3737074CA76D330BAB555405BAEF178CCCCB09889A8D7EBBD7DFBF6E0E0E0F5EBD7300C269309BA82BE7AF5EAF9F3E731C6B76FDF3E79F2041EA7F16878797909AFC3C5C5C5F1F1F19B376F88E8E1C3872F5FBE44BEC6EDED2D5AAADCBB770F1B0E4046C1463758B9D4C614EE07E0A80153511612DA4E2B208DC2A6DD05202E5168033AAD735E1BA9A4AA1B7AFACAEAACE93F77A9405B2FBE5BEEEF1AB9A45BFBB2392C18E452852865B962C88608A9B72B500A5C135A2F583E25DDC0F2C3C0FE71935C0AE55F8CB42C1470C73C351B39882C782429FF16C19DA2E8795F3A57887866A7CA2168DB763DDCF1098E0E24BEB8B840286A369BA1E702D46ED8A979CF1523B398127E726B4FB2480BFAC8C718178BC5B367CFA6D3E9A3478FD004E5F4F4B4AAAAF7EFDF4FA753F4E77AF9F2E53FFDD33F85100E0F0F211688E8DEBD7BFBFBFB7FF8C31FE0997DFDFAF5575F7D559625621497979728DF298AE2F0F0D0BAB0C01843C611FCB6A3D14852076CC030A4D16A6C3536141B0D8BD8364D1399C809FE89772412D35EAB7915A22278955624FFDCBA5E18DB0920478E5D787F3731AC5D750726AD0D6030A79A2FE0E25AEAA5A676C792A2BF85D5AA278E0BAF79BFDF876E8A12752B76F1A950D514E8DCF16F4F31E190CFD004EB26F673B6519CE1250E5A2B4C4EE5B670F2C045832A85F3F3F38F1F3F9ADBFEFDFBF7704D1645F1873FFC01A156BCB5B51EA12C6F0FFA0F659D7155D542B008E552CA3FBDBCBC44C7216C78DCB62D6258A3D1E84F7FFAD3B7DF7E8B4EDA676767C075AC85730E34F3777FF7776DDB7EF6D96731C6A3A3A3838303B420003F7AFBF62D2AECCECECE66B319402422575757E05C94F669A555D40CA4C44CDE71E1C93B75D25AD76BCB9476E20A6F008FD9A2AC7158FBDC443F3B7F5D05B2F5DE5CF83B7ECACF595381F29FD6BE6CFE44C94982D563E1A228C489AA3A114DC9CCC6C57DAA9F188FC7F061C3CF00A4C10A7DF1C51740FDB22CC7E33118FCA6C95BA4BE65968BDBFD2AAEDB0F19EF4E2BDEB01C20921A2442707196DA2E22CC5DD1BD3169987AB3D95C555144727E7E8E6DAEE7F3F9EDCDCD77DF7DD786707979391A8FDFBC7953D5F5C3870FDFBD7B67CE22336370B798E5129BDB00D87F7B7B7B707060CA3A44A5736E3018FCF6B7BF8534C0859F7DF619922F44045DA05FBD7AF5E5975F5E5C5C38E75EBE7C391C0EF7F6F64081F0AE7AEF0F0F0FB1914C8C11798DB7B7B793C9C4E25F5093C05CF08EA6FD47DB0E47B8DB428619351824CC5159093B8B3991484AAA5DCE55D267A2AA6CEC06B926016C99ECB46E8D769644AE5E7607FADE4D00FA236D802EA68BCB8555B545828376F94C21DB950460857BC762BA9CB68470CE3D7BF60C4586F04288083AD870F27842C20071CD196A2FE29C7382BD4C12AE13AF959FF2EA306F0FA7E05ACCF63BD2D4B79088BAB676219C9F9F030FC6E3F1F5F5F53FFEE33F32F3DB376FCECFCFABBA7EF6ECD9EFFFF99F0F0F0FAFAEAF91BC00C689BE1208E8C2556A922DA654D95EAF87B600A03D148BE1DD01C6987A13817E10662ECBF2EFFFFEEF7FFDEB5FFFEDDFFEADF7FEC1830793C904BDE57ABDDECB972FB1C364D3349F7DF65955551F3E7C00F05515DE4F903D7A5E40AA4038F77A3D7B7D631926275918496DB00620C74A1225156271AE280A516266EF7CD4C8229DDE9F2257316BF6BAF9B9C6B87F8000D6F0FE070767C9DCBCB1EFCBDD34907FEFB48B940DDAB66D88514442DA99D4A43C1199BF192520E031C08FDBDBDBFBF7EF3F7DFAB4DFEFEFEFEF0F0603D800C3E19079334A25200F53DC4D236262488034BF4E02AC293FB6961651CE23653910D25B282A9FB1E5043AC5BE79F3E6B3CF3E9B4EA7555591D2C9C9C9ABD7AF7EF39BDFEC1F1C88C8C7CB8F9075752A9BB6D47C144BB8D4FFC77E825F12DB23E008EE707D7D8D7440EBD0669C6B3A9D7EFBEDB7FFFAAFFFBAB7B7777A7AFAFAF5EB8F1F3FCEE7F3070F1EA0EFD5D1D1118A0A2E2E2EF088EFBFFFDEA57C4450BBF569440607B47F9F766AB3488BA6F6F41D9E64599DA284B49F8204DB4B3251E90B4406047BD6A13A3875F58C6957FA1CE69B12205F0E5ECD28FA2906EEBFFBC8FB5AAA2A38B74FFD924CF537F4DADBDB43E4DC5A9A99943F3E3E1E8D46E8CD86B2B27BF7EE199ADA3D25DB552EA48A551080D1433EC3AD90CD4F0BA9DD90FD0A8904FDC7CC0FE71CB0B0699AF7EFDFFFEE77BFDBDFDFBFBDBD85C7E6C3870F6FDFBE7DF6EC19220350FF7221833BDFDEDE42BBB39EC13607F05ABCB8C113F515A02238CD54757F7F1FCE19685F7FFBB77FFBD5575FFD5FFFF7FF737474349D4E9144F4F2E54B11B9B9B981A884DD727676F6F2E54BEF3D6A00A05961D5406C8863A8AA730ED9B8926AF68BB47F0FD2EF222D3513CFE252C381B6AE9BA6A9AA6A319B5755A521C6B4C3C3E6D8D4F5EF3E4E777485F8B1F4904B0C5DED3DB8F55686346BBF02779DF731C6100333D74DBD582CEAAA6AD366E8A004E068D334D82209CA2E1E876DADBEF8E28B478F1E3D7CF810B62309871849BBB8AF99A7BD347010B202DF9BA671E20AEF35C4C2795672A031E484A64D427DAA6CA6149B2B8AA26D9BC9645255F318438C2D73D7981A1A7C0808782B5C28CC7C737303A562369B7DFEF9E7671F3ECC17F3B76FDFD66DFBDD77DF15BD723018BC7DFBF6E8E808653D9797974F9E3C412A1B982EEC69ECF925A900CD9C6670D2A3DD227477220294D0270B540A47D3E9E969AF28FEE7FFFC9F7B7B7B70EC00C265594289FAFEFBEF6135B5A9CB15889053433EDCCA3888695C3115E9C33A7FF8F0211A7BC5107C51C4368813448102133BC7B14B0A8E313AE9B89238E7CB22C4104310274E5C8C9162945515DF1C276B514833FFF8D3DDA09F3836AD903BC656C2D02CA46F562F6425BE18FF36473BD4568B74C0CFF08B5FFCE2E1C387C8898086D32BCAC275C958922A54E023426B37144652F2A210112C45A361032EE6634C17AC1D7E12FAFF587BD71FC9AEEB3E74ADBDCFA3DE555D5D5DFD9857CF0C6724726486A4284A9414CA0FF901D8967D615B4162C0C685E30FC10D2E02DC8BE41F8803F84BF2D55F927C087013D80812DB8122CB967D2D29641C4B222931E27338331CCEA3DFD5F5AE3A67EF753FFCCEDEBDBBBA7B38D4CDC16050DD7DEAD4A97DD65ECFDFFAADA3240C01E68CBCA757C3CCAC144FA7534812DC7AB0EFFFE8473FFA9BBFF99B73E7CEEDEFEF8BC8AD5BB7900AAB56ABA8F4B5DBED870F1F4279974AA5B5B5B5CDCD4D782610DC46A3D16EB7777777F1469029E1AE40C4AB5D5B8CCF16886B5CEC743A5801009040DE88EF88CDD3EBF5A228C27E4331F1C2850B1264967D16283B63DC0EB9E42C2C18B0AEBEF69FBB567A806F7D51CFBF37CF7338BA1C70BFF994977FB22AA8AB9EF4E417A4EE2382E0C7B1036779F9A77EFF85853879606966F33911B152799EA3B9C8E44734D9F8E6A8E9E289A2988AB2A8889C3B77EEC68D1B1B1B1B4B4B4B70FDC595BD28E88ED34E8B63E97D0E3E6C8C320EBC854785C88188A2A0AA2F8E901019C9A32848945691561109E726F3D5316C6CA441078321943ABECE68347AFBEDB7B5D6DD6E576BBDB3B3339DCD922499CDE7DA4D1746433A7E442900BE3EEA244992ECEEEE369B4DEC2B44477002010A84746A4737B6B4B4542A951E3C78D0ED76BBDDEECECE8E72BD8E202AF52907101856AB55DF27C0CCDEF67A08061633F4C7C278C90706D89F4AA9D5D5550CDD28974A42A488736B88482B4556A2A0C38B1CE037491202DAA0289711CE5741D163E1FF054FC46F8C8FEE077884223FF5AF1FA9F81F7D9880D1C9BAF15E12B432843B1EDB1D5642B90172B55AEDA9A79E5A5D5D450F07336B564914474A2BE2486931568C8D94C66B9B9B4869168A948E7514EB48B3222B64451103A3A21D7F41EE6271EF9133D85C82E46311AB1874BAC4CC1AD04567DC6C9EE7D56AB5D3E9244994E7F96030585F5F47D70B11D56AB5D75E7BADDBED361A8D388ED1D8AEB546A6124449A552E9E2C58B4AA9FBF7EF371A0D11412C84DA599AA6687BC0580D6C4BF00E8948A7D3514A412F406177BB5D1141E212E1380042D7AE5DEBF57A302FC6986AB5FAF6DB6FEFEDED6122D36C36DBDFDF5F309B70D07D0364A89B217F58405088562A95C160B0B1B1F1DC73CFF9059C4EA7112B6B2D7A8F24A011C036C37B7DE51B62A31C7CDDBB3DA1F4874660C132E80BDDEE230C4478847F3A55CA4FBDCEC7B200EC60391374550342684C966571147BED02075D1CFC0149063821F3F9FCF2E5CBCF3EFB2CB09F22A2D93104125963C409A28F71BD8F18B8280AF98D6AB59ACFE72402CAB718FC70515473491571A3B850A2B601028A083E68112764F96C3E2F6A404AA92489900B69B596001C68B55AAFBFFE3A9AD99BCDE67FFC8FFF1194A03086F36C0E7141488A6E296B2DE606186386C361B7DB45B70AAA7E5B5B5BA88EB7DB6D2C0E1850708583830322C2EA75BB5D7856F06190A43F3C3C443D0E45151090A960F0198257B849266078D627307F74DC41809184CD0476FAFAF5EB699ADEBC7933C2006D22268AA328CF32722EB175C3478828CFF3B4542264A58114552A0AAAEF273D9FB32C80BED0ED9E25BB1FEB38D505E2B3291317364078BBE2101D207FB56289481FE7F5F5E9A04AA5727070E0556FB95CFEC217BE70EEDC39F6A94C1D6559069F9199AD31C0F403D2E3C5BA5C2A21211A692DD6E65966F27C321E8FC763E0E07DEB090CB776E336C2D28175543FCC4C2C5A45CC24628984D8229F932449A552B2D6C2FF4E92147E3688F6B7B6B6E0F1630CD16432D93F3810112B56442A950AB009E1D430A09ABBDD6EE41A826BB55ABD5E87C782AE00B8677B7B7B408560AFFA89BFE2B234904871FD59D830CC8C39659E91FBDCB97387878721A0CD5B6C6F00398847C3649AB5D69B14F84E804EC0111A8D46680650ACB2F93C726D7DD661DD71C3C698388999191B0044C51E2D16CA55E87D2D88FE476C8005CFFE11C7A36380B38E931B002FE0DA5A7811629552566C9EE712983CEB06FDA20280EA181119633EFDE94F3FFDF4D34A291D47888FC45A83D610A523ADF3609CA3EF0DD00EA686854697098093104D3CB05EAF07171C138DA0CE5186F3C19C3808AA8828CDC456C8328B763332A2284AD3022F54AFD72B952A6AB4180F53ABD5EEDFBFBFBFBFEF85783A9BA5692AEE83B4EB7D416227CFF372B9DCEFF7AF5EBDBAB3B383D4D0643269341A5B5B5BE0CF027C08DBB8DBED229C05D61AE981D168B4BEBE8E9381F18CDDCC0E94172418AF0687071D0B7E462A050E4FA8C8BCC20A7D15EBF0AAB01B08AC6155808632C6C43A2AD82683214E5E66D89526417E83AA30BB04742896E10638D5029C32246FE13B3C5AA04F8D013EAE0D59305508584D30DC5C29856990CA317723978C0C9A520A88E8CDCDCDF3E7CFA31ACF79C645C633F21E3C32D35072789C907594CFE0D702A513C731B08D10EED16884206F3018F4FB7D8CA8585D5D8502F31528B80AFE8943F7A3E65F2A5555F12C730436F8BEF8E5EAEA6AB95CFEFEF7BFBFB7B7D7E974B6B6B66EDEBC8965595E5EDEDFDF872E00101F9601D2DF6EB711F71B63C07E8E7BA320358932391CF466B3F9EEBBEFD6EB75C87DA954023A1A1382C91598E1A6C78E56158F006C3F580DD495D1A8108A970D06779F2A21D011780B08A0900FBD7DFB76A7D369369BBBBBBB60E1C66D0853B8AFACA3D0C47B23052835F9F2A80E08B0C2FFD519D0C6821BF4F1C5D439B8474768E616E43834823E1CA147A6AB84595CA8444C799EE7596E5D6AC55B27EC048F32C0052F5FBE7CFEFC79B8D4E2A0264CCC4A9108312BAD2079F05C317D716F6FEFF0F0F0CE9D3BF7EFDFEFF7FB3B3B3BFD7E1FBA64381C22C2C6888A388E4133AA94DADADADADDDD35C66076CBFEFEBE6BF890F97C66284FD244D8CCB2994A5894245162AD213A1AD50A14839882FF2B2995CE9D3FBFD2E964B379CC6A6B67BBD56A0D87C3F96C36198F35AB48299365FD7EFFCB3FF3332FFFB7FFA6955E6A2D55CAE541BFAF58351B8D9DEDED529A5EBA78F1AD37DFFCC4F54F0CFA83DE412F89E3388AE7B359B9543AB771AE522E572B95E964DA6A36A79389C973AD541C4587BDC3388A92382EA5699AA4B8A63A9E02463E80DCDC17EBF04821FEC23F56EBE8AE3C1EC43B48FE858F53F1B881F40602006D89C41CD613A0198B6629B18D46234DD22CCBD04D1605E1472869855C3951F4BFC4653F463F80BFE2C24EF21B63614B84272C18A085F38F5900578E452470D2375BB899D8F182A0A3AFD96C2A3783A4C87F59514A25712C0E3106AAF4C3C3C3EDEDEDF7DE7B0F74C70F1F3EBC7BF7EE6030087D53D459C97159633453B3D9843F033E642461816363E628D2ED763B8AA3E974CA4CA5520909D0384E858941124AA4E3282D95582BAD231545F8A6711C57CAE55AB5DA6A2F6D6D6F63978E46230C9F03DEC1588B9A2B34749AA6FBFBFB1B1B1BCC5CAFD7B157AF5EBD3A1A8D90C0C1524059A01F08DB1EEEDF83070F503444F20791C9850B17105621F0406912E20E0890D7A6E8BB5701FA4B1D4782713080E7D487CEC7FDA5851D222EF6F5D7D49E9B43719AA67114317354047BC7DACDE88437EE7F0C15EEC7DE0067FDE9D17F3DF9F653B34044C4C11063150C75CADCCC77AF63C89584F1FB52A984BE27908528D7DDA20B7EABA3B18A83C1009E4CAFD73B3C3C84ECA236492E9F331C0EADB58D46C3E3F5C7E3B1B5160377810C8372DADBDB6B341AB55A0D23E8F6F7F7F7F6F6A2386126AD2311ABB44ED3248A53A55514473AD2C414C55192A6AC149122C71F1A2771A55269341AEDE5F6D2D2D2FAFA3AA0970F1F3E64E67EBFDF6834E659E60D14BE3E4A78F3F97C30185CBA74E9830F3E78E9A59730D3B7D56AEDECEC542A956EB76B8C595A5A82C8826D723A9D76BBDD838303CF3DAA943A3C3CDCDCDCBC7FFF3E2231C49D6194E5FD526B2D2E4874E4A57861F56A31B4F33E803929150B42EF5F872ADC5F50B92124107D5DC0160360E94749B2FFDCFFBF1B20DC4CF84DA8FE434D70D6765CF8A57653DD61A5BCF50C17971C5E0D0B0A7C1B33FBF9E9F05651278AA39888AC31999B6B3B1A8DF6F7F7E1EAC09B1C8D46E4501888073CC6A65C2E0328C1CCD83C688C1A8FC77B7B7B1050602B104ED4EBF572B97CD8EF97CBA572B91C43D059C569CA8A75A4317F8D95525A11130947511425B18E2240EEF2DC186BE7B3D97C3EDFDCDC849A47D9C818B3B6BE5E2A95F6F6F690F6C9F3BCD96C627E5EBFDF7FF1C51731594C44767676004A9BCFE7E80845A16D636303F48970BEFDBC3D66866DA9542ADBDBDB442444899BA90A44966F6C87095A5E5E06E4D3064D86A1B3E19FBEDF1E2620870B5F9C5A38A3A0A1C73FF742FD31E6C1E9288A0A6CA2AB5486C2E65F9F9437FCE67F8D05A013AED1C92578F4158EEE384C77AA63E9E4C81DCAD12B402161034029428B3360A4484EA379D24D2045F906BDAAF0EC8121CDF31C3D2BB813D4777676769ACDA6CF5A6C6D6D6122D06030805CC220F4FBFD8D8D0DAD354C50A3D15C59ED46515C2AA5C658B8404A174DEBA1FBCBCC8A3429B6D666D68005248EE372A9B4D2E99C3B77EEE1C38718D177FBF6EDB5B5B57ABD9ECDE7626D1C45A3E1309BCF2F6F6E8E4723123179BEDAED92489A2491D693F1388EA2F6D2D27030A855ABE73636A6930912BED54A65B9DD7EF8E041AD5A1D8F46F3D92C8EA24AB99C26C96C3A8DE258398E2DE2A3B632ED30B3C802E389F8E257A8FE4FCA83DF127C7C96DC82548472E25F1FCBFC846E1572BB68BC761F631CF5D082B09DA57FF9C77081C24822BCD7B3A43F3CE7542BB170AF992BB5321F75E26AADC163CE8EA9CFAF23BE30D05DF06BF5F1661726D25AD7AA5520B4F6F6F640BB09C88A75B3245028C507C1982449D26C36A168316F2F4912149B3A9D0E247E341A1D1E1E02BFA903AAC079D1014C4A292B46A902E0C541468F8BF21C06E46A14EC5888AC88481C454A290C2A4DD3746363E3CE9D3BC6B120A2CD0AC018148C89087660381C1E1C1C60A018004B9B9B9B4B4B4BBBBBBB972F5FBE7DFBF6B56BD7D0F70830396812D1EB582A950EFB7DFC389D4EE32436C16819E3E604A30703EBC9817372EAEB506C4EDD00A70AAB97AE932E0D9E2C86E726685E0D3AE1CF8A2DCF3A7E9C0D106E5CFFFF824C2FBC7161033CE2E67237F28D08739F8E75ACFB17385902B671BC86DF02E2B7E26422AD75A35E47F17F381C024D092987C504992BFC6F2232C6743A9D9595956EB7CB884D2B95344D01B0595E5EB6D60E060380ABAF5DBBC6CE1F5B595959595949D394584DA6937ABD512AA5F32C8FE3C81AB43269B1C2C45A69268EB46651568A42175961E648EBC4B568B6DB6DB4B32D2D2D7DF6B39FC5484622021C00710BBA52D0F68915D8DADA6AB55A83C1A0D3E9606F20D17EFDFAF50F3EF8606969E9FEFDFB18C7E433F1ED767B6B6BABD3E920F152AFD7B7B7B7AD0BB18035C2668883896374C2FB0F933F14A8DE70039C94FB4728505421C273A0D7CA950A82E030BD78324579527A177EF3635A80708F2E5C7A61272C840127F7C9C21DDB6088B971E6D57F7F6F4CA106A22842CE9B88509087AB8AA34851132BA5CAA512F098D09A585638B8F811109A52A9049F9E5DEC81E4344CC4D2D252BBDD2E1E40B90CF425EA478808D15F3B9D4E59A966B3319BCD8CC91BCD8608912DF01424C2286C1BAB958AA384898430EB811571AC75AC2310B14C261300FE6AB51AE012FBFBFB5A6B8401AD560BFE184A011861341E8FD1F37E78789824C9934F3EF9C61B6FF8AD321A8DBEFCE52F8F46A3070F1E28A540BF05B89188ACACACB05277EFDE6D341A070707E0C3CBB20CD5B4B0DC6E1DE8C33885E53700BB1AFCC2F385009CBA01CE121B3AB101C465C0CB95729AA6F06F0B7214577C3855CF86521A2A717DAEB3CC6C59192B39B1D54A29B5984E5A90D785FB3EF258821342890FE5DE7F70680AC31BF5FA9C4414B166A55915C362D1F7E63F452B562A567A329EE4595629574A6969B9BD5CAFD55BCD16704426CBFBFD7EBBDDAE371A4BAD9672CCA11E585BAD5631C216C16B08644718D06AB5403D0478999F3761DDFC5D44DE88222693C9F2CA4AA95CAE542A4C9C944AB55A834869152549298E5366AD54A454D1F221C4562C666E6389D0FDC991CE8C21C52A8A726B9899984BE5F2DAFAFA6AB7BBBFBF3F9D4E575757EFDFBF9FBB1152682BDBD9D9F9C99FFCC9D75E7BEDF9E79F474A677D7DFDFDF7DFEF76BB4992BCF3DE7BCD562B4E92288E47D349AF7F9819A3E368381E55EBF5F1743ACFB372A5321C8DACC86C3E53AE893E8C5B7C8F4BEC88FCBD83E4C514AD98D56A155851A08CBCA8F8D45098DEF0FF472E0BE2A9627066E478F371C2DCE6A98E2BA53247DA18A34458686E721D644AC4259450A30C55B6F2C8A5739D8E524CE4426CD644A71B911FFB083FF8E40690E3C759264C5C01FC68B73011913126CB33A575A55A69B69A511CEB2832D64075596391B55C5F5FAF562AEC9A86C52598B1AC3ECFA35CD386718C12C02FF8B67A5F0CC21B8D23F9F1AA11D83500CE840AC27B1F69E0D0C10C6D0EDCDC855CCAD17205AB8482C6CECE8E7513170F0F0F91D74FD3143E98520A1E0EA684DCB97307CD71EDE5E5C8355E0E868352A9F4C1071F88E33C8C72620000200049444154936B369BE0A140A732EE1300214FEC03FC887275008FACF65E9075FD7AE572D9DBABDC91757B85E8D5B9FF8E50226044447A838369EAB8261A3BE1BE46499C46719A24C26472A388142B23A2CF005986E9A95041EBF32B1D763C07CC8C76FC4738F43FC671EA06E013DEBC570F675EC5BDD9DD2A33F12C9B2BADADD8F672BB56AF45714CCCC4AC98B32C1B0E06B3D9ACD3E95CBC78B15EAB11115619C94DA42FA1E043EB2C8E111F72030F247243BB94430AB04B3AF92117511429AD51CE8CA2C8BA150F653D94FE8514870906BE1F73350305912649BBDD06A30472FC28697B28D1DEDEDED5AB57218BE895C12C8C3CCF87A351BD5E3F383898CD66E3C918442993C9643018005E8ABA9E383813426D189930AEF5BD66B8255F926737854D2955AFD74115A11CFDDBC92719FEC88E91899C1F6583194258A846A301F08BD65AC7511A27491C0B933556338333429DA140D57128C4E20620D791F9BFDC027889A763327CACA3079A0CFF47AE3D77F13A7EB0071DDBC2A85682010E3E4C81B635868826E3B1B5F6FCF9F31B1B1BAD66136F89E31839257C5CE426CDE46E9C0C8E7ABD8E6E7A1C7842C832456E5404AC2811E19A5996C549228E931D8608578E1D0D231FB7F8E4C277FFE0A3A012527C77B72709886E9166B389412F408F02F0D36EB7C15405587FABD5BA7FFF7E1CC7F7EEDD7BE28927B6B7B7A7B399B5F6CA952BD65A56458D163458085D5AADD6AD5BB7B4D64B4B4B40FB456E5EB2C77E7BF58C4DE273C42A2881614D5036097377BE5B68413CBC80228EF70D657E9B616B01AD5484E05AA5511C696D4930A74DACB056F451D0CC50088948AFAF2C1F1F85A48895B572D62638553A3FF2386904BC2318AE885FBB533E280CA0E5C80E447104471CAE30945314155050E530422B2B2BB56A15CF120E3D940D6200E58A0F280EE071C2FF4132D44BB97F8ABEB1D83A6C02226C1BA444A26006479815C121416CC7AE18E4FD9F634F2BB00091D6688B819755AFD71F3C7880894638E1C2850BA3D1E8E1C38722321C0EE338AED7EB7B7B7B2B2B2B7BFBFBE478118508CC0E8885E00555AB5540A0B1A37C9B2F2015D00B6196D9B7072DF86CBEAF60EE868501605234679F48A59073FF50D241F55DBB96D7E2998B28A560A944C432A571C2449624D21A3B4C45119D415610FA3FA17445FEEA72461AE7318FB3DE75D65EB40EBEE71FEDC24564211EB09689AC3FC716EC3C4089C6715CAB541BB53A30F110E55EAF67B21C8DBF58B8C411A3C30BC25AE339B17361D16D081716B4D20815D05E8CFDE3AB6CF05CA11D619A3D3CBB5C2E972A657F8E1C4F1F87DF910387988E672A8A67163C23632D4AD1D0AC172E5CD8DFDFFFDEF7BE07D4C6A54B976EDEBCB9B6B6A6B5BE77EFDEDADA1AD2B560F14754839507D8091930ED70CE68B8C18AA1EEE1BB43C374A7BF4FE3B80DFD17F40E8FB516B9577CC1DC4D2760D736B0B00EE40615FB5552AEAF1FE760BF313370ACC86B2962261D298D94B9973439917A098D8FFF6811D1EB9DE56331002B6625F64C5FEAE35A8050F7872F42F5CF1E9A777CEAC4C93562227B640784849238162BF3D97C6D75757D6D6DB5BBAA98FB87873AD2E3F1783C1A77BBDD679E79666969294D9252A9D46C363D5334768BD76D993BA22842BE1F8530EC07F8C10897AD1BF0589851ADD9C503599E1F05098AB16D003A58F07CC2AFE9F5A85F1C392306D04A414142C29ACDE6C1C1C1EEEEEEE1E161144568221B0E872B2B2B688E595B5BCBF3BC56AB359B4D560A835B06834196E7440446DBC96402270DDE207887ACB5E572B9D3E91C1E1EE68EF7CA2BE650ACBDC029D7F01EC771B3D9C47D867BDB7F590A8C61B8E173C7EEE8E524D4CBDEE70467385B51AC54A48B84A1D2C267BAEF2600148757FE889EE0FFB5C7824087BA3FBCB353EF474E1CC5EF8DD1CC9552A9D5689CDFD838BFB1F1C9EBD72F9E3F3F9D4E5113B870E102E821102190ABB241CA91FB07C7A5D7730002003771EFDEBDBDBDBDFDFD7D50E2A0EFD657A6A1F9A03EBDC6F27A114559F0AEF97DCEC78F50F1870271D6E16785A06C8752AEB5163947908D6297C288D56A354C6EF428C0838303F40A1B3774C77B3BC041C1112FF69BD6E836F672ECBF85B70C1C709E8A2389585E5E4650648FF7B29CF570613FAD1B0E14C6E2E4AC8D7263A0BCC9C5E7FAA685B38046E1272E8899BEB0BEC20A63F814B112122B56D8B23D56783A55884FFEFEA4587BADB6F0BFAF70855778847909372FFEA1A2C4CCB3D9ACD56A61EC0FE8575756565A8DC6EEF6CE72BBFDA5975E6AD4EB499496D272292D572AA57ABD562E9740C1E8430EB82EC3E1109D849B9B9B172F5E34C660A618DA65F6F6F68C3170A2D0288327E177429EE7E4C8298C31918E7263BCAD88E3185D88D64D74F49FAEDC3452BF08BEC0C4CC5604932A893929A599C9C7D3E9743ABB77FFFE703088E3F8F0F0105F016867A0339006FDF0C30FD1282322D97CFEE1BD7BEBEBEB4AA9DDBD3D72842E1EEFE98515F2349D4EEFDEBD8BC8CAD1191908A5379ECAB13C68C752D16AB5FAFD3EE8277237081982AB4EB045783981AFE5A5C86705BCC181F42749D2683410930C47A372B95C4A4B8A38C10C632A662F805DD6DAA3948617AD239116C5F418D851FAF896213CDFB8F98D61AAC7EFD48F7BF1D020FA5F4207605843B3D944434CA9545A595979EAA9A756565620A0A00669341ACC3C9F675030954AA5D56AADACACE8A0D37C369BBDF7DE7BAFBEFA2A113D7CF81049778C7FCBB2ECCE9D3BEFBDF7DE9D3B77107CC3231F0E87CC8C62B3761306FC53044C1FCE95CF185A6B01B1B68EF3D43F2D1F36F8CD038BE4B506B29FCC8C2ECD8B172FC281811DA8D56AFBFBFBE8E78CE318E356D1660940385C7350A24F261372CC005E3890B9476ECDA77A6237D3809DCB8AEF88EA216A8BD8276B6B6BBE091306337273D03EEE83C60A6055C5556F3C86C5E7CDC441AD3E8644B125B6FA7CB7CB984243C7FE816B854F78AB8F50D28F38F323DFF591371D3A8BE15BB0C4C0ABCD66B35BB76EBDFBEEBBD3E97432192F2DB59F78E209F08B60165DB95C56AA48CB40706158412EBBB3B3737878381C0EEFDDBBF7D65B6F61D40FEC38900818FBBCBABAAA941A8D46E0CD6466E824DC12EC9D784D23E49B18901281C3ED6912C334C0593E211F6F68CAB26C301864F3ACD7EBC551F4C61B6F20138A4E4E04AF20DE420060ADDDDEDEBE7AF5EA7C3EDFDED949D3B4D168BC77F3BD72B90C1620583F3FBE05D1914FDA202B605D86DA06FD00E15316119C8FEB6F6D6DC14B2422CC0853418DF6D4E77BEAEF174A2588E3D3349DCD6793C9248EE272B98CB9E5541864BFC78E05C1E16286CEC8293DC1E1E11F86FFF1C7FE02675DFCACCF3AF564FFBF7F2F6A2E799EF77ABDADAD2D94B7EEDCB9A314FFF22F7FE5D2A54B780C5AC5B0004A17F4A3FEEDA552AA94F283530F0F0FEFDDBB379FCFDF7AEBADF7DE7BEF0FFFE88FCE6D6CACAFAF6F6C6C944AA58D8D8DB5B5B56EB75BAD56BBDD2E06AFBFF3CE3B880AA00E717B46045AB3A4946503F700EEB557F649303CFDE432FA3DEFB51DB95EF824496C6E4AA5D2C1DE1E92B3186301CD0D5EB77EBF1FC7F16030B0D6D6EB75347056ABD53B77EE5CB870819921FD705DBC7647A9D5FB33E2700470B8918A09752D6A6DE4C614203B0CC669EFFD82C47BE19B9EFA7C4F3E7D1570A250901E48DC54E33CCF2375E426598BC411939FF32B00569AE0E24761F7991B20DC3DE1EB477C073A638784BF090597CED803A71E363827DC0CB9B52C329BCF87E3F197BEF425245BB6B6B62E9E3F77FDFA75F824D6DA5AB55C947B8D58434485879DA60942DE5996A5E5B211D93B38C01CCEB45C9E4EA79B972F4FA7D39BB76E7DF0E187FBFBFBE57219EAB6DBE96030C4A73EF5A9279E78022126C89E90338DA248885058C8B22C4A62285AB8CBCD66D3BBC861C4E65F6BC772171692A047E17F7B0F07F2371A8DC07E8EF4CB743A3D7FFEFCDEDE1EBAD7F33C07C70444F3D6AD5BF0EC31E19488C06655ABD5F01B3C1D60781237501575316C5DE54806CAE5B27F16F033E3383E38382897CB4F3FFDF4871F7E68ADBD73E70EBC38DCC9A3E5878E8B990DE880AC23A2C476AD542A36375996454AA7691A15157482EE3F72F47901C2EC65CC8A7C940558B8A74708E8A972CF0E234527543812328FBEE6A99F72D21440D3E0F1E779FEEEBBEF3EF7DC73D7AE5D43A2C3275E006BC11B4D4E793E83B9B4D61A93F9408D993D34606969099CC640DA7CF18B5F843BD4EFF7FBBDDECECECE1B6FBCF1E69B6F96CBE5E5E5E5279F7CF2C9279FF4CE15C04216D4746EF6284C4DEE8E30F31B9AE9F0471F3289081AF301B0B1D60E0603F473F5FBFDA5A5A5EDED6D20375117432205594E6686DCA05AB7BFBF4F564086C74251D1A7AF352B8E639F686266B04584A91E766DBEB8BEAF9419370BA35C2EA3C28048667F7FDFBA8ABB1F1CFFF822C7C74122C84779DA8BF974E6AB0AA7886828FD8BBABB88A6222578DBE24D1839463D27C7CB34270F3E9EBF9313958E05EFE5F1757F71C28993FD5BA08AEEDDBBF7E0C183E974BABCBCFC4BBFF44B8D46A3D96C79D873EC4634FB94BC15B156E6F3F9743A0EDB88955220EAA12015638CD9DFDFFFF99FFFF9DDDDDD56ABF5FEFBEF67B3D9C1C1C173CF3D77FDFA75E8F2F178BCBDBDBDD65D8D7521F4D0CDB923CD0482DF8FC70A2B4A27E325097A08D1ADA6B5865F512A9550D8020D280A5850EDAD560B692B4CAE464A1E4D0E83C1607979B93C99586B9BCD265AFE016EF5FA68341A45C9D1BC643F7E135917EDB807018746DA142B0CB41CF6409EE7FBFBFBF3F9FCDEBD7B987EA0823EEF473FE59322C18E4A154E26E0405996A948475164236383AE791B9499E1F9D0910C6B629F7804E582A5C78901C23DF0F877EF0F7F735EF4F944AAFBF1AF1C0A3D5EE091C017C794AB7FFA4FFFE9DADA5AAD568BDDB46704B2C824244949C48C46A32C9F31D37C3E9F4C465E99C13921A25AAD06F940D8DAEFF79F79E619C4AF188852AFD75757570783C1D5AB57511F005BCE7838F2B123A1352449101E40680E0F0F913B42277B1C0C665D583728D7C80D0086F39324C96834D20E8F7D7070D06C36EBF53A1121BD038D582E977BBDDE7038BC74E9529665DBDBDB954A6577773737E6DCB973F3F97C79795982ECBBBF8728983A05823A1101AA3972CC9B48EF60DB60320DE4DEF394010BDD6834305418DF3D3E6D4CFC471ED878BE4EEAD1288837B41BF623189474E65C430527FAA4EC457EB98988A5D8462222DAFD86486127605F01F91448247E6F79316608857EE15878D8C76C85B1441442914CE1EB1B8F3CB3C68AC36F1B63228E07A3E1783A99CFE7BFFBBBBFBBB9B9194591568935542A95E238B2D6284522F3C964A25494E7392B8EE38248DD18198FA7A3D1080271EEDC392446D0FE6BAD6DB7DBED761BBE07F6D2F2F272A554428724BB0210DAA61A8D860D18B2D02D309B4CE234455E257643998C3160F487F996A051981DA1BECFCD8347318E634C479DCFE7E5B4D46C366FDEBCF9B33FFBB3A8D381DF01214DB55ADDDDDDCDF31C4CD1B8DACECE4EA7D369351A4AA9BD9DDD6A5AB28DC660341291CCE48D56733A9D62FC113E2B9C0E5F2D57D04D9AA6E96830AC542AD572A55C2AA77172707010EBC8F3D320006066D82B086EE246637CB4C89F101576846850193029B860542E5B6B15150E90B7ABD61A633311A3946215181F51440A05248C9689424F8B98C8B870C1C9ADF22E8783A43CFA8E1F539DFBD31ED32CAA004110AA4CFC1F45D1CECEEEFFF62BBFF2533FF553CA8F4588551CC749126BCD44642517111D45D60DE5CC731B567F3051787F7F1F1DB13EC0D05A2359DE6AB51001974A254514B9E11A5E3BB2C3FA83911C7105E4493B987B4AACB9808846C1109AD0D2CA2360E14E5B81D6E189279E40E2DF9B0BC01050903A383800871CE66294CBE50F3FFCF0D9679F1D8D46EFBEFBEEDADA9A88E4F3B92512A6F170B4B4DCDE9DCD4158FBF0E14378F6E3F17867FFE0C2B9F39FF9CC672A95CAEAEA2A726E6FBCF1C6ABAFBE8A1413339308B9880515E5C3C3436C210AE6F73C4E0CB07060AD10C501D190A6A98AB448418CFEF17D13E488B48839B60144841493100969EBB4F869F26989D87B23670BF0E3DCD9C24E58B8DA5152378811BDD2C5DB41AAFAC20B9FF9CDDFFC4DE458E2384E4BA8430198C0BED4EAF10E0BDA08E04AE498D334EDF7FBB76FDFAE542AE7CE9D5B5959C1A2371A0D149B5AAD56EEF073DA3570E2F034D1ECE09030D3711C15265BAC904D010D2259108885386A61ADE08E33F3EEEEEE6830DCD8D840610BBD011B1B1B68D26F369BEFBCF34EAFD76BB55AA83DCFE7F37EBF8F28E2E0E0007B1586C25A9B96CBDBDBDB699A969254B3D25A4DC79348E9FB1FDEDBD8D8F8955FFECA97BEF4A5A79F7EDAE370E00AFEE22FFE62BFDFFFCBBFFCCB975F7E797777D75A6BE9881617A5BAD8CD4AF23AFBC7F0828808F83C14F260550AE74248441829FF1371941799C2C65A5EC0FE30582142CD8A75B744CA14CBCF44C4648984C8862101153875FFDE473FBC538F47ABFF5042953E6256F4D7C72A408BFFC37FF80F3BCBCB083145244D0AD88F524A1409516EACB1669665683B145670F9F23CB75694D6505D88283A9D4E966577EFDE85A981E643011222584A539FC009BFACB516F134B9084A5CC9194D67D6DA388A92520AEF5F297DEAF752275003582E0C7D21A2E964424437DF7B0F4AF7F6EDDBDD6E77381C6E6F6FBB4A881A0E87402C830D093369F23CAF542A9F79FE33EFBCF72E9095F546033483799681847D6767A7D56A7DF5AB5FFDEDDFFEED9FFFF99F7FF2C927E1F7DFBC79737777B7D1689C3B776E7575B552A9B45BADCB57AEECEFEFF77ABDD9745AA956FCADC200E219C136C22D7C1CC1F0E201FF1E0B088F143E5E9CC4E42490E120B8B7045904524A79678649D111916EF1BB88AC8872C9A6C067B770999844E02C153F868FC4041BEAC790FE8533179666C15B0C45CDFF0F755E2E97BFFAD5AF3EF9E493B12EEAC1AEABC68A985C4459E56FDE8865D28523A7C140AC9452691C9B34355996CFE7A52461E6679E7EFA13D7AEDDBE7D7B36996C3D7820C694CB65343AB103294880108629801F8C2C2ABB94A8C7E1093A3C14FBBE051F002CACC9C99C01CE042B3A943AE81B7CDA1101288266AD35EAD6D65A0CD2841302A047B95CDEDAD9AE56AB002CC45A3FF5D45377EFDE6D773A0FEFDF6FD46AFFC73FFA474F3FFD34F0B0C829FD97FFF25FBEFEF5AF475184FCD2D2D2D26FFDD66F6D6E6E5EBB766D6565E5FCC6C6FFF31FFEC38F7EF4A3D16894CDE63A8EC895057EBC2C903F13E95404D9682A2067C69919D060D4DD2988A344C8FF4F81E4705128385AD54844D816212C2E6404D922B857EEA9B83BB7883EDDEF8D0B881774D8471EFE86167EE33E2538938FFEEACF11D761341E8F7FFAA77FFA0B5FF8421445711423F0AAD7EB8A8ADC7941C8E3BA38983481DED5185F35872E872FAB1C0D32463876BB5D201700948740E7798E322405511A5E44C1F0491FBDC5716C1938E148291527092B2544C6DA581FB50A848F3FFCA6E19F8A2A44BF6FADD55A0313FAF0E1432C0544040021941DD234454B244AD4699A1E1E1E9E3F7F7E369B612846BBDDC6A8BCD96CF6C52F7E1115B4B5B53570B110D16BAFBDF6FAEBAFA769FA1BBFF11BB3D96C6B6BEBC30F3FDCDDDDFDBDDFFBBD4F7CE213BFF66BBFF6F9CF7FBED7EB7DE1C5175F7FFDF52CCBDAED76AFD7132DCC8C428AB8C93ADA75513FFA085703AB57AD565DB1A2683D2D101998A0CACA2B6E0E0E72ED8322126645C532B1655622B6B89030613F591238734793719DB81FD3524CE4EC02A4E8D4D0E6E4A33D79C2C2775E50FC1254EE6C00201517C85EB972E5177EE117A06215316280D168D4A826A458316B1589B366B935AC0AD025312BE548AA85C6D309BCFFD96CB6B4B4048CB18878BA702005E0C5C29DF5777EE43ABA10D0BACE297258BD3889A3441769BBC4755BB0841BDB7BAEE4F0C074C230C20BD25AAFACACC04A80AD0D45D67EBF3F9FCF3B9D4E9EE7981903F21F58834AA5D2EBF580721591EBD7AF3F7CF81024EF8A7865B9B3D46CB52EB5D0029165D9D683877FFEE77F4E449FFAD4A72E5CBA88EC16D24D6FBDF5D6FAFAFA3BEFBCF32FFFE5BFDCDADA7AE185179E7FFEF9E79F7FFE1BDFF8063C4044AE88C7100EC11D7A84309C7AA0920D63424161D8E49917FA5383A5E0D1148530247F164ED3E7963B04FF1E669704135B2DC67633A1C9409C0D380AF8C28A9B140D34274DF9C7F2F97053C77F3CF6290B16C05AFB3BBFF33B172E5C807A4BE204AE48AD56D34A8849448C35856E50AC94CAE639339388523AD21101BE2F349DCD6067C9E16DFC7EC383C743C5368088935B90F080BD46BC0BBC4AE1C596622212261D15DD33B9B57192B05D7C24386C40884481AF4544FD7E5F44C4CAD6D6D668383C77EEDCFBEFBF1FC7F1CECE8E2F5DC31242047D37C2BD7BF79E79E6996BD7AEB5DBED0B172E28A53A9D8ED6FACAE66522BA7CF9F2C58B173B9D0E8CD8C1C1C1D7BEF6B57ABDFEF4D34FAFAFAFB797DBD56A75797979797919B3281129EDEDEDBDF3CE3B9FFEF4A7BBDD6EA55CFEDA7FFDAFC87A591180435152C49D6767CCF75D5881F04700BC0BE083436130738E06173C023E9A10A3034265883E2B1211122E26E2C114381F469FEFAE40509CC0123189629FEE544EA4F16146118990889282C387890A02FEE038A9DA712098163ABB7387444810AB50D00B85EF065CB1476E7DE52B5FB971E3A924496AB54614C5C4AA542E2569A26316A548698B7B2BEE9FC5DA3856449699492837799EE5D9DCCCB39C9564594654CC7037AED75105D3C4D8A55CB51B8C1ED6680A6302E615D0F529B6622D9B28899224B1242A8AE2522A91D269524A5356ACEC9101A14075C1DC03B717B9712140168127BD949646A31189C0437BE59557C026BDBDBD0DFE5340417BBD1EF2AD711CFFF22FFFF2673FFB59D4E0DAEDF66432B971E346BBDDBE7CE5F2B9F3E7D6D6D76BF55A9CC43AD2B73FFCE02FFFDFBFAAB71A17362F569A9572ADDCA856F1D54A69A5542A379BADA576AB5EAFE579BEBDBD3D9D4EFFCEDFF93BD56AF5B5575FDDDEDAAA562AA418B022E0FF505244DF36DC213C41E3D8843CCEC2BA3903887A9BCDA6E7E5B501EB16F408C2DF0205E4CC2FA0E5CCAC75C4AC449458A87F2CB208F9490512D169162494FB23993EF2C519A27C144B2F78EDC105CFCAFA7EDC8A084401CEB7B576777717AE3F06C0C0BF4C92446B956599900A5393A19B2E025420B312E6882D9E413299CE17CEE71355C3B38E7093177927F77BADB58AD80F1920A088D5D1EC51D090C98923B42A1CC08F9166151124F8D7D7D72793C96432B978F16214453B3B3BBD5EAFDBEDA2DC4B0E49BFB6B676FDFAF5975E7A496B7DFEFC79B870E00305438C278040C4FCE0C1838D8D8DE5E565403B45649ACD93A4A4E3382EA594659AA4D668ACD1C613D7AFEFEEEF7FE7E5977FED377EA3B9B4F4C2E73EF7BD575F4D4AA552A5ECCBCCD00E488C468EF3C21EEF0C0EDD3F6FEE1EB1FECE1E1EF1A7F389CA89B82CDC23AE138572AC888C1552A47C0CCC442E2344CEEB3124A06A1387382D74361D3BEDD1C7A9D503DCEBA95E13337B2AD6C964B2BABAFAB9CF7D2E49927ABD96E7C54C1E71C57C04081214CBF844A3B4524A8449178D20342DF4903F9F5CFCE4EF2A74F7CF72ED0A134C47D326A3447BC0304A4E05982C371C8005C30F253723C77F5CF8142B958A52AADF3BACD56A870707070707F80A49929C3B770E495211D9DADAC298E47ABDFEE28B2FFEC44FFCC4C58B17F7F7F7C1289165D9D2D212C2096C15E326C50F0683EBD7AF835B773C1ECFB319D081C43A33796C8D3019B1AC55AD5EBFF2C4D5C168F8707BEBFBAFBDFA733FF773EDCEF22CCF49B16F8624875445450CC9039F11F28FC6C742D8E41860AE1D2FA25F22FFDA6D0F6137294CB9050CCF3C29FA0BBF89E444A58B85848FF23C85E227222283CF93620FB09C22C722C736C359BB61E18DC56DF129E7E34FF0685159AC542A5FFEF2979F7CF2496897382E6A4F70B8AD35719C88CBBB894B424BD182E88A19BED227D6DA23C8AA9C4631B9B033FD7E38B66EC11355AAC0932549A263E74461EA9B568CEE556B433205769867DFE1EAA15D08F743AFB25C2E0FFB8352A974F7CE1D103C622F359B4DA06245049416F3F9FC539FFAD44FFCC44F60AA7BA552F1A4604A290F7EF607C08217362F369696E693C9C1C1C1F6EE569224D3F9CC0A9352C43A491263ED2C9B1349BBB37CFEE28552A5BC77B03FCFB395D56E5A4A66D9BCC429725060F3053604B367C85980F08B8B6B8A6766CCEA03DD98E77E5D380275847979EC210B0BD2EFD74D4EF3D22322B2448A88852C8972D91D75C2ABF176C032696F1F307B9449C9E9AED4E31C67BD31FCBD75EDCF799E7FF6B39FBD71E3867504214404AC3F15D8B8D8D80C1345956B940E3A3C8A813F62C08465AC3D6222A0E3F6F7A4889F54FCE16F0273CC00AE4551D1AD1139964FAD758EA19F4A19634A516A8396483A32EE45398C5D401CAE005EF861750F1F3E8CA2687979F9F6EDDB22024200E076AE5CB9F2533FF553E80B459A4BB9CE92108A0717087A04488A51BF8F781AD4B9C65AE3A8D2111DE18B03F6B3B4B4747070707070B0B4B474F1E245005199198E2BBA2094529FFCE427BFF39DEF3C427D18C756CD6E3AD8C20A2F9CAF16603BC1531397C078B45C1D43837A8DCE728A4FAF842C9388E8A2255D1415FE8FA2C775971FFF08B72FECBB526A3299B4DBED175E78018EA931264962B0D87AD82091A02D83039A2D6F0180D932C6982C2722A332221239D6B410166EFC0D84DAE5112E5021BE2EC1AAB5C6F329823CA5ACB5C61AADB5229ECFE7860DB4BEF7D9F02D0037F05D5AC6CD45861F08D98503638CE9F7FBD7AE5DB3D6A21F928846A3D1F9F3E7BBDDEEA54B97D0060DA1447316D43FF42B2691693748334D53200EF0B968044B9224B726891344207E41446CA9146F6E6E62B63106D2ACADADBDFDF6DB955219D4D3C81A0F0603204A7C1B3E1FAF75604B68C7D3AADD6CD6B3EA068576A0A30744CE9BA2E3BEABFFF1D4EB44E1158988851417D21F7A29F04D54511C130CF283A75BBCF898F27FE4621DF7C1CEBA8C47D53FF5D4539D4E0786522955AD5641F42B2E311AC705D63277C37C2860D93E7A7EC5AC35C1BF70D51672FCA1FF4DC757F3E43680B76383B0B6C89E19A3226DAD45C985DC96F09C5CCA41FFC1F31EB224D8E333B3E09AA3B40CC9B6D6A2E0BAB4B40490A952EAEAD5AB9FFFFCE72347698A041A9405E4125AC37F23686BA75652EC3178FFB3D92C89E2486945ECA7888BB1C6E48A78ADBBDAEDAC8C2BD5344EC4D8C3835E1444F998AB07FF165DF40000200049444154C3D5EFF7C33637D81372D24C44183DE88BD991E3B80F17DF8B8D38FC4FF89A025F74E1C19D7A9C0E3954DEF5671211E5FCF3A27AE3EF460A39C68B53FF9D75147FB5F298E7C33DD55A7FEE739F5B5B5B430B2CE22487368B3DDFBF75875700CAD161CBB1C3847AE2E8DE4E7375E8F16A1ABEFE15DE000EEBC8C4B193B1A5C9A11D3D1D15FC25201D00A70B8F72B98C79C659961D1E1E6E6D6DF57A3D20DEA228DAD8D8C8F37C7575F5C68D1B48D8239383F40B6E26728C40C8CAC3BA1A6300CC1E0C067FF0077FD0EBF580AC4636364D5388BEC97293E536379A156659A3AD2C89E2B5EE2AE8ECC94A392D798FCE4735F83AB91BE0A98E138461294067846CAF57618F58F9D03E3F8EB89F3C2243191119B26E2F281245C4462C4BF0014C968FC0702E95C81AE9FAD3F2FA383363F19B04300A4B02572A3CD9675DB51141C76E608284298992C964F2F9CF7F1E1550807B279349524AEAD55A964D1533315BCB93D994268A54C18687A2669EE7208AD24898962BD37C30999BF12CCF0D5B8E45DB3CCB8848116398451CC726E87CE0801001DE42F0148599B4C6C08E7151408814B3B02E86386552C0D689C8663913E92862E619CD59B131669ECFADB57026ADB531539C90B1F33C87076450C7D9DDDD25A2388EC7A3F164324177CEE6E62638DE3069BDDD6E2F2F2F53304604E255A994E7263364932461515996C5A56496CFD15E9CA6E941BF379D8D5FF91F2FFFD95F7CFD1FFFE3FFF327FFEE4B6B2B5D11E9F7FB71A94644492915B64929CEC7D9CC64B9B583D1B0D16A4E66D38DF3E7E67936180DDFBDF9DEEAEA6A3E9DC399812521A2344D3FF8E083C8318841B5E3475824804DB0E53CC27C3E9F899007BC29454A312B2B9259A32C119162514494192163A2E35CA22703E285BD746647181F0F6A0D8908592EF2FAECA59609837D169C04FF9114DEC18954E9D175DC87D2692502110100EB8B5FFC229021D097D56A352E692193A491183BCBE6C3E17096CD551465A6A07A1617D48E46839D9DAD66B3B9BCBC5C6E2D11D9E1A83F9FCF35AB2C9F5110C25251142FEA83E16DF87A8D3A91753E79CF300278D2C245665344582BBF2DC9554995521E722222599EC32BF64FCE98DC2F2F0C1AD297E8BD42A0391E8F575757991915280C2F43DD10BBD588C042962AA92665C5546AE5E97C92CFB2D16498E779B55CB97AF5EAB7BFFDED7FF5AFFED5BB6FBDFDEBBFFEEB172F5E6C369BB92DA64B7906622242ED053DC770DBDE7FFF7D146A8808B8A3959595FDFD7D68F405EC3707ACD1DA31C8FBD5931390F5E3EFD5472F175D93A347B0F0E2E4A1D7973BC412F8DE456D5710E34A81862066C3244C9A0ADDAF1075B8FF4F9A80E2CB70515466940BA8B8A009EFDA851FE1618370808986C3E173CF3DF7C20B2F2085073B1EC77152D28AA95C2ECD675363736B4D9667E3E93827CB9A95ABC82AAD58B1253B1A0E486CB95C8A93A877B03F383CCCF32CCBE68A232C3979BB4764C1F3131CEAB4E9F680DDFA10BC88F08AE45CF18CE74EFA8D31B9C97347B4E6FD7B5BCCA59622D962703E596B4D415E5A3094807373D0EF33F370300024E1F6EDDB40C501B0309D4EAF5DBBD66AB5BC0580A225176B8AB27112E948199BE7269B673321AB2345969E7DF659ADE39B376FDE7CF7BDEF7CE73B51143373A95CCEF3DC1AAB234DC8AAE5B962853EF7FBF7EF0387FBCD6F7E1336AAF838673931612D8AA25EAFB7A86844ACB5A55209155FFFAE408D16DE377EE7FE2FBE0A963FF8CBA2C43FDA2FF21640B974A8DB19AC10E3A2848CD103C2E824763ADB0A3183AEF6641DAEF8F22E0A840528342B919018771D265A70934E1E59965DBA7409390A84744AA9E974BAD4A97B0AE8C96C8A08B25C2E731C218381C70FBC803126D17A381CEEEEEEAE765610DEC109B66C17560D1640474746D227CBBDA20A1E65F1A3D7045EB7E119A38309C2A7442C15151FA44A44C4E6474EB318A38A783437C65883741EECD8A8542A1D1E1EA215065CBF4AA9D5D5D53B77EEA05BAD56AB89083A78101C7B49C2FDC7713C9CF67DD210AE36F6B064FC894F3C99E7368AA26F7EE3CF89F85BDFFA569224A4141087499EA0CD0D2C0F70664AA5D2F9F3E76FDDBA75FBF66DEB683A6194302240444056172C14853A1E3E8F4F515090793BE37019D2231E6748EAD1E4217A8C9D101111892276D22FAA7884CA591611C5AC480A53808784C43FBB75153A8B4D5AA4D0FBFEF3F1B5D4F1737011A1A31ADCC2ED621AFBC2EAE0F9017C0F4FA352A90C4643638C1843226992542A15229ACA5409E9B48479E2A3D1685CA926510CDB2DC61AA0904EE4F503E97954107CF24FDE05C27DEA38CAE67311D1189A941B11B1182263AC8F1423A5E04D7290C470B7C1087E10B0A206B2B6B666AD8567B2B4B4341E8F313F666D6D0DEDF03E67CFCC4AB1B768A893003E9D65D9FEFE3E06BFA6B5B2D6FAD9679F5D5F5F2FC5E90F7FF8C3070F1EBCF9E69BCDA525B0E4A2AD195E3B52F5D893E3F1F8E1C3877FFBDDEFADAD7691862222E45E3D88ED541164371BC6E74643F57FE69283EE4A883C015650970DA57FE1D92D6C8CC88BA57F6E4444A4ACF649CFE03E1C3739BB3D60498AC6F9471A1A11BF599C8AF4FE1991F8EDE436034E0B53A5706731A1DA0604350F1F6E574A65A59418EB3A19541CC5599695D21434E8D6DA48C568F36566A5C9E6799EDB72B9AA542426CFC8289B29E6C222B902A33ACEC7E80BB4ECB8711EF1958FBEB84B6516BFB276EE5AA574AEC302FE11EF38B335B9B71852588322B58592565CA98205A35AAD1E1E1E5A6B5757577BBD5EB95CAE542A172E5C00C77F71E5E250C69109B0A84829B29C44E9DECEFEC3075B1B6BE7963B9DE978361A8D1A8DC6F973177EF6677FB6D3E9DCBD7B773C1EEFEDEC809B1C2C0FA5C9149402E8370007C79B6FBED95DE96047A10EA81C7368B80716D60D8104D43F2FCC860A25F3C4C2FAD7F648C403313B7EDA59C6243A1D7E4064000F104189D7B2DB6E5AE13389C8901017CDC167363A283EEA5C0E443C04DB192A0A51E262665544C347E585F1788C6970A84D6AC790F1E1DDFB9DF672A9549A4E26F32C534A19B1B9CDAAA572AD5AABD7EA28FDD8CC1A65B22C13C54AC81ACA335BAE56C832B336468CCD22AD99157B7753B184FECD47A5414FFE75C1D9456DCE1823C1CC3CA4AA8A938F577044C45A09DDAA62B98C69341AFDDE619224955209BFACD7EBB009D6DA6EB75BAFD791FAB40E400F450B73AC948A7579329934EBADD96CF6DF5FFE9B4EA713EB842CCFE7F3C16060725BAD562F5CB860ADAD551BAFBEFAEACECE0E266983837A329964B3396E0B7474A3D1E88D37DEC0881772BCD3E820534A01D39F2409E82DBC386287A0907FC2B10C5229270E6B03BD2EE43B2BD47123F091875E5B5EC6873A7D5B04C133C9AD0889583408D8223CA4A89829E95B558AD76671D64BE1A260062522017691009312F2BF113E16835320FAFEC94F26934EA703628C288A9ACD261CD052B93C1E8DC7E3B11811A28383DE70341A8EC75A78D01F4CC613C5AA56AD552B55AD3409E5629978369BB3501C27BB3BBB5A47D6582B9681D50936003BA8AD1720E5B8DCFCE173383E082E820414835D99227344E1F3F99C5C68E119EE898E48068AAC4831AF12892C3CD122A084BFC744E5729944500F66664405CBCBCBED761BC554A4F07DFB8EB8763F668E588302F93FFFA7FFFCED6F7DBB9C96DAADA54AA98C2A75122744848994A3E178341ACD6653A41FCA6E9CF87038042C19927DEBD6AD6F7EF39BF0F8515AF6B53CB837C698909C8F9C79043C5B070DD6A1819533826018D4E25245CE820859EC13C749B373B401D6DBCBD6D83849E6F39C7594898D4BE9249B29501B28C55A65620D096B6D492262B2425642756545248D88592BA5848B7892599874D1ABC0422EE21162A158474214E9A8988CCB8CC290E70867A5AC31912ECA96A0EA6EB7DB1E5F8E5EBBF1684C44B3D9ECE6FB37BFFEF5AFFFF55FFFF59B3FFAD11BAFFF8088009E1B0E87088BF33C9F4EA74AC81A6B8D85F61D8E46E3C998959A8EA7918EA23826A5F23C4F3158DB49BCFF3F5C47A42C44C4BBA1C698482BC286518A14139191DC8A61563E2636C6983C37798EF80AFA05955AF815BE8426180D550405CCCC3617C5DAE43992AA891B5A6AADC528A424493001C0169CE68A4892249ACF33AD75294D0F7BBD248E6118EFDCB9F3ED6F7F1B560264BA572F5F69B79606FD3E66502749522E97C693D1E1E1619AA6AD56AB5EABADADAE8E86C3F96CA6951A4FA708005E79E5956F7CE31B88B8E00E206866578C07B803AFE117C1F9A956AB00F37985723C5BCA4EEE0BEF4044AC3D0E550CFE5912528CC646630BFC9A71DC923E243BDA00DD560BE0BE3CCFD3522A4450242CA2881511465593151649E3F87858564C9E41CF2B59216B1571A4B5EF792529FA9AC32FC6CCD65862C2936622B4278ACB9CC451C4CCA52425299A03BD31F5F96FAF5446A3D12BAFBCF26FFFEDBFFDEE77BFFBEEFBB7EE7FF8E183070F7EF0831F3C78F06069690930156646CEC7F7868B08B86B402CAE98FD142371739543DDEF7FF41E85E70282C6D285AD387A92682B958089205CFDE28DC28A184571D4C515B122C6E61111B48C7997C01A838FB0D66AAD23ADA7D329065280C074696909D474701193248E8BC9998A99E1C1E7795EADD69452AFBCF2CA934F3E8931DAB3D90C2C5AB55AAD5EAF830E1E8B0C50A731E6F2E5CB088201EA64661DC778E3B7BEF5ADEDED6D3EDEDA82D23B9A95010AD2C1E85F5806F42B2FA4FCCF52D8A19B74EA09FE4F48079D6C545C38F4B99595DCCF35C9B3088396DCD3C549A19597E0EB9148E44054511C0320CD5244155604916DE4182445C4E311941B1F0D950FB7091F1A034E03EE123F1693082380D012757878B8B7B7D7EBF50E0E0EDE7CF3CDEF7FFFFB57AF5EBD7CF972BD5A855F311C0EDF7DFFD6EDF7DF5F5F5F5F5D5D459D1F00184FD7232283C1C0AD9780B60482163952DB7059173C1F2FF4CC45940917A8583166A6A29D948414AB62909BA07BA270B7D4F1DA0205D3D3C40AD923DA0DDC82B14669C5EE7EAC48369F675976FEFC7972732E204CAE372AB7D66699D15A832565369B371A4D66DEDFDF47FA78757575757515148B6FBEF9E66C3643CF00543BA63061D1D6D6D65088ECF57AA8C6CCB2AC5C2E7FEF7BDFFB8BBFF80B4F4B01F901AB9C3106282384EF9E4D038D0A5E77D8E39C11FEF582F772D6EB9307B84CD4F101848BE788E8D5A525ADB538379D958210CFC90AB38A22D62AB756988439B7165E01CC0DCC12D4366265C98C582966FA322BAD142B0F8911C7E1833D03E8B9568A9823ADC55A1D17F8786696DCE0B92BA51051C16E62E4D67038C4205BA5D4850B175E7CF1C5E79F7FFEEAD5AB376EDC68341ADD6EB75C2E0F077D667EFBEDB731D98599A1D5BCB201BA06F96C92A30DA09DB1D2A7B118B08B5975408915D47D9CB656CCAC4958844958E963AA28D8492EF0C63B156373903D22F0709F48C891228EC248F43CCF59A96AADD1A8D77065002A21FDCCAC9406144D44A6D329B39A4C26E5727930183C78F0A05C2EAFADAD2D2F2F235400F1E383070FB22C4BD31491B4D61AE85A503B62FA3CFCA53CCF2BB55AAFD7FBE33FFEE3FFF93FFFE76C366B341AA834D7EB750F07F21E083011686A05DB0011B92E0E7BAA88872BF638DBC0CB3AAA8ADE0284A71D7781DA2D2EC62AA13C25491C67F33931B390180B7F1D2E7CA4B528B6C8072966AD08F57B663BCBE0202B5650AE599E892D1057DAF5897B17027A1D5A79369DE526574A65B379392D89B126CB018A121293E71ECB2922B3D9ACD7EBF57A3DF03755ABD55AAD76E9D2A54EA7D3E974BADDEECACACAE6E626783E66B3D96030B877EF1E02357628515F826566587F11932431203D4E2B531C47D61E13D9D023F2428FC0D7696E572F635DF843A448482B2E9C2122AC12132B5672C2B6140F8C0A1BEB7F4344AC3DFD93821D502A4A92B452A9983CF37D33DE3B451B8A57375114C3ADDFDEDE46EBF0952B57001C82DA6E341A4AA9F97C7EE7CE1D10AE4CA753B486E5D6EA2822E6B5F5F5ED9D9D2CCF9334B522511CFFE8473FFAA33FFAA3838303F010A3250D53A710F546C188037046A0DF45BBC11F80579C25D31F29F70BE717DBC6E10FE8912E5041F561DDFC337154D4316B661E8D46489F63326BB3D964E65AAD9614939341A51659B192286BED783A81CBC8AEBEC88ECC0C10731465E7F3CCBAE2F3FA6AF7C2850BCD66733E9FBFF9E69BD96CDE6C36E7B9998CC65A6B9317FE0F56CAE795C14E9CE7F9F7BEF7BD5BB76EBDFCF2CB376EDCB874E992D6BA5C2EAFAEAED66AB57FF00FFE81526A6767A7DFEFDFB973E7E6CD9BF7EFDFDFD8D8408914B54CEF8F5A77FDC2F708249E0219F5CB6D8E0D3D3FFAAB3ECA1A158ABDD0EE21B22338546E9C356522B6C24A383722A494702ED61B1951969552A45DD42B5112A71C898831524A12045A3E5505877B3E9F61E9F2DC28A545E4DEBD7B3FF8C10F6AB5DA0B2FBC805137CC5CAFD70783813106E8D19D9D9DFDFDFDC3C343001C4094045716FA0202B3B2B272E7EE077FF2277FB2B3B3834C8E9F19DEEBF57CBA0C253394E4108361EC2C40AC2A180D4F4E5ECFF258CEDA1BA79EFC8837FABF465012986C23D64651041379B8DFBB7AF5EA333FFD33E8A6B3D66E6F6F1F1C1CBCF1831FEEEDEDDDBA756BFBE17DD42311C18C66D34EA7B3D46C952AE56AB50A7BDA6AB5D08057AFD791BC67E652A904FF0F6E2534107A46DF7AEBAD3FFBB33FFBABBFFAAB76BB7D0495E1A256422E6F88200F9B61369B7DF0C107CD6673381CF67ABD4B972E6D6E6EA2A3149A1E7C7AE00E2122A83430E760CFFB4CBC71D4889821E325CFAF9DDF00EC9C759705629F23525A14630FE84201891211963CD44A7E165BEE3C547FC0C981F37A94D52653540AB5B0283256B934AB18CAF339BC4476C11B966E3A9D5A6B66B399B5451B57BFDFFFEFAFFC8FBDBDBDCF7FE173A0504FD3342E9795B5C0E73173A7D341D20C8D074AA9D16804571DCC42D6DA72B95CABD5A228FAFEF7BFFFA77FFAA7A00DF6B00B7274D648A890433B636F00C48E5C9F07EAF9A7F06308FD233C9C8FFC31C24DC00095D25429757878D86EB7FFF7FFFB773637376FDCB8818C3B7CC4C3C3C35FFB7B5F052A10DC1B5B5B5B98CDB6B2DC41779C8A8AB81EEB05B08D755D299E0C038A01A316C6E33133B71ACDCF7EE6859595954EA7F3A77FFAA7581AAD353AACC98A6FC3F38A197A0523DDB18DF159E83281E384C0AB542ADDB871636565653A9DE23A3074919B2CCF41B41454165D2757F01A8BE8752D5C47EF0229254C3EAE557066C4C5B0271F405EF00988666226CB64980C174DAAC5BB164A9BEEF644D818C3A2E23836D9244D533C47AF719324994CC64A29A4F04BA5D2EBAFBFFEFAEBAF3FF1C413E0BD433495BAE1094052E5798EB29A520AF86AAD356B5DABD5D6D6D676767698197AEDB5D75EFBF7FFFEDF63D400867478CF3672F36060B139603AC29385F2D20E4FBA20C78FF3FA23F789C831C6DC938B4F449164792E79946823767BFFA0566B7CF5EFFDBD5FFDCAAFA6E5D2134F3C0119C28CC4F97C8E4569B55AAD56CB5ABBB9B9899D8DAF8D8E07720957882908BD7CFACFBF80299C4C261044638C4E7436CF9697977FE1177EE1873FFCE1DFFEEDDF82C1AF52A9B090D24592148ACA5A0B081010E79FFAD4A73637375F7FFD758C8A0031779224E0F59FCFE7DD6E17C201560231B69A966C6EEC74961A89A2641E296BADE4999983C798444C9EDB342D59C79FCECC9075AD35E84C88482956EA28B68940735264AC2DD8FB98886C426C892CB31532D844D6521A6BC148665BCCB555A263A5ACA1284E89F1D9A263547CADB5A43573044C01B0B6C65A6B6726CFFDB664A5D23CCF2793311147518C42CAC1C1C177BFFBDD73E7D79FFBF433889DF23CC7CC9BE17028E8DE9ACDF70F0E50B83D3838A856AB9931ED76BBD16AA669BAB3B73B994D2BB56AA5561D4DC67FF197DF7CE38D373A9D0EE40FF6D9779F21E9D7EBF5000D82D68052436A082815784DA76A073A7BC2F6C9DF1702ED86BD3A477131F1BF78BE4E623337CCFCFECD0F7EFDD77FF52B5FF9D5E556673E9F830A8F5C84E0AFE25F7BAD895B479E3172D849BFE36101E95836A3F0958D3BA07844A45EAFD76AB5E5E5E57FF6CFFED9D7BEF6B57FFDAFFFF5952B577C12CD47145066C6F1D0B75AADB5B5B54EA7B3B2B2022B8478C35A3B180C309DC57B17AE18E73ADE50B21525463CD4C7BA91580BABCCA72055C83BF7851F85D1524798509FDD637705E282AA1B6728778582B1CB79329A0ACF4784AC140812413A3F74C3FCB3F08E1CB97EB43CCFAD1578F0D6DA9595959FF9999F99CFE730086848805F246EDA57AFD783F568B7DB1B1B1BE572394A126430E7F3F9DEDE1E33379B4D6BED2BAFBCF2877FF887AD56CB5B75AC2D1247B003A8528BEBEE85B7ECF1795E513EBE67FF91C72364FDD42332C690E2DC9ADFFFFDDF7BE9A597EEDD7B1045D1B5ABD7EACD8667A4F0F3B34404F5570A62443812D6B19240A6753012F4D40FC6DB51BBC18AC0514161EBA9A79EFAF4A73FFD5BBFF55BFFFC9FFFF3D75F7F5DB9B95448C6F9D432C20024AD4504CD81E572D91B5FE8212C37B27885C3E3F16D58353EBAA570A332332646129130A3B2222AA033646166297E69D5D18EF161833F3328F414425FE4E888A8E8420D140AFAF485195962228BD21832BFCEF53ADA0091239CC201E9CFB2CC188B1A22A2B5EBD7AFF7FBFDC16030180CDE7BEF3D1F2E7BB949D3B454295F79E22AE2D459966559369D4E0FEEF7F6F7F74BA552A7D321A23B77EEFCC11FFC8188205917397E17D8670469DE1F43808436263CC1D80D93F5C2F07105F71147E86EF81CC5592747E3C9646BF7E13FF9BFFEC9175EFABBB7EF7E502D55CF9F3F1FA709D4B976B4D4587420A5AC63EFF0B60621AFDFFA7E1E0ED6824EDB97DE5C880842707273395BAD166A5E4F3CF1C4BFF817FFE2EFFFFDBF0F2B89C3A759B0B8499280B97F341A018955AD56C1909EB851D81478ED857C5BF12CA8B9B564737F595FD20ACF3F52B12ECDCF41DF3C01F6C18A88A448540A9142CF90FFC64E7120A5EB1704A25F3C397C880829D8D2903D57885C615EB183B5E1058B4E53FFA4B050BEE710042A7038411C840A3AF41A24D25A8BCC58ABD542E03B1E8F0F0783F97C0EF2151569225A5F5F4FD3F4E6CD9BFFEEDFFDBBB7DF7E7B7D7D1DB1F242AE0C890A70D7411BD66AB576BB7DFFFE7D181FEF20F8F37F1C493FEDF02A801E6F474571A574E1D2A5175F7C716B7B1B64AED0C73E2B8AF380E2188FC7288FA37FC7DF3A221EC834C4DA7F3D0C65E013980224E9F03A7243443C81309C9CE170B8B9B9F9FBBFFFFBBFFBBBBF8BD9753E0CF02ECACACACA273FF9C98D8D8D975F7EF9C2850BAD566B341AD56A35AF23FDF5E7F339A279126B594431190075722BD60FAA58384831A1334E39304A084CC18F4A08C81FE6803EDE58D6EA48C9111FF5C6799D2721D233D86CC445E10C671ABFE1426F8782C4549C1CE954EFFB22230AC5747070802A6CBD5EEFF57AE0DCD45AB7DB6DAC1576FE68342AC6C9383145B85CADD76042DF7CF3CD7FF36FFECD7FFAE33F595DE9600BF9767B3C1AD45BFC2604D213A9730898FFEB5186F7E3E4371F7D9CF4F89D453D7D3F44FD7EFFD94F3F53ADD5BEFBDDEF6E6C6C7457D6BC2E84FAC46AA2A8046F12E5404C48F68DADC8C3E07C6FE0602225E88EC5461211445D5E4B215F892A665885DDDFDF7FF2C927AF5DBB76F7EE5D141FA0D799B9542A6D6F6F2F2F2F5FB972657F7F7F3299ACACACC01CE134E3669D7BF75444488ECAD2962D3B6996330E8FD75F708D8E1E185B4867A8CCC4ED0139A2A587CF83BC90C6E0F2F0A13033AC017E34921351D1710A0D82CD901B25A02123A2E2850831E8801524E0FFA3ED5D7FE4BAAE7BC1B5F73EE7D4B3EBD1EF171F2D911425520FD31E29890DDB578E1D7F48902080E70283C09FF231C00498EFF9036606980C907C19DC9B0448600442E024CA8C9DCC956459B94E6459B4F52029B644B29B6477B39F55DDF5AE3A67EF3D1F7E67AFDE5DD5DDA214CD81405577579D3A679FB5D65E8FDFFA2D6D4C42948634186289F2EDEDDBB751C185B147F6991D185457ACB5320840F24C44B14E3857B6BCBCFCE31FFFF88D37DE38B3300F3F13D7C6DB2C7660292503B7305A1C4FAD542AE1FC893728E90B947EF214809D9FD39DAB4028591EAFAE3CB8BFB5BB33353535180C8228DDB6988FB6D3E970250BE0D543D66FF437B954266497138BFCF55C9DF12F945FA0B0B5B7B7675D7B283619D4D4ACB5F3F3F377EEDC812E010947CEB9FCB55FFBB57C3E7FE7CE1D3486A35BC03AEA25ECB6891BAC809B3A72014A0A528191E6285B258BB8752DD1160805040CE08E2748BF2029480A2B0C90AF44049E0249E8B091C29221170B59D77987CFDA142E8E1F591A143707A214AD8DF61E241EB3FF74618C9552604CB1AE1E1C451106571251A9546AB55A1B1B1BDBDBDB402BCCCCCCB4DB6DA01220E5D58909634C2593E9F7FB9D4E47062A1B6673B95CAFD7DBDEDEFEABBFFAAB575F7DF5ECD9B368BAC757C3BE288772C32680010B4888232AC3156AD7D7C31616977D623FC9673C7CB97A9CF7076126836809A0488489B94C0E130D5010811708B351AD56810C8139C759A443CB91E3800FDD3050A65E921EE40BC646B903A1157ABD71068C71E664C2D7BEF6B5575F7D5508313939D96AB5F2F97CABD56AB7DBDFFBDEF7CE9F3F7F7070D0EBF5E6E6E6CAE5724AC7A9D23130388375D5802449C80D0017E20829A748D2E217EB2AFE4A876EC9B0D73164BAF01A1EA0244544C292B424841296FAB126328E2D5B1269D7897AE4E013267A902E2D1DD97FB447FACB3A60AD057A473A762D7C842D08AC0996E2CA952B972E5D5A5E5E06A7D0C4C4C4CCCCCCC2C24210047057D28522CA66B32485526A7B7B7B7575F5AFFFFAAF7FF18B5F5CBC78717B7B9B9F9D70E370A000889885838266B35988102E4639FE32DE84B5A3AEF9A2140087F5D8D64E7781D4EC44258EE3E7AE3EB7B1BE313D3D33313E51C8E7642074ACA328D23AA9D7EBCD66134D6E0865A0BB48FA4A37150B4E360A64D0167CA59F06556ED4B870091CDE7CC9E90F4A24D96C165E16CCC90B2FBCF0FDEF7FBFDBEDBEF9E69B00B26BAD9F7CF2C9EF7CE73B8D4603F35116161630D2073046CE6F901356171D5A12422A25485A43644858218522124A0561186532D92008A504222EB0A9C517C0F028E4FC85B4568B14B72600ECC166110825AC206BA549BD1340BC035242481264A4B5D25891029D8524222304E08887A51243964830951049A184F434561009383F2E592DBBDD1E9100D1E880A75366B2803D49A58CB5996CD6585B1D1F2F8F57E716E6A594FB66AC6C000020004944415441188651D4EE7434C8B9B406853F02DF7ABDFEE0C183E5E5E5FFFD7FFDDF565756C328D4D64499C8581B388016EBA470A360F1ACF3F93CE3AF1839C26825FCC8F950DFC36421A693F3FD27794DA9FF63C9F2F02E4BD61C7623F20AE3C1A46018AC17BC0B64D0409C14C7F160D0E7820092427CAD4832E2F63835C41127C268A6A17485A4E17BF0FFF5B37BF81638F42040FEA33FFAA37ABDFEEAABAF420973B95CAD56AB542A70469BCD263A53E1FD83F7989321E408C7F15A6B1D48154591D51A5B16165AB9DE1772BB81390EC343CE4519DDD9F8CD296F0071378000B24D9CBA3B1F3E2130AE72A313DAAF0F8D99F04C29880D07BCF2D6DA288A6089E18B732C87D5407751B95CCE6773DBDBDBD6DA42A110784CB488FADADDCEBD7BF7DE7AEBAD7FFEE77F9684F8DEF6E2819452042ACC44711C27B1C728E1B13CA0875BB8A0481EA5FB1D12E24F5D9093C4FDF44F0DBD1EFD1621C4A102484745ADB5EEF57A810851A5EBF57AB19BFBC93125B41660714839222D38D9004BE1B45B5B5B994CA6502864BCB9A2E481C6E828BA86B9A2B463111442C0E4170A853FFCC33F7CFBEDB701A2DADCDC5C5F5F9F9E9EB60E22DAEBF5409253A9549070C02D706D08DF8574A115466B2D9DB2A162E5CBF19044F39F9CC41F01F0F07B995D985C4A347D4D6E9330878FC188944C804337F26D181D7AF9D6FDC949D5A10DC336835582D7973836B96C36BBB7B7876434506E420824FAB091964A25D80B21848EE3200848CA9D9D9D4EA7D3EBF5DEFBE0FD1FFDE8471B1B1B428844EB200A8D2063D01F6E510FB129E93C31D01F7B3BD0031C8D08E7AA71EEFB14493D49A087B688D3DE79C26B7E94FC63C02945E1A6D3A0229888D868C29827AD13635205000C012FB04C800995CB65A4FF618FF9F14847F00D203EDF091C56FFC00515CB65EDB1C34225922429168BDD6E777171F14B5FFAD23BEFBC83D3C2BFB4AEEED36C3699D6B85AADBA96A8480801263996A14C2643C6F6FBFD404AC433524AB75C874336898454BC70167D8E425A29D304CEE8F34B037DE912A62E9599E28BAC1529CB8001A3B04F0DCC6A60ED912185D24B961EAAC4E13E6EADB54992261E924423911FC7F1EAEA6AB658B2D61604EDD56B52CA62B1883E2370B54BC23C113B180C06BD5EBFDF174A1D1C1CDCBC79F3673FFBD98D5B37B15774BB5DA1A40C03ABB50A14426D6D8C0A02DD4BA796F04E2BBDF651BE5ADEBB782BC02146B2347C77FE8FA3727F8AB6D071A26F8F16ECF96C01371031100082828C06A726880C863E209AEC76BBBBBBBB070707954A65626202B416C81AC1B38FDD702BEC06C671BEF20E0849653D612C7BAE5E272260ADD81D8AA2883B33CE9C39F3EAABAFCECFCF6F6D6DDDBD7B776666069ED86030C0109E7ABDFEE8D1A3D9D9D9F1F1F1288A9081666DC1EE618C19F4FA711C530038B14656976D3CB99DC1F7417D751DB54962D4C1736A608908BDD49684399C55930E203C2AD043CF5B98438110874A329CB745D9BBDFEFF77A1D64D28C319B9B9BEFBEF7FF8661F8CC33CFCCCECEA24488100BBD2F92D24459BBDDDEDDDEAED7EBCB9F7C72FDFAF5D5D5D56C366B05193766384E99EA2C0A26FC68F8C9E297CA8D8584FFE98B3E1D75E8FDDF9F22D0FE3AFB4B7D52EDECA41DC07F83FFBC02E1F8B5C92BEE129175EC06D6CDCF965212A5294BCC69CBE5721032E3A0CB9C6D6497C6FF8D7034DCC84E300EC47AA9FA6EB78B7A336AC37C66C0F7ADB59B9B9B3CA3F7FDF7DFC7340754D7E1CDE3AF9B9B9BA888F5FBFD89890929251825E013B7DBED4EAB8DE434B34791C3ABF2D52AA5B43CCC4EF8C18CF2FA9B8FACAF200189071E48A62D2FD65A21892CC013A90019B2C21AF26C3F87C264A5640010B3EB51DAEA6A1C5307BB4020D06521430E6D7171F187AFFEDF0F1F3E5C5959397FFE3C8C02527900A2C5FD01FA25F6F7F7EFDDB9B3B1B1D1E9F50A85C2CCCC8CB5B67EB08F8545E0679D6B6ADCE404A09DB9700EAC0A807468C46163C172CC827BBA091F12683E0E5DCDCFB5038891F0234892A4D36AE2727D9C09DE81AC56AF978E101D0C064110A2B51C2E263C482282B3C160382E77B3B0F2B7C2B4F3B6201DA8C13888BF768129F7254B299BCD269A721E3E7C383636D66EB70B85C2EEEEEEDB6FBF3D3131313939091E289429262727C330DCDDDD05721BFB0039170EA855E5BA99FD651D8A68F9F7FC1EDE224ECA4EF09B81D514E44AC896AC39C2C174C82BE359C1430720D1DA570C2EDEA52FFC1D80886830E8734E0217804149D7AE5DEB743A1B1B1BA00D2D954AD0702870BFDBC36861AD751404A5522993CB5947A08B270227534849C62A254D9210D94C102A29075A472AE43D1C89F2D04D9D395646D95362337C8A40FB9A73CA6A0F7D844E8801C471E9EC406BDD6C361104C36F492B1AC6221A6EB7DBFD7E3F13E5A00CA030822471F433E4EDE14510042A089A8D062FB771BC20C20B7F959BDD221C7CDA18D3EDA69D654A29EC3698177BFDFAF54F3EF9045E56A7D329140AA027088260676787E31070951151A9547AF0E0C1EEEEEED2D2D2F4F434374912512055ABD50A9542059AA320AED1A4FBBB1A862A08972739F60100266D5CF227A56D25C760A98F6F4D1A7DFC5C5B6541C0FF755AD2169E7C083C05B8374208D404ACB5D96C766A6A0A0CA1C0FFA05E8907512A9506BDBE94126FCE67B342886AA502514E92A4DBEFF1822821E2240E6484C794C964325144DA0C7A7DF240C8E42A9B9CFEB69EA36F5D9A88A5DFDAC72A030FBD4D8C440E8F731CFB5D6A6E6E2A8EE3D9D9D96AB55A1E2B3DF1C4139628D13A13AA24898DB1FD7E5F908AA2A8581C6318027097854281219FC8D9FBF511C4D33E7788EF42305B133212785A9C2E603C9270FE259CCBDDDDDDFFEBBFFE45CE0DBA4231526BDD6EB73112BDD7EB812A02A8D5EDEDED6EB7BBBABA5AAFD771919D4EA7D96CB65AAD5EB74B44857C1EA41D51144A0910B2CE6623210854F452A950C840C850AA404824E31992EC3F92B4E8662C599EFA6185B1A48D30562542686BB5B586F01F4A109AC8F2285B4944828422A1A40019A82092522810F0199DBA508C5CB2D66ACD1114258936C612896EB7371824D652A3D52A168BC0B01011BAF3C0D8A394CAE573857C1E94C363A552A15864A376707000E389A80FF4058A0469232D950AC576B3A513AD5D1B1D76D45C2E874D981F34EF53C643BFB144F231649847F75B8E1EFDD4F6A888A72721229E2086D74AB21CFADF9E8ED642CE185B21EC1F5779DD2A6BDF8D4B5D58671E0247BF3A740FC7FA09F862F821388FCF6E1BBB413DC835718C0E07AC5AAD3E77E599DDDD5D8E2250BE000C09B016F8F4F3F3F33B3B3B68CBCC66B30F1F3E6C341A709F9452ED765B92181B1BEB77BBC56211B57A21441886521EEEE03625AE3A2605E15BB5214DA0E3B66C431A9A61AC31640C88969CFD3E3C1540A39694EBE730C610A5A39D8D31362D1E1B5E7FE60C7521C161A95508313B3B0B37A65EAFEFEDEDA153310CC35827855C1E1EBC1252292589FAFD3E0017A90B64D35D4E7A232BF12F234AF027983CA080E8049ECCCF67B63FD331F4158FF37501B67EB88FF08F19CEE9EF50C64165385DC3F9532242B5CBF7108483D30D5D101F58FA56AB85E055783DEFD61B50073D44571752AE2FBFFCF29FFDD99F4D4E4E420710870D06838989898989098C771E1B1BEB743ADBDBDB7B7B7B8F1E3DD25A572A959D9D1D8CCE2D140ADBDBDBC252B55A3DBBB8982449269381638C7C11A7B08220185D426B2D1D25CDF5F561C80AF0912A00D954F4455A28E651E2E95A61C12C194F0989AC72B1506F80EEC154D05184B49E174E0E8A0BAB09FC73B95CAED7EB9B9B9B404147512494CC66B3561B2212964C92C471DC6A34BBF100E51DAD353916163C23467D5A87C8B25E46059078369743B6CFF7794E97C8FF9F94E4A4D31E92DF6BD7A74BC824D8438DE7B42E2412EF44C8CB4F7D687FA1133018FC5041EF031A19721C1EC6115F1E5E9FCB5273A2E6FCF9F3D6121A943052EAD2A54B994C66666666767616641E611862D66CBD5E07FC6B7979B9DD6E77BBDDDBB76F03CED43C68F47ABD6C14B9CA7FA254CA60A7B59532C5B7B85E746F1D8FB25BD2D1E77AAC8B4F2E66F064FA98358191B729FE8EB485054EDBD688885346689E4442060AA01DDDCBD053236BD0E00B7F155BA5102226130839180CC079D369B5DACD563F0CFB3A1D4D295CED026763240FAE990D250EA5149A51394D3424068FE3E88F1EA72883EFC99CF4D9C7F9CA805396ECC512F27DF6B0C90DAE087B267E71DBBF20E1C5FEFE6DB3261C7DD006A4DE48488F8D8DA1640B1F06D8F124399CE06BAD2D140A711C5FBB76AD582C20CC1A1B1B7BF9E597CBE572B7DB45773C445F38B69F42A130373777F1E2C56F7CE31B8D46A356ABDDBC79F3E38F3F5E5D5DADEFD58410D572191858F8C4D67222480AA18C49FBB086569C339BA3AB3FA41B7C187B4401F8B3D67AA4D9D652BA4D582232565B3286AC3456EBD8075DF2998CAB0943FAFD1C4B6A327482C8B8582C964A25043CC698200A9324691E34E238B6DA58AD07834126976D74DA4208B8973A89D91FB69E329047D7671DB7124F1B39D6F03DE6E17FEA31CF30FA7558C6C73C02186FAC2C049D1F0F17598952AC9FF700C87A610D1D3575E2E8317A93D65A6472D6D7D7CF9E3D2B84803220DFCFE107DEC95708F33C3939F9DBBFFDDBFFF00FFFB0B0B070EEDCB96AB5DAEFF711D549D79BC66CC360D0C77E8DEEE15FFFF55FBF76ED5AB3D9FC64F9E3DBB76F2304EF743A183CECBCE843A0285ADA399566292561E55B1EB2FDC72A8075A52B426F4D8A8B407EFA48F613E4CDD61C56BA841056A073E148CD58BBC3B8F0C077FDA56BF55226C4A0D24C2653C8E5BBB93C9ABC0CD920CAD862B1D7E9E29CCD76DB10158BC5F5F575E809DF11A78C85072B64930705E0100EE98DA175E01F4F4F1F7FEE8317E7A4ECDC49470AC6D48E31C13AF481311A72A3B506592CEECD8F7759FA79E7B52ECC3F25FC2517458D8F8FD7EB75141D9159CBE7F368A30672013D1948E1A5447CF9BC10E2B77EEBB75E79E5155C6AA7D3410EB752A900E562DDC85B8480F8EA2449807B41535818862FBDF452B55ADDAFD55016F5FBF4580188E8586332FA74C5D1A880461F3C29A73798A9605DE3FC616128DD031C7D282F9710876569C7B6A981FC41F2C7DF55842B68A4E9B5C100C52C183874AE6632994EAB9518A383B06B3B0047C43A41D216005B220AA290C58B53C3D64517E4B6416E6765111C0D9AF9C5290AF039CCFF7FFC38ECA4464C096FA4D3E9488319B18131462756BBA12638B0046C18309AEAA49B193AF84FD0A83FFFF33FBF76EDDAECEC6CA954026C0ED03A0C3E595E5E3E38384009737C7C1C21EFD34F3F7DEEDCB956ABD56834D6D7D7C7C7C7B5D6DC88AC1CDB4F269369341A18BE291C4C5508118661AFD713524C4D4D65A308403D961EA55410A49CE35A6B191E47CB210E6F84A5DFDF0146FF55A458EE59FA53C9107E6C00B93F24E3D03A26A2042EB973759244BB9EF7B44F66D423E59474E20686A728AF2481C8EA3826CFC3D4D60451B8B1B68E1D151EA9DF51C4C6D5DFD8ADB57056E1118D36D3FACA798A207E56897F9C78FA710E355E19534A55ABD5D9D9D9EA7875627C1C881A93C4511475BBBD76BB5D2814A3280AA248052A0C42630CEC68A95462FCF0103C988E3A30E4F2984A29AD350A526070B877EFDE9B6FBEC998C44EA7D36AB5B6B6B6DE7DF7DD1FFCE00749927CED6B5F9B9A9A42B38BB51689D19D9D9DB7DE7A4B4A09F04FB3D9ACD56A7C72638CDF93605D1A17CF298EE36C361B06A194320C82388E81A7B00ED8E8925194C964A5F09C3D64A32D91B15618728CCD18F061AC35D608230D9125115829490A1148A14252C2CB89F909F26ED235D6686313ADB54185C0689B24264974AC7592686DB4B689C6EE80760BAD1322DB6EB788ACD649B7DB190C6222423297996082209042044A85412088949482C8689DC4F1C04DA8CF170A491CB7DAED6EA72B486CEF6C77BA5D10E5276E789E2F70ECFA634967666698C28C3D1F0E457C19855440A3E8A816D1C90AC0BFF7DF3F9A72E423B5479416DDD3428018FE3A3E0E79DA38CC67C135C6C0DE70C82F5CAD94A95D1807C286906D21DF00D651398A73E3486650C0CA66B33FFDE94F6BB5DAB973E7262626E0B8BFFBEEBB775656FF973FFE9F5F78E10558712104025FC470BFF77BBFF75FFECB7FEDF57A0F1E3C08C3B05AAD2E2F2FD7EBF53367CE445134353505F645B8BF4C9700F34F44C698D8614E91FA84EFE4175C28B5EE870FEFE893F3F25D87D3D9D23411793B03511AD7FAF5934303A1536CA9419D40086BC96AAB32011191B4C6189E2D225C1A9A5340FCA5780ECA9B33E7ED21DA550C349E2932BF7867B3DDC62E410E90C24C8110356408A4239BF097C8DF76869EFBB1C7A7BEE1718ECF7D9263752C4580A1455DB8E4491445494F43F461EFB3D92C0637309B121480AB74E42D81FFECA15450306E3D81196BB7DB6B6B6B1F7EF8A110E2C183079F7CF209BC7FC4036717E65F7FFDF5E79F7F7E6969098F848B746866358E5E4E0801C2CA870F1F4E4D4D65B3D9ADAD2D101D43FD426FDA45E2A8A1759290AB43076E82015F3F760F29A552875BD99154A6B65678A9A1C36703F4A6B487B3D5D28678DE01580DAC8306E04F5CFDB0D69A4423B025638D31E4290F879BB84EE7F811B9D4A7AF0078346CCBECD1321916840D1F9088448437B33A71CD87AF10AE66E88620F94FFC53A5D6F78E4E11CDD18F9F64641FE738E92BD4D4640586F0CC993313131363C5A2033224894E3ADD6EA2350999CBE7A23082E57695A3946DCA3709FEC6442E81805A3AE3AB068341B7DBEDF57A5B5B5BEFBFFFFE7FFB6FFF0DBCB968B9AC56AB788DF2D6AF7EF5AB42A1B0B0B08031CBF80A0CA27A707F756D6D0D28D1388E8BC562B3D92C954A8B8B8BB0F4E03D360EA38A4BC2052449C2C94E22E2216D7C2F9EE36A460F6BAD2181195BF0DB4193620F77032B34596B0D594B569843924AD6011C7D3D204106FC86D6B02B658D30C61A6DB4365A1B93A42FAC25FCDBEBF5B536719C584B83416C6D2AFD0C4C405D855D8EA1F4083333F7FAFD6EB7BBBBB707DE83ADAD2DF890803F907308B90F845BAE917363E3C2327AACF8FAC790449E2EFDD66B221BF2734E1774E1FD7BCAA126C64BB8E10B172E4C4C4C4C4E4C20F7D28FFB7192F47A034114A8B090CB07410898AB75755C2C0DEF864377880306B8D3E93C7CF89088F05DC0EDDCBB77EF1FFFF11FD7D7D7F18D5874E41F90960982E0E0E0E0ADB7DEAAD56AB55A2D4992E9E9E962B188E4E6F6F6F65B6FBD353939890CB47430604CD2063D847405545E97018FEC1412310039E26F5CBCDFA56AAD655D202F9B41E9E82E72BE4F3A6210C94D2BC85A2B8DB596C0BD258CF5078973AE8988FA49DA17C16013BC964212273793D4E7C1011F06E92FCC14F3499970202A83C8D248CE9A9C2BDFED76E32469B7DBCD56132CF63B3B3B43555E8E6EF9E1621F8093E967BD8744908F6315E0A4370F1DBCFF9017619A11D6CAD1133E8E02586BD36936B55A6D7373F3C2850B5114B5DB6D638CB66EC724CA3ABFD938DE0B3C0F2E0D9A9132276F88681C93524E4F4FAFAEAEEEEDEDA158787070F0C31FFEF097BFFCE5D4D4147AE7D8621111DE50AD569F7CF2C98F3EFAE8873FFCE12BAFBC628CF9CDDFFCCD2F7DE94BDFFFFEF7D7D6D6E6E7E789280CC3F1F1F16EB70BD6758C8D31AE99135B018406D133C277E19AE05418D271668665D1DF40F8D6F866851018CC79E803A0D9CBCDF104E2870C917B60EC8BA78E4A6240E6231373B8C56B139B34AB88493DA0FD01CA0DE9845E0FD130F36CE7875273B87234E891D33AF29401ED418324A9D7EBE84F622947560D9FD5AE8DDDD7FFD00DE7A3913C1879CA439EF373AC1774CA6FFCC3F77C3E55671EE7E09304E023514AADADAD75BBDD56AB95CAB74DD8DEA8FC21BD94725492F6684ED71E1700909717D35A5FBE7C398EE3959595BFF88BBF78E38D37F6F6F6666767E1BAB0F248299BCD66B95C0665CDFEFEFED8D8D8C4C4041CA7EBD7AFBFFEFAEB3FFAD18FFEE00FFEE0830F3EE80E6260FD81F0C14C0004B54208C057946BE3D4DE445EF2D04D7E4573685FB6D60268C07E11FE2AA5242DC0E8E3BADFA11B708E88F1FA862C9134C69A38E6EF1DAA70F386E0C7008341CCEBC9E61F0A6CAD05A241BBE66CA5543E9F07144738EFDF1893C964E02EAA237317D3034B9A1883500A98C86305852F4C3BE2B3D04D3EB527C400F6A89772BAF3738A4C0FC9157D4191341F6A6AB2D26EB783208011AD562A6363634110C4C9C018D31F0C92382EE40AE0BC8753080540A8CAE0674E96F957691D3B3452FE286695CBE5A79F7EFA2FFFF22FA594486E62CF8101438001901CD0CB98F108FB8D224E1CC7BFF8C52F363636CE2C2E20EF8936BFF3E7CFC7710C5A94C84D8DE63C157BAB787269C39610C2714F9023F7E34DD65A8B42952FA9E98F46084AA719A791046E1D7E7F4ADE06778884B1CCA9CDF1686A86495B4186ACB6C61019C26B2BAD1444C65A67EF7BDD6E173CFA4404EA07630C3CFE2008AAD56A3A9FC1F14CE1018115949F11DF08EF12C6DA46A3112789D67A7777777F7F1FB90A2C85BFCF63E9E05B02F8193BD6E451DF86656054243E93805A5787365EFBD47FD005F2AF414581504A2D2C2CC0AD9F5F58A88E57DB9DB611221EC4ED765B4999CFE5335194CB65B563C9E34B4116850B8DF2E8C1970EF142EA334D62F407FFF6B39F49216397A3C465A1711105CB56AB454490CE62B1B8B7B7071BBFB8B8886216C2EB4EA7B3B3B31304C1D8D8D8E2E222E684A2350944290CF906CE424A49C6465154C8E592240955D0EFF5AD27FD6C6E851044C218ABB521020A5F1A6307831843808520C28390648531D6C409696DAD46504BD20A658548AB5887FE2111017B2B2C99C4248344928CFB71DC8FBBED6E3248FA83C1204E61DEC6B1B21251BFDFC72E8D6D04435940F66F1DBFA770C4C3702CB94463BD463CD4B9FAFD7EAFDF6F341ADA188C5BDDAFD5FBBD3E26341B7BA8F04A489D684194CFE50BC52211A1724A2326D99778DF7BE4BCAD1D590A31721C0AA83A6C41F6DFE0C751FEC1B1FE490A30B44D05524A5458EBF57AAD567BF4E8D157BFFAD5175F7C51900543DB58A1D86EB7E3FE00ACC271DC9152224865662B86468D1EBC2993D7432D8480238E8FB39DB6D61E1C1C2837510FB948C6FAA3EF1B56CD7A6DE070586BB5DADEDE1EFA21B7B6B69224999A9A02C60EAE6D369B6D369B28F30552753A1DE5F0AD52CAFE60907104CB10237C7518A68857799438DAF93024ACB00A192032A4AD9560651244C2580B226AB7DC6CFEB5EBDF857E2231C50402105F04BBBE28586B31AF176C1DC225BBD0D1CF8235ECAD1D9551BC86ECBA14AA327DE3A789E0BC8DFA2DCAB1D4E08B4025382A61C77A2962C47D3FC599115E18E69FF9F4CF7ED6ED45081154ABD5388E5BAD56ABD5C2DCB237DF7C736D6DEDD7BFF6D541B757ABD502A9C6CBE36118EEEFEF4B29B3D91CAC3E4CACF2BA02FCF3FA6BC73F5A871412424C4F4FA7951A9D7AE1908CC9C949384B7B7B7B4404690049631886F57A3D8AA2BDBD3D743CEEEFEF63C78069BF73E7CEDEDE1EC0CFB55AAD542A3DF3CC336052B1D622B5EA935AC2F725C769E3278BD84B11E2487313FBEE813C1C056289C8082B8C4887661E1A1E634C4AEEE9480BD98F821AF47A5D72E3C9B062F8EA76BBC3B508EB1C21E62786D2A2185F2E97B3D9AC48A7530A91B2FD1E299AB27CF8CE8FF5C6364233536B2DD2E4156E1C49AD446B2145108532501C14F9FA7992209EA40C9F269C4774407841B6BF758C7E447F468AC5406B8D41E12B2B2BBD5E0FB89A0F3EF8E0CCF973BB5BDBC562319948C821A2A51B71A33CE2172C138DC8BD7F95C2A1A9F83715D77B1AC8B48D95B316AD560B061B52ABB5CEE7F33B3B3BCC728C0925D65AE07B194681C1CEDBDBDB52CA6AB56AADFDE52F7FF9F0E1C3D9D9D9C5C5C5D9D959041BDD6E379F2F68ADAD4BA1684C09714525C804F4507A2C37C623BF082419D2D21EE676D2DB14447488F184452763EDD109AD7CAA300CF023637B18BA635D9A017FC21681C8DE1883A817F3469DE81FE91E145E888F83235A22823A21FFC677AD3DE251638C505248A9ADB1444A4A762C8547F3F1987276FA3B473787A14FF9E1B27088D4A1FB7AFC2BF1DF1F00890932B02F7DE94B689C9B9A9A7AEFBDF71EAEDEAF56AB531393CD66339FCD09E7B992B35EECD8F82B3EE4C91D0625DE2FB1DCC6131178ABF97C1E9E3108FE89A8D16880149A733BD65A101AA36800024A904420D789BE6F96D476BBFDC31FFEF0C2850B5FFEF297DF7AEBAD4B972E9D3F7F3E9856D2B15B21AA4E8C46CD1F97CAE050A58016C16572FFA734A4AD034E0B2BD05A65951024259140E460D2865DB6AF70AB806F753B521FBE387954939C9802CD1E9A87F0233BBE0CE280CD532ACDE71A6FA2D9D083F01F3C9E207E892788954F4C4A2A61C82A2203D4B6106126CC170A51149171E456DA4812FA7006D46932C72F8C87A87B1C793DC905FAACDECE494780E0A95EAF2F2C2C0821F6F6F61617173737371B8F36E66766A3287AFDF5D7BFF3ADEF64A30C3CFE52A92C5CAA61D4D80FDD95EF36F076C69B6F1486E4DC0F58593C15E434A594E0BA421E334912CE3C1863307703FE8CB5161E6D369B3D38388095055B1160615AEBE5E5E577DF7DD71873EFDEBD4C26F39FBFF73F5EB87001631553DF2349B720AE12E0B57F2FFE1E285C25819F87B5560965ED219D095B6EEDA84AFCD5C08D703E478E601610032037CD93E47047D89D703DD2F172D288FFEDFB3FBEE858172EF3EE2DA5C40EA3D3F9F2D2126906832B494A1A91F2E00669CF20267F1D06CA43DFE21BC42139193D4EDA04E83817E8D8773EBE4AF8DF158C8D8D0D0683F9F9F94AA5B2B5B5B5B4B474EBD6AD4AA5F2F4D34F472AE8F7FBCDFE607D7DBD90CB57AB5510C9FBFBECB117E41B1EDEF105A35CDC506E10F9DB43F4A545E505A94F78FFDAF58855AB55A4024BA5123C692144A150404428A5044B2E94010F923F0E9694A9A9A9CDCD4D88DDDFFDDDDF5DB972E5E56F7E737A7AFAD6AD5B67CF9E0D33112266C83D4C3234901F308B0B27E6F9C124036DAD35CA62B61711696BE0B843075009311E3302E895A04848ACE1B211992063E6F889073C9C01D961A48F91ED75A908267E2421AC70F332583878F1AD5770E0ED57BA6676EC3F42496DD126404610F42CAD88D994ED140419A7C8991D29059C248EE449F949A71A3AA7F98C8D2F271D01025F29E5BBEFBE7BEDDAB5ADAD2D21C4934F3E992B163EBA71F3A38F3E3ABB78E6DFFFFDDFDF79FBE7CF3EFBEC57BFFAD552A90C331CBBE1B2C22B028CDE044E69070000200049444154A7AF1EF6E8A11C733FBF19CF12A53174C6846EAEA09412EAC74E7FDADCED009E5C5DB2AE955E4A09D051A1502897CB0707071CCBF67ABD7FF9977FA9EDEE0E0683DBB73E7AE9A59716CF9EF9F6B7BF5DA954F862D02306D3C8210AC703C8DBE0DB252918F22008C230F5B98D3171928A2F677E7091C671B06219D9EFE7D74A299035F57A3D7FA1D0E9066A132C8B72636AA3E89074D64F581933EC36E05F6C2F1C5AF083C36905A5F83E0DAA3B2533D9AC7199ABD4E90A8E4C40B427247F707CAA977FD2DB3E55251EF338E90254BFDB6A341ADD6E5708B1B4B474FBF6EDA5A5A5C160B0B6BE9EC4F18B2FBEB8F6706D7262727161617B7B7B7373F3C9272F0004021716849B5C42E76C262284B4F5C4A50B005C9152D6EBF5CDADCD377EF293E25811BE0AC32B3064803D663699EC2DF0762F5D715E4A89E67A8C20073F1C64747A7AFAEAD5AB63636380B8A0A34D4A498254A06AFBF56EBFD7E9F7D6371F5DBFFECBA9E9E9200CE7E7E6C83D4EE42821B578D8DAC1AA1111E2AEBBBDAE36499489B2B96CAFDFC3B4006D4CBBDD46A082BC2DEC2E7819D0A18F1A1FE8EB7ABDDEDEDE1E067FD46AB566B309CA4A2965369B1D1B1B836788C017FF42CA11132332512A088250A90073EA8D49DB17FDE542C8D119F4E338D6C6F43A9D76ABD5EBF50F1A07F57A1D2A67AC01C8290C826C3E97CB6695904ACA502A4922904A49C9ADA2FE86CF87EF2070CE7ED45918FDE590B9341EE49B8E6E17435FCA6F10028939E2F9007E6C3AAC00671666D94CC2C0944AA5870F1F0EE278E9FCF9388E976FDF1EAF8C67A2A8582C562A1538210852395204D1E490C291F37FACC7A86E8C0137DBD6D6D64F7FFA53ED5A11A018782754C218836A2EFC073F7FE22F1924004DDC88A1B9E8562814F038DBED361161680F5C915C2E373939099548517D4170F7EEDDBB77EF16F2F9D5D5D57FFBB77F534A95CB652870EC062A125192243815101CB81D4821EE0E96B5DD6EA3FAC6BF01DD08CC0DF8F69224D9DBDBEB76BBCD66F3E0E0000A0012C8B46B270C21EE131313C87802F5C03578F6E08F75B8ED4813234B247ACAACD6987F3588E3FDE6C1FEC1FEA03F4861DE420829832008A2502925D3A29F1094B697D0A9FE0F1DB5EEA73B4B43424C233E0FDF9D3CA100EC7F91757C10476A615E4AC63F7900AF777C7C9CF7D9959595EDEDEDDFFCADEF34EAFB0F1E3C989B9B6BB7DBC2D2FEFE7E9224E7CF2FE19AAE5CB902971DAEB371E322A115DA236AD50E868E87D1ED7613373BD6BAF20A2E48BA32BEF03A1859B6C83300FC1AEA8112120092103B9C3F8A22A07CE15843FA513778F4E8D1D9B367F7F6F6403714649531666B6BEB6FFFF66F575757DBEDF6B973E7262727FFF88FFFB8542AE5F379228AE3186004F8E80087C35181EB0CD5C29560AE0272F9483441E8E1E8631E94B5165E10241ECB28A52C140A6363638542019D3D40234BC7089FCFE7794DAC9BC9E5CF37F065C837AEF8AB74DA2009483B2194222944A08C14A0533382A410D2CB779FC4B3709264B3911A7D6427BD7FE8F5B11ECB90A375ACC29C7EFEA19307C82462BB7FF8F06110049B9B9B5FF9CA57262626B61F6D0A2176F7F6AE3E7DF5D2858BD7AF5FDFDCDC6CB55A7B7B7BAFBCF2CAF8F8F8EFFFFEEF5FBA74A956AB81947328ADC6696FCE69603B86E8C0B98725831315BB316FDAB5621807FF300E25CA57EF6F02D001D4F2E6E7E7810D46C5407A1568F69D90C92D97CBFBFBFBCD66736C6CACDFEFC3AA8561D8ED76A7A7A761B96FDFBEFD777FF777DFF9CE77CAE5F2DEDE1E028F999919082274895CD421A5E456CF7EBF8F842CE260A4AD100CC09B6AB7DB501BED1A44D162810EFD4AA5323E3E0EF38FBE08CC5A54DEE0055FFED000CDF29D5A41AFD578D4D3480671DC1F706C630509298D122635EF87730D157EF179D38EBEC88EBA40A78BE9D0131F3AE749DBC5E39CF95001B09AC833082180BE3C77EEDCEDDBB7EFDEBD0B54E6D8D8D8C1C1C16030181F1F7FE69967A228BA79F3E6F227772A95CADCDC1C4657C015E1F60072620113285C625E7BF4137ECCAA1C64175208F3C611DEB1E93CFE166C62B3B3B3DBDBDB704BA49B3403382478F111AE846E367DABD51A1F1F07270AB27EB892F367CF6E6F6FEFEEEE160A85E9E9E9F7DE7BEFC68D1B4F3DF5D4DEDE1EE6217CE31BDFC0BC75E44F90AE31C6F47A3D4C29C65609FD87B3C46024EC0C707EB03200B156ABD562B198CD66CBE5323C1C94B71068812880888089622405FECA7902E11D4372C32E107B143A8DC063638C15141BAD29A524331023AF3D487E06A29D2302F798E6FF1401A511B11E756386DE7FFCC9C591771E2A004004DAF18E1863CE9C39F3C1071F6CEDEE140A855AAD76E18927E338DE3A689C3973A6542A359BCDCDCDCDFDFDFDDFF8B5977EF2939F743A9D975F7EF9C5175F84C7C2C12B9E2E280DA5872360AF14A927E3A180007A639F95AF521EE52AC5E1FB85F0DC90CA305E0F14BE05795584C5D6E1EDC0225AAFD763370A369FCD61E7D9DEDE86FD1642A0725C2C167FF5AB5FE1EE9ACDE62BAFBCF2AD6F7DEBF2E5CB4849753A1D18602464C129824D00602ADCE9E18A07019C22F4B221E8AA56ABE572597A005BE6AF955262CA8131A65028588FA5071604B7268FA23221FAA9AC3B0B62BD54BA0C03D94F93458C93B53645ADCAA3D8DED3C5EB74C93BC5251B96D191D7BEE1E78F0FDDC8E99767AD650EFA634F1BC0E2A2D4A294426A194921D8C80B172ED8C4EE6EEF8461F8F1C71F8F8D95D6D6D68410070707FD7EFFB5D75E7BFFFDF7FFE44FFEE4F9E79FC7795907ACCB7B48C769631C126E3018ECEEEE26AE5BD76F30504A01DECCAEBC72D3FB708C3E1230FE41796247338AEF821D05740C6C730C8D24A25EAF87A880799DA494BBBBBB524AB8F2F073ACB598788553EDECECBCF3CE3B1B1B1B0B0B0B6CEFCBE532C6C2DDBF7F9FC362482AD489B3C6A8DCB194B3F947998F1B4D9103C025F12C6B186CEC0F580464CF4EDA21EDD1E2117418861FFC8B86AC754D70B0F789354464AC519EEC9A93E1C7A7DB751AB1DF9FFAE6A117C7FE78CA6F4E778146FF0D10C82A3719259BCDB6DBED279E78E297EFBF37373707FA9DD641EBEA33575E7BEDB56EB7DB6CB68C9BC0F3E28B2F1E1C1CDCBA75EBF5D75F6F369B172F5E3C73E60C7C1272C3F600B52067C8F1A8FAFDFEF6F636E077DAA16A0F0E0EF0245019400D8B8EBA40ACBBFC82BB875BAD168C25F61CC436689544E332AA4E389B7494EE709F92248982109143534A60E64237AA030EC6F4F4F4C3870FFBFD7EA552C1F8998F3FFE18AE63A150387BF6ECFEFE3EBE02EE3E524F5042A81F7CFAA9A9292C781445C8EA54AB55B8494110703CA694EA76BB3EDC103D1B18058BEC1666B19067EFFDA7CB42CFD97A2EAB0D06834EAFD7E9F5508B00BFBA30D66AC3964893B59F665F1FF3F84C3A30FA8DA77FFC53CCFFC88FC32E109B105452DBEDF6D6D6D6FDFBF727A6A7CAE5F2FDFBF777B7779E79EA19AC9A3146084944E572797272329FCFA3A3F7073FF8C18F7FFCE34C26F3BDEF7DEFDBDFFEF6DCDC5CB3D94430C7191858F1D88D0BCF6432894E9392D86D400BC7FB388379EC096CC3C2156ED28117414044C8D26847B56B1CF412DE05AE2449924AA5A294820B846A06ECF4D6CEB650B297C42A1325C6586B32853CD66975EDA1365A65A2D89A846C5FA7D5316D4DAD71D0BD7B07BD075A6B74F3C0312B572A10F47EBF3F511DD7711CAA009CBEC5D218E4BBD1684C4F4FA382810C15FC4972149C6C9EA1D2CA8D84520E2BCF072F0EBFE0042E062618C7354FC6583724938C46BF42144599C0B1C36B83920570EF5AEB280C8594D6180D0C884D9BD1869E8BFF82AF6AD43D631FE158CBCD3FF273172EB1FEF83A903AC9E99B0E7F69BD185A8D57C6E0E696CBE59D9D1D8866100489D17B3BBB711C773B9DC989C93008D7D6D64AA552A7D3458AFAC9279FEC76BB2B2B2BD6DAB367CF56ABD56EB7FB831FFCA0D16880C4017E0507B87812A873653299BFF99BBF691C1C64B3D96EB7CB9360FC2C8739DA3438B4707C9C641BD8CCF31A715C819818E1298C31472CEC3E312A0E352C80D2D06F4E6E300779A6971F0F7209A06144FE7E7272329BCD168B454134562C6220453E9F9F989C649C1FFC787253A170619C3FB08EB24EBAF1643E9207DF3E140308EFF0A510E37670A90096265A1B6B3BDD4EA3D5DADCDE3289F64F22BDE2B7524A0949D66260823D2AA0C7CAE5E9BB87FFD7A1CB26CFC67DA6C32996B5D651466257A3E39DAB00712A11B5DB6D78CC009D17B3A5F18949224A06F1E2E2E2FD95D54C2683EC3544B6DFEFDFB871A3D7EB954AA52B57AE68ADAF5FBF7EE5CA95D75E7BEDB5D75EDBDED9FD3FFFF4FFF8DDDFFD5D210452815114C56EF8C5DADADAFEFE3E11419790041C1F1F072D3DCC3FAFFEE7DB827DCBC1C1B772903BC02A95E311813B8436708413FCF020EB1C15F8D1A175053E8624F8850E634CA954AA542AE86E9B9B9B8BFB836C140552C1C468AD63AD710184799D41C03A89B237874F7C17CC43C3D2EF0B101D35A5C2A1D08DD784C0C81FDC8E7674911C57F827F1F716FF05CE7EBA88DBA3CE86389AB81CFA3D0BBD7FF1F4690E981D717252BB89C017E7C1C52A49C7A99C3A7B66AE5028607050B1589C9C9CDCDBDBCBE7F3D97C4E10EDEDED196D96CE2FB55BED7EBFFFFCF3CFAFACAC3CF7DC73972F5FB6D696CBE5E9E969B8CED7AF5F8786105118865FBE76EDCE9D3B972E5DC2CC6AF4B34A29F7F7F70F0E0E0E0E0EFEFEEFFFDEDF04B14DA3EB4FBAEA7DE0C62B59AFF43D74D0516B37F427EBF66876FDF1C8FD33C32F82F02154E5DF5B371B82886092A5D79C6A9862C8291BCE8F551EB889EDE7CE9D9B9D9D6D369BD94C360C824C361385611085711C67B2D97C2E177833A0F05A3B8A143E587BB91F43792D19C22B910EC9109F07550B64FCE0BC21B11627491086711227C66C6E6FC5FDC1D0DAB212A21E3CB4039C62A44715E024C1A5A3C055DFF63FA6F9E3B7A51512087DFAB7F4A4C77E50CDCE4C207F0FD93DC4EE4AA993249FCFC783F8D1C6A37AADF6C4134F7CF0C1070B0B0B4F3CF1C4FAFAFADB6FBF7DE9D2A572B9FCE1871FAEAFAF57AB55D0F54829AF5DBBD6EFF7F7F7F7DF78E38D3B77EEECEEEEE6F379E41021E2F7EFDFFFA77FFAA742A1C0051D0696A1941B3B0E39E366181FEBFF9CE202F18A630F310EBADC68345085804B231DF51F0A677D37E3DEBAC003F010E381EC91A48297CFA83B384ED22BFF1111C2560C69BC75EBD6CD5BB78220BC74F1A254D25A5B2C95841083381652066168AC4DB44EB4EEF67AAD763B0A43166B1677E5DA927C05F06F767435D828A2FC8C154360867BD4C690A066ABB9DF687C72E78E18411CB082292995901882863F0CED0CA35F7DD2EF875E8C1A7E7EFDA90A30FA062100E47093DC48B0BAFA0B8543554A051483B01CA8DE4B29FBF1200C82300CCBA5D2E4F8646D6FAFDBEDD66AB56F7EF39B711C43E24BA512117DFCF1C752CAADAD2DD83FA4E40783C19933679224F9E0830F1A8DC66BAFBDF6ECB3CFA24B6B30186C6D6DBDF3CE3BB0765003D8BF7C3E8F9C3DE455B9E18DFE931835F3C71EF8ABF57223C27512F17C79E9C80391D712AE31CDBA62851002194C7ED2385B9A3174E48AECFF288F5F911CC81E99D376B7D33838E8F7FA9928420B1E1D659A30DE78AF4C268339EC522921A50A021504240409117831B138EA24F8E2E85F306E8A88A000D05BE346A08291AED96AEDD5EB0FD7D7D408CB03DF32148EDCFC0E2E2D9D2488C72AC06712E8CFEAFF100BC9880218CFB5F3F737F53F7CE505605460BA808027222165B7D3E9F7FB61104C4F4D27715CABD5E0A5ACADAD6D6D6D7DF7BBDFDDDDDD7DF4E811AA9B0B0B0BD6DA4EA733353575E9D2A52008EEDDBB57AFD7A5948B8B8B5114FDE99FFEE9F2F2F2F9F3E7C330DCDADAFAF0C30FADAB1023B1CD9C11080DF198D9753956FA4FB110ECEEF326231DA40277CAD80AA453C0A8653D1E32A865B95C464EC9F7312040488B298763656F9E1D369C5C4AD9EBF54850369369369A6B0F1F42CAD7D6D757EEAF2ECC2FA0BCA5BDEE02E1265C0826F0520A2D60D665FDD985A3A3CEC6900290DBD561F8C96B89B4980A17C7894EBABDDEE6F6D6CEDE2E2F344B9570D13982606B8EB8407C8C1AA35117882F78F4CDC6C3383ECE0E7FBA9E8C82E18CEB5C1BB29EEAE9A72EACAEAE222180E8B6542A8D8D8DB53B9D248E8320C86573993033E80F006F0492274992F3E7CFDFBD7B776D6D0DA93AB46819631A8DC6F9F3E7E14E68ADBFF5AD6F21F7BCB1B1512C165F7BEDB5B1B1B13B77EE1863363737C9E5FBF13C205B284EE3FE91591F5A94A1053AF6801C27AE091DE6D94FBA1937181860382EAFB21B23A51C1B1B03461F6F630A0CE18608F15660DDCC1B2925FC37E198F8E12C855114851159DB6C34363737EFADAE5EBF7EFDDECA4AE3A08142185F39A211561EE1CA02F82E72A6C13701A34EC5D08AE1845C09B1AE5E298101211B27C9DAC67A7D7F9F5CE4ED1B17E1027DE926DCE0B7A708A838BA3B1DFB36FF97E628EC998F53B24CC71EE9C74762009E143FAC00DFF9CDFF74FDFA75D48F507AC47A4961A514C6D8289389E324896361289BC9E60B7921047097480A9D3F7F1ED9CC56AB353737F7CD6F7EF3FEFDFB0F1F3E845144CBD5CACA0AF8DB8C316FBFFDF6DCDCDCFEFEFEFEFEBE72805EA5D4F4F4F4E4E42438409523B78148A190C4B2CBCF0FE285B08185C6B8CE15967B7E01FF0A72A03CAE28C8282483217DF8E0E4E4E4E4E424B632224A9204407CBE126B2D58497001580A6B2D240681752693C1485DA9A4213B3E3999CBE7129DC4717CD068AC6FAC8F4F8C0B29B7B6B72DD94AB592CDE54420ADB5DA68290481CB5A9BB8DFCF170AC2ED8DD65AA1D4208EA34C46F87EADC785C8C51076F6985134CD442589544A1BFDD1F272B3DD0A55E0CB2EBFCE6632910A9490C6186B0C18C5AC20E35A2259BC3867E5FFF2241D18D2077FF3C10173C37232AA18ACFFE967A59022253DF6E7048BA3A4018791FDB3572F7FF2C9274CF686583608827EBF27C0556FAD20D1383810568461B8B3BB6BAD2D168B8D46230882478F1E219FD0ED76F7F7F7171616EEDEBDBBB1B1F1CC33CF28A5B4D69B9B9BB55A0D830A61DAE16F5CBE7C19E37EE1FAF77ABD66B309E615DC181C0CEBA502B5EBACE591DA107772C39CB96C84F7A320CDC60CC12E5746F9849C7235CCD7E9DC6B044550753EADF1B80DB9B2862C02B8D9B8D111200B803BE01D6193E10A37DAF9F7F7F7373636767777DF78E38DB5B5B520084AA5126456081106412E9BD55A67A24C9224D6352E629594945126A3B5568EA74CBAD66A2282456345351EC52217408DB552C96EAFF7C18D1B56903DA1D5300C4325A51B636C214FF0578EB5AC43B6FF53A5FFA4C31E6D66F0CF3974A45F2D48C0731BEE07387C8F7F49CAEA81B5766262228EE3D9D9593C6C22EA763BD6DA2008B5D63AD13A49C8D82449CE2F9DDFD9D921227805D56A554AD96C36979696BEFBDDEF020C0CFF016063FC88826B1CC7B55A2D9BCD562A955EAF0728041A53B05E9818C9778EF414FA42B2D92CF0C31C921A87A7476E049F62CF873CCA5E96667534828417A4DDD863EB6AC6D22382655F0EA694FD1372D26CDC78E32449C6C6C6B816C6E1AC94123410BE4C445184D4F3D8D818EABB7B7B7BED767B6F6F6F7D7DFDC68D1B57AF5CB5D6B6DBED7AAD1684A135A6D7EF8551041829126520C1EE763A819B6EC8B1BB70F4557C91FEC1CB120441B7D71352F407835FBEF72B6DCCB06BEF8E20ED89496DAABB13A2A3CDEF2C9A5F9402F867F69DDE93DE46D6BB34222952DAEEA12BE193A87C2E2C168B172E5CB878F162B1586CB7DBE82F91528C8F8F5B4B83C1208975A8026185B5B6DDE9207B038A322965A3D1989D9DBD7CF9F2A3478F9ACD66B3D97CF9E5977FFEF39F379B4D381EC08A218CEB743AD56A75616101138D5098AC56AB309CE4F2A1ECB7E09EF1B0C177C228035EE8A16C20BB07EAE8CC8BD0CD2126971B858B853E49ED2871782B90AE05CCB8A664E1A8EC38F72F5CCD0E7B342015D87978AB85F2046E280E5FBF520AA22FD209F569B5358EE356AB0550EAFBEFBFBFBDB565AD9D9B9F97485F2649269B2D160ABC23714256784872FC15FE1EC797EC0E610510EAF4070312B4F1E8D187376FC840C91318C5A51032F523849B3D7444AE7DA11423C1EEA8623CFE3194EF1227F485B192A4AFF1758EFE75480FF9859A991E9752E6F3F94F3EF9E4EAD5ABB76EDDAAD7EBB95C8EC8CECCCCF4FB036B6D26CA08A26C94CD66B3BD7ECF1893CBE5666666C8353D22C18F444AAFD77BEAA9A75076412714DE838268BBDD7EFAE9A78D316B6B6BD65A30BD411AB4EB9FF41D7736C34C76CB9D6200BAA140CB0D93D22BF7728D1392CDB03CE1F871916F452B49EC8D002417F621C6201717B1B127C7E602B1833EC02E30B38870A8BEC431B30B0F5950281488083B034B06B411271142DCB871637D7D7D6D7D7DF9F66D2144A95CEE0F065AEB62B1582A9705534D5A0A5440E270C7E3DC17361F7B3432664F0F1E1109D1E9766FDCBCB1B6B11166223AC5C45A42242E40FA280409818CD090F40FBD7E1CF37F92628CEE2AC295B78F7D27E7CD2D513A8990885C4A74F4FCAA522E341A0D229A9B9B2B140ABBBBBBC0EA2449BCB3B383CE512583402A495208D11F0CD0017CF9F2E5C16050ABD5E0F8BEF4D24B8F1E3D5A5A5A82E02E2F2F2F2D2D01720339989999812F343E3EFEF0E1C34EA793CD661B8D06DCA142A1D06EB741008A3BE10428D4035E38C09B9CA90471037B4DC2C57FF0F8B5C3996AAD8130E3E7C1E696217ACA0D4226AFEC0A59E45FE246E0D3FBCE8670B4C9700B95A30446B9CA781C24D2E1BD8118155E29606161811CE10AB64A2965B1580C82401BB3B6BEB6B6BEFEF3777E7EF3D6CD9DED6D22CAE672646DAFD32D140A83C12093CD2210524A21AF0AE009A214F6EB7807C07506411046D1FAC6FA8D9B370E9A0D4490A3724C44D61841A4A4520A4CA89610599E3C8362D4DC7E8EC34F49F911DA490A70C4F5424820050952275582AB95E2C2C2C2D2D29294726969E9CD37DF2C168BE7CF9F1F1FAFD66AB5308CACB546DB5005BD4E6F3018186BA4949D4EE7FEFDFB403BF7FBFD6BD7AEBDFBEEBB9D4E677E7E7E7777777D7D1D991374632549323535B5B3B303C472A3D140C60968E4244990F847219953E96C92F9AE204F688A4546DF3A883CAC3211B19FA31D2D05C49AEBC1F04F8CAB7CF142C0B7F1D797C5C5B87112C22B2D4B17746253E28D427B1C584A29549DD9BFC276215C5E1F5F8DDC40BD5ED75AA3A8225C4B00D440BAE13748557F78E3C35F5EFF65B95CAE94CBFFFD5FFFFB83070FC6C6C6CA9532CE8C6637AC2AF05D3EA69A1D24169444EBF73F787F6575A51FC72A084E72818C319284922A0802298406E446CAA177DBA319A14359742FCC0941F649079F87CFCCCA7CEC3B8DC350F2811F250DEF54A9507DF5D75F5C5A5ADADDDD5D5E5E465627088266B31945611CC7AD563B0CC37C2EAF843489564A69A3C1A50E7B5CA954D0148FDE2B24FB7BBDDED8D858A3D1989C9C84CD460214C2872C5310047B7B7BA0B881DFCC3BB871F0070816133720DDC9A525F44969D763C9FC53D66127E1E7C0F023630B5707128CDD835C8B30630DA46B4063C36F5D81C2AF91195749C5BFD8C178EF12AE78C45ACA17C66AC9FE187C24B86D4064C0DF8BA288AB0D83C120CC4471122B2485C3E89D77DE595F5BDB585F7FEDB5D71EADAD97AA952008565656EEDFBF0F820F222A168B0C9AC0DE92B8D1B1780483C160E3D1A39FFDDBCFFA83BE0A436D8DAF00BEB868AD2589400541100812C6A60A70926B218F8229F8C5678D01FCF3F0027E2605B082480879F4ED878AFA3FFDE7DF7BE289277EFAD39FDEB871031949F8EE5F79E92BE7CF9C7DF468EBEE277736D7370BB97CB7DBC34E0D1A15F631F07441C203843D0CDED8D818686E1716160E0E0E9E7AEAA97FFDD77FC52023BE4A64D01337F10AB914BE49F27CD672B98C16CD4EA7333E3E6E8CE976BBE572B956ABE11A2626266AB51A7924EC4110A07A055BD8EFF7C7C7C7E1B34947FFD66C36E1E8FB4F9119D591BCB2AEAD4439DE0772FCCCE4F9EEB0DFD6DA5C2E073F87D3BED8E8B0ED6072AB70052FD878083ABA709051C5AAE27A029F443E50561BD8E308F36FFA836EB71B44E16030A8D7EBF8C837BEF18DAF7FFDEB88AFC2305C5A5A524AEDEEEE62C6421CC75B5B5B1B9B9BDD6E776D637DE5FE6A1CC79AAC312674F59621590980544F742E970B55006B28ACA5E0445AFC637FFF9914409CA05D43E739257EE0D74A1C5F500BD6D6D6AE5CB9020E5A38CA994C066D473B3B3BD7AF5F6F359A67E6CFDCFDE4CEECEC5CBBDDBE7AF56AB3D9BC79F32672DBA8A1160A857ABD0E371D5EF8F4F434A2D5288AEEDFBF5F2E977FFEF39F97CB654E9C83D6FCE0E0607A7A1ABA0458FCC05196B342E336707E8096F1456118EEEFEF4374C230C4F4B14AA582A295710DF8BC0F9053395C61DF0D96336EF00CDE8C96942160821002BDEA5C15968EF14539FA3A54D3A1FCC8BD205086BF04414C9204EDF9686163523028180C1BD403294E9CCA27E1D35A9B446BAD03A9E868233C9A3A9ACD6614451F7DF4D1CECE4EA3D168341AFD7EFFEB5FFFFAF4F4F4CD9B371B8DC6850B177ABD5EAD56DBABD78D31866C1445E5C9C9D868AD75ABD715475115E455E2891CD2D85A6BAD92F28B2128FC34F13DE53845A3EC6374A2A9F3E71616171757565660F0B0D644F4F1271F2F7F745B4A353D35BD746E69677B3B9FCF03DBD8EBF5403388C60E8817161AA2034582AB03B707A674767616C6ACD1688C8F8F8391F7DCB97377EEDC4195E0308477DE3F740CF035E1F25F684F814DCDE572983949CEE5803E48877D180C06A092C67BA03C80B88D8D8D3DF5D4535114C1BD861E4A29617D61ADF17EE3617E5858858BD4B979124040486AA15040CD18A13F87075CD4C4ED005AE2072AD85BA08AB817E5E0A842089D2450B940292437A4526114C265F21BF081FB2F964A2A08D637363EBC71E3A0D118C4F1FEC1C1D6F676BBD3817E6A638220B064FBDD1E4941D622E389429280C45B1B0601F8514250EB21FB2C4F0A19FE4381EF7FFCE3A3E739E9746A717E2697CB6D6C6C1011D03E52CA8F3FBEFFEDDF7A797E6E6E6767B7902F7CE5DA5756EEDD7BE69967AAD5EAAD5BB760FBF1982134C2A11260A1E1204119066ECA3C8C5FA7D3C1639E9B9B83C4ACACAC209286ACF80AC0C947AD35DC039843185AA5D4ECEC2C977B20B8AC180337F80DEFC48F911B0A0F65DBDEDE26229CD33A641E878C5A6B5050F164342C192083EAE8E81E3F7421D787C0F569245BE102F1FA0897EEE41A9CEFEAE0BB428F65CC8F43ACB52DA46EC50000200049444154461B638C3646837A0803C5B4CEE672C65A069082311B0A0945C5AE82A64AA1D208C758932449A802A1ADB4242D0963F11F69232D8541E01E892522A994209124893C6132D01722B5A71F8FEF4D097162B64A05D2763A9D478F1E0921CAE5F2D8D89810E2CA95CBFB07FBFBF5FA60104B21C8D0CABD1598522E6AE2295EB870617373137429984C1AC771A55279F6D96751EB856E0441303333333E3EDE6AB5E0C90441B0BDBD6DADAD542AF82C0C213BD6B83E0E4C61DA19C580C6A87EBF5FAFD7D17F08261210E8E26D10268CDCF33102524A8CDD9E9D9D5D5F5F971E064EBAC9E9D801B83D808B749C8F12AED62B8EC2D110EC426FC33084B3245C6F2EDF143EE2676619C4C10134EE17C13D7E09E54F037154FBD34A678A8F624F0FF732180C12A35510186BFB83810A54108652A9200C2C599ECF404429CA5F08D2D61A83B5B3C6A6BFB7A4ADB1DA18D75096CD664988D87DE3177B3C8E027CD660FAC41D20970940328EA73B3D3DFDFCF3CF974AA558C7C57C6163E39192AAD568B55BAD6EB737180CD6D6D6161717F3F97CA3D10057EBE6E666B7DBE50703F936C63C7CF830F4665EF4FBFDF5F5F54C26830E713070E5F37970EF90131D367EC225D7192C0DBBC5CE127241A077B7D656AB55BC87BD20EBB109C1FFC6C3833FD66EB7AF5CB992C964767676E094B3AB034FC61803020872DC139C64B06E740D790D37E4D52C21EBB86CFE94743566DE12F99D9C7B955EF723B9CCAF70E957C63BE054C65A1224954C53DD8102525348219532D60A2978BF6234A174F055E91A6B58930589C41A4316FF59412405FE4D1B0B8580AF552814F8897FB1C7D0393FABA09F74D813FE538BF3337373738D46637777F7F2E5CB67CF9EEDF57A0F1E3CB870F18214E2A38F6E1B6D2AE5CAF4D4742E97B7D67EF9CB5F2E954A83C1606969099F9A999929954A57AF5E4D92A456AB8D8F8F832DE2CC9933B0B8AD566B7A7A3A8E63242EB1E2F8AEADAD2DC8A25FEF101E5CC7BA3113BEAD6597038B55A95480C603973FF794312E883B60C036454440E675BBDD7BF7EE01F36CDD44572232C6A07CB1BFBF8F321F43EA794340F4CFE28E8B87C745DE5404281267908407D5145ECE8E1CB489839C6C363B3333834152C811238AC016671C2B28E3EAD853828271BA1D3B007A6B2C91B1D6582395227BB8119157EA262F65C90F4229259D124A579AB4D6C2A7FA420494BFF43FF271F6481FFF234A49835E5EE058565656565757F7F7F79F7DEE5961E9C18387E552B9B1DF48E23849B4B5767777777777B752A920CCC5588D4C26D3EBF5B6B6B6E2389E9A9A9252EEEFEF4F4D4D81E01B7F3D73E6CCD2D2D2FAFA3A9ECD8B2FBEF8D1471F6D6C6CA0EEC3991078BD1C03B08780C43FC2007E6C4880C6718C5018F9284E202AD7A8253D74101119D7CBC2DFC51611628480D8180347CB3A1C250C30427C72FDF28CC6130E86C4C007FF2E7C8BCE0131B6114E28713CC0F45EA88E0B2190D00C828039460F8B6B4A0A29C9A65B0A324BB829AD75E21AA0F94A709D89D65229EB7971888E481B4902FF2921F93F4BD6BFD42449629D4825E9040B7D92E53E453ABF10E9FFACA752179E3857ABD5E08A20BA05EE72727AB2D36E773ADDC989C9B38B673F5E5E463E0489F3B5B535C4AC98D4B0BDBD8D69DB711C8391EAFCF9F31F7EF8211ED8C1C141B1589C9B9B7BF5D557AF5CB952ABD5CE9D3B77FFFE7DE45E818A493312AE84442E9A541E109CA36DB8404AA956AB85C94E711CA3B5120DBB08798DC384B1BD2427AF611882C7052A0A65E0CA06A60D28A5B0B7404591FEE7AE09E3987DFDDFC0C5B21E06D31E85D6487770BA067B05E49B016DBCBFC19924372CD95ACBE9517C6314458204594294020D64C726088200C80563C9218491645052F9309EC31732451090C351225A30AE138D9F88924A4909882EC730BC8FF1DDF18FBC4F0E1DF20468C3E9873CA11FC05FEDC75280B1421610686B2D42433CC566BBB9B1B61EC7C9C6FA7ABBD5CE6573DD6E0F48AC46A371EEDC39987FE6714029E0EAD5ABD6DA3367CE1C1C1CB45A2D0001904BD9DEDE5E5A5ACAE7F328664D4D4DE154DA91A7E3E4D6030E90F3258808A61DA65138A49A70791B1875E122457F9960CEF99180534D3BA03F879EE49823B84A8095550ECDCFFB099FD0BA20124E1A39722EF2C0C6B0BEE4EC13C2626897EFFDB3F4F02344B50EBB01E7AFF83CA8360A97DB41BC6B1DF842396421B6AC631FFCA74A89F07C213AAEA9C03A9CA275A5776C83ECF2592F9371FAD77D0E05183AE167957B3ED4E2C20CAC3E60FA28CA66B3D94C36D36C34BADD9E201256140B852B57AE2C2E2EC29B6F341A082B013B01A0727272727A7A7A7171B156ABD56A352C132C47A95442A10070EBC9C94988F2EEEE2EC33961DE12C706C5357C8811E713ADCB94974A25649FB4EBE1B25EC996C594370DE1CA082CD91C62160A05E1D03BD6915AE337F820394E32C822AB0ACACCD02EFFC1F07719C7200D31E58E1C0E64D99673F7266E1FF9625672E4828C8330716214112D941FE784FBC7C427EA8434E5E388CB900EF0D51211A26A006C7D9A3AE1E892FC0083BCBCB63C0EC9FC398E2F4C01C68AA9478BF448A954CA66B3B55A4D48315EA996CB156B6C14445FFD8DDF989B9BDBDEDECEE7F34F3DF5D42F7EF18B288AC0E88D5CE4B973E7AE5EBDFAE0C1033404AFAEAE22489A9D9D1542D46A350054209D984A82A910A55209349A6118221A561E728BA530707C38C2CB96C0816141E7C80F261076113CCC524A7C0BBAFEE17208D713CCC80EF224981CC5A272342D502A22B26E2E256E04C84A5E43B694B8925C2E8746196835A26A8624F9610F2B12AB0AFCD2C32A98D628414AAF0C87628B70F1035F7FE018791F4780F8B047E348FF85F50E7268220063FDE705BDE594319F96EDCEE710D34FBDFECFAF00F37353D56A15AB0CF0AD9472676727CA463A4E6AB57AA082C585C55C3657AFD7FF9F1FFDF84B5F7A210CC3EDEDEDE9E9E9CDCD4DEB3AB9BADDEEC71F7F0C13B5B9B9893230D37DBEF4D24B376FDEB4D6B65A2D9858CC1C1042003C07578AD3D8A3EB0EC79719DDB0FAEC621211F3E0B20B2E1D9E199E18110182C175658E0DA075DC122D5C0F38C7DCF025509686684AD7EB235CA1C3B8FE32E9A1A9C921E7B8CE8D8B816DE6860472AD05FC607CBF427A3D3A8B8B8B48796105A0698CF9F14DB5F5460E7FAA009DF2067EC17A881B443482A01F864939EA0A76A47DD79F9FECE793D4D3AFFFF32BC0B9B3F3686449920493AAD07ED5ED75C78AC5384E2E5DBCF8DCD5E77492FCE4276F4E8C8FF7FBFDF9F9F9FBF7EF5FBC7811085EB8E0AD568BD1410F1E3CC063EB76BBA87D627405049488F04E1857001994D7AC685C9BAF72BDE74A29A45C38C9A8B58EDC883E5F0DA4434008972A05E1218B233C2E94C684D77580F7908BAE94D7A063AD9D9C9C2422E497D86123E701C30F491CD50A79A10BAE019507E9F8E7606EF04BE3EABEE6281816BBA56FD1AD2B3E707A97EB621C84246E802C3ECBD7F3A902C487F5F033A3EF61E987A003BB65BD701FAB84F23F0EE57569CBE320A29FEFF8E26280F9190E07E7E7E7914FCCE7F3DA6893E824D1C542F1FEEAFDF77EF5AB384EC6C6C68039DBDBDB5B5D5D856F333E3E0E02FB8989897ABDBEBDBD1D45513E9F2F168B2FBCF002EA65CBCBCBA87F11D1B973E77C0E507C969C5FE16FC1D68DD04ADCE00CEB25BFC9C99F9F3C814043089011628384BF4E4C4C48572A662B95381616EB18F761DE187CC131280C3988EEAC0BA6851BACCD172F5D8D89DC0EC017C6A21904013AAAA10C2CEE18036CADE5409CFD31564B2EF005AE8D81AF9CB3B79C177A1C01E2E32417487A93708D8789125E459C6F96BC7C173FCAC7BC80C73CBE3005C86553AC4BB7DB7DE185175656563299CCC2C282B6BABE570BC3E8D1C646AFDB8BC250A900801CEC1880C1FDCEEFFCCE534F3D8531D40F1E3C00D4190FA95AADDEBB778FF139BD5EEFD2A54B108E838303E4F5701178CC90093F43422E0D6A5DE0CBB6C4BAEE96388E51FF320EAFC6794372D912EB729110178C510238872598EBD0ECE8C3545B6BC15787E6125C15EC053966002104CC216F23D00D064AE1B40042F3CE0317B156AB818500918975BDC8F87676A5F01154C1B19E613A1F3BAD76C32A63250169E17AF9E308101F2CA97E2C445EB1CFD70D8EB9AD1BB405E0B775FC62BC0F6B6F48F8A75EC3E31C5F9802542B45E45E922481ED6F369B428856B3118661B3D32997CB56CA89F1F178104B12C6A5AE73B9DCD7BFFEF57C3EFFDE7BEFF5FBFD6AB58AB6E046A3819CD2FAFABA520AD0F6279F7CF2DAB56B6B6B6B30BA2CA6D6CBE0F2B334EE18DA5BF926B9AAC5FDEC1074EC0C98A20E9C3D207AF8139CA5C16000E88770F90A6C5648D40857EA872AA27A2D5D33243230D6256A198E2A84881D9929A82EC8C5887977609B955E492E499276BB0D902C9A13F014B021900B8503377B0AEBA6C220CA446114921089D6A14B60F0FE03770EACEEC2239623AFB9825CC118EE13BFD60EE53AEAAC5B57BC63EB0395E6EFB5AED287EC10766F1F0BC82D786C8FF8824745597AC8806305D75754FF52B574C415693103C8D643B20B7B3431A5E667A7363737793415CEB8BFBF7F70B0BFB4B434313965B4EE74BA856CCE6843D66AA389E8D2A54B172F5E544ADDBD7BF7C68D1B972E5DC26899ADADADF9F979AC4BE0C6BD8C8F8F83561A63E8D13B663CD6DB5314D47F06EC44B2DA288F570B436BACB5E8B4848491639ED3AE515D38A235667A83D821DFCFA13048BB262626666666B03B351A8D8989096C80F070B2D92C30CFACD29816C37200C185ECC2DDC78D7051092F9018F07338D831D86A1AAFD9DFB8CA43A802B28762E78BC290BD181265FEA574895A9642E331B11E2B732C94B860647BC8CB2CC388C0E184E107E33CB92A38D081D655DF9583939CF4D03FEBC19F4CC14B76E40FEE5EF0427DE5DAF3BD5E6F626202571686214CD1E2E2C2993367DADD2E19FBF4D3CF3C5A5B8F0771122751264A92E489279E68B55A77EFDEDDD9D9999D9D85002D2F2F5FBD7A75636303360C39CDFDFDFDC5C5C5ADAD2D802072B9DC73CF3D57AD56B7B6B6D8EDE6DB3EF6CE79D1871C4A7E3FE32561933A9D0E44B952A9003580D042B8F219A732714E74BA40EEA12DF8782E97C375EEEFEFF31D71F402A05BA3D140F40F7D80D537AE2181D1CB106EEEF5E1622D39941EA789784403EF2A81636421C0518D15247492040E9F9C5A776DC8A6E55EB22485109EE51BDA69AD579FB60E7C459F4501C86D710C9E4DF1D5E2107EC7819072CCEF44A49482C9D00EA3C1EEC0FFD7D8973537761D69E659EE054080000970156B69154BB23C92DC130A8FE46E477814D1D12F1D31317FDAE1997971386CD92A5B552ABAC8622D5C008220967BCF39390F1F32EB102C958DA8071617E0DE7B72CF2FBFD4E3FE87524EEF4B2AE407CB7F86298740E35689975FBCEB8857F39BC562717575853B01A8B8288AAA5ABC7DFBD6F9E293C3C7EBEBDDBF3DF96BABD94A319221EFFDCB972F5FBD7A855192BDBDBDF1788C71C456AB351C0EB7B7B777777751B486149E9F9F235EDFD9D9B1D61E1D1DE5909EFCCE3FA0067ADBB97FC4735411C72C724A697D7DFDA38F3E7AFBF62D668EB193021608D95BB7DBD56AFAF5F53582282BCC9E3898CBCB4B2B0D04402D8AA200B4094F09817B120E2CEF3D5A13449477D360B3F5BF46D88792CCBBD4B7E9E0B5C0AFD1052BBE20A64659724ACE3A6236B2E023D4EFFA68B71E9A79F7B5061B49584D29D38D7F46FEF25F73824E2529BEE1474551A041A4B50D2D1F1BE984E0FB9AA769CCF3814F5C79D99F0056704C4B0578DF1FE6F10FBE70CD86C3148B9511EFB22C7BBD5E5916CC9C887EF6E9A73FFCF0F4667CFDC9E34F767776DF9E9D61AA107BCCCFCFCF99F9ECECCC7B3F1E8F8F8F8FFBFD3ECB4E212BD8463D80F97C7E7272A25BB4F47455FAF5B6576E40135C234D62CE36C0596B373636D093029412628D8D7420A8C3DA6A634CA7D321E14C66E9B2251936501081EE8C41D927A584D036C8C49613009FCA135C4121CC145027FD5A9541836F9BF137FA0CD7A9A2E90577491217195A124678EFD92C4521624DBC052EDA001DCD444CEFB895DE8948E637569EF64A92FA014134D9CAA65CBC38A375CA0FC8084422088D001121E9D7F2B15EC6DD80ED9F578094C1C9965765DE819F016DCABF70FFFB7FFDD7F6F6364652701E4856168B393347E6F1E8EAD5ABD7A5F386CC466FE3ECFC0C673F180CC6E371A7D30191160259E0294082A25E1EDA852A0D4E1AC3C1FF30FEC9BF6933EE4E2D0DB1B4B1D0F1DDDDDD7DFBF6EDDEDE1E6431A504001F441C9909882490DAE24E357CC20701614A929F2C168B325BA21A8403CB0A49A85A7475EB70471AD63B99A5F4C2FFA577D4ED764308501B92004CBD8491393B7C8D23F7CE115148B1288B449C98A361B2A65196CE3BEB1CC603F4BCCDEDDC409FF97B1B641F30FF2B4269A561CFD281D1740EB122E27E2FBB629120E952123C04B514D004BD48CAC2819F0A757EEA5239A55CE293B2591BB322FAF8C27DFB3F7FFDC73FFE71329950169BDEDCDC10714A29315D5E5C785F18266BEC9BD76FAABAC629C2C683670147C8CC7B7B7BCC7CFFFEFDDFFFFEF7ED761B25A0F5F575229A4EA73146D44C5236307ED73EBD570DDEFB6B6A57BCF7D815B9B7B707865D68A38A17CAF9448401B4DC72D3EDDD952CC5134D06300BAFE10D7C972A246218CA36E4E1742BD96D6C33B482159215380A40D9F09B9075167084171252CE3095C66097694AC4063B7DAD6198432BA36186C81AB2C6386B9CE5F86E55F3CAD35E097E3EFC5AF11250787D4F0478319B0D08217899985187668C41AA005740D252D077CB75E0C30AA00F67E5854518D001322619C2466426CA56235322C677DC643C042C19DD3BD8BF56AB5596458CB10E3185C84CD57CE19D3764420C60D285C944E88CA86E7777F7E9D3A79B9B9BAD56EBE2E202EFB6B7B777767636180C9ACD66A3D1404AA02D9E95E7FB811B8E19E656A3264821AC7BC866CFB567A4DD03381C80B7D5114561EA54038F5F065659F357B817ADBEE3D30B21A646DACA82BF0087A98607319B4308C2358494919991A3231BB1525337321DA16340947594935093074E31255F1438E350D7A8199131648C75402BDB58D57A5F6AA45784EC9FD1017BBB899BC73F9CA5D151E61CF2B68CF683ADF4DAEBBAD6D95ABCFCFBE6CB3E2C0FEF5500B2CBB427DD8A7C96EFACEFA66FEAB6B73620F4289E7CFAE9A700E7BC7C79CA4CDE3A634CE94B43547A4F861ACD26DAA2384E949C078301FE1CFC872F5EBCC0B830E8A37163E08586C61B29E7AB51544FCA59B84CD9AC60FE38CCED9C4963129B2DAEC3F335D29E04B504641DA06BB5436A95D58323D3858B50F980EC6E6E6ECEE773E4069A39E8640CEAFD2C15402B9878638C6207B4AECFD9FA57DC94E28E30DB897C514951D54018A29862E45440FA99D950AC83564B35F8ACEBBA74CB3C555112E93655234992A6711DDD49C68C6CBB51FBD268343A9D0E0A3E856C98D4F2AE169D311F925202BB19E45E31AA415E1A11E8C9E253F44C7328802615E67DF822036137EF849D33289EAA81AA87BB77B04BE2AF7FF39BDFECEFEF7FFFFDF7E3F118EFB8241409D1102DE6F3AAAAD6BB5D941D67B3194C23264B40F27370708029F5FDFDFDCBCB4BE4A32F5FBE04C47A7B7BFBEAEA0AE0E410DE1D980A412E70B983D64BBF6BAECCED3530FAF4D5628510506D40CD4E2B6E2A8246EAF1244E00C50D45D81B63A00F900034109C1094A79430B48586B4963EABAA82A6A9018E325115641A38C688D93A056BE06D8D401B4892752F247344541485756E4978664CE4946282A93299A9C3DD395A66142AD99C751BAC001CF81FEDAC4EF27282445461C5A8061AD5365BDF84B22FE0E2F93377192DA47A0618A97C1E508D6314D48CCF06E8EEBE4C963CC009B0DC0767C9FDF21EA123865CA3B0100BEFFDF9F9F96C367BF6EC5908A1DFEF63A8B7AA2A624A31B6D7D6ACB5D3E9ACDBED02C063ADDDDADAEAF7FB7FFBDBDFB4C8787676063274983DCC49A2B2C4CC6767671A2CE637995F652EF46AE9EF96A8D51EE47DA5288B219819B837C8AE91D5F3F811044E9F354BC2AA8AC4C22881A4B9D7EB617014D2AC133670866A02ABAA6AB55A6A23915E6384BCCE081859F00EC6186C8757F31C649782C9F843B1749024B428CBD2C16B5983D5ED21456C764919A26E198D189BFB19D5738D3A54D3F4317E40BC70D7AA99466635353562E6B5B53593ED77D358543F022A94B2893F2F1C98E0405058AB565A9330D4EBD1DC12F73BD709EE5E28C07BB57AF9CB44AEF48684F5603A9D02BBD66EB70F0F0F7776768E8F8FE7F3B9B3BED36EF7D6BBB3D9ACDDEE841026930922DD94D2D1D151A7D301D5FDAB57AF1E3E7C08F22C38F17EBF8F2061341A813950F54D8F4A35DE0990D36495901527B0F2D2F7E12C12353229A68F2909584D7546ABEC2B86339703004EE18231FA38994CE6F339BE098527A95041C481EBEE76BB51A0C8787F38558802E201167A058838C82FA260348828C608A038EA4588BB58F88B98D83BB76445CF42449B8191ACB58EDEC53CFA6057A23E7C5F25FBAE9BD56F3AD92B63A48CDB6834D0DB01352AD400F161ABD502C20075023CFC3C5865194B823E60442464BCF3A0CF218996732DFA80969284F84B05901FE5B65FFFB9C38F1FB4DBED4EA783D90E20F841A6B9BEBE7E7272D2EBF5F6F7F67BEBDDC2FBD96CE6BC1F8FC765596AE4038EB7E9747A7070F0CB5FFEF2E8E808BD273CD0EBEB6BC41283C1C07B3F9BCD50EEC8A5D664117FEEE3F24826D787FC7834C1CAFF446350D4FED5C81963D0A0510DCC0D89B617F0B7790E80F0E9F0F010F83616E605601F406CEA32C41BFC80A68018B5437601622C5CB91A11840A5AF28700696F4E6D5E59961C5340EA62ACF39E630A31580D1B881A282912619FA415B8446E08AD94EA73B5D1C2E88A71CD43E7DC40B0E0172793C9F5F535BE8FA05F3F42DD9DF6B353D68333D223875BC3E332921FD2EDCD57DAA6D4635A117A7D31B386402B76537FD5B228C017FFED67006982166E381C022BB6B6B6767A7A5A14C5C71F7F5C57E17A3C5ECCE67080C82F534A9B9B9BA054A9EBBADFEF3F7CF8F0F8F8F8E2E202B54E7C1F9106FAAFCD66B3D3E9200DC8931EB5CDB9A0EB4F73E1565394DF7621EB5554A3609E2152F0C898F457C9AE645FA2C6ACFAB75A44CACF0FE7D1EBF5DEBC7933994CD052806AE171B11446715FD7D7D793C9647D7D1D84BE684AE8A7E4B80078457497214678B64A6587BFC2F5A494C0CCBC94423231849452E1BCE1E5028B56A319EB003E430022D40390043F56E878F140F218F2BDD2CFD97E1D27D308F81AC82BFC82C9A0752019C19F00224A445AD7F2199D16124265F233929024E9C3C0D50053A8BD33FA89D752E26FE700B9F42F455F1560677B138BD98C00218968369B9D9F9F7BEFEFDDBB371A8D8697C3E9CD0DA7747878F87FFEEFFFDBDFDF03F9CF68343A3F3F07E6673E9F8F46A3C964B2B6B6D66C368F8E8EBEFEFAEB76BB3D1A8D70EA0F1E3CF8EAABAF009EC94B0D2A7F49686255E84D56F75C31FFB90EB04C8EAB0D0B2160C33BC916168404E0050A320E66B2ECC2C9785792515A44B795EC6FC51C5C4AA9D7EB998C035D376220B443900370113680E47985AA196795220D949D40F196C65E400446965D3BE7524C106B9680CD3BBFD65A73643926676CABD19C4F67D0072BBF962B00DD8615AED8A015E3A222E565F0C0CBAE5892CD23D06144682104C42DA0C14C82F5F032FFA45A0743C3021A455284C708BB998482095F805AC10B85EB2DC9BE1BDFA3124AEF31FF907EA2E5A3716BCDC27BFFF6ED5B4C8A18637ABDDE783CFEF5AF7F3D994C8E8E8E628C9C9812FFF77FFDD7EFBFFFBED96A81A9FCECEC0C4E8388363636F2924E5DD70F1F3EDCDCDCFCE1871FF0C8AAAA1A0C068BC5E22F7FF94BBBDDD618340A583F49815C2BF79415E6F9763E90FB04741C59A69F72D805CE1811D7C6C6864626D0D815681A420E6DD6E2B372D1212284E3D8E487D8A6D3E900D6E13262431C24D072504596F1038D77F19BF8A99709042395935238D993F06139E710A98EAFAE96AE297162B6D602940A4B8FBF057869F9B80CE9133659253E4F3694F4EEAEF4EB0BD6C16493C768E11545B1B5B5359D4EAFAEAE90C624A18749B2BA4A9FB3CD5A07A82EA8E78FD9C080CD2AE3302B288EA1C74CC2A7F4DEEBCC859DDFF33D21862142E2E4D6DBCD1042A7D3B9BCBC5487B5BFBF7F72720258C4D5D59577C55AABF5F7A3A318E3743A23A2E170A88ECC7B0F2BA8F119C62087C321341E8D82C964F2E38F3F62EC589D2365D549E71C3675E7A6C86425619262B6FA6292828F56E8B05212C0241467A054E8136394167FAEBBA9010D425084311DEF3D98E150EDDDD9D961668C77C20E29C8D46614884E5040AA999A18E0965948119109E0FD73F7A5B1380A41A590C5E34640611D624027BFDDE940924208373737939B1B2676DE4F6753322631FBC293590E15E0DD5CC6018326B7932551389194AD4FD5E9E724AD43D814BC5B8C11897BBBD10C215AE722A79BE94D1D6A6B8C3376369F154501127C58161CF7E2669A12933315272E5CB0649B25178EAD21A258074B26A65485DA1AC331355B2D2FECD9F0065A376769C3E3D101F6C2CC648DB596050F920C9135CE58638C17CE2F14D0C859B7D5EF61460426100B88BADD2EB6382EED2893B7AEF0BED96CBA2C5842FD5B73234478D3E9F4D1A347C008A10902EB02C38FE7A823016AE939ABA0AB753777027D35C6E9F63881FA0AFC14761A963EC8FC2EFAB846F6F8DA0C6E59C8FA169C56D29EAB904FE1D6502B73324B006BD4ED7695033865543CF9392559D8610428810417C522B5C41A8BC3900F87C3FBF7EF23D58692E0CDB5A202CB0531450111D7A957A21536B8412B981C35287CBB1352089B030BBA816F8F085B699CA9BD30C6C2866BBFC91AE39D0B31E87BC2A82116AD1755624EC4758C6C96F5CA108277CE194B3111536236D636CAB22C4A32A455072BA44C210444DA68AD0699895B8EEC2D4DBDF1CE59E70C12EEEC5F9E21B8B566B1B5B585924E51144AF5CCCC08188C31CD468B12072CE83506860D7E796363633C1EC360682809B0434A09E9118C25709A24C56C96060709D2137D25F589EFF5C57996E6843D45BF809059411AB32CC756D61068789071DEFC8146196FD53097850C02485218EF7CB6C3C8B43E8604D47C56B267402546632A27C8787C071D155CB095DABC26039D4EE7F5EBD77B7B7B8BC562369B410F8D104DE391424CE14535B034D23642DD09D780DB3492F6F88C98DA4885D1097A4FAF19518DBBDDACD4709799534C750C750C7A8FC41C43B0CE8280C3651BBFD11C0E00000F7B49444154128AA2F0D6196B8DB391D915DE79BF0CFDEBBAF4DE5BE7AC2343312562AAAB7ABE581011449124527242C2855C2BC9F02A487A5059C7E5E27A8C24C6907E93E5C7EE3FFFE3DBC78F1FDFBF7FBFDD6EFFF9CF7FEEF7FB4865C097D8EBF50683C17CB6B04B341D93C8DC62B178FCF8315410C9654A099B9FA7D3298668298331C39FA0B58C6D791AF0A9A55C296FADE880B93D169347961A28C30600ACEF65A80A2AB7B1B1414460324569482F00C516F51EDD6E57410D513048B0FDA87BA0A684A3CD87FA732F948408DA081C55DB6780E801EF90642F864647B02FC8B69919B30A88EC7177C062E838A21332F75AB886A015B9C9D00400971764C032C8C822CA65980D82C46B2C875F5B491234EF2FCAC2381B3855751D3995BE70D631BD631A8E321289DA20C748C61867C91A5F14D6184E29A091EC0B67AC3540745BEF1C31CFE673F00177BB5D22EA743A1AFD432DBDF7EBEBEB68A1C0DE1545E1BC5BAA2263B9E592C394CD3B0F4044C990FBE2F39F9D9E9EEEEFEF8F46A3D168F4C5175FBC79F3C6CB5608F462888D35666B30B0D65E4F262D09CBCAB27CF2E4C9679F7DF6F9E79FBF7CF912692E92516CC5C3632ACB122CC7008A815D340924C166C541A8CA8AE8E36B2F1C836AC3D48A6BCEA03146CC6611B592339FCFB15C4C412CFA87E89AA1DE1233A812C2240D34E1FDB111502F7EE9D9EB1ABFA683F01AD8E09D15F1AB019291054D36C323E06A71235757573A9F14633C3C3C1C8D463A7706F38FC78B550CC892D50968668FA7D1E974B405A18AA16AAF9559386A2DECEA2B6FA7E4A1D1EB8BB3440CDB6D6499B66A32652465A8F9B65B6BC65A361462C0BE6122E2107D5134CB46013CB773D6D9C27B4374EFFEBD66B37971718127A6B4001AB21291122B69839918E3A26CC9386B9DB558F3CAE6D63F4223ECECECECDEBD7BD7D7D7DF7EFB2D56D03D7FFE1CCD5D447BC4D4EDAC7FF2F8F1E9E9E96C3EC7738C314EA7D3B5B5B5870F1F8E46A3172F5E7CF1C5178F1E3D028CE2C99327487F9D73DD6E17C779FFFEFDF3F373923687EAB1061EF136FE2CF706B907A0ACB487B38137446D270A8D33EA9E9060D4DAD076252234C8B44C04B143161E0537E164502B662BB89761AEB5D8C51B649640FB068D4663301880081E39370E3E09D221A752CB433ECE882D8AA2E8F7FBA3D108968899178B05D8068C1449AC80299C2CFD6E369B676767E7E7E74EA60E42B6C002160D5E082153212F96D91DB44A5256EF8749529DC9DBE7B8E6667BADC838B4438C869783134E68F0C03C0B235DD7818810FC341A8D4651368AD27B6FBDF3D6714C869674BCC41443BC1C5EC24F42ED2F2E2E34DDC271C39681E80993BD38FA1423612A9299535A8223B27F4BF1DBDFDDBAB9B9190E879F7FFEF9F1F1F1D3A74FC1D80C99004F56E1CB6E67FDE5F149BBDDEE6D6CE0F650A368341AC3E1F0FCFCBCD7EB8105F1AF7FFDEB37DF7CD368340E0F0FFBFDFEE6E6E6E1E1E1EBD7AF11840C87432508D208449FA6CD9AB8AA0046C05246802B7908A4518A97498B248DD5A228269309EC9993B91954D3606B7DB63606F3405A64C0F9A9137332D40289D1821D944DBBD19D4EE7FAFAFAE6E606C700DBE9645BB091F23F3E42C176E1F6802FFE1014231AC1437C114838E7AEAEAE70915A2F8F428DD1EFF72107B5B0716986A6BFA9960557A5652897B1B05819734932F680AFD19AB0D21C34850F9CEA18B06215C1468A3109FB7C9291173C84B228AC77CEBB3A8488FC9539C5689C8B75BD98CD6388CB592DB04F2F96B4F8008318816CD86C6910522360F2D1FF51F9C1561B2C5623B1FAC9BC2B89BAF576131BAA9F3D7BF6E38F3F7EF2C927BD5E6F7777B7288ABDBDBD939393D96CB6BDB57D351CC53AACADAD5D5D8D612A6E6E6E363636D40D75BBDD172F5E9C9C9C586BB7B7B77FF18B5FE0908C3110087C8AE673311BF2C0F1230946C2BAE201549254EE57D268D5130D54002476D2698F822554ABA9892F82255DDEAA4E1FE70DEF8132629495304680771AC0A46C99B6EA67ABD5EA76BB40C5290F9293976A3E6E3C57754DDF95C511158F8B8B8B94D260304802D48386A8E704680FD98515569824DC2DB82345B3B294A16B2100B6770691D5511B610102C247CDC12CD6FA402CB071CE11932A096E76B158001E66518474360A440F2113D6BF724C65512E3738C514EAD0EEB4E1B781A34E775697E362208495ECE381515388B8F71E29302B44C2482778D0EFA2BC8D52069EF2E5E5E56C76B3BBBB5355F5EEEEEED568BCDEEEEC6EED9E9F9D8FAFAF8D1407102631334A19A7A7A75F7EF9E5D1D151B7DBFDEEBBEFFEF0873F3C7AF4687F7F7FB158FCE94F7F6AB7DBB08B3081DA874A82E0371936217FE89AADE2B4200D5AB75673C5B7478411F443443000A97C8C4970882A010869A2605483ECCB2019D9566DD4A6847E28CC2740BFBAE94C6BFF007BB26C3B4DB2FD5B2DB13683B4F0AA8551BC09EE118563F017016F0BEB8EF85E43C4BAAE01D72B84FA8584E10B3E0D378BC935F5BA94B5C6B4B4A06AE09C53262575B99AEAC4182D91B79652429DD0581B39357CA10D1F924979E79C2F8AAAAA12735D55D659636D628E8628A676A3E9996208442672E2C4D6D8AAAEB113041129041ACA00E507E41EB12ED6A1C34F125188D13A6B9D63E2BAAE517EC5C0101121DB76FFF2E0607373F3C18307D8381D4278F1E2C57038FCF8E37FB9BABA7AF0E0E16030A816F5F31F7F6C14E57C3E37D6EACC3F2C1CF472369B75BBDD274F9E600E1D4818AC65FEED6F7FDBEBF56CB6AC5CE34E276858B4333B9D8EE69779F44F924B45699E6B10926B4BFE57307BC86B736BA1C3687AC07837A4E93163BBD74C402D9CFA87746790CF09A2380A062E4F76F5B30AA173D31C54C377BD4D9BF163032DB7BEBE5E140570A6F0571AF5E9FC8DD61B4AA1F8D51B41FE0375D29A0CF4165417494AC92C4D1504B726A39886F1C22BC93034D48C125B32DE3A982E6F9DB72E8977D5C00FC5254B8689ADB13145672DBA6BA52F425D9BC816980B22C47B852FAABAC69593F4ECB559693348A9E2C1E0AEE1FF495A16CB1690B518A6034402DD53F7EFFFF63F8074BFB9B9C1EA6666EE743A3186172F5EC498AEAFAF4F5F9E5A32BBDB3B755D7F74F0D1CDCD0DAA13F3F9FCD5AB5780795A6BBFFEFAEBBFFFFDEFCC0C942804E2D9B36790AD5CEE57AC3BC23864F794C1DD4C064330D92CBC0E5EACF8E815CD8140AB38A6946A614154A95527A073DC2AD36AFF92B45AB45284CE06345FC30C45610044B41248A4DB20DE94A1A1F45E70A94126A4068341AFD79B4EA7B86CF890ADADAD908DC8E47E4367066CD60921693CE346503B2A8A028640B7036AACA897EAB3911705B12519E82B8A627D7D7D737373369DD6559562B4C662203FC55857B5CD8693701050FEBAAA524CCE3A66B6C612912532D64CAF27DE79C314425854158E6D3A9BA9D7CD6BBB5555C150AA938C32A46EAD45091E7711A589668C619D15B6C618836376B3E9F8ECEC0CBE7B636303E5CBCBCBCBAA5A8CC7E3AAAA87C361A36C84AAFED5D7DF3C7DFAF4CDDBB76559CE66B38D8D0D6CFE0216FAD34F3F3D3E3E6EB7DB0BD9C00E8B9B637BD44DAB7D5227E00432907E829BC964BD5B163CA30E9EDFD501D41C605CA3606B11C5AAD557134E425D01D1CF4D0E7EA7902975F874D4DD830C36C01187DB54E91A294541B938D97DED333C191E51948DF3B80B8097B05D0A12B9B1B181830455111C2FF2042FB86E96D21049E54A9316CEE8E5BCE0D2F03C6BD9DFAA09B106575E5628F06D32186B6D080179208C31102829DBF3E7B2DE997A60225A4CA79C12B697853AC41889D9242626B0CDD629968DB268944559365B2D6B0C4C383EDADFA670C4E9E034A30CB8A28D830A813A07D8219D9936C68043D10D36BBE8017BEFEFDDBB678C412CD46EAF359BCD8F3E3A984EA79CA85196A727A78BC5A26C34767676E02E0E0E0E5EBF7E8DEEC9D1D111D0329D4EA7AEEBCDCDCD9D9D9DF3F3732B3D4B7DD6A88AA89585AD224190E779ADBE385B4B8AFA634A09A5C61585D1AF6D86BE24895CD523E3C145995837D2D3D55680A6959A7EE0FAE1CAF17C5514F269AFC964E2A493AA594A996D2DC87D0B3363669A3334352EB8D16860ED9A5A0A2D77A046874A6EC8A8008C0CAC4062F034B446AE29388C027E8402A5113C8BCD2A728079BA0CE4E732862227C05B4BC659E79D5F167388ACB1C44CA2F9F67673D07B6F24746166EF5CA36C341B4DE77D4A69329B1A6BCA46C9CCB6F06B9D76BDA8D447D90C2FED6E53617B19A4B619664C418ACB26925962639103704C292537D8EC76BBDD94D2CDCDCDD9D919C88AB7B6B67EF5AB6FA6D3E9F3E7472184F65ABBD9685C9E5F12D18E70657EF9E5973B3B3BBFFBDDEF3EFBEC33546175518AD67DEBBADED9D941D7532BA756D875F26043BDED5D0FA0710E00B7FD7E1F7F55D735C677EE9A7F0831AA0768511999604AD2A075D2ECB4D93C97B6CF54B2F387AE12863B4DD24955A781FA3A4B9942934E9521D4F5E1B8A0C95AAA8A3237082387660B927894DDEABADEDEDE06981CFB4774B3098C1C5E2C004F6D8CE0A3935433A112C07AA1304052C5CA93019B55B7E045350452CF16636C341B31A5986244ADDD18321453D487902B4C4AA914169952967A2CC5D49A2AD43527D72C8DB52125669E558B6A3AD36E86BA9128D376B83635105012E52830598B869913A7884B120FC0CCAEBBDEAA6589158C07DEB1DFDF3C3A3A6A349A5F7DF5D5EB576F06FDBE336E6D6DED723834C63C7AF4A8AEEBF178FCFCF9F37BF7EE351A8D8B8B8B6EB70BEF8F31312B7C385A14873CE13CF8363DA51E401E28E72F23802D6C74BDBEBE4655048C467427077042DD9A64818A863D6ACBF168F05FF0D5689E60B33A0F3E1A6A0C91D547ACA515B591AACF3E9BF9503FA037628C014CBA1010BCE6DFF0758AC033C660C20E1F8D605A231C8515E6A85835EAB5B0B1DBDB1317A04E8AB2A940830ABC8F0A1C84BE940595FA262A85EAAC749B72FE10D47E99AC48305F2C12A73A048055C99810C3A25ACC66B39A52B464BDB7DE01AA598550B08194E33A7D36510965C6003A09BE553D8093F68BB659628A21C62470515CA2DBDCE8C41875F2B5213B0647A36155558F1E1D5A6BEB2ACC67B37B1FDD3B3E3E0E315E5D5D5555757E7E7E7A7A7A7070F0F39FFF7C6B6BEBBBEFBE83D182022C168B9393130C07C39382620DE2156EB35C68EDD26553797982AB27EA9C03813BAC7BA3D15005B8AB03245D5E452F5A692AA9C84225D6D6D6F0E7B0C140FBB0D44335B4D5AB5221D6BC9C3300828237555090626178AA969977BC150C84266D78132880C6665AC507403D0FD3515EA48CF5C4DC2958E558C05AD66C1E1C1C282B23EE149F888FD6B83FC78A3B6984EBA110D1743E6BB69ACD562BC450D5B575960CCDE6F386E454498ACECB143F45634D4CA9280B04E390812AD454B88A9371B65196802BB73AED222E793DA0037948A3890AFC366C816632DAEAC6091645917B0022E294628CFF1FB346BFD552DC646D0000000049454E44AE426082,
        'd052a520af587c72edcc4168032e1e4e', 'monezhao', '2021-01-08', '2021-01-08 00:58:01', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_sys_post
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_post`;
CREATE TABLE `t_sys_post`
(
    `post_id`     varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '岗位ID',
    `post_name`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
    `post_status` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   DEFAULT NULL COMMENT '状态',
    `sort_no`     int(11) DEFAULT NULL COMMENT '排序号',
    `remark`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
    `create_by`   varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '创建人',
    `create_date` date                                                          DEFAULT NULL COMMENT '创建日期',
    `create_time` datetime                                                      DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '修改人',
    `update_date` date                                                          DEFAULT NULL COMMENT '修改日期',
    `update_time` datetime                                                      DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`post_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='SYS13_岗位表';

-- ----------------------------
-- Records of t_sys_post
-- ----------------------------
BEGIN;
INSERT INTO `t_sys_post` (`post_id`, `post_name`, `post_status`, `sort_no`, `remark`, `create_by`, `create_date`,
                          `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('boss', '老板', '1', 1, '', 'admin', '2020-04-12', '2020-04-12 20:45:42', NULL, NULL, NULL);
INSERT INTO `t_sys_post` (`post_id`, `post_name`, `post_status`, `sort_no`, `remark`, `create_by`, `create_date`,
                          `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('employee', '普通员工', '1', 3, '', 'admin', '2020-04-25', '2020-04-25 12:00:50', NULL, NULL, NULL);
INSERT INTO `t_sys_post` (`post_id`, `post_name`, `post_status`, `sort_no`, `remark`, `create_by`, `create_date`,
                          `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('manager', '经理', '1', 2, '', 'admin', '2020-04-12', '2020-04-12 20:45:24', 'admin', '2020-04-12',
        '2020-04-12 20:45:50');
COMMIT;

-- ----------------------------
-- Table structure for t_sys_post_user
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_post_user`;
CREATE TABLE `t_sys_post_user`
(
    `post_user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'UUID',
    `post_id`      varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位ID',
    `user_id`      varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户ID',
    `create_by`    varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
    `create_date`  date                                                         DEFAULT NULL COMMENT '创建日期',
    `create_time`  datetime                                                     DEFAULT NULL COMMENT '创建时间',
    `update_by`    varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
    `update_date`  date                                                         DEFAULT NULL COMMENT '修改日期',
    `update_time`  datetime                                                     DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`post_user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='SYS14_岗位和用户关系表';

-- ----------------------------
-- Records of t_sys_post_user
-- ----------------------------
BEGIN;
INSERT INTO `t_sys_post_user` (`post_user_id`, `post_id`, `user_id`, `create_by`, `create_date`, `create_time`,
                               `update_by`, `update_date`, `update_time`)
VALUES ('boss-admin', 'boss', 'admin', 'admin', '2020-05-27', '2020-05-27 17:46:37', NULL, NULL, NULL);
INSERT INTO `t_sys_post_user` (`post_user_id`, `post_id`, `user_id`, `create_by`, `create_date`, `create_time`,
                               `update_by`, `update_date`, `update_time`)
VALUES ('d3fde943aabbac316d5c63fc48e14f2f', 'employee', 'monezhao', 'admin', '2020-12-10', '2020-12-10 20:54:25', NULL,
        NULL, NULL);
INSERT INTO `t_sys_post_user` (`post_user_id`, `post_id`, `user_id`, `create_by`, `create_date`, `create_time`,
                               `update_by`, `update_date`, `update_time`)
VALUES ('manager-admin', 'manager', 'admin', 'admin', '2020-05-27', '2020-05-27 17:46:52', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_sys_role
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_role`;
CREATE TABLE `t_sys_role`
(
    `role_id`     varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '角色ID',
    `role_name`   varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
    `sort_no`     int(11) NOT NULL COMMENT '排序号',
    `remark`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
    `create_by`   varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '创建人',
    `create_date` date                                                          DEFAULT NULL COMMENT '创建日期',
    `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '修改人',
    `update_date` date                                                          DEFAULT NULL COMMENT '修改日期',
    `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='SYS07_角色表';

-- ----------------------------
-- Records of t_sys_role
-- ----------------------------
BEGIN;
INSERT INTO `t_sys_role` (`role_id`, `role_name`, `sort_no`, `remark`, `create_by`, `create_date`, `create_time`,
                          `update_by`, `update_date`, `update_time`)
VALUES ('admin', '系统管理员', 1, '', NULL, NULL, NULL, 'admin', '2020-06-17', '2020-06-17 06:50:53');
INSERT INTO `t_sys_role` (`role_id`, `role_name`, `sort_no`, `remark`, `create_by`, `create_date`, `create_time`,
                          `update_by`, `update_date`, `update_time`)
VALUES ('queryRole', '用户', 2, '', 'admin', '2019-09-07', '2019-09-07 21:10:19', 'admin', '2020-06-17',
        '2020-06-17 06:50:46');
COMMIT;

-- ----------------------------
-- Table structure for t_sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_role_permission`;
CREATE TABLE `t_sys_role_permission`
(
    `role_permission_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作权限ID',
    `role_id`            varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色ID',
    `permission_type`    varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '权限类型',
    `menu_or_func_id`    varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单或功能ID',
    `create_by`          varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
    `create_date`        date                                                         DEFAULT NULL COMMENT '创建日期',
    `create_time`        timestamp NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`          varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
    `update_date`        date                                                         DEFAULT NULL COMMENT '修改日期',
    `update_time`        timestamp NULL DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`role_permission_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='SYS08_操作权限表';

-- ----------------------------
-- Records of t_sys_role_permission
-- ----------------------------
BEGIN;
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('018ac05dfa90c3ed6677790eaecbfd11', 'queryRole', '1', 'sysBalanceMain', 'monezhao', '2022-11-23',
        '2022-11-23 10:44:01', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('02ca2934469375282b952c37e9024869', 'admin', '2', 'sysUser-2', 'monezhao', '2022-09-16', '2022-09-16 16:49:53',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('054fab8219d2cee4380a3e117c211707', 'admin', '1', 'monitorDruid', 'monezhao', '2022-09-16',
        '2022-09-16 16:49:53', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('058f056ccf9157167f9f13f22d6a43b6', 'admin', '2', 'sysOrg-1', 'monezhao', '2022-09-16', '2022-09-16 16:49:53',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('085c4ea287c066baf9366a05ada9555a', 'admin', '1', 'balance', 'monezhao', '2022-09-16', '2022-09-16 16:49:53',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('0a98f3dca401074db3f55211df6cc546', 'admin', '2', 'sysBalanceMain-3', 'monezhao', '2022-09-16',
        '2022-09-16 16:49:53', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('0b416b4f678cbd04ce1d06d0deb4a5d3', 'admin', '2', 'a1544742d620b37a625117e358ba47c0', 'monezhao', '2022-09-16',
        '2022-09-16 16:49:53', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('0ece8e1b961297d0797f4802b4b5d41a', 'queryRole', '1', 'statementTable', 'monezhao', '2022-11-23',
        '2022-11-23 10:44:01', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('0f5681e1233197cf29c3734fdc1846c7', 'admin', '1', 'sysCodeCreate', 'monezhao', '2022-09-16',
        '2022-09-16 16:49:53', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('13ef8be1254f51879b0c4945d0fc948a', 'queryRole', '2', 'sysBalanceMain-3', 'monezhao', '2022-11-23',
        '2022-11-23 10:44:01', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('1b5b398365ddd74b9d13472bf389e593', 'admin', '1', 'sysOrg', 'monezhao', '2022-09-16', '2022-09-16 16:49:53',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('1d73d9d54c8ae8eedbe101ffbad2ae7a', 'admin', '2', 'sysOrg-3', 'monezhao', '2022-09-16', '2022-09-16 16:49:53',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('1ef52b1d2fa9f438a1e6d8b8195201bc', 'admin', '1', 'flowableTask', 'monezhao', '2022-09-16',
        '2022-09-16 16:49:53', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('1f6666a6ad247a5e72f3d0f8699df9f4', 'admin', '2', 'flowableModel-6', 'monezhao', '2022-09-16',
        '2022-09-16 16:49:53', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('2002b53ccc4d959d9b6fd1d758d2e7a2', 'admin', '1', 'sysJob', 'monezhao', '2022-09-16', '2022-09-16 16:49:53',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('21079e7ae00b4f639100858dadcf036d', 'admin', '2', 'flowableProcessDefinition-2', 'monezhao', '2022-09-16',
        '2022-09-16 16:49:53', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('26487436f180405293a6eca66260c5df', 'queryRole', '2', 'sysBalanceMain-5', 'monezhao', '2022-11-23',
        '2022-11-23 10:44:01', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('2787756ba00f370eb108998219eb0c7a', 'admin', '1', 'flowableProcessDefinition', 'monezhao', '2022-09-16',
        '2022-09-16 16:49:53', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('29bfb86861a3ef502aa1b219cb0b3b0f', 'admin', '2', 'sysPost-4', 'monezhao', '2022-09-16', '2022-09-16 16:49:53',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('2a04626fd4a60059dbdaeea7b986ff6a', 'admin', '2', 'sysCodeInfo-2', 'monezhao', '2022-09-16',
        '2022-09-16 16:49:53', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('2bc0af7448236c363a68761d9f86d50c', 'admin', '1', 'sysPicUpDown', 'monezhao', '2022-09-16',
        '2022-09-16 16:49:53', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('2c56d77c7684ac3d5af0b25b43016167', 'admin', '1', 'base', 'monezhao', '2022-09-16', '2022-09-16 16:49:53', NULL,
        NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('2e79f30ef9527e55bede737f1632908c', 'admin', '2', 'sysRole-5', 'monezhao', '2022-09-16', '2022-09-16 16:49:53',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('2f440c6f252e04f629edc23303449626', 'admin', '1', 'sysPost', 'monezhao', '2022-09-16', '2022-09-16 16:49:53',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('2fa837d7065a405dd32b0807c91249d6', 'admin', '2', 'sysPost-2', 'monezhao', '2022-09-16', '2022-09-16 16:49:53',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('3024083a6b6e684f4dfa5dcca1eb74c0', 'queryRole', '1', 'balance', 'monezhao', '2022-11-23',
        '2022-11-23 10:44:01', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('347856474c668219a8c8375df32f82cc', 'admin', '1', 'flowableModel', 'monezhao', '2022-09-16',
        '2022-09-16 16:49:53', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('37b32c604132204656604d709c5c1783', 'admin', '1', 'sysFunc', 'monezhao', '2022-09-16', '2022-09-16 16:49:53',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('392b7b2698355c2cb6924a6335fa5404', 'admin', '2', 'flowableModel-4', 'monezhao', '2022-09-16',
        '2022-09-16 16:49:53', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('3ae0b543ea47c17fbedd834292cb6ec3', 'admin', '2', 'sysJob-4', 'monezhao', '2022-09-16', '2022-09-16 16:49:53',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('3cb8bfabe237c5390f7f64e5c633f251', 'admin', '2', 'flowableProcessInstance-1', 'monezhao', '2022-09-16',
        '2022-09-16 16:49:53', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('3e0ef3246929983717de351b7e855fc3', 'admin', '2', 'sysRole-4', 'monezhao', '2022-09-16', '2022-09-16 16:49:53',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('3efea791ed0b9b1f020a45f0c63f34ee', 'admin', '1', 'sysCodeType', 'monezhao', '2022-09-16',
        '2022-09-16 16:49:53', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('3f034a3e43322a8fd592e941dc102d11', 'admin', '2', 'flowableProcessDefinition-3', 'monezhao', '2022-09-16',
        '2022-09-16 16:49:53', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('42dd90de9d02629070fcb90372e492a2', 'admin', '2', 'sysPost-3', 'monezhao', '2022-09-16', '2022-09-16 16:49:53',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('46701c50ae5e3e93bd0d7843db706eb0', 'admin', '2', 'sysPost-1', 'monezhao', '2022-09-16', '2022-09-16 16:49:53',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('4e0ae67027a370e776edbd89af3a5991', 'admin', '2', 'sysMenu-1', 'monezhao', '2022-09-16', '2022-09-16 16:49:53',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('5900ae359bde49ba19ca41c31e1c3af6', 'admin', '2', 'sysFunc-3', 'monezhao', '2022-09-16', '2022-09-16 16:49:53',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('5932188fe1860f7adc48d8838346f5af', 'admin', '1', 'flowableForm', 'monezhao', '2022-09-16',
        '2022-09-16 16:49:53', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('59976c75e58203b37988e2bdef229bb5', 'admin', '2', 'sysRole-2', 'monezhao', '2022-09-16', '2022-09-16 16:49:53',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('5d43817f12e8d29ca81f21f41076c5a7', 'admin', '2', 'flowableForm-3', 'monezhao', '2022-09-16',
        '2022-09-16 16:49:53', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('5e1d441fbdb6ccafbbd767e649278282', 'admin', '1', 'sys', 'monezhao', '2022-09-16', '2022-09-16 16:49:53', NULL,
        NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('5fb614dad5c11183c8962e375838979a', 'admin', '2', 'sysCodeCreate-1', 'monezhao', '2022-09-16',
        '2022-09-16 16:49:53', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('64ac43f3f3431a1200e189bf46437d48', 'admin', '1', 'job', 'monezhao', '2022-09-16', '2022-09-16 16:49:53', NULL,
        NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('66e903ec4103c7a12ec9efc84bbd72c2', 'admin', '2', 'sysUser-4', 'monezhao', '2022-09-16', '2022-09-16 16:49:53',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('67ae3fa5fc4321883ee8d45edb5832f9', 'admin', '2', 'sysRole-3', 'monezhao', '2022-09-16', '2022-09-16 16:49:53',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('6814754624779177aabd2986b403b069', 'admin', '1', 'sysConfig', 'monezhao', '2022-09-16', '2022-09-16 16:49:53',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('681a42a2d3aae1b0a3d12e736aab219c', 'admin', '2', 'sysFunc-2', 'monezhao', '2022-09-16', '2022-09-16 16:49:53',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('686d85658e8fdeba54eb2d48bd1b7259', 'admin', '1', 'sysBalanceCount', 'monezhao', '2022-09-16',
        '2022-09-16 16:49:53', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('690e19cd150a23db81937cf461d81408', 'admin', '2', 'sysCodeInfo-3', 'monezhao', '2022-09-16',
        '2022-09-16 16:49:53', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('704ed83d745c007b5b7942f60fce64f2', 'admin', '1', 'sysJobLog', 'monezhao', '2022-09-16', '2022-09-16 16:49:53',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('72a2ed92e60c6469f9b7edbdd9b85cdb', 'admin', '2', 'sysUser-1', 'monezhao', '2022-09-16', '2022-09-16 16:49:53',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('730a5e646614dda9483e5490fa92f8fd', 'admin', '2', 'sysBalanceMain-5', 'monezhao', '2022-09-16',
        '2022-09-16 16:49:53', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('73c6efbd13cd6cd2ee5b92c16897c8a4', 'admin', '1', 'sysBalanceMain', 'monezhao', '2022-09-16',
        '2022-09-16 16:49:53', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('74e763f7b55eab084e6160e603c2d0dc', 'admin', '2', 'sysBalanceMain-4', 'monezhao', '2022-09-16',
        '2022-09-16 16:49:53', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('7b0987b865a2ee4bcc1048cca3c5fdd7', 'admin', '1', 'sysLog', 'monezhao', '2022-09-16', '2022-09-16 16:49:53',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('7b6e1a2f2fcbabebfaa00d60eaae47c8', 'admin', '2', 'sysCodeType-2', 'monezhao', '2022-09-16',
        '2022-09-16 16:49:53', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('7d20f43c527abb4a08c44aeb4cd08e0d', 'admin', '2', 'sysRole-1', 'monezhao', '2022-09-16', '2022-09-16 16:49:53',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('82aadb944490048d54980d42ec082562', 'admin', '2', 'flowableForm-2', 'monezhao', '2022-09-16',
        '2022-09-16 16:49:53', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('8334200fd9bf685c9b11d0665c2f351c', 'admin', '2', 'sysCodeCreate-2', 'monezhao', '2022-09-16',
        '2022-09-16 16:49:53', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('842e7e5f1c7000f78fecd9393d57200a', 'admin', '1', 'monitorServer', 'monezhao', '2022-09-16',
        '2022-09-16 16:49:53', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('84fe1638a19dd916064453b9b2ca2669', 'admin', '1', 'statement', 'monezhao', '2022-09-16', '2022-09-16 16:49:53',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('8712ca209af748359cba747d9d5252d1', 'admin', '1', 'sysUser', 'monezhao', '2022-09-16', '2022-09-16 16:49:53',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('8a7ed9758476190fe6a0f4d4afc524e5', 'admin', '2', 'flowableModel-2', 'monezhao', '2022-09-16',
        '2022-09-16 16:49:53', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('8c4cf4a864a143b082c27c7418ea9a1e', 'admin', '2', 'sysJob-5', 'monezhao', '2022-09-16', '2022-09-16 16:49:53',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('933ab6b4a0b00eb91261c939bcdfbd92', 'admin', '2', 'sysCodeType-1', 'monezhao', '2022-09-16',
        '2022-09-16 16:49:53', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('93a488f700b4d254d845d5f38db58046', 'admin', '2', 'sysConfig-2', 'monezhao', '2022-09-16',
        '2022-09-16 16:49:53', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('957cdac88df857c403685376c10fe704', 'admin', '2', 'sysBalanceMain-2', 'monezhao', '2022-09-16',
        '2022-09-16 16:49:53', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('9960f6f30aed9e744a6399b4893defcb', 'admin', '2', 'flowableModel-3', 'monezhao', '2022-09-16',
        '2022-09-16 16:49:53', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('99aca01d24405d884802dc401f9d80e0', 'queryRole', '2', 'sysBalanceMain-4', 'monezhao', '2022-11-23',
        '2022-11-23 10:44:01', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('9b706ddcf4bee7a54c3eda2a34cb31f5', 'admin', '2', 'sysCodeType-3', 'monezhao', '2022-09-16',
        '2022-09-16 16:49:53', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('9c3377eff9dd4c352f00868b2c246a17', 'admin', '2', 'flowableTask-1', 'monezhao', '2022-09-16',
        '2022-09-16 16:49:53', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('a3b5fab0f6f1c9ba237575d80f8a81a4', 'admin', '2', 'sysJob-1', 'monezhao', '2022-09-16', '2022-09-16 16:49:53',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('a4bc4c962a1aef5aa0c87a37e80d3ece', 'queryRole', '1', 'statement', 'monezhao', '2022-11-23',
        '2022-11-23 10:44:01', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('a94f04520e24f7c2725084496adc7394', 'admin', '2', 'sysMenu-3', 'monezhao', '2022-09-16', '2022-09-16 16:49:53',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('a9c3275a5e6e6a0293946ee03e516675', 'admin', '1', 'sysMenu', 'monezhao', '2022-09-16', '2022-09-16 16:49:53',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('ae8b17d13b4211aa39ece70219c743b5', 'admin', '1', 'flowable', 'monezhao', '2022-09-16', '2022-09-16 16:49:53',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('b095f0b849786e8665eff2d1f2d0193d', 'admin', '2', 'flowableModel-1', 'monezhao', '2022-09-16',
        '2022-09-16 16:49:53', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('b3cfedc58dcb7683245c6fc72ec41b9b', 'admin', '1', 'detailTable', 'monezhao', '2022-09-16',
        '2022-09-16 16:49:53', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('b858d856a167d7b88409c90936233526', 'admin', '2', 'sysCodeInfo-1', 'monezhao', '2022-09-16',
        '2022-09-16 16:49:53', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('bb5dd543feb81320d8309d996433d1ee', 'admin', '2', 'sysBalanceMain-1', 'monezhao', '2022-09-16',
        '2022-09-16 16:49:53', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('be0df4c8de1274ee805d8b413ff18480', 'admin', '1', 'flowableProcessInstance', 'monezhao', '2022-09-16',
        '2022-09-16 16:49:53', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('bf001afb392b4411ff85d4870dc27053', 'admin', '2', 'sysUser-3', 'monezhao', '2022-09-16', '2022-09-16 16:49:53',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('bf34c89c9696fbbd231eed54894e8aa2', 'admin', '2', 'sysCodeCreate-3', 'monezhao', '2022-09-16',
        '2022-09-16 16:49:53', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('c2adc7200cc19d764defb51e00d7b98b', 'queryRole', '1', 'sysBalanceCount', 'monezhao', '2022-11-23',
        '2022-11-23 10:44:01', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('c443a8f0761a75c913c4ed63fe3d809c', 'admin', '2', 'flowableProcessDefinition-5', 'monezhao', '2022-09-16',
        '2022-09-16 16:49:53', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('c67d0a93c1c201e1559f7bdc4d756d3b', 'admin', '2', 'flowableProcessInstance-3', 'monezhao', '2022-09-16',
        '2022-09-16 16:49:53', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('c69965269bbab949670c1dc8d7c9d048', 'admin', '2', 'sysCodeCreate-4', 'monezhao', '2022-09-16',
        '2022-09-16 16:49:53', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('c996a3df44261a99851ab1265d7f0b7e', 'admin', '2', 'flowableModel-5', 'monezhao', '2022-09-16',
        '2022-09-16 16:49:53', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('cb5f6a07900348fc6d86c16d89151cdf', 'admin', '1', 'monitor', 'monezhao', '2022-09-16', '2022-09-16 16:49:53',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('cbe331fae2dfaaed852b4bc6159711da', 'admin', '1', 'statementTable', 'monezhao', '2022-09-16',
        '2022-09-16 16:49:53', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('cdc7184eb6c19e4c8e392ad3663732a8', 'queryRole', '2', 'sysBalanceCount-2', 'monezhao', '2022-11-23',
        '2022-11-23 10:44:01', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('cf2e5576b26d37066bc4e09aa637531b', 'admin', '2', 'sysJob-2', 'monezhao', '2022-09-16', '2022-09-16 16:49:53',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('d44207f5375a2f03149954c8f0924e9c', 'admin', '2', 'sysMenu-2', 'monezhao', '2022-09-16', '2022-09-16 16:49:53',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('d5ff1af604ec2eea4353d4c5a471eb39', 'admin', '2', 'sysBalanceCount-2', 'monezhao', '2022-09-16',
        '2022-09-16 16:49:53', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('d63276677edc858464069c07af179341', 'admin', '2', 'sysConfig-1', 'monezhao', '2022-09-16',
        '2022-09-16 16:49:53', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('d6b48664857ab6a3059c651e8e69db32', 'admin', '2', 'flowableProcessDefinition-4', 'monezhao', '2022-09-16',
        '2022-09-16 16:49:53', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('d8f1dd8fd915b298f36eee428227bd1f', 'admin', '2', 'sysJob-3', 'monezhao', '2022-09-16', '2022-09-16 16:49:53',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('e21bb68b970d9ce135c728d7a86074c7', 'queryRole', '2', 'sysBalanceMain-2', 'monezhao', '2022-11-23',
        '2022-11-23 10:44:01', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('e3de36b2d39e2d5c4d39345825871e3d', 'admin', '2', 'sysOrg-2', 'monezhao', '2022-09-16', '2022-09-16 16:49:53',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('e5a0c546364cabf0a9f56fa21f307168', 'queryRole', '2', 'sysBalanceMain-1', 'monezhao', '2022-11-23',
        '2022-11-23 10:44:01', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('e5e0e3f37265033594abc80d3ef6712a', 'admin', '1', 'sysRole', 'monezhao', '2022-09-16', '2022-09-16 16:49:53',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('e86d3a07ffb27dd4349f9ebddc4369fa', 'admin', '2', 'flowableForm-1', 'monezhao', '2022-09-16',
        '2022-09-16 16:49:53', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('e931cb462a4f1b5addf663f796a8204a', 'admin', '1', 'monitorSwagger', 'monezhao', '2022-09-16',
        '2022-09-16 16:49:53', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('e9cc73e9efdf4807413b9c1e600d9c9b', 'admin', '2', 'sysConfig-3', 'monezhao', '2022-09-16',
        '2022-09-16 16:49:53', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('e9def99d92ed14cdb2be708fde050a21', 'queryRole', '1', 'detailTable', 'monezhao', '2022-11-23',
        '2022-11-23 10:44:01', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('eb6a686c83f567fd27ce63a5f69b8faf', 'admin', '2', 'sysCodeInfo-4', 'monezhao', '2022-09-16',
        '2022-09-16 16:49:53', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('edb2ec70da232883b29dc2b2dd2080f2', 'admin', '2', 'sysFunc-1', 'monezhao', '2022-09-16', '2022-09-16 16:49:53',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('f5c5b4454719ac0fb9649b1777837aa2', 'admin', '2', '98b38d14e31700a4e5b70967ba0d2db0', 'monezhao', '2022-09-16',
        '2022-09-16 16:49:53', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('f6cb636f7a5be8016e0e9dab9543b6f2', 'admin', '2', 'flowableProcessInstance-2', 'monezhao', '2022-09-16',
        '2022-09-16 16:49:53', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission` (`role_permission_id`, `role_id`, `permission_type`, `menu_or_func_id`, `create_by`,
                                     `create_date`, `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('faa40a0fc521615b32c1e87e0dcf8015', 'admin', '2', 'flowableProcessDefinition-1', 'monezhao', '2022-09-16',
        '2022-09-16 16:49:53', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_sys_role_user
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_role_user`;
CREATE TABLE `t_sys_role_user`
(
    `role_user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'UUID',
    `role_id`      varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色ID',
    `user_id`      varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户ID',
    `create_by`    varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
    `create_date`  date                                                         DEFAULT NULL COMMENT '创建日期',
    `create_time`  timestamp NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`    varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
    `update_date`  date                                                         DEFAULT NULL COMMENT '修改日期',
    `update_time`  timestamp NULL DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`role_user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='SYS11_角色和用户关系表';

-- ----------------------------
-- Records of t_sys_role_user
-- ----------------------------
BEGIN;
INSERT INTO `t_sys_role_user` (`role_user_id`, `role_id`, `user_id`, `create_by`, `create_date`, `create_time`,
                               `update_by`, `update_date`, `update_time`)
VALUES ('admin-admin', 'admin', 'admin', 'admin', '2020-03-17', '2020-03-17 14:11:29', NULL, NULL, NULL);
INSERT INTO `t_sys_role_user` (`role_user_id`, `role_id`, `user_id`, `create_by`, `create_date`, `create_time`,
                               `update_by`, `update_date`, `update_time`)
VALUES ('admin-monezhao', 'admin', 'monezhao', 'admin', '2021-09-14', '2021-09-14 10:52:00', NULL, NULL, NULL);
INSERT INTO `t_sys_role_user` (`role_user_id`, `role_id`, `user_id`, `create_by`, `create_date`, `create_time`,
                               `update_by`, `update_date`, `update_time`)
VALUES ('queryRole-monezhao', 'queryRole', 'monezhao', 'admin', '2020-06-12', '2020-06-12 11:07:42', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_sys_user
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_user`;
CREATE TABLE `t_sys_user`
(
    `user_id`     varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '用户ID',
    `user_name`   varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户姓名',
    `password`    varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
    `salt`        varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   DEFAULT NULL COMMENT '密码盐',
    `sex`         varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   DEFAULT NULL COMMENT '性别',
    `role_id`     varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '所属角色ID',
    `org_id`      varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '所属机构ID',
    `mobile`      varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '手机号码',
    `id_card_no`  varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '身份证号码',
    `email`       varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
    `status`      varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   DEFAULT NULL COMMENT '用户状态',
    `sort_no`     int(11) DEFAULT NULL COMMENT '排序号',
    `pic_id`      varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '头像id',
    `remark`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
    `create_by`   varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '创建人',
    `create_date` date                                                          DEFAULT NULL COMMENT '创建日期',
    `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '修改人',
    `update_date` date                                                          DEFAULT NULL COMMENT '修改日期',
    `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`user_id`) USING BTREE,
    UNIQUE KEY `unique_user_name` (`user_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='SYS10_用户表';

-- ----------------------------
-- Records of t_sys_user
-- ----------------------------
BEGIN;
INSERT INTO `t_sys_user` (`user_id`, `user_name`, `password`, `salt`, `sex`, `role_id`, `org_id`, `mobile`,
                          `id_card_no`, `email`, `status`, `sort_no`, `pic_id`, `remark`, `create_by`, `create_date`,
                          `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('admin', 'admin', '99f8090e4ca3c97db6d806c6b263b4daf402703121a1c5622b3f17dbde64feaa', '1tw8Yj3S', '1', 'admin',
        '1000000000', '18888888888', 'xxx', 'xxx@yyy.zz', '1', 1, NULL, '1', NULL, NULL, NULL, 'admin', '2020-06-08',
        '2020-06-08 06:52:30');
INSERT INTO `t_sys_user` (`user_id`, `user_name`, `password`, `salt`, `sex`, `role_id`, `org_id`, `mobile`,
                          `id_card_no`, `email`, `status`, `sort_no`, `pic_id`, `remark`, `create_by`, `create_date`,
                          `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('monezhao', '赵一鸣', 'a0fff4cc61b70e2cf83de42da872d4b90edfc05b6f47476f87779c70c0824677', 'dGTuqdRI', '1',
        'admin', '1000000000', 'x', 'x', 'x', '1', 2, '8a4579a1d8502b75d312a768e0bbd1c0', '', 'admin', '2020-06-12',
        '2020-06-12 11:07:42', 'monezhao', '2022-12-20', '2022-12-20 17:22:26');
COMMIT;

-- ----------------------------
-- Table structure for t_sys_user_short_cut
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_user_short_cut`;
CREATE TABLE `t_sys_user_short_cut`
(
    `user_short_cut_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作权限ID',
    `user_id`           varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户ID',
    `role_id`           varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色ID',
    `menu_id`           varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单ID',
    `create_by`         varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
    `create_date`       date                                                         DEFAULT NULL COMMENT '创建日期',
    `create_time`       datetime                                                     DEFAULT NULL COMMENT '创建时间',
    `update_by`         varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
    `update_date`       date                                                         DEFAULT NULL COMMENT '修改日期',
    `update_time`       datetime                                                     DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`user_short_cut_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='shortcut_用户与快捷方式表';

-- ----------------------------
-- Records of t_sys_user_short_cut
-- ----------------------------
BEGIN;
INSERT INTO `t_sys_user_short_cut` (`user_short_cut_id`, `user_id`, `role_id`, `menu_id`, `create_by`, `create_date`,
                                    `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('177a6ab5df8e93243163aad59a7c5b7d', 'monezhao', 'queryRole', 'sysBalanceCount', 'monezhao', '2022-08-15',
        '2022-08-15 14:41:45', NULL, NULL, NULL);
INSERT INTO `t_sys_user_short_cut` (`user_short_cut_id`, `user_id`, `role_id`, `menu_id`, `create_by`, `create_date`,
                                    `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('1bf5e4f66debe377574bfda88034947e', 'monezhao', 'admin', 'sysRole', 'monezhao', '2022-08-15',
        '2022-08-15 14:41:37', NULL, NULL, NULL);
INSERT INTO `t_sys_user_short_cut` (`user_short_cut_id`, `user_id`, `role_id`, `menu_id`, `create_by`, `create_date`,
                                    `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('7050dc0fe330e3d653ccb4eb0b12293b', 'monezhao', 'admin', 'monitorServer', 'monezhao', '2022-08-15',
        '2022-08-15 14:41:37', NULL, NULL, NULL);
INSERT INTO `t_sys_user_short_cut` (`user_short_cut_id`, `user_id`, `role_id`, `menu_id`, `create_by`, `create_date`,
                                    `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('a3788fa9f4c78d868569c5e1492770b5', 'monezhao', 'admin', 'sysLog', 'monezhao', '2022-08-15',
        '2022-08-15 14:41:37', NULL, NULL, NULL);
INSERT INTO `t_sys_user_short_cut` (`user_short_cut_id`, `user_id`, `role_id`, `menu_id`, `create_by`, `create_date`,
                                    `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('cbf415e33b7e3304fb456d48a0f26fb6', 'monezhao', 'queryRole', 'sysBalanceMain', 'monezhao', '2022-08-15',
        '2022-08-15 14:41:45', NULL, NULL, NULL);
INSERT INTO `t_sys_user_short_cut` (`user_short_cut_id`, `user_id`, `role_id`, `menu_id`, `create_by`, `create_date`,
                                    `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('d4f2f73875fbca4add8bdc387337f7da', 'monezhao', 'admin', 'monitorDruid', 'monezhao', '2022-08-15',
        '2022-08-15 14:41:37', NULL, NULL, NULL);
INSERT INTO `t_sys_user_short_cut` (`user_short_cut_id`, `user_id`, `role_id`, `menu_id`, `create_by`, `create_date`,
                                    `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('ecfa1a23a9b305d9b485dbe805507841', 'monezhao', 'queryRole', 'detailTable', 'monezhao', '2022-08-15',
        '2022-08-15 14:41:45', NULL, NULL, NULL);
INSERT INTO `t_sys_user_short_cut` (`user_short_cut_id`, `user_id`, `role_id`, `menu_id`, `create_by`, `create_date`,
                                    `create_time`, `update_by`, `update_date`, `update_time`)
VALUES ('f5f6535bd2ea80f7ca11e966bac3bb8b', 'monezhao', 'queryRole', 'statementTable', 'monezhao', '2022-08-15',
        '2022-08-15 14:41:45', NULL, NULL, NULL);
COMMIT;

SET
FOREIGN_KEY_CHECKS = 1;
