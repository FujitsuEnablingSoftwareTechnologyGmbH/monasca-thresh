CREATE TABLE `alarm` (
  `id` varchar(36) NOT NULL,
  `tenant_id` varchar(36) NOT NULL,
  `name` varchar(250) NOT NULL,
  `description` varchar(250) NOT NULL,
  `expression` mediumtext NOT NULL,
  `state` varchar(20) NOT NULL check state in ('UNDETERMINED','OK','ALARM'),
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime,
  PRIMARY KEY (`id`)
);

CREATE TABLE `sub_alarm` (
  `id` varchar(36) NOT NULL,
  `alarm_id` varchar(36) NOT NULL,
  `function` varchar(10) NOT NULL,
  `metric_name` varchar(100) NOT NULL,
  `operator` varchar(5) NOT NULL,
  `threshold` double NOT NULL,
  `period` int(11) NOT NULL,
  `periods` int(11) NOT NULL,
  `state` varchar(20) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `sub_alarm_dimension` (
  `sub_alarm_id` varchar(36) NOT NULL,
  `dimension_name` varchar(50) NOT NULL,
  `value` varchar(300) NOT NULL,
  PRIMARY KEY (`sub_alarm_id`,`dimension_name`)
);

CREATE TABLE `alarm_action` (
  `alarm_id` varchar(36) NOT NULL,
  `action_id` varchar(50) NOT NULL,
  PRIMARY KEY (`alarm_id`,`action_id`)
);
