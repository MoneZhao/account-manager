/**【t_sys_user_short_cut】开始**/
drop table if exists t_sys_user_short_cut;
CREATE TABLE t_sys_user_short_cut
(
    user_short_cut_id varchar(32) NOT NULL COMMENT '操作权限ID',
    user_id varchar(32) NOT NULL COMMENT '用户ID',
    role_id varchar(32) NOT NULL COMMENT '角色ID',
    menu_id varchar(32) NOT NULL COMMENT '菜单ID',
    create_by varchar(32) NULL COMMENT '创建人',
    create_date date NULL COMMENT '创建日期',
    create_time datetime NULL COMMENT '创建时间',
    update_by varchar(32) NULL COMMENT '修改人',
    update_date date NULL COMMENT '修改日期',
    update_time datetime NULL COMMENT '修改时间',
    PRIMARY KEY (user_short_cut_id)
) ENGINE=InnoDB DEFAULT CHARSET = utf8mb4  COLLATE = utf8mb4_general_ci COMMENT='用户与快捷方式表';
