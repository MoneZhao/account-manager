/**【t_sys_balance_count】开始**/
drop table if exists t_sys_balance_count;
CREATE TABLE t_sys_balance_count
(
    balance_count_id varchar(32) NOT NULL COMMENT '主键id',
    code_info_id varchar(32) NOT NULL COMMENT '账户类型id',
    count_type varchar(2) NOT NULL COMMENT '是否计入总资产',
    user_id varchar(32) NOT NULL COMMENT '所属用户',
    create_by varchar(32) NULL COMMENT '创建人',
    create_date date NULL COMMENT '创建日期',
    create_time datetime NULL COMMENT '创建时间',
    update_by varchar(32) NULL COMMENT '修改人',
    update_date date NULL COMMENT '修改日期',
    update_time datetime NULL COMMENT '修改时间',
    PRIMARY KEY (balance_count_id)
) ENGINE=InnoDB DEFAULT CHARSET = utf8mb4  COLLATE = utf8mb4_general_ci COMMENT='SYS21_计入总资产表';

/**【t_sys_balance_count】结束**/
INSERT INTO t_sys_menu VALUES ('sysBalanceCount', '计入总资产', 'balance', 'liuchengshili', 'balanceCount', 'sys:balanceCount:list', 'views/sys/balanceCount/index', NULL, '0', '1', 'SysBalanceCount', '0', '0', '1', '32000', NULL, NULL, NULL, NULL, NULL, NULL);
-- INSERT INTO t_sys_func VALUES ('sysBalanceCount-1', '新增', 'sysBalanceCount', 'sys:balanceCount:save', '', '1', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO t_sys_func VALUES ('sysBalanceCount-2', '修改', 'sysBalanceCount', 'sys:balanceCount:update', '', '2', NULL, NULL, NULL, NULL, NULL, NULL);
-- INSERT INTO t_sys_func VALUES ('sysBalanceCount-3', '删除', 'sysBalanceCount', 'sys:balanceCount:delete', '', '3', NULL, NULL, NULL, NULL, NULL, NULL);
