/**【t_sys_balance_main】开始**/
drop table if exists t_sys_balance_main;
CREATE TABLE t_sys_balance_main
(
    balance_main_id varchar(32) NOT NULL COMMENT '主键id',
    account float(12,2) NOT NULL COMMENT '账户余额',
    account_date date NOT NULL COMMENT '记录时间',
    user_id varchar(32) NOT NULL COMMENT '所属用户',
    remark varchar(255) NULL COMMENT '备注',
    create_by varchar(32) NULL COMMENT '创建人',
    create_date date NULL COMMENT '创建日期',
    create_time datetime NULL COMMENT '创建时间',
    update_by varchar(32) NULL COMMENT '修改人',
    update_date date NULL COMMENT '修改日期',
    update_time datetime NULL COMMENT '修改时间',
    PRIMARY KEY (balance_main_id)
) ENGINE=InnoDB DEFAULT CHARSET = utf8mb4  COLLATE = utf8mb4_general_ci COMMENT='SYS17_账户余额主表';

/**【t_sys_balance_main】结束**/
INSERT INTO t_sys_menu VALUES ('sysBalanceMain', '账户余额', 'sys', 'list', 'balanceMain', 'sys:balanceMain:list', 'views/sys/balanceMain/index', NULL, '0', '1', 'SysBalanceMain', '1', '0', '1', '19100', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO t_sys_func VALUES ('sysBalanceMain-1', '新增', 'sysBalanceMain', 'sys:balanceMain:save', '', '1', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO t_sys_func VALUES ('sysBalanceMain-2', '修改', 'sysBalanceMain', 'sys:balanceMain:update', '', '2', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO t_sys_func VALUES ('sysBalanceMain-3', '删除', 'sysBalanceMain', 'sys:balanceMain:delete', '', '3', NULL, NULL, NULL, NULL, NULL, NULL);

