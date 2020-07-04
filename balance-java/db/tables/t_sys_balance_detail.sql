/**【t_sys_balance_detail】开始**/
drop table if exists t_sys_balance_detail;
CREATE TABLE t_sys_balance_detail
(
    balance_detail_id varchar(32) NOT NULL COMMENT '主键id',
    account float(12,2) NOT NULL COMMENT '账户余额',
    account_type varchar(4) NOT NULL COMMENT '账户类型',
    balance_main_id varchar(32) NOT NULL COMMENT '主表id',
    remark varchar(255) NULL COMMENT '备注',
    create_by varchar(32) NULL COMMENT '创建人',
    create_date date NULL COMMENT '创建日期',
    create_time datetime NULL COMMENT '创建时间',
    update_by varchar(32) NULL COMMENT '修改人',
    update_date date NULL COMMENT '修改日期',
    update_time datetime NULL COMMENT '修改时间',
    delete_type int(1) NULL COMMENT '0 不删除 1 删除',
    PRIMARY KEY (balance_detail_id)
) ENGINE=InnoDB DEFAULT CHARSET = utf8mb4  COLLATE = utf8mb4_general_ci COMMENT='SYS18_账户明细表';

/**【t_sys_balance_detail】结束**/
-- INSERT INTO t_sys_menu VALUES ('sysBalanceDetail', 'XX功能', 'sys', 'list', 'balanceDetail', 'sys:balanceDetail:list', 'views/sys/balanceDetail/index', NULL, '0', '1', 'SysBalanceDetail', '1', '0', '1', '19100', NULL, NULL, NULL, NULL, NULL, NULL);
-- INSERT INTO t_sys_func VALUES ('sysBalanceDetail-1', '新增', 'sysBalanceDetail', 'sys:balanceDetail:save', '', '1', NULL, NULL, NULL, NULL, NULL, NULL);
-- INSERT INTO t_sys_func VALUES ('sysBalanceDetail-2', '修改', 'sysBalanceDetail', 'sys:balanceDetail:update', '', '2', NULL, NULL, NULL, NULL, NULL, NULL);
-- INSERT INTO t_sys_func VALUES ('sysBalanceDetail-3', '删除', 'sysBalanceDetail', 'sys:balanceDetail:delete', '', '3', NULL, NULL, NULL, NULL, NULL, NULL);
