/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : localhost:3306
 Source Schema         : manager

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 06/07/2020 22:56:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for QRTZ_BLOB_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
CREATE TABLE `QRTZ_BLOB_TRIGGERS`
(
    `SCHED_NAME`    varchar(120) NOT NULL,
    `TRIGGER_NAME`  varchar(190) NOT NULL,
    `TRIGGER_GROUP` varchar(190) NOT NULL,
    `BLOB_DATA`     blob,
    PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`),
    KEY `SCHED_NAME` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`),
    CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Records of QRTZ_BLOB_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_CALENDARS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
CREATE TABLE `QRTZ_CALENDARS`
(
    `SCHED_NAME`    varchar(120) NOT NULL,
    `CALENDAR_NAME` varchar(190) NOT NULL,
    `CALENDAR`      blob         NOT NULL,
    PRIMARY KEY (`SCHED_NAME`, `CALENDAR_NAME`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Records of QRTZ_CALENDARS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_CRON_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS`
(
    `SCHED_NAME`      varchar(120) NOT NULL,
    `TRIGGER_NAME`    varchar(190) NOT NULL,
    `TRIGGER_GROUP`   varchar(190) NOT NULL,
    `CRON_EXPRESSION` varchar(120) NOT NULL,
    `TIME_ZONE_ID`    varchar(80) DEFAULT NULL,
    PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`),
    CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Records of QRTZ_CRON_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_FIRED_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS`
(
    `SCHED_NAME`        varchar(120) NOT NULL,
    `ENTRY_ID`          varchar(95)  NOT NULL,
    `TRIGGER_NAME`      varchar(190) NOT NULL,
    `TRIGGER_GROUP`     varchar(190) NOT NULL,
    `INSTANCE_NAME`     varchar(190) NOT NULL,
    `FIRED_TIME`        bigint(13)   NOT NULL,
    `SCHED_TIME`        bigint(13)   NOT NULL,
    `PRIORITY`          int(11)      NOT NULL,
    `STATE`             varchar(16)  NOT NULL,
    `JOB_NAME`          varchar(190) DEFAULT NULL,
    `JOB_GROUP`         varchar(190) DEFAULT NULL,
    `IS_NONCONCURRENT`  varchar(1)   DEFAULT NULL,
    `REQUESTS_RECOVERY` varchar(1)   DEFAULT NULL,
    PRIMARY KEY (`SCHED_NAME`, `ENTRY_ID`),
    KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`, `INSTANCE_NAME`),
    KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`, `INSTANCE_NAME`, `REQUESTS_RECOVERY`),
    KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`),
    KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`, `JOB_GROUP`),
    KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`),
    KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`, `TRIGGER_GROUP`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Records of QRTZ_FIRED_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_JOB_DETAILS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS`
(
    `SCHED_NAME`        varchar(120) NOT NULL,
    `JOB_NAME`          varchar(190) NOT NULL,
    `JOB_GROUP`         varchar(190) NOT NULL,
    `DESCRIPTION`       varchar(250) DEFAULT NULL,
    `JOB_CLASS_NAME`    varchar(250) NOT NULL,
    `IS_DURABLE`        varchar(1)   NOT NULL,
    `IS_NONCONCURRENT`  varchar(1)   NOT NULL,
    `IS_UPDATE_DATA`    varchar(1)   NOT NULL,
    `REQUESTS_RECOVERY` varchar(1)   NOT NULL,
    `JOB_DATA`          blob,
    PRIMARY KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`),
    KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`, `REQUESTS_RECOVERY`),
    KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`, `JOB_GROUP`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Records of QRTZ_JOB_DETAILS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_LOCKS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS`
(
    `SCHED_NAME` varchar(120) NOT NULL,
    `LOCK_NAME`  varchar(40)  NOT NULL,
    PRIMARY KEY (`SCHED_NAME`, `LOCK_NAME`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Records of QRTZ_LOCKS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS`
(
    `SCHED_NAME`    varchar(120) NOT NULL,
    `TRIGGER_GROUP` varchar(190) NOT NULL,
    PRIMARY KEY (`SCHED_NAME`, `TRIGGER_GROUP`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Records of QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SCHEDULER_STATE
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE`
(
    `SCHED_NAME`        varchar(120) NOT NULL,
    `INSTANCE_NAME`     varchar(190) NOT NULL,
    `LAST_CHECKIN_TIME` bigint(13)   NOT NULL,
    `CHECKIN_INTERVAL`  bigint(13)   NOT NULL,
    PRIMARY KEY (`SCHED_NAME`, `INSTANCE_NAME`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Records of QRTZ_SCHEDULER_STATE
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS`
(
    `SCHED_NAME`      varchar(120) NOT NULL,
    `TRIGGER_NAME`    varchar(190) NOT NULL,
    `TRIGGER_GROUP`   varchar(190) NOT NULL,
    `REPEAT_COUNT`    bigint(7)    NOT NULL,
    `REPEAT_INTERVAL` bigint(12)   NOT NULL,
    `TIMES_TRIGGERED` bigint(10)   NOT NULL,
    PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`),
    CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Records of QRTZ_SIMPLE_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS`
(
    `SCHED_NAME`    varchar(120) NOT NULL,
    `TRIGGER_NAME`  varchar(190) NOT NULL,
    `TRIGGER_GROUP` varchar(190) NOT NULL,
    `STR_PROP_1`    varchar(512)   DEFAULT NULL,
    `STR_PROP_2`    varchar(512)   DEFAULT NULL,
    `STR_PROP_3`    varchar(512)   DEFAULT NULL,
    `INT_PROP_1`    int(11)        DEFAULT NULL,
    `INT_PROP_2`    int(11)        DEFAULT NULL,
    `LONG_PROP_1`   bigint(20)     DEFAULT NULL,
    `LONG_PROP_2`   bigint(20)     DEFAULT NULL,
    `DEC_PROP_1`    decimal(13, 4) DEFAULT NULL,
    `DEC_PROP_2`    decimal(13, 4) DEFAULT NULL,
    `BOOL_PROP_1`   varchar(1)     DEFAULT NULL,
    `BOOL_PROP_2`   varchar(1)     DEFAULT NULL,
    PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`),
    CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Records of QRTZ_SIMPROP_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS`
(
    `SCHED_NAME`     varchar(120) NOT NULL,
    `TRIGGER_NAME`   varchar(190) NOT NULL,
    `TRIGGER_GROUP`  varchar(190) NOT NULL,
    `JOB_NAME`       varchar(190) NOT NULL,
    `JOB_GROUP`      varchar(190) NOT NULL,
    `DESCRIPTION`    varchar(250) DEFAULT NULL,
    `NEXT_FIRE_TIME` bigint(13)   DEFAULT NULL,
    `PREV_FIRE_TIME` bigint(13)   DEFAULT NULL,
    `PRIORITY`       int(11)      DEFAULT NULL,
    `TRIGGER_STATE`  varchar(16)  NOT NULL,
    `TRIGGER_TYPE`   varchar(8)   NOT NULL,
    `START_TIME`     bigint(13)   NOT NULL,
    `END_TIME`       bigint(13)   DEFAULT NULL,
    `CALENDAR_NAME`  varchar(190) DEFAULT NULL,
    `MISFIRE_INSTR`  smallint(2)  DEFAULT NULL,
    `JOB_DATA`       blob,
    PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`),
    KEY `IDX_QRTZ_T_J` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`),
    KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`, `JOB_GROUP`),
    KEY `IDX_QRTZ_T_C` (`SCHED_NAME`, `CALENDAR_NAME`),
    KEY `IDX_QRTZ_T_G` (`SCHED_NAME`, `TRIGGER_GROUP`),
    KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`, `TRIGGER_STATE`),
    KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`),
    KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`),
    KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`, `NEXT_FIRE_TIME`),
    KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`, `TRIGGER_STATE`, `NEXT_FIRE_TIME`),
    KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`),
    KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_STATE`),
    KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_GROUP`,
                                         `TRIGGER_STATE`),
    CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `QRTZ_JOB_DETAILS` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Records of QRTZ_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for t_sys_balance_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_balance_detail`;
CREATE TABLE `t_sys_balance_detail`
(
    `balance_detail_id` varchar(32)   NOT NULL COMMENT '主键id',
    `account`           double(12, 2) NOT NULL COMMENT '账户余额',
    `account_type`      varchar(4)    NOT NULL COMMENT '账户类型',
    `balance_main_id`   varchar(32)   NOT NULL COMMENT '主表id',
    `remark`            varchar(255) DEFAULT NULL COMMENT '备注',
    `create_by`         varchar(32)  DEFAULT NULL COMMENT '创建人',
    `create_date`       date         DEFAULT NULL COMMENT '创建日期',
    `create_time`       datetime     DEFAULT NULL COMMENT '创建时间',
    `update_by`         varchar(32)  DEFAULT NULL COMMENT '修改人',
    `update_date`       date         DEFAULT NULL COMMENT '修改日期',
    `update_time`       datetime     DEFAULT NULL COMMENT '修改时间',
    `delete_type`       int(1)       DEFAULT NULL COMMENT '0 不删除 1 删除',
    PRIMARY KEY (`balance_detail_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='SYS18_账户明细表';

