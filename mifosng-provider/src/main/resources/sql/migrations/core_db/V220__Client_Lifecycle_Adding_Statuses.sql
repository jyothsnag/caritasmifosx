


ALTER TABLE `m_client`
	ADD COLUMN `reject_reason_cv_id` INT(11) NULL DEFAULT NULL AFTER `client_classification_cv_id`,
	ADD COLUMN `rejectedon_date` DATE NULL DEFAULT NULL AFTER `reject_reason_cv_id`,
	ADD COLUMN `rejectedon_userid` BIGINT(20) NULL DEFAULT NULL AFTER `rejectedon_date`,
	ADD COLUMN `withdraw_reason_cv_id` INT(11) NULL DEFAULT NULL AFTER `rejectedon_userid`,
	ADD COLUMN `withdrawn_on_date` DATE NULL DEFAULT NULL AFTER `withdraw_reason_cv_id`,
	ADD COLUMN `withdraw_on_userid` BIGINT(20) NULL DEFAULT NULL AFTER `withdrawn_on_date`,
	ADD CONSTRAINT `FK_m_client_type_mcode_value_reject` FOREIGN KEY (`reject_reason_cv_id`) REFERENCES `m_code_value` (`id`),
	ADD CONSTRAINT `FK_m_client_type_m_code_value_withdraw` FOREIGN KEY (`withdraw_reason_cv_id`) REFERENCES `m_code_value` (`id`);
SELECT `DEFAULT_COLLATION_NAME` FROM `information_schema`.`SCHEMATA` WHERE `SCHEMA_NAME`='mifostenant-default';
SHOW TABLE STATUS FROM `mifostenant-default`;
SHOW FUNCTION STATUS WHERE `Db`='mifostenant-default';
SHOW PROCEDURE STATUS WHERE `Db`='mifostenant-default';
SHOW TRIGGERS FROM `mifostenant-default`;
SHOW EVENTS FROM `mifostenant-default`;
SHOW CREATE TABLE `mifostenant-default`.`m_client`;
/* Entering session "mifosx" */

ALTER TABLE `m_client`
	ADD COLUMN `updated_by` BIGINT(20) NULL DEFAULT NULL AFTER `closedon_date`,
	ADD COLUMN `updated_on` DATE NULL DEFAULT NULL AFTER `updated_by`;



INSERT INTO `m_permission` ( `grouping`, `code`, `entity_name`, `action_name`, `can_maker_checker`) VALUES ( 'portfolio', 'REJECT_CLIENT', 'CLIENT', 'REJECT', 1);
INSERT INTO `m_permission` (`grouping`, `code`, `entity_name`, `action_name`, `can_maker_checker`) VALUES ( 'portfolio', 'REJECT_CLIENT_CHECKER', 'CLIENT', 'REJECT_CHECKER', 0);

INSERT INTO `m_permission` ( `grouping`, `code`, `entity_name`, `action_name`, `can_maker_checker`) VALUES ( 'portfolio', 'WITHDRAW_CLIENT', 'CLIENT', 'WITHDRAW', 1);
INSERT INTO `m_permission` (`grouping`, `code`, `entity_name`, `action_name`, `can_maker_checker`) VALUES ('portfolio', 'WITHDRAW_CLIENT_CHECKER', 'CLIENT', 'WITHDRAW_CHECKER', 0);


INSERT INTO `m_code` ( `code_name`, `is_system_defined`) VALUES ( 'ClientRejectReason', 1);


INSERT INTO `m_code_value` ( `code_id`, `code_value`, `order_position`, `code_score`) VALUES ( (SELECT id  from m_code where code_name = 'ClientRejectReason') , 'Client Rejected', 1, NULL);

INSERT INTO `m_code` ( `code_name`, `is_system_defined`) VALUES ( 'ClientWithdrawReason', 1);

INSERT INTO `m_code_value` ( `code_id`, `code_value`, `order_position`, `code_score`) VALUES ( (SELECT id  from m_code where code_name = 'ClientWithdrawReason') , 'Client Withdrawn', 1, NULL);



INSERT INTO `m_permission` (`grouping`, `code`, `entity_name`, `action_name`, `can_maker_checker`) VALUES ( 'portfolio', 'REACTIVATE_CLIENT', 'CLIENT', 'REACTIVATE', 1);
INSERT INTO `m_permission` ( `grouping`, `code`, `entity_name`, `action_name`, `can_maker_checker`) VALUES ( 'portfolio', 'REACTIVATE_CLIENT_CHECKER', 'CLIENT', 'REACTIVATE_CHECKER', 0);


ALTER TABLE `m_client`
	ADD COLUMN `reactivated_on_date` DATE NULL AFTER `withdraw_on_userid`,
	ADD COLUMN `reactivated_on_userid` BIGINT(20) NULL AFTER `reactivated_on_date`;