UPDATE `account_manager`.`t_sys_balance_main`
set `delete_type` = null;

ALTER TABLE `account_manager`.`t_sys_balance_main`
    MODIFY COLUMN `delete_type` datetime NULL COMMENT '1900-01-01 00:00:00 不删除 时间为删除';

UPDATE `account_manager`.`t_sys_balance_main`
set `delete_type` = '1900-01-01 00:00:00';

UPDATE `account_manager`.`t_sys_balance_detail`
set `delete_type` = null;

ALTER TABLE `account_manager`.`t_sys_balance_detail`
    MODIFY COLUMN `delete_type` datetime NULL COMMENT '1900-01-01 00:00:00 不删除 时间为删除';

UPDATE `account_manager`.`t_sys_balance_detail`
set `delete_type` = '1900-01-01 00:00:00';

ALTER TABLE `account_manager`.`t_sys_balance_main`
    ADD UNIQUE INDEX `uniq_account_date` (`user_id`, `account_date`, `delete_type`);

ALTER TABLE `account_manager`.`t_sys_balance_detail`
    ADD UNIQUE INDEX `uniq_account_date` (`balance_main_id`,`balance_type` , `delete_type`);
