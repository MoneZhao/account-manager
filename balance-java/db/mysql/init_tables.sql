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

 Date: 02/07/2020 15:48:56
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
VALUES ('sysCodeCreate-1', '新增', 'sysCodeCreate', 'sys:codeCreate:save', '', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func`
VALUES ('sysCodeCreate-2', '修改', 'sysCodeCreate', 'sys:codeCreate:update', '', 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func`
VALUES ('sysCodeCreate-3', '删除', 'sysCodeCreate', 'sys:codeCreate:delete', '', 3, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func`
VALUES ('sysCodeCreate-4', '下载', 'sysCodeCreate', 'sys:codeCreate:export', '', 4, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func`
VALUES ('sysCodeInfo-1', '新增', 'sysCodeInfo', 'sys:codeInfo:save', '', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func`
VALUES ('sysCodeInfo-2', '修改', 'sysCodeInfo', 'sys:codeInfo:update', '', 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func`
VALUES ('sysCodeInfo-3', '删除', 'sysCodeInfo', 'sys:codeInfo:delete', '', 3, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func`
VALUES ('sysCodeType-1', '新增', 'sysCodeType', 'sys:codeType:save', '', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func`
VALUES ('sysCodeType-2', '修改', 'sysCodeType', 'sys:codeType:update', '', 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_func`
VALUES ('sysCodeType-3', '删除', 'sysCodeType', 'sys:codeType:delete', '', 3, NULL, NULL, NULL, NULL, NULL, NULL);
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
        '0', '1', 'SysCodeCreate', '1', '0', '1', 11000, NULL, NULL, NULL, 'admin', '2020-07-01',
        '2020-07-01 10:56:17');
INSERT INTO `t_sys_menu`
VALUES ('sysCodeInfo', '代码信息', 'sys', 'codelibrary-fill', 'codeInfo', 'sys:codeType:list,sys:codeInfo:list',
        'views/sys/codeInfo/index', NULL, '0', '1', 'SysCodeInfo', '1', '0', '1', 10300, NULL, NULL, NULL, 'admin',
        '2020-06-14', '2020-06-14 10:38:59');
INSERT INTO `t_sys_menu`
VALUES ('sysCodeType', '代码类别', 'sys', 'code', 'codeType', 'sys:codeType:list', 'views/sys/codeType/index', NULL, '0',
        '1', 'SysCodeType', '1', '0', '1', 10200, NULL, NULL, NULL, 'admin', '2020-06-14', '2020-06-14 10:38:51');
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
        '1', '0', '1', 10900, NULL, NULL, NULL, 'admin', '2020-07-01', '2020-07-01 10:56:09');
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
VALUES ('admin', '超级管理员', 1, '', NULL, NULL, NULL, 'admin', '2020-05-27', '2020-05-27 17:30:49');
INSERT INTO `t_sys_role`
VALUES ('queryRole', '查询角色', 2, '查询角色', 'admin', '2019-09-07', '2019-09-07 21:10:19', 'admin', '2019-09-15',
        '2019-09-15 18:15:52');
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
VALUES ('006b2cedbf751a823a49655efdf8af3d', 'admin', '1', 'monitorServer', 'admin', '2020-07-01', '2020-07-01 11:48:02',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('039cb558818c955fb9053db2e18200a8', 'queryRole', '2', 'sysBalanceMain-2', 'admin', '2020-07-01',
        '2020-07-01 16:07:33', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('041e4c25030e27ecb3db2be7d3f8bb99', 'admin', '1', 'sysOrg', 'admin', '2020-07-01', '2020-07-01 11:48:02', NULL,
        NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('07656cd0acb5ef4dc1e5c755da2ffc02', 'admin', '2', 'sysPost-4', 'admin', '2020-07-01', '2020-07-01 11:48:02',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('096865253d3b52d982e06840b4a8f249', 'admin', '1', 'base', 'admin', '2020-07-01', '2020-07-01 11:48:02', NULL,
        NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('11b9cae9bba5b6fbbe2531996c58404b', 'admin', '2', 'sysUser-2', 'admin', '2020-07-01', '2020-07-01 11:48:02',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('184d94c22454f4bab57113a2d68fb556', 'queryRole', '1', 'sysBalanceMain', 'admin', '2020-07-01',
        '2020-07-01 16:07:33', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('1dc597cfd1016780e959b9035ceb2ae1', 'admin', '1', 'sys', 'admin', '2020-07-01', '2020-07-01 11:48:02', NULL,
        NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('30a0f6be737e2b5170dd7263be2ae498', 'admin', '2', 'sysBalanceMain-1', 'admin', '2020-07-01',
        '2020-07-01 11:48:02', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('342162c6171856926183d6b3fd318603', 'admin', '2', 'sysCodeInfo-1', 'admin', '2020-07-01', '2020-07-01 11:48:02',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('34baa6d68066087b94b9606bac82ac23', 'admin', '2', 'sysRole-1', 'admin', '2020-07-01', '2020-07-01 11:48:02',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('3674f39ae9013d56c192836060638a7e', 'admin', '1', 'sysCodeInfo', 'admin', '2020-07-01', '2020-07-01 11:48:02',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('38c3f5bd8ce6ef089e23430597b63dc1', 'admin', '2', 'sysPost-1', 'admin', '2020-07-01', '2020-07-01 11:48:02',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('3a3bb621e9d43c8d34c51e18b4aed47a', 'queryRole', '2', 'sysBalanceMain-1', 'admin', '2020-07-01',
        '2020-07-01 16:07:33', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('46bb74763ad631a7361a0a4b20e9f3c2', 'admin', '2', 'sysJob-5', 'admin', '2020-07-01', '2020-07-01 11:48:02',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('46c00baf6237f9b500fe8a19911312b2', 'admin', '2', 'sysCodeCreate-2', 'admin', '2020-07-01',
        '2020-07-01 11:48:02', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('48c415689210f4c743f9cba227b8c276', 'admin', '2', 'sysJob-4', 'admin', '2020-07-01', '2020-07-01 11:48:02',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('4b1cec862e6fcf7a7972c196faca52b7', 'admin', '2', 'sysCodeType-3', 'admin', '2020-07-01', '2020-07-01 11:48:02',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('4d417274f20a54abe6347b209f6c0932', 'admin', '2', 'sysJob-1', 'admin', '2020-07-01', '2020-07-01 11:48:02',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('4ff82101510ce666de28c1cae22c5f6c', 'admin', '1', 'sysCodeType', 'admin', '2020-07-01', '2020-07-01 11:48:02',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('509d4640a976ee587d1fa1b91eda76c5', 'admin', '2', 'sysOrg-3', 'admin', '2020-07-01', '2020-07-01 11:48:02',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('51e638efe6e41effed1835c554c6463f', 'admin', '2', 'sysFunc-1', 'admin', '2020-07-01', '2020-07-01 11:48:02',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('537fcf740ae5d4832e91b9f311f8405d', 'admin', '2', 'sysUser-1', 'admin', '2020-07-01', '2020-07-01 11:48:02',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('54164ac5644e39e260097d291c3f9212', 'admin', '1', 'sysLog', 'admin', '2020-07-01', '2020-07-01 11:48:02', NULL,
        NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('54a3a22ef975de341fea8898a1d604b1', 'admin', '2', 'sysMenu-3', 'admin', '2020-07-01', '2020-07-01 11:48:02',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('568af813a2a499e52696d6c382b4d49c', 'admin', '1', 'sysCodeCreate', 'admin', '2020-07-01', '2020-07-01 11:48:02',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('58d3b113b08688f479f6fecf7013528a', 'admin', '1', 'sysJob', 'admin', '2020-07-01', '2020-07-01 11:48:02', NULL,
        NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('597c93a2ae12532e30873c4c24b7bc8e', 'queryRole', '2', 'sysBalanceMain-3', 'admin', '2020-07-01',
        '2020-07-01 16:07:33', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('637fd2e9727ddc99a354b5c362091f3d', 'admin', '2', 'sysMenu-1', 'admin', '2020-07-01', '2020-07-01 11:48:02',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('6b3670bb54390f5cfdb906d3a1fddd89', 'admin', '1', 'sysMenu', 'admin', '2020-07-01', '2020-07-01 11:48:02', NULL,
        NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('6ca6ffaba8398db7987301a960a1c52b', 'admin', '2', 'sysCodeCreate-1', 'admin', '2020-07-01',
        '2020-07-01 11:48:02', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('6f21a8d38116d9cba5e4ab3a10f55df3', 'admin', '1', 'sysUser', 'admin', '2020-07-01', '2020-07-01 11:48:02', NULL,
        NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('7289fccbeafe3b5ed4a220a506864542', 'admin', '2', 'sysCodeType-2', 'admin', '2020-07-01', '2020-07-01 11:48:02',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('7ae4a023c54a7fce48c082ae15dfc518', 'admin', '2', 'sysOrg-2', 'admin', '2020-07-01', '2020-07-01 11:48:02',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('7b5b21700919309e2bbd0278b686d129', 'admin', '2', 'sysCodeCreate-3', 'admin', '2020-07-01',
        '2020-07-01 11:48:02', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('7e4a0525b53aeec2def60cfb37866305', 'admin', '2', 'sysPost-3', 'admin', '2020-07-01', '2020-07-01 11:48:02',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('7f831f91b1792e9bf17f504dbb87c694', 'admin', '2', 'sysConfig-1', 'admin', '2020-07-01', '2020-07-01 11:48:02',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('82c7bc9492d95c80c32cbd407b0a8433', 'admin', '2', 'sysPost-2', 'admin', '2020-07-01', '2020-07-01 11:48:02',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('89c9ded73bb81aafaec713a6455b486f', 'admin', '2', 'sysConfig-2', 'admin', '2020-07-01', '2020-07-01 11:48:02',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('89f24f29c4b70198535cb7b949fafecb', 'admin', '1', 'sysJobLog', 'admin', '2020-07-01', '2020-07-01 11:48:02',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('8d52b0d050018273797a78bd0c2c3fce', 'admin', '2', 'sysCodeInfo-3', 'admin', '2020-07-01', '2020-07-01 11:48:02',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('8db2618979ac0545191cc1cf436b01bc', 'admin', '2', 'sysRole-3', 'admin', '2020-07-01', '2020-07-01 11:48:02',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('910ba345610f4df5bc940dba1d331596', 'admin', '1', 'sysPost', 'admin', '2020-07-01', '2020-07-01 11:48:02', NULL,
        NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('97a98008650d555908952752314bb779', 'admin', '1', 'monitor', 'admin', '2020-07-01', '2020-07-01 11:48:02', NULL,
        NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('981dcd68c2fb513fb7bc69972989d390', 'admin', '2', 'sysRole-2', 'admin', '2020-07-01', '2020-07-01 11:48:02',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('9ac5906fdc1d35c0251404d2ecc4f7ea', 'admin', '2', 'sysUser-3', 'admin', '2020-07-01', '2020-07-01 11:48:02',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('a6a198038f8fc70cba4120003f8fb433', 'admin', '2', 'sysUser-4', 'admin', '2020-07-01', '2020-07-01 11:48:02',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('a7fb09f8064ed55c09e29b80d0e354b0', 'admin', '2', 'sysCodeInfo-2', 'admin', '2020-07-01', '2020-07-01 11:48:02',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('acc4404739f5ea3fbbeba87fcd07eb20', 'admin', '2', 'sysCodeCreate-4', 'admin', '2020-07-01',
        '2020-07-01 11:48:02', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('b08b242c411bfa664454616c487de69b', 'admin', '1', 'balance', 'admin', '2020-07-01', '2020-07-01 11:48:02', NULL,
        NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('bfba6452a08bb649624ce3ad7411d744', 'admin', '2', 'sysJob-3', 'admin', '2020-07-01', '2020-07-01 11:48:02',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('c85234368b0dd0303cc5596464cbcb08', 'admin', '1', 'sysRole', 'admin', '2020-07-01', '2020-07-01 11:48:02', NULL,
        NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('c92225d3d909053c460d26c7644e4c5a', 'admin', '2', 'sysBalanceMain-2', 'admin', '2020-07-01',
        '2020-07-01 11:48:02', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('c9ac1b3ed75af109da09fae8cfeffbec', 'admin', '2', 'sysMenu-2', 'admin', '2020-07-01', '2020-07-01 11:48:02',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('ca8d4c9b7c1fe76a0ee251db1199ee05', 'admin', '2', 'sysCodeType-1', 'admin', '2020-07-01', '2020-07-01 11:48:02',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('ceb162da3c54a654f6361c6b8126cfab', 'admin', '1', 'sysBalanceMain', 'admin', '2020-07-01',
        '2020-07-01 11:48:02', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('d4c84bf145af4eca324f72c1dbb18d28', 'admin', '1', 'job', 'admin', '2020-07-01', '2020-07-01 11:48:02', NULL,
        NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('d7d314f0113f094e1edc3c945a895475', 'admin', '1', 'sysConfig', 'admin', '2020-07-01', '2020-07-01 11:48:02',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('db5efe7c0206ffe453c1be1f5e93d69d', 'admin', '2', 'sysRole-5', 'admin', '2020-07-01', '2020-07-01 11:48:02',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('db807c1105f04fb801188b6f5d54c7c2', 'admin', '2', 'sysFunc-2', 'admin', '2020-07-01', '2020-07-01 11:48:02',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('e01ee0b59240d4be7df35879e2d258f8', 'admin', '2', 'sysOrg-1', 'admin', '2020-07-01', '2020-07-01 11:48:02',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('e1a427565ddc879225868a73e868ec42', 'admin', '2', 'sysFunc-3', 'admin', '2020-07-01', '2020-07-01 11:48:02',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('e63939402005b8d222fcb246d171c723', 'queryRole', '1', 'balance', 'admin', '2020-07-01', '2020-07-01 16:07:33',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('e81a4bef2d1fa42d4f21be0fc2ca741f', 'admin', '1', 'monitorDruid', 'admin', '2020-07-01', '2020-07-01 11:48:02',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('ec8be55deea28884f4da783389d846ed', 'admin', '1', 'sysFunc', 'admin', '2020-07-01', '2020-07-01 11:48:02', NULL,
        NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('ef51fe63b998eeba4b2fd1c14ac0a7a7', 'admin', '2', 'sysRole-4', 'admin', '2020-07-01', '2020-07-01 11:48:02',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('f0f59803b4737872a9119258449daf1f', 'admin', '2', 'sysJob-2', 'admin', '2020-07-01', '2020-07-01 11:48:02',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('f71ac4a5143a4b5e27e644946422826f', 'admin', '2', 'sysConfig-3', 'admin', '2020-07-01', '2020-07-01 11:48:02',
        NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('f95433c72e565b72958072860a8c5861', 'admin', '2', 'sysBalanceMain-3', 'admin', '2020-07-01',
        '2020-07-01 11:48:02', NULL, NULL, NULL);
INSERT INTO `t_sys_role_permission`
VALUES ('b8f1636506e78427773a06d626f97ed8', 'admin', '1', 'monitorSwagger', 'admin', '2020-07-02',
        '2020-07-02 15:59:29', NULL, NULL, NULL);
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
VALUES ('admin', 'admin', '75856dfe4f117fff6afc8723a76774f6f56291d47b8cadf500b3e692e90a387d', '2YKKAhYR', '1', 'admin',
        '1000000000', '18888888888', 'xxx', 'xxx@yyy.zz', '1', 1, '1', NULL, NULL, NULL, 'admin', '2020-06-08',
        '2020-06-08 06:52:30');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
