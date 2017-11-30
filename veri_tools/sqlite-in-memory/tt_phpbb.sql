DROP TABLE IF EXISTS `phpbb_acl_groups`;

CREATE TABLE `phpbb_acl_groups` (
  `group_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `auth_option_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `auth_role_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `auth_setting` tinyint(2) NOT NULL DEFAULT '0',
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  KEY `group_id` (`group_id`),
  KEY `auth_opt_id` (`auth_option_id`),
  KEY `auth_role_id` (`auth_role_id`),
  UNIQUE KEY `phpbb_acl_groups_unique` (`start_ts`, `group_id`, `forum_id`, `auth_option_id`, `auth_role_id`, `auth_setting`),
  KEY `end_ts` (`end_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `phpbb_acl_options`;

CREATE TABLE `phpbb_acl_options` (
  `auth_option_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `auth_option` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '',
  `is_global` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_local` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `founder_only` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  KEY `phpbb_acl_options_old_primary` (`auth_option_id`),
  PRIMARY KEY (`start_ts`, `auth_option_id`),
  UNIQUE KEY `auth_option` (`start_ts`, `auth_option`),
  KEY `end_ts` (`end_ts`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `phpbb_acl_roles`;

CREATE TABLE `phpbb_acl_roles` (
  `role_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `role_description` text COLLATE utf8_bin NOT NULL,
  `role_type` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '',
  `role_order` smallint(4) unsigned NOT NULL DEFAULT '0',
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  KEY `phpbb_acl_roles_old_primary` (`role_id`),
  PRIMARY KEY (`start_ts`, `role_id`),
  KEY `role_type` (`role_type`),
  KEY `role_order` (`role_order`),
  KEY `end_ts` (`end_ts`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `phpbb_acl_roles_data`;

CREATE TABLE `phpbb_acl_roles_data` (
  `role_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `auth_option_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `auth_setting` tinyint(2) NOT NULL DEFAULT '0',
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  KEY `phpbb_acl_roles_data_old_primary` (`role_id`,`auth_option_id`),
  PRIMARY KEY (`start_ts`, `role_id`,`auth_option_id`),
  KEY `ath_op_id` (`auth_option_id`),
  KEY `end_ts` (`end_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `phpbb_acl_users`;

CREATE TABLE `phpbb_acl_users` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `auth_option_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `auth_role_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `auth_setting` tinyint(2) NOT NULL DEFAULT '0',
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `auth_option_id` (`auth_option_id`),
  KEY `auth_role_id` (`auth_role_id`),
  UNIQUE KEY `phpbb_acl_users_unique` (`start_ts`, `user_id`, `forum_id`, `auth_option_id`, `auth_role_id`, `auth_setting`),
  KEY `end_ts` (`end_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `phpbb_attachments`;

CREATE TABLE `phpbb_attachments` (
  `attach_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_msg_id` int(10) unsigned NOT NULL DEFAULT '0',
  `topic_id` int(10) unsigned NOT NULL DEFAULT '0',
  `in_message` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `poster_id` int(10) unsigned NOT NULL DEFAULT '0',
  `is_orphan` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `physical_filename` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `real_filename` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `download_count` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `attach_comment` text COLLATE utf8_bin NOT NULL,
  `extension` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `mimetype` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `filesize` int(20) unsigned NOT NULL DEFAULT '0',
  `filetime` int(11) unsigned NOT NULL DEFAULT '0',
  `thumbnail` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  KEY `phpbb_attachments_old_primary` (`attach_id`),
  PRIMARY KEY (`start_ts`, `attach_id`),
  KEY `filetime` (`filetime`),
  KEY `post_msg_id` (`post_msg_id`),
  KEY `topic_id` (`topic_id`),
  KEY `poster_id` (`poster_id`),
  KEY `is_orphan` (`is_orphan`),
  KEY `end_ts` (`end_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `phpbb_banlist`;

CREATE TABLE `phpbb_banlist` (
  `ban_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ban_userid` int(10) unsigned NOT NULL DEFAULT '0',
  `ban_ip` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ban_email` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ban_start` int(11) unsigned NOT NULL DEFAULT '0',
  `ban_end` int(11) unsigned NOT NULL DEFAULT '0',
  `ban_exclude` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ban_reason` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ban_give_reason` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  KEY `phpbb_banlist_old_primary` (`ban_id`),
  PRIMARY KEY (`start_ts`, `ban_id`),
  KEY `ban_end` (`ban_end`),
  KEY `ban_user` (`ban_userid`,`ban_exclude`),
  KEY `ban_email` (`ban_email`,`ban_exclude`),
  KEY `ban_ip` (`ban_ip`,`ban_exclude`),
  KEY `end_ts` (`end_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `phpbb_bbcodes`;

CREATE TABLE `phpbb_bbcodes` (
  `bbcode_id` smallint(4) unsigned NOT NULL DEFAULT '0',
  `bbcode_tag` varchar(16) COLLATE utf8_bin NOT NULL DEFAULT '',
  `bbcode_helpline` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_on_posting` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `bbcode_match` text COLLATE utf8_bin NOT NULL,
  `bbcode_tpl` mediumtext COLLATE utf8_bin NOT NULL,
  `first_pass_match` mediumtext COLLATE utf8_bin NOT NULL,
  `first_pass_replace` mediumtext COLLATE utf8_bin NOT NULL,
  `second_pass_match` mediumtext COLLATE utf8_bin NOT NULL,
  `second_pass_replace` mediumtext COLLATE utf8_bin NOT NULL,
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  KEY `phpbb_bbcodes_old_primary` (`bbcode_id`),
  PRIMARY KEY (`start_ts`, `bbcode_id`),
  KEY `display_on_post` (`display_on_posting`),
  KEY `end_ts` (`end_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `phpbb_bookmarks`;

CREATE TABLE `phpbb_bookmarks` (
  `topic_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  KEY `phpbb_bookmarks_old_primary` (`topic_id`,`user_id`),
  PRIMARY KEY (`start_ts`, `topic_id`,`user_id`),
  KEY `end_ts` (`end_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `phpbb_bots`;

CREATE TABLE `phpbb_bots` (
  `bot_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bot_active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `bot_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `bot_agent` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `bot_ip` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  KEY `phpbb_bots_old_primary` (`bot_id`),
  PRIMARY KEY (`start_ts`, `bot_id`),
  KEY `bot_active` (`bot_active`),
  KEY `end_ts` (`end_ts`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `phpbb_config`;

CREATE TABLE `phpbb_config` (
  `config_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `config_value` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `is_dynamic` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  KEY `phpbb_config_old_primary` (`config_name`),
  PRIMARY KEY (`start_ts`, `config_name`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `end_ts` (`end_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `phpbb_config_text`;

CREATE TABLE `phpbb_config_text` (
  `config_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `config_value` mediumtext COLLATE utf8_bin NOT NULL,
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  KEY `phpbb_config_text_old_primary` (`config_name`),
  PRIMARY KEY (`start_ts`, `config_name`),
  KEY `end_ts` (`end_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `phpbb_confirm`;

CREATE TABLE `phpbb_confirm` (
  `confirm_id` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `session_id` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `confirm_type` tinyint(3) NOT NULL DEFAULT '0',
  `code` varchar(8) COLLATE utf8_bin NOT NULL DEFAULT '',
  `seed` int(10) unsigned NOT NULL DEFAULT '0',
  `attempts` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  KEY `phpbb_confirm_old_primary` (`session_id`,`confirm_id`),
  PRIMARY KEY (`start_ts`, `session_id`,`confirm_id`),
  KEY `confirm_type` (`confirm_type`),
  KEY `end_ts` (`end_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `phpbb_disallow`;

CREATE TABLE `phpbb_disallow` (
  `disallow_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `disallow_username` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  KEY `phpbb_disallow_old_primary` (`disallow_id`),
  PRIMARY KEY (`start_ts`, `disallow_id`),
  KEY `end_ts` (`end_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `phpbb_drafts`;

CREATE TABLE `phpbb_drafts` (
  `draft_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `topic_id` int(10) unsigned NOT NULL DEFAULT '0',
  `forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `save_time` int(11) unsigned NOT NULL DEFAULT '0',
  `draft_subject` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `draft_message` mediumtext COLLATE utf8_bin NOT NULL,
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  KEY `phpbb_drafts_old_primary` (`draft_id`),
  PRIMARY KEY (`start_ts`, `draft_id`),
  KEY `save_time` (`save_time`),
  KEY `end_ts` (`end_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `phpbb_ext`;

CREATE TABLE `phpbb_ext` (
  `ext_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ext_active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ext_state` text COLLATE utf8_bin NOT NULL,
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  UNIQUE KEY `ext_name` (`start_ts`, `ext_name`),
  KEY `end_ts` (`end_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `phpbb_extension_groups`;

CREATE TABLE `phpbb_extension_groups` (
  `group_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `cat_id` tinyint(2) NOT NULL DEFAULT '0',
  `allow_group` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `download_mode` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `upload_icon` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `max_filesize` int(20) unsigned NOT NULL DEFAULT '0',
  `allowed_forums` text COLLATE utf8_bin NOT NULL,
  `allow_in_pm` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  KEY `phpbb_extension_groups_old_primary` (`group_id`),
  PRIMARY KEY (`start_ts`, `group_id`),
  KEY `end_ts` (`end_ts`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `phpbb_extensions`;

CREATE TABLE `phpbb_extensions` (
  `extension_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `extension` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  KEY `phpbb_extensions_old_primary` (`extension_id`),
  PRIMARY KEY (`start_ts`, `extension_id`),
  KEY `end_ts` (`end_ts`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `phpbb_forums`;

CREATE TABLE `phpbb_forums` (
  `forum_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `left_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `right_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_parents` mediumtext COLLATE utf8_bin NOT NULL,
  `forum_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `forum_desc` text COLLATE utf8_bin NOT NULL,
  `forum_desc_bitfield` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `forum_desc_options` int(11) unsigned NOT NULL DEFAULT '7',
  `forum_desc_uid` varchar(8) COLLATE utf8_bin NOT NULL DEFAULT '',
  `forum_link` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `forum_password` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `forum_style` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_image` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `forum_rules` text COLLATE utf8_bin NOT NULL,
  `forum_rules_link` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `forum_rules_bitfield` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `forum_rules_options` int(11) unsigned NOT NULL DEFAULT '7',
  `forum_rules_uid` varchar(8) COLLATE utf8_bin NOT NULL DEFAULT '',
  `forum_topics_per_page` tinyint(4) NOT NULL DEFAULT '0',
  `forum_type` tinyint(4) NOT NULL DEFAULT '0',
  `forum_status` tinyint(4) NOT NULL DEFAULT '0',
  `forum_last_post_id` int(10) unsigned NOT NULL DEFAULT '0',
  `forum_last_poster_id` int(10) unsigned NOT NULL DEFAULT '0',
  `forum_last_post_subject` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `forum_last_post_time` int(11) unsigned NOT NULL DEFAULT '0',
  `forum_last_poster_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `forum_last_poster_colour` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT '',
  `forum_flags` tinyint(4) NOT NULL DEFAULT '32',
  `display_on_index` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `enable_indexing` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `enable_icons` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `enable_prune` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `prune_next` int(11) unsigned NOT NULL DEFAULT '0',
  `prune_days` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `prune_viewed` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `prune_freq` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `display_subforum_list` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `forum_options` int(20) unsigned NOT NULL DEFAULT '0',
  `forum_posts_approved` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_posts_unapproved` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_posts_softdeleted` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_topics_approved` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_topics_unapproved` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_topics_softdeleted` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `enable_shadow_prune` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `prune_shadow_days` mediumint(8) unsigned NOT NULL DEFAULT '7',
  `prune_shadow_freq` mediumint(8) unsigned NOT NULL DEFAULT '1',
  `prune_shadow_next` int(11) NOT NULL DEFAULT '0',
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  KEY `phpbb_forums_old_primary` (`forum_id`),
  PRIMARY KEY (`start_ts`, `forum_id`),
  KEY `left_right_id` (`left_id`,`right_id`),
  KEY `forum_lastpost_id` (`forum_last_post_id`),
  KEY `end_ts` (`end_ts`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `phpbb_forums_access`;

CREATE TABLE `phpbb_forums_access` (
  `forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `session_id` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  KEY `phpbb_forums_access_old_primary` (`forum_id`,`user_id`,`session_id`),
  PRIMARY KEY (`start_ts`, `forum_id`,`user_id`,`session_id`),
  KEY `end_ts` (`end_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `phpbb_forums_track`;

CREATE TABLE `phpbb_forums_track` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `mark_time` int(11) unsigned NOT NULL DEFAULT '0',
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  KEY `phpbb_forums_track_old_primary` (`user_id`,`forum_id`),
  PRIMARY KEY (`start_ts`, `user_id`,`forum_id`),
  KEY `end_ts` (`end_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `phpbb_forums_watch`;

CREATE TABLE `phpbb_forums_watch` (
  `forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `notify_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  KEY `forum_id` (`forum_id`),
  KEY `user_id` (`user_id`),
  KEY `notify_stat` (`notify_status`),
  UNIQUE KEY `phpbb_forums_watch_unique` (`start_ts`, `forum_id`, `user_id`, `notify_status`),
  KEY `end_ts` (`end_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `phpbb_groups`;

CREATE TABLE `phpbb_groups` (
  `group_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `group_type` tinyint(4) NOT NULL DEFAULT '1',
  `group_founder_manage` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `group_skip_auth` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `group_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `group_desc` text COLLATE utf8_bin NOT NULL,
  `group_desc_bitfield` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `group_desc_options` int(11) unsigned NOT NULL DEFAULT '7',
  `group_desc_uid` varchar(8) COLLATE utf8_bin NOT NULL DEFAULT '',
  `group_display` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `group_avatar` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `group_avatar_type` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `group_avatar_width` smallint(4) unsigned NOT NULL DEFAULT '0',
  `group_avatar_height` smallint(4) unsigned NOT NULL DEFAULT '0',
  `group_rank` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `group_colour` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT '',
  `group_sig_chars` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `group_receive_pm` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `group_message_limit` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `group_legend` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `group_max_recipients` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  KEY `phpbb_groups_old_primary` (`group_id`),
  PRIMARY KEY (`start_ts`, `group_id`),
  KEY `group_legend_name` (`group_legend`,`group_name`),
  KEY `end_ts` (`end_ts`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `phpbb_icons`;

CREATE TABLE `phpbb_icons` (
  `icons_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `icons_url` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `icons_width` tinyint(4) NOT NULL DEFAULT '0',
  `icons_height` tinyint(4) NOT NULL DEFAULT '0',
  `icons_alt` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `icons_order` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `display_on_posting` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  KEY `phpbb_icons_old_primary` (`icons_id`),
  PRIMARY KEY (`start_ts`, `icons_id`),
  KEY `display_on_posting` (`display_on_posting`),
  KEY `end_ts` (`end_ts`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `phpbb_lang`;

CREATE TABLE `phpbb_lang` (
  `lang_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `lang_iso` varchar(30) COLLATE utf8_bin NOT NULL DEFAULT '',
  `lang_dir` varchar(30) COLLATE utf8_bin NOT NULL DEFAULT '',
  `lang_english_name` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `lang_local_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `lang_author` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  KEY `phpbb_lang_old_primary` (`lang_id`),
  PRIMARY KEY (`start_ts`, `lang_id`),
  KEY `lang_iso` (`lang_iso`),
  KEY `end_ts` (`end_ts`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `phpbb_log`;

CREATE TABLE `phpbb_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `log_type` tinyint(4) NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_id` int(10) unsigned NOT NULL DEFAULT '0',
  `post_id` int(10) unsigned NOT NULL DEFAULT '0',
  `reportee_id` int(10) unsigned NOT NULL DEFAULT '0',
  `log_ip` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `log_time` int(11) unsigned NOT NULL DEFAULT '0',
  `log_operation` text COLLATE utf8_bin NOT NULL,
  `log_data` mediumtext COLLATE utf8_bin NOT NULL,
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  KEY `phpbb_log_old_primary` (`log_id`),
  PRIMARY KEY (`start_ts`, `log_id`),
  KEY `log_type` (`log_type`),
  KEY `forum_id` (`forum_id`),
  KEY `topic_id` (`topic_id`),
  KEY `reportee_id` (`reportee_id`),
  KEY `user_id` (`user_id`),
  KEY `log_time` (`log_time`),
  KEY `end_ts` (`end_ts`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `phpbb_login_attempts`;

CREATE TABLE `phpbb_login_attempts` (
  `attempt_ip` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `attempt_browser` varchar(150) COLLATE utf8_bin NOT NULL DEFAULT '',
  `attempt_forwarded_for` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `attempt_time` int(11) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `username` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `username_clean` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  KEY `att_ip` (`attempt_ip`,`attempt_time`),
  KEY `att_for` (`attempt_forwarded_for`,`attempt_time`),
  KEY `att_time` (`attempt_time`),
  KEY `user_id` (`user_id`),
  UNIQUE KEY `phpbb_login_attempts_unique` (`start_ts`, `attempt_ip`, `attempt_time`, `user_id`),
  KEY `end_ts` (`end_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `phpbb_migrations`;

CREATE TABLE `phpbb_migrations` (
  `migration_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `migration_depends_on` text COLLATE utf8_bin NOT NULL,
  `migration_schema_done` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `migration_data_done` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `migration_data_state` text COLLATE utf8_bin NOT NULL,
  `migration_start_time` int(11) unsigned NOT NULL DEFAULT '0',
  `migration_end_time` int(11) unsigned NOT NULL DEFAULT '0',
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  KEY `phpbb_migrations_old_primary` (`migration_name`),
  PRIMARY KEY (`start_ts`, `migration_name`),
  KEY `end_ts` (`end_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `phpbb_moderator_cache`;

CREATE TABLE `phpbb_moderator_cache` (
  `forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `username` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `group_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `group_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_on_index` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  KEY `disp_idx` (`display_on_index`),
  KEY `forum_id` (`forum_id`),
  UNIQUE KEY `phpbb_moderator_cache_unique` (`start_ts`, `forum_id`, `user_id`, `group_id`, `display_on_index`),
  KEY `end_ts` (`end_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `phpbb_modules`;

CREATE TABLE `phpbb_modules` (
  `module_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `module_enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `module_display` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `module_basename` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `module_class` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '',
  `parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `left_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `right_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `module_langname` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `module_mode` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `module_auth` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  KEY `phpbb_modules_old_primary` (`module_id`),
  PRIMARY KEY (`start_ts`, `module_id`),
  KEY `left_right_id` (`left_id`,`right_id`),
  KEY `module_enabled` (`module_enabled`),
  KEY `class_left_id` (`module_class`,`left_id`),
  KEY `end_ts` (`end_ts`)
) ENGINE=InnoDB AUTO_INCREMENT=208 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `phpbb_notification_types`;

CREATE TABLE `phpbb_notification_types` (
  `notification_type_id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `notification_type_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `notification_type_enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  KEY `phpbb_notification_types_old_primary` (`notification_type_id`),
  PRIMARY KEY (`start_ts`, `notification_type_id`),
  UNIQUE KEY `type` (`start_ts`, `notification_type_name`),
  KEY `end_ts` (`end_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `phpbb_notifications`;

CREATE TABLE `phpbb_notifications` (
  `notification_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `notification_type_id` smallint(4) unsigned NOT NULL DEFAULT '0',
  `item_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item_parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `notification_read` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `notification_time` int(11) unsigned NOT NULL DEFAULT '1',
  `notification_data` text COLLATE utf8_bin NOT NULL,
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  KEY `phpbb_notifications_old_primary` (`notification_id`),
  PRIMARY KEY (`start_ts`, `notification_id`),
  KEY `item_ident` (`notification_type_id`,`item_id`),
  KEY `user` (`user_id`,`notification_read`),
  KEY `end_ts` (`end_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `phpbb_oauth_accounts`;

CREATE TABLE `phpbb_oauth_accounts` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `provider` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `oauth_provider_id` text COLLATE utf8_bin NOT NULL,
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  KEY `phpbb_oauth_accounts_old_primary` (`user_id`,`provider`),
  PRIMARY KEY (`start_ts`, `user_id`,`provider`),
  KEY `end_ts` (`end_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `phpbb_oauth_states`;

CREATE TABLE `phpbb_oauth_states` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `session_id` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `provider` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `oauth_state` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `provider` (`provider`),
  UNIQUE KEY `phpbb_oauth_states_unique` (`start_ts`, `user_id`, `session_id`),
  KEY `end_ts` (`end_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `phpbb_oauth_tokens`;

CREATE TABLE `phpbb_oauth_tokens` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `session_id` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `provider` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `oauth_token` mediumtext COLLATE utf8_bin NOT NULL,
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `provider` (`provider`),
  UNIQUE KEY `phpbb_oauth_tokens_unique` (`start_ts`, `user_id`, `session_id`),
  KEY `end_ts` (`end_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `phpbb_poll_options`;

CREATE TABLE `phpbb_poll_options` (
  `poll_option_id` tinyint(4) NOT NULL DEFAULT '0',
  `topic_id` int(10) unsigned NOT NULL DEFAULT '0',
  `poll_option_text` text COLLATE utf8_bin NOT NULL,
  `poll_option_total` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  KEY `poll_opt_id` (`poll_option_id`),
  KEY `topic_id` (`topic_id`),
  UNIQUE KEY `phpbb_poll_options_unique` (`start_ts`, `poll_option_id`, `topic_id`, `poll_option_total`),
  KEY `end_ts` (`end_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `phpbb_poll_votes`;

CREATE TABLE `phpbb_poll_votes` (
  `topic_id` int(10) unsigned NOT NULL DEFAULT '0',
  `poll_option_id` tinyint(4) NOT NULL DEFAULT '0',
  `vote_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `vote_user_ip` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  KEY `topic_id` (`topic_id`),
  KEY `vote_user_id` (`vote_user_id`),
  KEY `vote_user_ip` (`vote_user_ip`),
  UNIQUE KEY `phpbb_poll_votes_unique` (`start_ts`, `topic_id`, `poll_option_id`, `vote_user_id`, `vote_user_ip`),
  KEY `end_ts` (`end_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `phpbb_posts`;

CREATE TABLE `phpbb_posts` (
  `post_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `topic_id` int(10) unsigned NOT NULL DEFAULT '0',
  `forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `poster_id` int(10) unsigned NOT NULL DEFAULT '0',
  `icon_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `poster_ip` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `post_time` int(11) unsigned NOT NULL DEFAULT '0',
  `post_reported` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `enable_bbcode` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `enable_smilies` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `enable_magic_url` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `enable_sig` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `post_username` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `post_subject` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `post_text` mediumtext COLLATE utf8_bin NOT NULL,
  `post_checksum` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `post_attachment` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `bbcode_bitfield` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `bbcode_uid` varchar(8) COLLATE utf8_bin NOT NULL DEFAULT '',
  `post_postcount` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `post_edit_time` int(11) unsigned NOT NULL DEFAULT '0',
  `post_edit_reason` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `post_edit_user` int(10) unsigned NOT NULL DEFAULT '0',
  `post_edit_count` smallint(4) unsigned NOT NULL DEFAULT '0',
  `post_edit_locked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `post_visibility` tinyint(3) NOT NULL DEFAULT '0',
  `post_delete_time` int(11) unsigned NOT NULL DEFAULT '0',
  `post_delete_reason` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `post_delete_user` int(10) unsigned NOT NULL DEFAULT '0',
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  KEY `phpbb_posts_old_primary` (`post_id`),
  PRIMARY KEY (`start_ts`, `post_id`),
  KEY `forum_id` (`forum_id`),
  KEY `topic_id` (`topic_id`),
  KEY `poster_ip` (`poster_ip`),
  KEY `poster_id` (`poster_id`),
  KEY `tid_post_time` (`topic_id`,`post_time`),
  KEY `post_username` (`post_username`),
  KEY `post_visibility` (`post_visibility`),
  KEY `end_ts` (`end_ts`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `phpbb_privmsgs`;

CREATE TABLE `phpbb_privmsgs` (
  `msg_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `root_level` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `icon_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `author_ip` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `message_time` int(11) unsigned NOT NULL DEFAULT '0',
  `enable_bbcode` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `enable_smilies` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `enable_magic_url` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `enable_sig` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `message_subject` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `message_text` mediumtext COLLATE utf8_bin NOT NULL,
  `message_edit_reason` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `message_edit_user` int(10) unsigned NOT NULL DEFAULT '0',
  `message_attachment` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `bbcode_bitfield` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `bbcode_uid` varchar(8) COLLATE utf8_bin NOT NULL DEFAULT '',
  `message_edit_time` int(11) unsigned NOT NULL DEFAULT '0',
  `message_edit_count` smallint(4) unsigned NOT NULL DEFAULT '0',
  `to_address` text COLLATE utf8_bin NOT NULL,
  `bcc_address` text COLLATE utf8_bin NOT NULL,
  `message_reported` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  KEY `phpbb_privmsgs_old_primary` (`msg_id`),
  PRIMARY KEY (`start_ts`, `msg_id`),
  KEY `author_ip` (`author_ip`),
  KEY `message_time` (`message_time`),
  KEY `author_id` (`author_id`),
  KEY `root_level` (`root_level`),
  KEY `end_ts` (`end_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `phpbb_privmsgs_folder`;

CREATE TABLE `phpbb_privmsgs_folder` (
  `folder_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `folder_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pm_count` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  KEY `phpbb_privmsgs_folder_old_primary` (`folder_id`),
  PRIMARY KEY (`start_ts`, `folder_id`),
  KEY `user_id` (`user_id`),
  KEY `end_ts` (`end_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `phpbb_privmsgs_rules`;

CREATE TABLE `phpbb_privmsgs_rules` (
  `rule_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `rule_check` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `rule_connection` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `rule_string` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `rule_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `rule_group_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `rule_action` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `rule_folder_id` int(11) NOT NULL DEFAULT '0',
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  KEY `phpbb_privmsgs_rules_old_primary` (`rule_id`),
  PRIMARY KEY (`start_ts`, `rule_id`),
  KEY `user_id` (`user_id`),
  KEY `end_ts` (`end_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `phpbb_privmsgs_to`;

CREATE TABLE `phpbb_privmsgs_to` (
  `msg_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `pm_deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pm_new` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `pm_unread` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `pm_replied` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pm_marked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pm_forwarded` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `folder_id` int(11) NOT NULL DEFAULT '0',
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  KEY `msg_id` (`msg_id`),
  KEY `author_id` (`author_id`),
  KEY `usr_flder_id` (`user_id`,`folder_id`),
  UNIQUE KEY `phpbb_privmsgs_to_unique` (`start_ts`, `msg_id`, `user_id`, `author_id`, `pm_deleted`, `pm_new`, `pm_unread`, `pm_replied`, `pm_marked`, `pm_forwarded`, `folder_id`),
  KEY `end_ts` (`end_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `phpbb_profile_fields`;

CREATE TABLE `phpbb_profile_fields` (
  `field_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `field_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `field_type` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `field_ident` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '',
  `field_length` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '',
  `field_minlen` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `field_maxlen` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `field_novalue` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `field_default_value` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `field_validation` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `field_required` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_show_on_reg` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_hide` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_no_view` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_order` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_show_profile` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_show_on_vt` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_show_novalue` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_show_on_pm` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_show_on_ml` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_is_contact` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_contact_desc` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `field_contact_url` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  KEY `phpbb_profile_fields_old_primary` (`field_id`),
  PRIMARY KEY (`start_ts`, `field_id`),
  KEY `fld_type` (`field_type`),
  KEY `fld_ordr` (`field_order`),
  KEY `end_ts` (`end_ts`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `phpbb_profile_fields_data`;

CREATE TABLE `phpbb_profile_fields_data` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `pf_phpbb_interests` mediumtext COLLATE utf8_bin NOT NULL,
  `pf_phpbb_occupation` mediumtext COLLATE utf8_bin NOT NULL,
  `pf_phpbb_location` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pf_phpbb_youtube` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pf_phpbb_facebook` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pf_phpbb_icq` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pf_phpbb_skype` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pf_phpbb_twitter` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pf_phpbb_googleplus` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pf_phpbb_website` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pf_phpbb_yahoo` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pf_phpbb_aol` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  KEY `phpbb_profile_fields_data_old_primary` (`user_id`),
  PRIMARY KEY (`start_ts`, `user_id`),
  KEY `end_ts` (`end_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `phpbb_profile_fields_lang`;

CREATE TABLE `phpbb_profile_fields_lang` (
  `field_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `lang_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `option_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_type` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `lang_value` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  KEY `phpbb_profile_fields_lang_old_primary` (`field_id`,`lang_id`,`option_id`),
  PRIMARY KEY (`start_ts`, `field_id`,`lang_id`,`option_id`),
  KEY `end_ts` (`end_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `phpbb_profile_lang`;

CREATE TABLE `phpbb_profile_lang` (
  `field_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `lang_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `lang_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `lang_explain` text COLLATE utf8_bin NOT NULL,
  `lang_default_value` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  KEY `phpbb_profile_lang_old_primary` (`field_id`,`lang_id`),
  PRIMARY KEY (`start_ts`, `field_id`,`lang_id`),
  KEY `end_ts` (`end_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `phpbb_ranks`;

CREATE TABLE `phpbb_ranks` (
  `rank_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `rank_title` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `rank_min` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `rank_special` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `rank_image` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  KEY `phpbb_ranks_old_primary` (`rank_id`),
  PRIMARY KEY (`start_ts`, `rank_id`),
  KEY `end_ts` (`end_ts`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `phpbb_reports`;

CREATE TABLE `phpbb_reports` (
  `report_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reason_id` smallint(4) unsigned NOT NULL DEFAULT '0',
  `post_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_notify` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `report_closed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `report_time` int(11) unsigned NOT NULL DEFAULT '0',
  `report_text` mediumtext COLLATE utf8_bin NOT NULL,
  `pm_id` int(10) unsigned NOT NULL DEFAULT '0',
  `reported_post_enable_bbcode` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `reported_post_enable_smilies` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `reported_post_enable_magic_url` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `reported_post_text` mediumtext COLLATE utf8_bin NOT NULL,
  `reported_post_uid` varchar(8) COLLATE utf8_bin NOT NULL DEFAULT '',
  `reported_post_bitfield` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  KEY `phpbb_reports_old_primary` (`report_id`),
  PRIMARY KEY (`start_ts`, `report_id`),
  KEY `post_id` (`post_id`),
  KEY `pm_id` (`pm_id`),
  KEY `end_ts` (`end_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `phpbb_reports_reasons`;

CREATE TABLE `phpbb_reports_reasons` (
  `reason_id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `reason_title` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `reason_description` mediumtext COLLATE utf8_bin NOT NULL,
  `reason_order` smallint(4) unsigned NOT NULL DEFAULT '0',
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  KEY `phpbb_reports_reasons_old_primary` (`reason_id`),
  PRIMARY KEY (`start_ts`, `reason_id`),
  KEY `end_ts` (`end_ts`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `phpbb_search_results`;

CREATE TABLE `phpbb_search_results` (
  `search_key` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_time` int(11) unsigned NOT NULL DEFAULT '0',
  `search_keywords` mediumtext COLLATE utf8_bin NOT NULL,
  `search_authors` mediumtext COLLATE utf8_bin NOT NULL,
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  KEY `phpbb_search_results_old_primary` (`search_key`),
  PRIMARY KEY (`start_ts`, `search_key`),
  KEY `end_ts` (`end_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `phpbb_search_wordlist`;

CREATE TABLE `phpbb_search_wordlist` (
  `word_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `word_text` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `word_common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `word_count` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  KEY `phpbb_search_wordlist_old_primary` (`word_id`),
  PRIMARY KEY (`start_ts`, `word_id`),
  UNIQUE KEY `wrd_txt` (`start_ts`, `word_text`),
  KEY `wrd_cnt` (`word_count`),
  KEY `end_ts` (`end_ts`)
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `phpbb_search_wordmatch`;

CREATE TABLE `phpbb_search_wordmatch` (
  `post_id` int(10) unsigned NOT NULL DEFAULT '0',
  `word_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title_match` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  UNIQUE KEY `un_mtch` (`start_ts`, `word_id`,`post_id`,`title_match`),
  KEY `word_id` (`word_id`),
  KEY `post_id` (`post_id`),
  KEY `end_ts` (`end_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `phpbb_sessions`;

CREATE TABLE `phpbb_sessions` (
  `session_id` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `session_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `session_last_visit` int(11) unsigned NOT NULL DEFAULT '0',
  `session_start` int(11) unsigned NOT NULL DEFAULT '0',
  `session_time` int(11) unsigned NOT NULL DEFAULT '0',
  `session_ip` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `session_browser` varchar(150) COLLATE utf8_bin NOT NULL DEFAULT '',
  `session_forwarded_for` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `session_page` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `session_viewonline` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `session_autologin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `session_admin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `session_forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  KEY `phpbb_sessions_old_primary` (`session_id`),
  PRIMARY KEY (`start_ts`, `session_id`),
  KEY `session_time` (`session_time`),
  KEY `session_user_id` (`session_user_id`),
  KEY `session_fid` (`session_forum_id`),
  KEY `end_ts` (`end_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `phpbb_sessions_keys`;

CREATE TABLE `phpbb_sessions_keys` (
  `key_id` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `last_ip` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `last_login` int(11) unsigned NOT NULL DEFAULT '0',
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  KEY `phpbb_sessions_keys_old_primary` (`key_id`,`user_id`),
  PRIMARY KEY (`start_ts`, `key_id`,`user_id`),
  KEY `last_login` (`last_login`),
  KEY `end_ts` (`end_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `phpbb_sitelist`;

CREATE TABLE `phpbb_sitelist` (
  `site_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `site_ip` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `site_hostname` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ip_exclude` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  KEY `phpbb_sitelist_old_primary` (`site_id`),
  PRIMARY KEY (`start_ts`, `site_id`),
  KEY `end_ts` (`end_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `phpbb_smilies`;

CREATE TABLE `phpbb_smilies` (
  `smiley_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '',
  `emotion` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `smiley_url` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '',
  `smiley_width` smallint(4) unsigned NOT NULL DEFAULT '0',
  `smiley_height` smallint(4) unsigned NOT NULL DEFAULT '0',
  `smiley_order` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `display_on_posting` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  KEY `phpbb_smilies_old_primary` (`smiley_id`),
  PRIMARY KEY (`start_ts`, `smiley_id`),
  KEY `display_on_post` (`display_on_posting`),
  KEY `end_ts` (`end_ts`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `phpbb_styles`;

CREATE TABLE `phpbb_styles` (
  `style_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `style_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `style_copyright` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `style_active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `style_path` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `bbcode_bitfield` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT 'kNg=',
  `style_parent_id` int(4) unsigned NOT NULL DEFAULT '0',
  `style_parent_tree` text COLLATE utf8_bin NOT NULL,
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  KEY `phpbb_styles_old_primary` (`style_id`),
  PRIMARY KEY (`start_ts`, `style_id`),
  UNIQUE KEY `style_name` (`start_ts`, `style_name`),
  KEY `end_ts` (`end_ts`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `phpbb_teampage`;

CREATE TABLE `phpbb_teampage` (
  `teampage_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `teampage_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `teampage_position` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `teampage_parent` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  KEY `phpbb_teampage_old_primary` (`teampage_id`),
  PRIMARY KEY (`start_ts`, `teampage_id`),
  KEY `end_ts` (`end_ts`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `phpbb_topics`;

CREATE TABLE `phpbb_topics` (
  `topic_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `icon_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_attachment` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `topic_reported` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `topic_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `topic_poster` int(10) unsigned NOT NULL DEFAULT '0',
  `topic_time` int(11) unsigned NOT NULL DEFAULT '0',
  `topic_time_limit` int(11) unsigned NOT NULL DEFAULT '0',
  `topic_views` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_status` tinyint(3) NOT NULL DEFAULT '0',
  `topic_type` tinyint(3) NOT NULL DEFAULT '0',
  `topic_first_post_id` int(10) unsigned NOT NULL DEFAULT '0',
  `topic_first_poster_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `topic_first_poster_colour` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT '',
  `topic_last_post_id` int(10) unsigned NOT NULL DEFAULT '0',
  `topic_last_poster_id` int(10) unsigned NOT NULL DEFAULT '0',
  `topic_last_poster_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `topic_last_poster_colour` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT '',
  `topic_last_post_subject` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `topic_last_post_time` int(11) unsigned NOT NULL DEFAULT '0',
  `topic_last_view_time` int(11) unsigned NOT NULL DEFAULT '0',
  `topic_moved_id` int(10) unsigned NOT NULL DEFAULT '0',
  `topic_bumped` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `topic_bumper` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `poll_title` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `poll_start` int(11) unsigned NOT NULL DEFAULT '0',
  `poll_length` int(11) unsigned NOT NULL DEFAULT '0',
  `poll_max_options` tinyint(4) NOT NULL DEFAULT '1',
  `poll_last_vote` int(11) unsigned NOT NULL DEFAULT '0',
  `poll_vote_change` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `topic_visibility` tinyint(3) NOT NULL DEFAULT '0',
  `topic_delete_time` int(11) unsigned NOT NULL DEFAULT '0',
  `topic_delete_reason` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `topic_delete_user` int(10) unsigned NOT NULL DEFAULT '0',
  `topic_posts_approved` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_posts_unapproved` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_posts_softdeleted` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  KEY `phpbb_topics_old_primary` (`topic_id`),
  PRIMARY KEY (`start_ts`, `topic_id`),
  KEY `forum_id` (`forum_id`),
  KEY `forum_id_type` (`forum_id`,`topic_type`),
  KEY `last_post_time` (`topic_last_post_time`),
  KEY `fid_time_moved` (`forum_id`,`topic_last_post_time`,`topic_moved_id`),
  KEY `topic_visibility` (`topic_visibility`),
  KEY `forum_vis_last` (`forum_id`,`topic_visibility`,`topic_last_post_id`),
  KEY `end_ts` (`end_ts`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `phpbb_topics_posted`;

CREATE TABLE `phpbb_topics_posted` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `topic_id` int(10) unsigned NOT NULL DEFAULT '0',
  `topic_posted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  KEY `phpbb_topics_posted_old_primary` (`user_id`,`topic_id`),
  PRIMARY KEY (`start_ts`, `user_id`,`topic_id`),
  KEY `end_ts` (`end_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `phpbb_topics_track`;

CREATE TABLE `phpbb_topics_track` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `topic_id` int(10) unsigned NOT NULL DEFAULT '0',
  `forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `mark_time` int(11) unsigned NOT NULL DEFAULT '0',
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  KEY `phpbb_topics_track_old_primary` (`user_id`,`topic_id`),
  PRIMARY KEY (`start_ts`, `user_id`,`topic_id`),
  KEY `forum_id` (`forum_id`),
  KEY `topic_id` (`topic_id`),
  KEY `end_ts` (`end_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `phpbb_topics_watch`;

CREATE TABLE `phpbb_topics_watch` (
  `topic_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `notify_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  KEY `topic_id` (`topic_id`),
  KEY `user_id` (`user_id`),
  KEY `notify_stat` (`notify_status`),
  UNIQUE KEY `phpbb_topics_watch_unique` (`start_ts`, `topic_id`, `user_id`, `notify_status`),
  KEY `end_ts` (`end_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `phpbb_user_group`;

CREATE TABLE `phpbb_user_group` (
  `group_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `group_leader` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `user_pending` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  KEY `group_id` (`group_id`),
  KEY `user_id` (`user_id`),
  KEY `group_leader` (`group_leader`),
  UNIQUE KEY `phpbb_user_group_unique` (`start_ts`, `group_id`, `user_id`, `group_leader`, `user_pending`),
  KEY `end_ts` (`end_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `phpbb_user_notifications`;

CREATE TABLE `phpbb_user_notifications` (
  `item_type` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `item_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `method` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `notify` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  UNIQUE KEY `phpbb_user_notifications_unique` (`start_ts`, `item_id`, `user_id`, `notify`),
  KEY `end_ts` (`end_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `phpbb_users`;

CREATE TABLE `phpbb_users` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_type` tinyint(2) NOT NULL DEFAULT '0',
  `group_id` mediumint(8) unsigned NOT NULL DEFAULT '3',
  `user_permissions` mediumtext COLLATE utf8_bin NOT NULL,
  `user_perm_from` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_ip` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_regdate` int(11) unsigned NOT NULL DEFAULT '0',
  `username` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `username_clean` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_password` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_passchg` int(11) unsigned NOT NULL DEFAULT '0',
  `user_email` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_email_hash` bigint(20) NOT NULL DEFAULT '0',
  `user_birthday` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_lastvisit` int(11) unsigned NOT NULL DEFAULT '0',
  `user_lastmark` int(11) unsigned NOT NULL DEFAULT '0',
  `user_lastpost_time` int(11) unsigned NOT NULL DEFAULT '0',
  `user_lastpage` varchar(200) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_last_confirm_key` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_last_search` int(11) unsigned NOT NULL DEFAULT '0',
  `user_warnings` tinyint(4) NOT NULL DEFAULT '0',
  `user_last_warning` int(11) unsigned NOT NULL DEFAULT '0',
  `user_login_attempts` tinyint(4) NOT NULL DEFAULT '0',
  `user_inactive_reason` tinyint(2) NOT NULL DEFAULT '0',
  `user_inactive_time` int(11) unsigned NOT NULL DEFAULT '0',
  `user_posts` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_lang` varchar(30) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_timezone` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_dateformat` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT 'd M Y H:i',
  `user_style` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_rank` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_colour` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_new_privmsg` int(4) NOT NULL DEFAULT '0',
  `user_unread_privmsg` int(4) NOT NULL DEFAULT '0',
  `user_last_privmsg` int(11) unsigned NOT NULL DEFAULT '0',
  `user_message_rules` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `user_full_folder` int(11) NOT NULL DEFAULT '-3',
  `user_emailtime` int(11) unsigned NOT NULL DEFAULT '0',
  `user_topic_show_days` smallint(4) unsigned NOT NULL DEFAULT '0',
  `user_topic_sortby_type` varchar(1) COLLATE utf8_bin NOT NULL DEFAULT 't',
  `user_topic_sortby_dir` varchar(1) COLLATE utf8_bin NOT NULL DEFAULT 'd',
  `user_post_show_days` smallint(4) unsigned NOT NULL DEFAULT '0',
  `user_post_sortby_type` varchar(1) COLLATE utf8_bin NOT NULL DEFAULT 't',
  `user_post_sortby_dir` varchar(1) COLLATE utf8_bin NOT NULL DEFAULT 'a',
  `user_notify` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `user_notify_pm` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `user_notify_type` tinyint(4) NOT NULL DEFAULT '0',
  `user_allow_pm` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `user_allow_viewonline` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `user_allow_viewemail` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `user_allow_massemail` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `user_options` int(11) unsigned NOT NULL DEFAULT '230271',
  `user_avatar` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_avatar_type` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_avatar_width` smallint(4) unsigned NOT NULL DEFAULT '0',
  `user_avatar_height` smallint(4) unsigned NOT NULL DEFAULT '0',
  `user_sig` mediumtext COLLATE utf8_bin NOT NULL,
  `user_sig_bbcode_uid` varchar(8) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_sig_bbcode_bitfield` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_jabber` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_actkey` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_newpasswd` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_form_salt` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_new` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `user_reminded` tinyint(4) NOT NULL DEFAULT '0',
  `user_reminded_time` int(11) unsigned NOT NULL DEFAULT '0',
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  KEY `phpbb_users_old_primary` (`user_id`),
  PRIMARY KEY (`start_ts`, `user_id`),
  UNIQUE KEY `username_clean` (`start_ts`, `username_clean`),
  KEY `user_birthday` (`user_birthday`),
  KEY `user_email_hash` (`user_email_hash`),
  KEY `user_type` (`user_type`),
  KEY `end_ts` (`end_ts`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `phpbb_warnings`;

CREATE TABLE `phpbb_warnings` (
  `warning_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `post_id` int(10) unsigned NOT NULL DEFAULT '0',
  `log_id` int(10) unsigned NOT NULL DEFAULT '0',
  `warning_time` int(11) unsigned NOT NULL DEFAULT '0',
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  KEY `phpbb_warnings_old_primary` (`warning_id`),
  PRIMARY KEY (`start_ts`, `warning_id`),
  KEY `end_ts` (`end_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `phpbb_words`;

CREATE TABLE `phpbb_words` (
  `word_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `word` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `replacement` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  KEY `phpbb_words_old_primary` (`word_id`),
  PRIMARY KEY (`start_ts`, `word_id`),
  KEY `end_ts` (`end_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `phpbb_zebra`;

CREATE TABLE `phpbb_zebra` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `zebra_id` int(10) unsigned NOT NULL DEFAULT '0',
  `friend` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `foe` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  KEY `phpbb_zebra_old_primary` (`user_id`,`zebra_id`),
  PRIMARY KEY (`start_ts`, `user_id`,`zebra_id`),
  KEY `end_ts` (`end_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


