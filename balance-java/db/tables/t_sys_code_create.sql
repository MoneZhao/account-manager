/**【t_sys_code_create】开始**/
drop table if exists t_sys_code_create;
CREATE TABLE t_sys_code_create
(
    code_create_id varchar(32) NOT NULL COMMENT '主键id',
    code_create_tablename varchar(50) NOT NULL COMMENT '表名',
    code_create_module varchar(200) NOT NULL COMMENT '模块名',
    code_create_filename varchar(200) NOT NULL COMMENT '文件名',
    create_by varchar(32) NULL COMMENT '创建人',
    create_date date NULL COMMENT '创建日期',
    create_time datetime NULL COMMENT '创建时间',
    update_by varchar(32) NULL COMMENT '修改人',
    update_date date NULL COMMENT '修改日期',
    update_time datetime NULL COMMENT '修改时间',
    PRIMARY KEY (code_create_id)
) ENGINE=InnoDB DEFAULT CHARSET = utf8mb4  COLLATE = utf8mb4_general_ci COMMENT='sys19_代码在线生成';

/**【t_sys_code_create】结束**/
INSERT INTO t_sys_menu VALUES ('sysCodeCreate', '代码生成', 'sys', 'list', 'codeCreate', 'sys:codeCreate:list', 'views/sys/codeCreate/index', NULL, '0', '1', 'SysCodeCreate', '1', '0', '1', '19100', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO t_sys_func VALUES ('sysCodeCreate-1', '新增', 'sysCodeCreate', 'sys:codeCreate:save', '', '1', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO t_sys_func VALUES ('sysCodeCreate-2', '修改', 'sysCodeCreate', 'sys:codeCreate:update', '', '2', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO t_sys_func VALUES ('sysCodeCreate-3', '删除', 'sysCodeCreate', 'sys:codeCreate:delete', '', '3', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO t_sys_func VALUES ('sysCodeCreate-4', '下载', 'sysCodeCreate', 'sys:codeCreate:export', '', '3', NULL, NULL, NULL, NULL, NULL, NULL);
