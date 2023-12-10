/**【t_sys_travel_expense】开始**/
drop table if exists t_sys_travel_expense;
CREATE TABLE t_sys_travel_expense
(
    travel_expense_id varchar(32) NOT NULL COMMENT '主键id',
    travel_place varchar(32) NOT NULL COMMENT '出差地点',
    request_date date NOT NULL COMMENT '报销日期',
    get_date date NOT NULL COMMENT '到账日期',
    use_day int(5) NOT NULL COMMENT '报账天数',
    use_number decimal(12,2) NOT NULL COMMENT '实际花费',
    request_number decimal(12,2) NOT NULL COMMENT '报销金额',
    get_number decimal(12,2) NOT NULL COMMENT '到账金额',
    add_number decimal(12,2) NOT NULL COMMENT '得利',
    remark varchar(255) NULL COMMENT '备注',
    create_by varchar(32) NULL COMMENT '创建人',
    create_date date NULL COMMENT '创建日期',
    create_time datetime NULL COMMENT '创建时间',
    update_by varchar(32) NULL COMMENT '修改人',
    update_date date NULL COMMENT '修改日期',
    update_time datetime NULL COMMENT '修改时间',
    delete_type datetime DEFAULT NULL COMMENT '1900-01-01 00:00:00 不删除 时间为删除',
    PRIMARY KEY (travel_expense_id)
) ENGINE=InnoDB DEFAULT CHARSET = utf8mb4  COLLATE = utf8mb4_general_ci COMMENT='SYS22_出差报销表';

/**【t_sys_travel_expense】结束**/
INSERT INTO t_sys_menu VALUES ('sysTravelExpense', '出差报销', 'sys', 'list', 'travelExpense', 'sys:travelExpense:list', 'views/sys/travelExpense/index', NULL, '0', '1', 'SysTravelExpense', '0', '0', '1', '19100', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO t_sys_func VALUES ('sysTravelExpense-1', '新增', 'sysTravelExpense', 'sys:travelExpense:save', '', '1', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO t_sys_func VALUES ('sysTravelExpense-2', '修改', 'sysTravelExpense', 'sys:travelExpense:update', '', '2', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO t_sys_func VALUES ('sysTravelExpense-3', '删除', 'sysTravelExpense', 'sys:travelExpense:delete', '', '3', NULL, NULL, NULL, NULL, NULL, NULL);