-- ----------------------------
-- Records of t_sys_balance_detail
-- ----------------------------

-- ----------------------------
-- Table structure for t_sys_balance_main
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_balance_main`;
CREATE TABLE `t_sys_balance_main`
(
    `balance_main_id` varchar(32)   NOT NULL COMMENT '主键id',
    `account`         double(12, 2) NOT NULL COMMENT '账户余额',
    `account_date`    date          NOT NULL COMMENT '记录时间',
    `user_id`         varchar(32)   NOT NULL COMMENT '所属用户',
    `remark`          varchar(255) DEFAULT NULL COMMENT '备注',
    `create_by`       varchar(32)  DEFAULT NULL COMMENT '创建人',
    `create_date`     date         DEFAULT NULL COMMENT '创建日期',
    `create_time`     datetime     DEFAULT NULL COMMENT '创建时间',
    `update_by`       varchar(32)  DEFAULT NULL COMMENT '修改人',
    `update_date`     date         DEFAULT NULL COMMENT '修改日期',
    `update_time`     datetime     DEFAULT NULL COMMENT '修改时间',
    `delete_type`     int(1)       DEFAULT NULL COMMENT '0 不删除 1 删除',
    PRIMARY KEY (`balance_main_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='SYS17_账户余额主表';

-- ----------------------------
-- Records of t_sys_balance_main
-- ----------------------------

-- ----------------------------
-- Table structure for t_sys_code_info
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_code_info`;
CREATE TABLE `t_sys_code_info`
(
    `code_info_id` varchar(32)  NOT NULL COMMENT '代码信息ID',
    `code_type_id` varchar(32)  NOT NULL COMMENT '代码类别ID',
    `value`        varchar(100) NOT NULL COMMENT '下拉框值',
    `content`      varchar(100) NOT NULL COMMENT '下拉框内容',
    `parent_value` varchar(100)      DEFAULT NULL COMMENT '上级联动下拉框值',
    `sort_no`      int(11)      NOT NULL COMMENT '排序号',
    `remark`       varchar(255)      DEFAULT NULL COMMENT '备注',
    `is_ok`        varchar(1)        DEFAULT NULL COMMENT '是否显示',
    `create_by`    varchar(32)       DEFAULT NULL COMMENT '创建人',
    `create_date`  date              DEFAULT NULL COMMENT '创建日期',
    `create_time`  timestamp    NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`    varchar(32)       DEFAULT NULL COMMENT '修改人',
    `update_date`  date              DEFAULT NULL COMMENT '修改日期',
    `update_time`  timestamp    NULL DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`code_info_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='SYS03_代码信息表';

-- ----------------------------
-- Records of t_sys_code_info
-- ----------------------------
BEGIN;
INSERT INTO `t_sys_code_info`
VALUES ('balanceType-0', 'balanceType', '0', '支付宝', '', 0, '', '1', 'admin', '2020-06-08', '2020-06-08 08:57:50', NULL,
        NULL, NULL);
INSERT INTO `t_sys_code_info`
VALUES ('balanceType-1', 'balanceType', '1', '微信钱包', '', 1, '', '1', 'admin', '2020-06-08', '2020-06-08 08:58:26', NULL,
        NULL, NULL);
INSERT INTO `t_sys_code_info`
VALUES ('balanceType-2', 'balanceType', '2', '京东金融', '', 2, '', '1', 'admin', '2020-06-08', '2020-06-08 08:58:26', NULL,
        NULL, NULL);
INSERT INTO `t_sys_code_info`
VALUES ('balanceType-3', 'balanceType', '3', '翼支付', '', 3, '', '1', 'admin', '2020-06-08', '2020-06-08 08:58:26', NULL,
        NULL, NULL);
INSERT INTO `t_sys_code_info`
VALUES ('balanceType-4', 'balanceType', '4', '招商银行', '', 4, '', '1', 'admin', '2020-06-08', '2020-06-08 08:58:26', NULL,
        NULL, NULL);
INSERT INTO `t_sys_code_info`
VALUES ('balanceType-5', 'balanceType', '5', '建设银行', '', 5, '', '1', 'admin', '2020-06-08', '2020-06-08 08:58:26', NULL,
        NULL, NULL);
INSERT INTO `t_sys_code_info`
VALUES ('balanceType-6', 'balanceType', '6', '农业银行', '', 6, '', '1', 'admin', '2020-06-08', '2020-06-08 08:58:26', NULL,
        NULL, NULL);
INSERT INTO `t_sys_code_info`
VALUES ('balanceType-7', 'balanceType', '7', '工商银行', '', 7, '', '1', 'admin', '2020-06-08', '2020-06-08 08:58:26', NULL,
        NULL, NULL);
INSERT INTO `t_sys_code_info`
VALUES ('balanceType-8', 'balanceType', '8', '邮储银行', '', 8, '', '1', 'admin', '2020-06-08', '2020-06-08 08:58:26', NULL,
        NULL, NULL);
INSERT INTO `t_sys_code_info`
VALUES ('balanceType-9', 'balanceType', '9', '平安银行', '', 9, '', '1', 'admin', '2020-06-08', '2020-06-08 08:58:26', NULL,
        NULL, NULL);
INSERT INTO `t_sys_code_info`
VALUES ('entityType-1', 'entityType', '1', '角色', '', 1, '', '1', 'admin', '2019-09-01', '2019-09-01 11:40:55', NULL,
        NULL, NULL);
INSERT INTO `t_sys_code_info`
VALUES ('entityType-2', 'entityType', '2', '用户', '', 2, '', '1', 'admin', '2019-09-01', '2019-09-01 11:41:12', NULL,
        NULL, NULL);
INSERT INTO `t_sys_code_info`
VALUES ('identityType-1', 'identityType', '1', '用户', '', 1, '', '1', 'admin', '2020-03-01', '2020-03-01 19:14:27', NULL,
        NULL, NULL);
INSERT INTO `t_sys_code_info`
VALUES ('identityType-2', 'identityType', '2', '岗位', '', 2, '', '1', 'admin', '2020-03-01', '2020-03-01 19:14:53',
        'admin', '2020-04-20', '2020-04-20 20:31:24');
INSERT INTO `t_sys_code_info`
VALUES ('logType-1', 'logType', '1', '登录日志', '', 1, '', '1', 'user2', '2019-09-03', '2019-09-03 00:52:34', NULL, NULL,
        NULL);
INSERT INTO `t_sys_code_info`
VALUES ('logType-2', 'logType', '2', '操作日志', '', 2, '', '1', 'user2', '2019-09-03', '2019-09-03 00:52:56', NULL, NULL,
        NULL);
INSERT INTO `t_sys_code_info`
VALUES ('misfirePolicy-0', 'misfirePolicy', '0', '默认', '', 0, '', '1', 'admin', '2020-04-26', '2020-04-26 23:56:39',
        NULL, NULL, NULL);
INSERT INTO `t_sys_code_info`
VALUES ('misfirePolicy-1', 'misfirePolicy', '1', '立即触发执行', '', 1, '', '1', 'admin', '2020-04-26', '2020-04-26 23:57:25',
        NULL, NULL, NULL);
INSERT INTO `t_sys_code_info`
VALUES ('misfirePolicy-2', 'misfirePolicy', '2', '触发一次执行', '', 2, '', '1', 'admin', '2020-04-26', '2020-04-26 23:57:41',
        NULL, NULL, NULL);
INSERT INTO `t_sys_code_info`
VALUES ('misfirePolicy-3', 'misfirePolicy', '3', '不触发立即执行', '', 3, '', '1', 'admin', '2020-04-26',
        '2020-04-26 23:58:03', NULL, NULL, NULL);
INSERT INTO `t_sys_code_info`
VALUES ('orgLevel-1', 'orgLevel', '1', '一级', NULL, 1, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_code_info`
VALUES ('orgLevel-2', 'orgLevel', '2', '二级', '', 2, '', '1', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_code_info`
VALUES ('orgLevel-3', 'orgLevel', '3', '三级', '', 3, '', '1', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_code_info`
VALUES ('orgLevel-4', 'orgLevel', '4', '四级', '', 4, '', '1', 'admin', '2019-09-07', '2019-09-07 21:09:18', NULL, NULL,
        NULL);
INSERT INTO `t_sys_code_info`
VALUES ('orgType-1', 'orgType', '1', '普通机构', NULL, 1, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_code_info`
VALUES ('orgType-2', 'orgType', '2', '部门', '', 2, '', '1', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_code_info`
VALUES ('sourceStrategy-1', 'sourceStrategy', '1', '用户录入', '', 1, '', '1', 'admin', '2019-09-01', '2019-09-01 13:58:04',
        NULL, NULL, NULL);
INSERT INTO `t_sys_code_info`
VALUES ('sourceStrategy-2', 'sourceStrategy', '2', '系统提供', '', 2, '', '1', 'admin', '2019-09-01', '2019-09-01 11:40:19',
        NULL, NULL, NULL);
INSERT INTO `t_sys_code_info`
VALUES ('suspended-false', 'suspended', 'false', '激活', '', 2, '', '1', 'admin', '2020-01-12', '2020-01-12 22:01:35',
        NULL, NULL, NULL);
INSERT INTO `t_sys_code_info`
VALUES ('suspended-true', 'suspended', 'true', '挂起', '', 1, '', '1', 'admin', '2020-01-12', '2020-01-12 22:01:15', NULL,
        NULL, NULL);
INSERT INTO `t_sys_code_info`
VALUES ('trueOrFalse-0', 'trueOrFalse', 'false', '否', '', 2, '', '1', 'admin', '2020-01-06', '2020-01-06 20:32:22',
        NULL, NULL, NULL);
INSERT INTO `t_sys_code_info`
VALUES ('trueOrFalse-1', 'trueOrFalse', 'true', '是', '', 1, '', '1', 'admin', '2020-01-06', '2020-01-06 20:32:08', NULL,
        NULL, NULL);
INSERT INTO `t_sys_code_info`
VALUES ('userSex-1', 'userSex', '1', '男', '', 1, '', '1', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_code_info`
VALUES ('userSex-2', 'userSex', '2', '女', '', 2, '', '1', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_code_info`
VALUES ('userSex-3', 'userSex', '3', '保密', '', 3, '', '1', NULL, NULL, NULL, 'admin', '2020-05-28',
        '2020-05-28 08:49:44');
INSERT INTO `t_sys_code_info`
VALUES ('userStatus-1', 'userStatus', '1', '正常', '', 1, '', '1', NULL, NULL, NULL, 'admin', '2020-03-30',
        '2020-03-30 22:28:23');
INSERT INTO `t_sys_code_info`
VALUES ('userStatus-2', 'userStatus', '2', '锁定', '', 2, '', '1', NULL, NULL, NULL, 'admin', '2020-03-30',
        '2020-03-30 22:28:30');
INSERT INTO `t_sys_code_info`
VALUES ('yesOrNo-0', 'yesOrNo', '0', '否', '', 2, '', '1', 'admin', '2020-01-09', '2020-01-09 23:08:54', NULL, NULL,
        NULL);
INSERT INTO `t_sys_code_info`
VALUES ('yesOrNo-1', 'yesOrNo', '1', '是', '', 1, '', '1', NULL, NULL, NULL, 'admin', '2020-01-09',
        '2020-01-09 23:08:35');
COMMIT;

-- ----------------------------
-- Table structure for t_sys_code_type
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_code_type`;
CREATE TABLE `t_sys_code_type`
(
    `code_type_id`   varchar(32)  NOT NULL COMMENT '代码类别ID',
    `code_type_name` varchar(100) NOT NULL COMMENT '代码类别名称',
    `sort_no`        int(11)      NOT NULL COMMENT '排序号',
    `remark`         varchar(255)      DEFAULT NULL COMMENT '备注',
    `create_by`      varchar(32)       DEFAULT NULL COMMENT '创建人',
    `create_date`    date              DEFAULT NULL COMMENT '创建日期',
    `create_time`    timestamp    NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`      varchar(32)       DEFAULT NULL COMMENT '修改人',
    `update_date`    date              DEFAULT NULL COMMENT '修改日期',
    `update_time`    timestamp    NULL DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`code_type_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='SYS02_代码类别表';

-- ----------------------------
-- Records of t_sys_code_type
-- ----------------------------
BEGIN;
INSERT INTO `t_sys_code_type`
VALUES ('balanceType', '账户类型', 13, '', 'admin', '2020-06-08', '2020-06-08 08:56:34', NULL, NULL, NULL);
INSERT INTO `t_sys_code_type`
VALUES ('entityType', '实体类型', 5, '', 'admin', '2019-09-01', '2019-09-01 11:40:19', NULL, NULL, NULL);
INSERT INTO `t_sys_code_type`
VALUES ('identityType', '授权类型', 10, '', 'admin', '2020-03-01', '2020-03-01 19:13:55', NULL, NULL, NULL);
INSERT INTO `t_sys_code_type`
VALUES ('logType', '日志类型', 7, '', 'user2', '2019-09-03', '2019-09-03 00:52:09', NULL, NULL, NULL);
INSERT INTO `t_sys_code_type`
VALUES ('misfirePolicy', '计划执行错误策略', 12, '', 'admin', '2020-04-26', '2020-04-26 23:54:48', NULL, NULL, NULL);
INSERT INTO `t_sys_code_type`
VALUES ('orgLevel', '机构级别', 3, NULL, NULL, NULL, NULL, 'admin', '2019-09-01', '2019-09-01 17:06:53');
INSERT INTO `t_sys_code_type`
VALUES ('orgType', '机构类型', 4, NULL, NULL, NULL, NULL, 'admin', '2019-09-01', '2019-09-01 17:01:27');
INSERT INTO `t_sys_code_type`
VALUES ('sourceStrategy', '数据源策略', 6, '', 'admin', '2019-09-01', '2019-09-01 13:04:14', 'admin', '2019-09-01',
        '2019-09-01 17:06:49');
INSERT INTO `t_sys_code_type`
VALUES ('suspended', '状态', 9, '', 'admin', '2020-01-12', '2020-01-12 22:00:28', NULL, NULL, NULL);
INSERT INTO `t_sys_code_type`
VALUES ('trueOrFalse', '是否', 8, '', 'admin', '2020-01-06', '2020-01-06 20:28:43', 'admin', '2020-01-06',
        '2020-01-06 20:31:31');
INSERT INTO `t_sys_code_type`
VALUES ('userSex', '用户性别', 2, '', NULL, NULL, NULL, 'admin', '2019-08-21', '2019-08-21 23:27:09');
INSERT INTO `t_sys_code_type`
VALUES ('userStatus', '用户状态', 11, NULL, NULL, NULL, NULL, 'admin', '2019-09-08', '2019-09-08 14:34:34');
INSERT INTO `t_sys_code_type`
VALUES ('yesOrNo', '是否', 1, NULL, NULL, NULL, NULL, 'admin', '2019-09-08', '2019-09-08 14:34:34');
COMMIT;

-- ----------------------------
-- Table structure for t_sys_config
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_config`;
CREATE TABLE `t_sys_config`
(
    `config_id`    varchar(32)  NOT NULL COMMENT '系统参数ID',
    `config_name`  varchar(100) NOT NULL COMMENT '系统参数名称',
    `config_value` varchar(255) NOT NULL COMMENT '系统参数值',
    `sort_no`      int(11)      NOT NULL COMMENT '排序号',
    `remark`       varchar(255)      DEFAULT NULL COMMENT '备注',
    `create_by`    varchar(32)       DEFAULT NULL COMMENT '创建人',
    `create_date`  date              DEFAULT NULL COMMENT '创建日期',
    `create_time`  timestamp    NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`    varchar(32)       DEFAULT NULL COMMENT '修改人',
    `update_date`  date              DEFAULT NULL COMMENT '修改日期',
    `update_time`  timestamp    NULL DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`config_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='SYS01_系统参数表';

-- ----------------------------
-- Records of t_sys_config
-- ----------------------------
BEGIN;
INSERT INTO `t_sys_config`
VALUES ('defaultPassword', '新建用户默认密码', '1', 1, '', 'admin', '2019-09-11', '2019-09-11 23:03:25', 'admin', '2019-09-21',
        '2019-09-21 12:22:34');
COMMIT;

-- ----------------------------
-- Table structure for t_sys_func
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_func`;
CREATE TABLE `t_sys_func`
(
    `func_id`          varchar(32)  NOT NULL COMMENT '功能ID',
    `func_name`        varchar(100) NOT NULL COMMENT '功能名称',
    `menu_id`          varchar(32)  NOT NULL COMMENT '菜单ID',
    `func_permissions` varchar(255)      DEFAULT '' COMMENT '可访问路径',
    `remark`           varchar(255)      DEFAULT NULL COMMENT '备注',
    `sort_no`          int(11)           DEFAULT NULL COMMENT '排序号',
    `create_by`        varchar(32)       DEFAULT NULL COMMENT '创建人',
    `create_date`      date              DEFAULT NULL COMMENT '创建日期',
    `create_time`      timestamp    NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`        varchar(32)       DEFAULT NULL COMMENT '修改人',
    `update_date`      date              DEFAULT NULL COMMENT '修改日期',
    `update_time`      timestamp    NULL DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`func_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='SYS05_功能表';

-- ----------------------------
-- Records of t_sys_func
-- ----------------------------
BEGIN;
INSERT INTO `t_sys_func`
VALUES ('sysBalanceMain-1', '新增', 'sysBalanceMain', 'sys:balanceMain:save', '', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func`
VALUES ('sysBalanceMain-2', '修改', 'sysBalanceMain', 'sys:balanceMain:update', '', 2, NULL, NULL, NULL, NULL, NULL,
        NULL);
INSERT INTO `t_sys_func`
VALUES ('sysBalanceMain-3', '删除', 'sysBalanceMain', 'sys:balanceMain:delete', '', 3, NULL, NULL, NULL, NULL, NULL,
        NULL);
INSERT INTO `t_sys_func`
VALUES ('sysBalanceMain-4', '导出', 'sysBalanceMain', 'sys:balanceMain:export', '', 4, NULL, NULL, NULL, NULL, NULL,
        NULL);
INSERT INTO `t_sys_func`
VALUES ('sysBalanceMain-5', '导入', 'sysBalanceMain', 'sys:balanceMain:import', '', 5, NULL, NULL, NULL, NULL, NULL,
        NULL);
INSERT INTO `t_sys_func`
VALUES ('sysCodeCreate-1', '新增', 'sysCodeCreate', 'sys:codeCreate:save', '', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func`
VALUES ('sysCodeCreate-2', '修改', 'sysCodeCreate', 'sys:codeCreate:update', '', 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func`
VALUES ('sysCodeCreate-3', '删除', 'sysCodeCreate', 'sys:codeCreate:delete', '', 3, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func`
VALUES ('sysCodeCreate-4', '下载', 'sysCodeCreate', 'sys:codeCreate:export', '', 4, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func`
VALUES ('sysCodeInfo-1', '字典内容新增', 'sysCodeType', 'sys:codeInfo:save', '', 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func`
VALUES ('sysCodeInfo-2', '字典内容修改', 'sysCodeType', 'sys:codeInfo:update', '', 6, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func`
VALUES ('sysCodeInfo-3', '字典内容删除', 'sysCodeType', 'sys:codeInfo:delete', '', 7, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func`
VALUES ('sysCodeInfo-4', '字典内容列表', 'sysCodeType', 'sys:codeInfo:list', '', 4, NULL, NULL, NULL, 'admin', '2020-07-06',
        '2020-07-06 22:20:57');
INSERT INTO `t_sys_func`
VALUES ('sysCodeType-1', '数据字典新增', 'sysCodeType', 'sys:codeType:save', '', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func`
VALUES ('sysCodeType-2', '数据字典修改', 'sysCodeType', 'sys:codeType:update', '', 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func`
VALUES ('sysCodeType-3', '数据字典删除', 'sysCodeType', 'sys:codeType:delete', '', 3, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func`
VALUES ('sysConfig-1', '新增', 'sysConfig', 'sys:config:save', '', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func`
VALUES ('sysConfig-2', '修改', 'sysConfig', 'sys:config:update', '', 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func`
VALUES ('sysConfig-3', '删除', 'sysConfig', 'sys:config:delete', '', 3, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func`
VALUES ('sysFunc-1', '新增', 'sysFunc', 'sys:func:save', '', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func`
VALUES ('sysFunc-2', '修改', 'sysFunc', 'sys:func:update', '', 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func`
VALUES ('sysFunc-3', '删除', 'sysFunc', 'sys:func:delete', '', 3, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func`
VALUES ('sysJob-1', '新增', 'sysJob', 'sys:job:save', '', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func`
VALUES ('sysJob-2', '修改', 'sysJob', 'sys:job:update', '', 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func`
VALUES ('sysJob-3', '删除', 'sysJob', 'sys:job:delete', '', 3, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func`
VALUES ('sysJob-4', '激活/挂起', 'sysJob', 'sys:job:changeStatus', '', 4, 'admin', '2020-04-27', '2020-04-27 22:33:30',
        NULL, NULL, NULL);
INSERT INTO `t_sys_func`
VALUES ('sysJob-5', '立即执行', 'sysJob', 'sys:job:run', '', 5, 'admin', '2020-04-27', '2020-04-27 23:29:17', NULL, NULL,
        NULL);
INSERT INTO `t_sys_func`
VALUES ('sysMenu-1', '新增', 'sysMenu', 'sys:menu:save', '', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func`
VALUES ('sysMenu-2', '修改', 'sysMenu', 'sys:menu:update', '', 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func`
VALUES ('sysMenu-3', '删除', 'sysMenu', 'sys:menu:delete', '', 3, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func`
VALUES ('sysOrg-1', '新增', 'sysOrg', 'sys:org:save', '', 1, NULL, NULL, NULL, 'admin', '2020-05-27',
        '2020-05-27 18:23:00');
INSERT INTO `t_sys_func`
VALUES ('sysOrg-2', '修改', 'sysOrg', 'sys:org:update', '', 2, NULL, NULL, NULL, 'admin', '2020-05-27',
        '2020-05-27 18:23:09');
INSERT INTO `t_sys_func`
VALUES ('sysOrg-3', '删除', 'sysOrg', 'sys:org:delete', '', 3, NULL, NULL, NULL, 'admin', '2020-05-27',
        '2020-05-27 18:23:16');
INSERT INTO `t_sys_func`
VALUES ('sysPost-1', '新增', 'sysPost', 'sys:post:save', '', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func`
VALUES ('sysPost-2', '修改', 'sysPost', 'sys:post:update', '', 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func`
VALUES ('sysPost-3', '删除', 'sysPost', 'sys:post:delete', '', 3, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func`
VALUES ('sysPost-4', '分配用户', 'sysPost', 'sys:post:getPostUser,sys:post:savePostUsers,sys:post:deletePostUsers', '', 4,
        'admin', '2020-04-12', '2020-04-12 21:35:50', NULL, NULL, NULL);
INSERT INTO `t_sys_func`
VALUES ('sysRole-1', '新增', 'sysRole', 'sys:role:save', '', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func`
VALUES ('sysRole-2', '修改', 'sysRole', 'sys:role:update', '', 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func`
VALUES ('sysRole-3', '删除', 'sysRole', 'sys:role:delete', '', 3, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func`
VALUES ('sysRole-4', '角色授权', 'sysRole', 'sys:role:getRolePermissions,sys:role:saveRolePermissions', '', 4, NULL, NULL,
        NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func`
VALUES ('sysRole-5', '分配用户', 'sysRole', 'sys:role:getRoleUser,sys:role:saveRoleUsers,sys:role:deleteRoleUsers', '', 5,
        NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func`
VALUES ('sysUser-1', '新增', 'sysUser', 'sys:user:save,sys:org:getTreeData', '', 1, NULL, NULL, NULL, 'admin',
        '2019-09-08', '2019-09-08 17:51:12');
INSERT INTO `t_sys_func`
VALUES ('sysUser-2', '修改', 'sysUser', 'sys:user:update,sys:org:getTreeData', '', 2, NULL, NULL, NULL, 'admin',
        '2019-09-08', '2019-09-08 17:51:19');
INSERT INTO `t_sys_func`
VALUES ('sysUser-3', '删除', 'sysUser', 'sys:user:delete', '', 3, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func`
VALUES ('sysUser-4', '导出', 'sysUser', 'sys:user:export', '', 4, 'admin', '2020-05-03', '2020-05-03 11:48:01', 'admin',
        '2020-05-03', '2020-05-03 11:48:14');
COMMIT;

-- ----------------------------
-- Table structure for t_sys_job
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_job`;
CREATE TABLE `t_sys_job`
(
    `job_id`          varchar(32)  NOT NULL COMMENT '任务ID',
    `job_name`        varchar(64)  NOT NULL COMMENT '任务名称',
    `job_group`       varchar(64)  NOT NULL COMMENT '任务组名',
    `invoke_target`   varchar(500) NOT NULL COMMENT '调用目标字符串',
    `cron_expression` varchar(255) DEFAULT NULL COMMENT 'cron执行表达式',
    `misfire_policy`  varchar(20)  DEFAULT NULL COMMENT '计划执行错误策略',
    `concurrent`      varchar(1)   DEFAULT NULL COMMENT '是否并发执行',
    `status`          varchar(1)   DEFAULT NULL COMMENT '是否正常状态',
    `remark`          varchar(500) DEFAULT NULL COMMENT '备注',
    `create_by`       varchar(32)  DEFAULT NULL COMMENT '创建人',
    `create_date`     date         DEFAULT NULL COMMENT '创建日期',
    `create_time`     datetime     DEFAULT NULL COMMENT '创建时间',
    `update_by`       varchar(32)  DEFAULT NULL COMMENT '修改人',
    `update_date`     date         DEFAULT NULL COMMENT '修改日期',
    `update_time`     datetime     DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`job_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='SYS15_定时任务表';

-- ----------------------------
-- Records of t_sys_job
-- ----------------------------
BEGIN;
INSERT INTO `t_sys_job`
VALUES ('1', '测试1', '测试1', 'balanceJob.hasNoParam()', '0 0/1 * * * ?', '0', '1', '0', '', 'admin', '2020-04-27',
        '2020-04-27 00:00:21', 'admin', '2020-05-28', '2020-05-28 07:10:27');
INSERT INTO `t_sys_job`
VALUES ('2', '测试2', '测试2', 'balanceJob.hasParam(\'123\')', '0 0/1 * * * ?', '0', '1', '0', '', 'admin', '2020-04-27',
        '2020-04-27 22:02:27', 'admin', '2020-04-27', '2020-04-27 22:02:42');
INSERT INTO `t_sys_job`
VALUES ('3', '测试3', '测试3', 'balanceJob.hasMultipleParams(\'321\', true, 2000L, 316.50D, 100)', '0 0/1 * * * ?', '0',
        '1', '0', '', 'admin', '2020-04-27', '2020-04-27 22:03:01', 'admin', '2020-05-06', '2020-05-06 23:25:12');
INSERT INTO `t_sys_job`
VALUES ('4', '测试4', '测试4', 'balanceJob.saveTest()', '0/15 * * * * ?', '0', '1', '0', '', 'admin', '2020-04-27',
        '2020-04-27 22:03:19', 'admin', '2020-04-27', '2020-04-27 22:03:28');
COMMIT;

-- ----------------------------
-- Table structure for t_sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_job_log`;
CREATE TABLE `t_sys_job_log`
(
    `job_log_id`     varchar(32)  NOT NULL COMMENT '日志ID',
    `job_name`       varchar(64)  NOT NULL COMMENT '任务名称',
    `job_group`      varchar(64)  NOT NULL COMMENT '任务组名',
    `invoke_target`  varchar(500) NOT NULL COMMENT '调用目标字符串',
    `job_message`    varchar(500) DEFAULT NULL COMMENT '日志信息',
    `status`         varchar(20)  DEFAULT NULL COMMENT '是否正常执行',
    `exception_info` mediumtext COMMENT '异常信息',
    `start_time`     datetime     DEFAULT NULL COMMENT '开始时间',
    `stop_time`      datetime     DEFAULT NULL COMMENT '结束时间',
    `create_by`      varchar(32)  DEFAULT NULL COMMENT '创建人',
    `create_date`    date         DEFAULT NULL COMMENT '创建日期',
    `create_time`    datetime     DEFAULT NULL COMMENT '创建时间',
    `update_by`      varchar(32)  DEFAULT NULL COMMENT '修改人',
    `update_date`    date         DEFAULT NULL COMMENT '修改日期',
    `update_time`    datetime     DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`job_log_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='SYS16_定时任务执行日志表';

-- ----------------------------
-- Records of t_sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for t_sys_log
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_log`;
CREATE TABLE `t_sys_log`
(
    `log_id`         varchar(32)  NOT NULL COMMENT 'UUID',
    `log_type`       varchar(2)   NOT NULL COMMENT '日志类型',
    `log_content`    varchar(100) NOT NULL COMMENT '日志内容',
    `operate_type`   varchar(2)   DEFAULT NULL COMMENT '操作类型',
    `user_id`        varchar(32)  DEFAULT NULL COMMENT '操作用户',
    `user_name`      varchar(100) DEFAULT NULL COMMENT '操作用户姓名',
    `ip`             varchar(100) DEFAULT NULL COMMENT 'IP地址',
    `method`         varchar(255) DEFAULT NULL COMMENT '请求方法',
    `request_url`    varchar(255) DEFAULT NULL COMMENT '请求路径',
    `request_param`  text COMMENT '请求参数',
    `request_type`   varchar(10)  DEFAULT NULL COMMENT '请求类型',
    `operate_result` text COMMENT '操作结果',
    `cost_time`      bigint(20)   DEFAULT NULL COMMENT '耗时',
    `create_by`      varchar(32)  DEFAULT NULL COMMENT '创建人',
    `create_date`    date         DEFAULT NULL COMMENT '创建日期',
    `create_time`    datetime     DEFAULT NULL COMMENT '创建时间',
    `update_by`      varchar(32)  DEFAULT NULL COMMENT '修改人',
    `update_date`    date         DEFAULT NULL COMMENT '修改日期',
    `update_time`    datetime     DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`log_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='SYS12_系统日志表';

-- ----------------------------
-- Records of t_sys_log
-- ----------------------------

-- ----------------------------
-- Table structure for t_sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_menu`;
CREATE TABLE `t_sys_menu`
(
    `menu_id`          varchar(32)  NOT NULL COMMENT '菜单ID',
    `menu_name`        varchar(100) NOT NULL COMMENT '菜单名称',
    `parent_menu_id`   varchar(32)       DEFAULT NULL COMMENT '上级菜单ID',
    `menu_icon`        varchar(100)      DEFAULT NULL COMMENT '图标',
    `menu_url`         varchar(255)      DEFAULT NULL COMMENT '菜单URL',
    `menu_permissions` varchar(255)      DEFAULT NULL COMMENT '授权',
    `component`        varchar(255)      DEFAULT NULL COMMENT '组件',
    `redirect`         varchar(255)      DEFAULT NULL COMMENT '重定向URL',
    `hidden`           varchar(1)        DEFAULT NULL COMMENT '是否隐藏',
    `is_route`         varchar(1)        DEFAULT NULL COMMENT '是否路由',
    `route_name`       varchar(255)      DEFAULT NULL COMMENT '路由名称',
    `is_cache`         varchar(1)        DEFAULT NULL COMMENT 'tagsView是否缓存 1-缓存 0-不缓存',
    `affix`            varchar(1)        DEFAULT NULL COMMENT '是否常驻菜单1-是0-否',
    `is_leaf`          varchar(1)        DEFAULT NULL COMMENT '是否叶子节点',
    `sort_no`          int(11)           DEFAULT NULL COMMENT '排序号',
    `create_by`        varchar(32)       DEFAULT NULL COMMENT '创建人',
    `create_date`      date              DEFAULT NULL COMMENT '创建日期',
    `create_time`      timestamp    NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`        varchar(32)       DEFAULT NULL COMMENT '修改人',
    `update_date`      date              DEFAULT NULL COMMENT '修改日期',
    `update_time`      timestamp    NULL DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`menu_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='SYS04_菜单表';

-- ----------------------------
-- Records of t_sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `t_sys_menu`
VALUES ('balance', '账户余额', '', 'accountbook-fill', '/balance', '', '', '', '0', '1', '', '1', '0', '0', 30000, 'admin',
        '2020-06-11', '2020-06-11 02:27:46', 'admin', '2020-06-14', '2020-06-14 10:31:12');
INSERT INTO `t_sys_menu`
VALUES ('base', '基础资源', '', 'home', '/base', '', '', '', '0', '1', '', '1', '0', '0', 20000, 'admin', '2020-06-14',
        '2020-06-14 00:51:18', 'admin', '2020-06-14', '2020-06-14 10:35:34');
INSERT INTO `t_sys_menu`
VALUES ('job', '定时任务', '', 'time-circle-fill', '/job', '', '', '', '0', '1', '', '1', '0', '0', 40000, 'admin',
        '2020-06-14', '2020-06-14 00:44:51', 'admin', '2020-06-14', '2020-06-14 10:29:24');
INSERT INTO `t_sys_menu`
VALUES ('monitor', '监控管理', '', 'funnelplot-fill', '/monitor', '', '', '', '0', '1', '', '1', '0', '0', 50000, 'admin',
        '2020-04-13', '2020-04-13 23:13:17', 'admin', '2020-06-14', '2020-06-14 10:29:12');
INSERT INTO `t_sys_menu`
VALUES ('monitorDruid', '数据监控', 'monitor', 'database-fill', 'druid', 'monitor:druid:list',
        'views/sys/monitor/druid/index', '', '0', '1', 'MonitorDruid', '1', '0', '1', 51000, 'admin', '2020-04-13',
        '2020-04-13 23:17:22', 'admin', '2020-06-14', '2020-06-14 10:28:49');
INSERT INTO `t_sys_menu`
VALUES ('monitorServer', '服务监控', 'monitor', 'dashboard', 'server', 'monitor:server:getServerInfo',
        'views/sys/monitor/server/index', '', '0', '1', 'MonitorServer', '1', '0', '1', 52000, 'admin', '2020-04-14',
        '2020-04-14 00:06:38', 'admin', '2020-06-14', '2020-06-14 00:52:38');
INSERT INTO `t_sys_menu`
VALUES ('monitorSwagger', 'Swagger', 'monitor', 'swagger', 'swagger', 'monitor:swagger',
        'views/sys/monitor/swagger/index', '', '0', '1', 'MonitorSwagger', '1', '0', '1', 53000, 'admin', '2020-07-01',
        '2020-07-01 15:34:12', NULL, NULL, NULL);
INSERT INTO `t_sys_menu`
VALUES ('sys', '系统管理', '', 'setting-fill', '/sys', NULL, '', '', '0', '1', '', '1', '0', '0', 10000, NULL, NULL, NULL,
        'admin', '2020-06-14', '2020-06-14 10:36:55');
INSERT INTO `t_sys_menu`
VALUES ('sysBalanceMain', '余额列表', 'balance', 'orderedlist', 'balanceMain', 'sys:balanceMain:list',
        'views/sys/balanceMain/index', NULL, '0', '1', 'SysBalanceMain', '1', '0', '1', 31000, NULL, NULL, NULL,
        'admin', '2020-06-14', '2020-06-14 10:31:26');
INSERT INTO `t_sys_menu`
VALUES ('sysCodeCreate', '代码生成', 'sys', 'list', 'codeCreate', 'sys:codeCreate:list', 'views/sys/codeCreate/index', NULL,
        '0', '1', 'SysCodeCreate', '1', '0', '1', 11000, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_menu`
VALUES ('sysCodeType', '数据字典', 'sys', 'code', 'codeType', 'sys:codeType:list', 'views/sys/codeType/index', NULL, '0',
        '1', 'SysCodeType', '1', '0', '1', 10200, NULL, NULL, NULL, 'admin', '2020-07-06', '2020-07-06 21:40:28');
INSERT INTO `t_sys_menu`
VALUES ('sysConfig', '参数管理', 'sys', 'link', 'config', 'sys:config:list', 'views/sys/config/index', NULL, '0', '1',
        'SysConfig', '1', '0', '1', 10100, NULL, NULL, NULL, 'admin', '2020-06-14', '2020-06-14 10:47:06');
INSERT INTO `t_sys_menu`
VALUES ('sysFunc', '功能管理', 'sys', 'form', 'func', 'sys:func:list,sys:menu:getTreeData', 'views/sys/func/index', NULL,
        '0', '1', 'SysFunc', '1', '0', '1', 10500, NULL, NULL, NULL, 'admin', '2020-06-14', '2020-06-14 10:40:07');
INSERT INTO `t_sys_menu`
VALUES ('sysJob', '定时任务', 'job', 'build-fill', 'sysJob', 'sys:job:list', 'views/sys/job/index', NULL, '0', '1',
        'SysJob', '1', '0', '1', 41000, NULL, NULL, NULL, 'admin', '2020-06-14', '2020-06-14 10:30:55');
INSERT INTO `t_sys_menu`
VALUES ('sysJobLog', '定时任务日志', 'job', 'list', 'sysJobLog', 'sys:jobLog:list', 'views/sys/jobLog/index', NULL, '0', '1',
        'SysJobLog', '1', '0', '1', 42000, NULL, NULL, NULL, 'admin', '2020-06-14', '2020-06-14 10:30:18');
INSERT INTO `t_sys_menu`
VALUES ('sysLog', '系统日志', 'sys', 'read-fill', 'log', 'sys:log:list', 'views/sys/log/index', NULL, '0', '1', 'SysLog',
        '1', '0', '1', 10900, NULL, NULL, NULL, 'admin', '2020-06-14', '2020-06-14 10:43:00');
INSERT INTO `t_sys_menu`
VALUES ('sysMenu', '菜单管理', 'sys', 'menu', 'menu', 'sys:menu:list,sys:menu:getTreeData', 'views/sys/menu/index', NULL,
        '0', '1', 'SysMenu', '1', '0', '1', 10400, NULL, NULL, NULL, 'admin', '2020-06-14', '2020-06-14 10:39:13');
INSERT INTO `t_sys_menu`
VALUES ('sysOrg', '机构管理', 'base', 'tree', 'org', 'sys:org:list,sys:org:getTreeData', 'views/sys/org/index', NULL, '0',
        '1', 'SysOrg', '1', '0', '1', 21000, NULL, NULL, NULL, 'admin', '2020-06-14', '2020-06-14 10:35:48');
INSERT INTO `t_sys_menu`
VALUES ('sysPost', '岗位管理', 'base', 'tools', 'post', 'sys:post:list', 'views/sys/post/index', NULL, '0', '1', 'SysPost',
        '1', '0', '1', 22000, NULL, NULL, NULL, 'admin', '2020-06-14', '2020-06-14 10:36:19');
INSERT INTO `t_sys_menu`
VALUES ('sysRole', '角色管理', 'sys', 'highlight-fill', 'role', 'sys:role:list', 'views/sys/role/index', NULL, '0', '1',
        'SysRole', '1', '0', '1', 10700, NULL, NULL, NULL, 'admin', '2020-06-14', '2020-06-14 10:41:45');
INSERT INTO `t_sys_menu`
VALUES ('sysUser', '用户管理', 'sys', 'user', 'user', 'sys:user:list,sys:role:listAll', 'views/sys/user/index', NULL, '0',
        '1', 'SysUser', '1', '0', '1', 10800, NULL, NULL, NULL, 'admin', '2020-06-14', '2020-06-14 10:40:19');
COMMIT;

-- ----------------------------
-- Table structure for t_sys_org
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_org`;
CREATE TABLE `t_sys_org`
(
    `org_id`         varchar(32)  NOT NULL COMMENT '机构ID',
    `org_name`       varchar(100) NOT NULL COMMENT '机构名称',
    `parent_org_id`  varchar(32)       DEFAULT NULL COMMENT '上级机构ID',
    `short_name`     varchar(120)      DEFAULT NULL COMMENT '机构简称',
    `org_type`       varchar(4)        DEFAULT NULL COMMENT '机构类型',
    `org_level`      varchar(2)   NOT NULL COMMENT '机构级次',
    `org_level_code` varchar(200) NOT NULL COMMENT '组织机构路径',
    `remark`         varchar(255)      DEFAULT NULL COMMENT '备注',
    `is_leaf`        varchar(1)        DEFAULT NULL COMMENT '是否叶子节点',
    `create_by`      varchar(32)       DEFAULT NULL COMMENT '创建人',
    `create_date`    date              DEFAULT NULL COMMENT '创建日期',
    `create_time`    timestamp    NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`      varchar(32)       DEFAULT NULL COMMENT '修改人',
    `update_date`    date              DEFAULT NULL COMMENT '修改日期',
    `update_time`    timestamp    NULL DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`org_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='SYS06_机构表';

-- ----------------------------
-- Records of t_sys_org
-- ----------------------------
BEGIN;
INSERT INTO `t_sys_org`
VALUES ('1000000000', '总部', '', '总部', '1', '1', '1000000000', '', '0', NULL, NULL, NULL, 'admin', '2020-05-28',
        '2020-05-28 03:12:44');
COMMIT;

-- ----------------------------
-- Table structure for t_sys_post
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_post`;
CREATE TABLE `t_sys_post`
(
    `post_id`     varchar(32)  NOT NULL COMMENT '岗位ID',
    `post_name`   varchar(255) NOT NULL COMMENT '岗位名称',
    `post_status` varchar(1)   DEFAULT NULL COMMENT '状态',
    `sort_no`     int(11)      DEFAULT NULL COMMENT '排序号',
    `remark`      varchar(255) DEFAULT NULL COMMENT '备注',
    `create_by`   varchar(32)  DEFAULT NULL COMMENT '创建人',
    `create_date` date         DEFAULT NULL COMMENT '创建日期',
    `create_time` datetime     DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(32)  DEFAULT NULL COMMENT '修改人',
    `update_date` date         DEFAULT NULL COMMENT '修改日期',
    `update_time` datetime     DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`post_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='SYS13_岗位表';

-- ----------------------------
-- Records of t_sys_post
-- ----------------------------
BEGIN;
INSERT INTO `t_sys_post`
VALUES ('boss', '老板', '1', 1, '', 'admin', '2020-04-12', '2020-04-12 20:45:42', NULL, NULL, NULL);
INSERT INTO `t_sys_post`
VALUES ('employee', '普通员工', '1', 3, '', 'admin', '2020-04-25', '2020-04-25 12:00:50', NULL, NULL, NULL);
INSERT INTO `t_sys_post`
VALUES ('manager', '经理', '1', 2, '', 'admin', '2020-04-12', '2020-04-12 20:45:24', 'admin', '2020-04-12',
        '2020-04-12 20:45:50');
COMMIT;

-- ----------------------------
-- Table structure for t_sys_post_user
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_post_user`;
CREATE TABLE `t_sys_post_user`
(
    `post_user_id` varchar(32) NOT NULL COMMENT 'UUID',
    `post_id`      varchar(32) NOT NULL COMMENT '岗位ID',
    `user_id`      varchar(32) NOT NULL COMMENT '用户ID',
    `create_by`    varchar(32) DEFAULT NULL COMMENT '创建人',
    `create_date`  date        DEFAULT NULL COMMENT '创建日期',
    `create_time`  datetime    DEFAULT NULL COMMENT '创建时间',
    `update_by`    varchar(32) DEFAULT NULL COMMENT '修改人',
    `update_date`  date        DEFAULT NULL COMMENT '修改日期',
    `update_time`  datetime    DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`post_user_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='SYS14_岗位和用户关系表';

-- ----------------------------
-- Records of t_sys_post_user
-- ----------------------------
BEGIN;
INSERT INTO `t_sys_post_user`
VALUES ('boss-admin', 'boss', 'admin', 'admin', '2020-05-27', '2020-05-27 17:46:37', NULL, NULL, NULL);
INSERT INTO `t_sys_post_user`
VALUES ('employee-admin', 'employee', 'admin', 'admin', '2020-05-27', '2020-05-27 17:47:05', NULL, NULL, NULL);
INSERT INTO `t_sys_post_user`
VALUES ('manager-admin', 'manager', 'admin', 'admin', '2020-05-27', '2020-05-27 17:46:52', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_sys_role
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_role`;
CREATE TABLE `t_sys_role`
(
    `role_id`     varchar(32)  NOT NULL COMMENT '角色ID',
    `role_name`   varchar(100) NOT NULL COMMENT '角色名称',
    `sort_no`     int(11)      NOT NULL COMMENT '排序号',
    `remark`      varchar(255)      DEFAULT NULL COMMENT '备注',
    `create_by`   varchar(32)       DEFAULT NULL COMMENT '创建人',
    `create_date` date              DEFAULT NULL COMMENT '创建日期',
    `create_time` timestamp    NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(32)       DEFAULT NULL COMMENT '修改人',
    `update_date` date              DEFAULT NULL COMMENT '修改日期',
    `update_time` timestamp    NULL DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`role_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='SYS07_角色表';

-- ----------------------------
-- Records of t_sys_role
-- ----------------------------
BEGIN;
INSERT INTO `t_sys_role`
VALUES ('admin', '系统管理员', 1, '', NULL, NULL, NULL, 'admin', '2020-06-17', '2020-06-17 06:50:53');
INSERT INTO `t_sys_role`
VALUES ('queryRole', '用户', 2, '', 'admin', '2019-09-07', '2019-09-07 21:10:19', 'admin', '2020-06-17',
        '2020-06-17 06:50:46');
COMMIT;

-- ----------------------------
-- Table structure for t_sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_role_permission`;
CREATE TABLE `t_sys_role_permission`
(
    `role_permission_id` varchar(32) NOT NULL COMMENT '操作权限ID',
    `role_id`            varchar(32) NOT NULL COMMENT '角色ID',
    `permission_type`    varchar(1)  NOT NULL COMMENT '权限类型',
    `menu_or_func_id`    varchar(32) NOT NULL COMMENT '菜单或功能ID',
    `create_by`          varchar(32)      DEFAULT NULL COMMENT '创建人',
    `create_date`        date             DEFAULT NULL COMMENT '创建日期',
    `create_time`        timestamp   NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`          varchar(32)      DEFAULT NULL COMMENT '修改人',
    `update_date`        date             DEFAULT NULL COMMENT '修改日期',
    `update_time`        timestamp   NULL DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`role_permission_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='SYS08_操作权限表';

-- ----------------------------
-- Records of t_sys_role_permission
-- ----------------------------
BEGIN;
INSERT INTO `t_sys_role_permission`
VALUES ('03a40e2995e395886e6d2fc8232aeeea', 'admin', '2', 'sysRole-2', 'admin', '2020-07-06', '2020-07-06 22:29:20',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('054a5ebe21747c426f39aa416acf3058', 'admin', '2', 'sysConfig-1', 'admin', '2020-07-06', '2020-07-06 22:29:20',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('05cdf1aadd3e808918ed934e2db6d8f8', 'admin', '2', 'sysJob-5', 'admin', '2020-07-06', '2020-07-06 22:29:20',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('0cf2f5a133169fc6ca682ee9c385d6a3', 'admin', '2', 'sysCodeType-2', 'admin', '2020-07-06', '2020-07-06 22:29:20',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('0d9b30557a10a6298cd42a5b15c6e817', 'queryRole', '2', 'sysBalanceMain-1', 'admin', '2020-07-02',
        '2020-07-02 21:01:55', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('0def2a4ef1a60c8814100f8f831e4177', 'admin', '1', 'sysPost', 'admin', '2020-07-06', '2020-07-06 22:29:20', NULL,
        NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('10b2b491ffa59a644c1a50f7fb379cb7', 'admin', '1', 'monitorSwagger', 'admin', '2020-07-06',
        '2020-07-06 22:29:20', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('15c69c64b4c5ee4650c23e30b53dafb0', 'admin', '2', 'sysMenu-1', 'admin', '2020-07-06', '2020-07-06 22:29:20',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('1610c1c8dd707329ffe3d3688eedf939', 'admin', '1', 'monitorDruid', 'admin', '2020-07-06', '2020-07-06 22:29:20',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('16d1d0096695f761a932d6f7b423ee21', 'admin', '1', 'sysOrg', 'admin', '2020-07-06', '2020-07-06 22:29:20', NULL,
        NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('1992349a022b96b111da3ebb9ee65b8c', 'admin', '2', 'sysUser-3', 'admin', '2020-07-06', '2020-07-06 22:29:20',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('1e9e464bddec95129f590152869c03f8', 'admin', '1', 'sys', 'admin', '2020-07-06', '2020-07-06 22:29:20', NULL,
        NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('1f4a2bdd7fccbaa04935febc55286d37', 'admin', '2', 'sysJob-1', 'admin', '2020-07-06', '2020-07-06 22:29:20',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('262ab1092a7d19eda605689e287ed6f4', 'admin', '2', 'sysRole-1', 'admin', '2020-07-06', '2020-07-06 22:29:20',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('27795222ecbc3a7d648fe26254a1b92d', 'admin', '2', 'sysConfig-2', 'admin', '2020-07-06', '2020-07-06 22:29:20',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('2c59365e90e0b9e0cf7bb1c1f95c439e', 'admin', '2', 'sysUser-4', 'admin', '2020-07-06', '2020-07-06 22:29:20',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('2e7b03e9a4e269bea6f063e48241851e', 'admin', '1', 'sysConfig', 'admin', '2020-07-06', '2020-07-06 22:29:20',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('2eca0caf9a7f5009ad6631dda8c5314f', 'admin', '1', 'sysJob', 'admin', '2020-07-06', '2020-07-06 22:29:20', NULL,
        NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('2fc8b33dae770ade34a6308438ae042a', 'admin', '2', 'sysPost-4', 'admin', '2020-07-06', '2020-07-06 22:29:20',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('3357a1cf1b04a52e40c42d4ac354f319', 'admin', '2', 'sysOrg-2', 'admin', '2020-07-06', '2020-07-06 22:29:20',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('3813b5b1f01030a3007267ac839d3922', 'admin', '1', 'job', 'admin', '2020-07-06', '2020-07-06 22:29:20', NULL,
        NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('39379ea4e1e0d09250c8e48153a5121e', 'admin', '1', 'sysRole', 'admin', '2020-07-06', '2020-07-06 22:29:20', NULL,
        NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('3a34aad5aca7706ddc99a04801656bbf', 'admin', '2', 'sysPost-3', 'admin', '2020-07-06', '2020-07-06 22:29:20',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('41b415fbe15237e9ef5df9b21bc2db9a', 'admin', '2', 'sysJob-4', 'admin', '2020-07-06', '2020-07-06 22:29:20',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('4463969f21d36b662a24b6e83382beb0', 'queryRole', '1', 'balance', 'admin', '2020-07-02', '2020-07-02 21:01:55',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('48243c9120f65e208322dc4d32e9fc3b', 'admin', '1', 'sysFunc', 'admin', '2020-07-06', '2020-07-06 22:29:20', NULL,
        NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('4a03be831db218d104bee4de40b5e6b3', 'admin', '2', 'sysFunc-1', 'admin', '2020-07-06', '2020-07-06 22:29:20',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('4a6d2aebda25aa9c6a80101d01421598', 'queryRole', '2', 'sysBalanceMain-5', 'admin', '2020-07-02',
        '2020-07-02 21:01:55', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('6345d4dd6f5c6ca6055541c2afdf1a03', 'admin', '2', 'sysJob-3', 'admin', '2020-07-06', '2020-07-06 22:29:20',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('634d7d00a032e9d8b235815b084b249f', 'admin', '2', 'sysCodeInfo-3', 'admin', '2020-07-06', '2020-07-06 22:29:20',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('647dd04dbecf36a3861404185d12a0fb', 'admin', '2', 'sysCodeType-3', 'admin', '2020-07-06', '2020-07-06 22:29:20',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('68d6e3c06bf8bd5b2b765647dd40038a', 'admin', '2', 'sysRole-3', 'admin', '2020-07-06', '2020-07-06 22:29:20',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('6a507266323d8d6eb1d09c0c2e8bca7e', 'admin', '1', 'sysCodeCreate', 'admin', '2020-07-06', '2020-07-06 22:29:20',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('6b3d1a0bd343a3063d29ebfa4c86f0c9', 'admin', '1', 'monitor', 'admin', '2020-07-06', '2020-07-06 22:29:20', NULL,
        NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('6d9a26ca49ba6ea4ab37e76c44d0e12a', 'admin', '1', 'balance', 'admin', '2020-07-06', '2020-07-06 22:29:20', NULL,
        NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('71ccde005a7ef48599461f5aca7e39c5', 'admin', '2', 'sysOrg-1', 'admin', '2020-07-06', '2020-07-06 22:29:20',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('7459f2e3bf879939bb8b712d0101ca5f', 'admin', '2', 'sysCodeCreate-4', 'admin', '2020-07-06',
        '2020-07-06 22:29:20', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('79340aa0126f7f76e83832f3f22634d2', 'admin', '2', 'sysCodeInfo-1', 'admin', '2020-07-06', '2020-07-06 22:29:20',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('79cae3f81425e8df48e1093930f5c5cc', 'admin', '2', 'sysBalanceMain-2', 'admin', '2020-07-06',
        '2020-07-06 22:29:20', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('803352646622eab5eb950017433d7b5d', 'admin', '2', 'sysBalanceMain-3', 'admin', '2020-07-06',
        '2020-07-06 22:29:20', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('8330560d93866ed56dc9a8b0b9d1955a', 'admin', '2', 'sysFunc-3', 'admin', '2020-07-06', '2020-07-06 22:29:20',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('83fb071407d5a9b4b5b35d4dd6168a9f', 'admin', '1', 'sysJobLog', 'admin', '2020-07-06', '2020-07-06 22:29:20',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('86fc67bed0dd366f2ec6d75c99d51ff9', 'admin', '2', 'sysCodeCreate-2', 'admin', '2020-07-06',
        '2020-07-06 22:29:20', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('90882204081a036454e3be6ab074150e', 'admin', '2', 'sysFunc-2', 'admin', '2020-07-06', '2020-07-06 22:29:20',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('910a68b7ac031734b1ceab85693069e1', 'admin', '1', 'base', 'admin', '2020-07-06', '2020-07-06 22:29:20', NULL,
        NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('942a00525c0a0871d271698d08bbab88', 'admin', '1', 'sysMenu', 'admin', '2020-07-06', '2020-07-06 22:29:20', NULL,
        NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('97e25cdb7bc8b85aef6605ed0596d144', 'admin', '2', 'sysMenu-3', 'admin', '2020-07-06', '2020-07-06 22:29:20',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('9b87568a2ed1784c1d84eca57a2df513', 'queryRole', '1', 'sysBalanceMain', 'admin', '2020-07-02',
        '2020-07-02 21:01:55', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('9ed5e42b01a274b9bf2f4875ca0e28b8', 'admin', '2', 'sysMenu-2', 'admin', '2020-07-06', '2020-07-06 22:29:20',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('a7fdd97b28e2c83870bab28394ebbee6', 'admin', '2', 'sysBalanceMain-4', 'admin', '2020-07-06',
        '2020-07-06 22:29:20', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('acd92518a08ce2f11c32740a2950d334', 'admin', '2', 'sysConfig-3', 'admin', '2020-07-06', '2020-07-06 22:29:20',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('b00e3da076d270db897d9ebe75075eb5', 'admin', '1', 'sysCodeType', 'admin', '2020-07-06', '2020-07-06 22:29:20',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('b0703fa156648984df74f4fbeabdfdb4', 'admin', '2', 'sysUser-1', 'admin', '2020-07-06', '2020-07-06 22:29:20',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('b4f738eccc61a125ac9953bb180c2cf0', 'admin', '2', 'sysBalanceMain-5', 'admin', '2020-07-06',
        '2020-07-06 22:29:20', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('b52587cb53d94ba5e8ecbbb1bc65bd54', 'queryRole', '2', 'sysBalanceMain-4', 'admin', '2020-07-02',
        '2020-07-02 21:01:55', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('c048f5db6deb11d711bf1601ffa13573', 'admin', '1', 'sysLog', 'admin', '2020-07-06', '2020-07-06 22:29:20', NULL,
        NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('c10abc6e87f7e198cbefa3132bfaf7ec', 'admin', '2', 'sysCodeType-1', 'admin', '2020-07-06', '2020-07-06 22:29:20',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('c29d300924ac62bae0c8a698063679f2', 'admin', '2', 'sysCodeInfo-4', 'admin', '2020-07-06', '2020-07-06 22:29:20',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('c2fbaa197fdc8be6eda10500afa52e4e', 'admin', '2', 'sysOrg-3', 'admin', '2020-07-06', '2020-07-06 22:29:20',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('c67e2f24c5c6669650bb21a6f01d6558', 'admin', '2', 'sysPost-2', 'admin', '2020-07-06', '2020-07-06 22:29:20',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('c69aeed25f2712481e63457bf796556e', 'admin', '2', 'sysCodeInfo-2', 'admin', '2020-07-06', '2020-07-06 22:29:20',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('d2a8d07d2813f946c1272334ecf68eaa', 'admin', '2', 'sysPost-1', 'admin', '2020-07-06', '2020-07-06 22:29:20',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('d7129ae7b8548f7fff3deca494b39e7b', 'admin', '2', 'sysJob-2', 'admin', '2020-07-06', '2020-07-06 22:29:20',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('d7e9ff332cb7542996a6ee285399ad79', 'admin', '1', 'sysUser', 'admin', '2020-07-06', '2020-07-06 22:29:20', NULL,
        NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('d932b759d4da63ac0e8b90b53a5168a3', 'admin', '2', 'sysUser-2', 'admin', '2020-07-06', '2020-07-06 22:29:20',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('d98e2edbfc6db700cb6104cb2a40d08a', 'admin', '2', 'sysRole-4', 'admin', '2020-07-06', '2020-07-06 22:29:20',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('de507e456c3c08f49e42146519135766', 'queryRole', '2', 'sysBalanceMain-3', 'admin', '2020-07-02',
        '2020-07-02 21:01:55', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('debca47225f74609626fb0127b96bb9b', 'admin', '2', 'sysBalanceMain-1', 'admin', '2020-07-06',
        '2020-07-06 22:29:20', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('debee698d5841a0b6e3db9c4c2ba26d2', 'admin', '2', 'sysCodeCreate-1', 'admin', '2020-07-06',
        '2020-07-06 22:29:20', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('e3bbc6179217530e1c7e351135679b8a', 'admin', '1', 'monitorServer', 'admin', '2020-07-06', '2020-07-06 22:29:20',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('eb4a497db3277021ce8228c46b4f47bd', 'admin', '2', 'sysRole-5', 'admin', '2020-07-06', '2020-07-06 22:29:20',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('ede5e1cf278013f892e9b5b82e201e58', 'queryRole', '2', 'sysBalanceMain-2', 'admin', '2020-07-02',
        '2020-07-02 21:01:55', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('f109355f2aa54b0d10ba0f015c1ef6cd', 'admin', '1', 'sysBalanceMain', 'admin', '2020-07-06',
        '2020-07-06 22:29:20', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('f75e873ff0bd5825fc81b5966e68a035', 'admin', '2', 'sysCodeCreate-3', 'admin', '2020-07-06',
        '2020-07-06 22:29:20', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_sys_role_user
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_role_user`;
CREATE TABLE `t_sys_role_user`
(
    `role_user_id` varchar(32) NOT NULL COMMENT 'UUID',
    `role_id`      varchar(32) NOT NULL COMMENT '角色ID',
    `user_id`      varchar(32) NOT NULL COMMENT '用户ID',
    `create_by`    varchar(32)      DEFAULT NULL COMMENT '创建人',
    `create_date`  date             DEFAULT NULL COMMENT '创建日期',
    `create_time`  timestamp   NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`    varchar(32)      DEFAULT NULL COMMENT '修改人',
    `update_date`  date             DEFAULT NULL COMMENT '修改日期',
    `update_time`  timestamp   NULL DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`role_user_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='SYS11_角色和用户关系表';

-- ----------------------------
-- Records of t_sys_role_user
-- ----------------------------
BEGIN;
INSERT INTO `t_sys_role_user`
VALUES ('admin-admin', 'admin', 'admin', 'admin', '2020-03-17', '2020-03-17 14:11:29', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_sys_user
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_user`;
CREATE TABLE `t_sys_user`
(
    `user_id`     varchar(32)  NOT NULL COMMENT '用户ID',
    `user_name`   varchar(100) NOT NULL COMMENT '用户姓名',
    `password`    varchar(100) NOT NULL COMMENT '密码',
    `salt`        varchar(8)        DEFAULT NULL COMMENT '密码盐',
    `sex`         varchar(1)        DEFAULT NULL COMMENT '性别',
    `role_id`     varchar(32)       DEFAULT NULL COMMENT '所属角色ID',
    `org_id`      varchar(32)       DEFAULT NULL COMMENT '所属机构ID',
    `mobile`      varchar(20)       DEFAULT NULL COMMENT '手机号码',
    `id_card_no`  varchar(20)       DEFAULT NULL COMMENT '身份证号码',
    `email`       varchar(100)      DEFAULT NULL COMMENT '邮箱',
    `status`      varchar(1)        DEFAULT NULL COMMENT '用户状态',
    `sort_no`     int(11)           DEFAULT NULL COMMENT '排序号',
    `remark`      varchar(255)      DEFAULT NULL COMMENT '备注',
    `create_by`   varchar(32)       DEFAULT NULL COMMENT '创建人',
    `create_date` date              DEFAULT NULL COMMENT '创建日期',
    `create_time` timestamp    NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(32)       DEFAULT NULL COMMENT '修改人',
    `update_date` date              DEFAULT NULL COMMENT '修改日期',
    `update_time` timestamp    NULL DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`user_id`),
    UNIQUE KEY `unique_user_name` (`user_name`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='SYS10_用户表';

-- ----------------------------
-- Records of t_sys_user
-- ----------------------------
BEGIN;
INSERT INTO `t_sys_user`
VALUES ('admin', 'admin', '99f8090e4ca3c97db6d806c6b263b4daf402703121a1c5622b3f17dbde64feaa', '1tw8Yj3S', '1', 'admin',
        '1000000000', '18888888888', 'xxx', 'xxx@yyy.zz', '1', 1, '1', NULL, NULL, NULL, 'admin', '2020-06-08',
        '2020-06-08 06:52:30');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
