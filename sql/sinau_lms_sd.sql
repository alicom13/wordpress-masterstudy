-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 09, 2021 at 05:43 PM
-- Server version: 5.7.31
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sinau_lms_sd`
--

-- --------------------------------------------------------

--
-- Table structure for table `sd_commentmeta`
--

DROP TABLE IF EXISTS `sd_commentmeta`;
CREATE TABLE IF NOT EXISTS `sd_commentmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_comments`
--

DROP TABLE IF EXISTS `sd_comments`;
CREATE TABLE IF NOT EXISTS `sd_comments` (
  `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'comment',
  `comment_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_links`
--

DROP TABLE IF EXISTS `sd_links`;
CREATE TABLE IF NOT EXISTS `sd_links` (
  `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_options`
--

DROP TABLE IF EXISTS `sd_options`;
CREATE TABLE IF NOT EXISTS `sd_options` (
  `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`),
  KEY `autoload` (`autoload`)
) ENGINE=MyISAM AUTO_INCREMENT=440 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `sd_options`
--

INSERT INTO `sd_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost/sd-sinau.sch.id', 'yes'),
(2, 'home', 'http://localhost/sd-sinau.sch.id', 'yes'),
(3, 'blogname', 'SD SINAU SARENG', 'yes'),
(4, 'blogdescription', 'E-Learning MasterStudy', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'admin@sinau.web.id', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '1', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'j F Y', 'yes'),
(24, 'time_format', 'g:i a', 'yes'),
(25, 'links_updated_date_format', 'j F Y H:i', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '', 'yes'),
(29, 'rewrite_rules', '', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:3:{i:0;s:21:\"gutentor/gutentor.php\";i:1;s:35:\"litespeed-cache/litespeed-cache.php\";i:2;s:89:\"masterstudy-lms-learning-management-system/masterstudy-lms-learning-management-system.php\";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '0', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', '', 'no'),
(40, 'template', 'cosmoswp', 'yes'),
(41, 'stylesheet', 'cosmoswp', 'yes'),
(42, 'comment_registration', '0', 'yes'),
(43, 'html_type', 'text/html', 'yes'),
(44, 'use_trackback', '0', 'yes'),
(45, 'default_role', 'subscriber', 'yes'),
(46, 'db_version', '49752', 'yes'),
(47, 'uploads_use_yearmonth_folders', '1', 'yes'),
(48, 'upload_path', '', 'yes'),
(49, 'blog_public', '1', 'yes'),
(50, 'default_link_category', '2', 'yes'),
(51, 'show_on_front', 'page', 'yes'),
(52, 'tag_base', '', 'yes'),
(53, 'show_avatars', '1', 'yes'),
(54, 'avatar_rating', 'G', 'yes'),
(55, 'upload_url_path', '', 'yes'),
(56, 'thumbnail_size_w', '150', 'yes'),
(57, 'thumbnail_size_h', '150', 'yes'),
(58, 'thumbnail_crop', '1', 'yes'),
(59, 'medium_size_w', '300', 'yes'),
(60, 'medium_size_h', '300', 'yes'),
(61, 'avatar_default', 'mystery', 'yes'),
(62, 'large_size_w', '1024', 'yes'),
(63, 'large_size_h', '1024', 'yes'),
(64, 'image_default_link_type', 'none', 'yes'),
(65, 'image_default_size', '', 'yes'),
(66, 'image_default_align', '', 'yes'),
(67, 'close_comments_for_old_posts', '0', 'yes'),
(68, 'close_comments_days_old', '14', 'yes'),
(69, 'thread_comments', '1', 'yes'),
(70, 'thread_comments_depth', '5', 'yes'),
(71, 'page_comments', '0', 'yes'),
(72, 'comments_per_page', '50', 'yes'),
(73, 'default_comments_page', 'newest', 'yes'),
(74, 'comment_order', 'asc', 'yes'),
(75, 'sticky_posts', 'a:0:{}', 'yes'),
(76, 'widget_categories', 'a:3:{i:1;a:0:{}i:2;a:4:{s:5:\"title\";s:5:\"Topik\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(77, 'widget_text', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(78, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(79, 'uninstall_plugins', 'a:1:{s:35:\"litespeed-cache/litespeed-cache.php\";s:47:\"LiteSpeed\\Activation::uninstall_litespeed_cache\";}', 'no'),
(80, 'timezone_string', '', 'yes'),
(81, 'page_for_posts', '7', 'yes'),
(82, 'page_on_front', '6', 'yes'),
(83, 'default_post_format', '0', 'yes'),
(84, 'link_manager_enabled', '1', 'yes'),
(85, 'finished_splitting_shared_terms', '1', 'yes'),
(86, 'site_icon', '0', 'yes'),
(87, 'medium_large_size_w', '768', 'yes'),
(88, 'medium_large_size_h', '0', 'yes'),
(89, 'wp_page_for_privacy_policy', '3', 'yes'),
(90, 'show_comments_cookies_opt_in', '1', 'yes'),
(91, 'admin_email_lifespan', '1644073891', 'yes'),
(92, 'disallowed_keys', '', 'no'),
(93, 'comment_previously_approved', '1', 'yes'),
(94, 'auto_plugin_theme_update_emails', 'a:0:{}', 'no'),
(95, 'auto_update_core_dev', 'enabled', 'yes'),
(96, 'auto_update_core_minor', 'enabled', 'yes'),
(97, 'auto_update_core_major', 'enabled', 'yes'),
(98, 'wp_force_deactivated_plugins', 'a:0:{}', 'yes'),
(99, 'initial_db_version', '49752', 'yes'),
(100, 'sd_user_roles', 'a:6:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:71:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;s:21:\"publish_stm_lms_posts\";b:1;s:20:\"delete_stm_lms_posts\";b:1;s:27:\"delete_others_stm_lms_posts\";b:1;s:28:\"delete_private_stm_lms_posts\";b:1;s:30:\"delete_published_stm_lms_posts\";b:1;s:18:\"edit_stm_lms_posts\";b:1;s:25:\"edit_others_stm_lms_posts\";b:1;s:26:\"edit_private_stm_lms_posts\";b:1;s:28:\"edit_published_stm_lms_posts\";b:1;s:26:\"read_private_stm_lms_posts\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}s:18:\"stm_lms_instructor\";a:2:{s:4:\"name\";s:10:\"Instructor\";s:12:\"capabilities\";a:12:{s:4:\"read\";b:1;s:12:\"upload_files\";b:1;s:21:\"publish_stm_lms_posts\";b:1;s:18:\"edit_stm_lms_posts\";b:1;s:20:\"delete_stm_lms_posts\";b:1;s:17:\"edit_stm_lms_post\";b:1;s:19:\"delete_stm_lms_post\";b:1;s:18:\"read_stm_lms_posts\";b:1;s:27:\"delete_others_stm_lms_posts\";b:0;s:25:\"edit_others_stm_lms_posts\";b:0;s:26:\"read_private_stm_lms_posts\";b:0;s:10:\"edit_posts\";b:1;}}}', 'yes'),
(101, 'fresh_site', '0', 'yes'),
(102, 'WPLANG', 'id_ID', 'yes'),
(103, 'widget_block', 'a:6:{i:2;a:1:{s:7:\"content\";s:19:\"<!-- wp:search /-->\";}i:3;a:1:{s:7:\"content\";s:157:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Pos-pos Terbaru</h2><!-- /wp:heading --><!-- wp:latest-posts /--></div><!-- /wp:group -->\";}i:4;a:1:{s:7:\"content\";s:228:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Komentar Terbaru</h2><!-- /wp:heading --><!-- wp:latest-comments {\"displayAvatar\":false,\"displayDate\":false,\"displayExcerpt\":false} /--></div><!-- /wp:group -->\";}i:5;a:1:{s:7:\"content\";s:143:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Arsip</h2><!-- /wp:heading --><!-- wp:archives /--></div><!-- /wp:group -->\";}i:6;a:1:{s:7:\"content\";s:148:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Kategori</h2><!-- /wp:heading --><!-- wp:categories /--></div><!-- /wp:group -->\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(104, 'sidebars_widgets', 'a:15:{s:9:\"sidebar-1\";a:3:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";}s:9:\"sidebar-2\";a:2:{i:0;s:7:\"block-5\";i:1;s:7:\"block-6\";}s:19:\"wp_inactive_widgets\";a:0:{}s:15:\"stm_lms_sidebar\";a:0:{}s:19:\"cwp-primary-sidebar\";a:0:{}s:21:\"cwp-secondary-sidebar\";a:0:{}s:16:\"footer-sidebar-1\";a:1:{i:0;s:13:\"custom_html-2\";}s:16:\"footer-sidebar-2\";a:1:{i:0;s:12:\"categories-2\";}s:16:\"footer-sidebar-3\";a:1:{i:0;s:26:\"gutentor_wp_block_widget-2\";}s:16:\"footer-sidebar-4\";a:0:{}s:16:\"footer-sidebar-5\";a:0:{}s:16:\"footer-sidebar-6\";a:0:{}s:16:\"footer-sidebar-7\";a:0:{}s:16:\"footer-sidebar-8\";a:0:{}s:13:\"array_version\";i:3;}', 'yes'),
(144, 'widget_recent-comments', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(145, 'widget_recent-posts', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(146, 'current_theme', 'CosmosWP', 'yes'),
(147, 'theme_switched', '', 'yes'),
(149, 'customize_stashed_theme_mods', 'a:0:{}', 'no'),
(154, 'gutentor_settings_options', 'a:49:{s:16:\"assets-on-global\";b:0;s:21:\"color-palette-options\";s:4:\"both\";s:14:\"color-palettes\";s:0:\"\";s:20:\"dynamic-res-location\";s:4:\"head\";s:19:\"enable-export-block\";s:4:\"true\";s:19:\"enable-import-block\";s:4:\"true\";s:10:\"fa-version\";s:1:\"5\";s:18:\"load-optimized-css\";b:0;s:7:\"map-api\";s:39:\"AIzaSyAq-PUmXMM3M2aQnwUslzap0TXaGyZlqZE\";s:10:\"off-blocks\";s:0:\"\";s:4:\"ptel\";s:0:\"\";s:12:\"tax-in-color\";s:0:\"\";s:12:\"tax-in-image\";s:0:\"\";s:18:\"typo-apply-options\";s:6:\"global\";s:17:\"wide-width-editor\";b:0;s:20:\"page-templates-in-pt\";s:0:\"\";s:12:\"videos-in-pt\";s:0:\"\";s:10:\"gc-btn-txt\";s:2:\"{}\";s:9:\"gc-btn-bg\";s:2:\"{}\";s:10:\"gc-heading\";s:2:\"{}\";s:7:\"gc-body\";s:2:\"{}\";s:7:\"gc-link\";s:2:\"{}\";s:18:\"gc-cat-txt-default\";s:2:\"{}\";s:17:\"gc-cat-bg-default\";s:2:\"{}\";s:5:\"gt-h1\";s:0:\"\";s:5:\"gt-h2\";s:0:\"\";s:5:\"gt-h3\";s:0:\"\";s:5:\"gt-h4\";s:0:\"\";s:5:\"gt-h5\";s:0:\"\";s:5:\"gt-h6\";s:0:\"\";s:7:\"gt-body\";s:0:\"\";s:9:\"gt-button\";s:0:\"\";s:9:\"gw-mobile\";s:0:\"\";s:9:\"gw-tablet\";s:0:\"\";s:10:\"gw-desktop\";s:0:\"\";s:8:\"gw-large\";s:0:\"\";s:11:\"pf-standard\";s:0:\"\";s:8:\"pf-aside\";s:0:\"\";s:8:\"pf-image\";s:0:\"\";s:8:\"pf-video\";s:0:\"\";s:8:\"pf-quote\";s:0:\"\";s:7:\"pf-link\";s:0:\"\";s:10:\"pf-gallery\";s:0:\"\";s:9:\"pf-status\";s:0:\"\";s:8:\"pf-audio\";s:0:\"\";s:7:\"pf-chat\";s:0:\"\";s:23:\"gutentor_tax_term_color\";b:0;s:23:\"gutentor_tax_term_image\";b:0;s:11:\"options_v_0\";b:1;}', 'yes'),
(155, 'stm_lms_version', '2.6.6', 'yes'),
(156, 'stm_lms_db_version', '2.6.6', 'yes'),
(157, 'widget_stm_lms_popular_courses', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(158, 'stm_lms_set_woocommerce_order_items', '1', 'yes'),
(159, 'stm_lms_set_order_total_price', '1', 'yes'),
(105, 'cron', 'a:9:{i:1628530974;a:3:{s:27:\"litespeed_task_imgoptm_pull\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:16:\"litespeed_filter\";s:4:\"args\";a:0:{}s:8:\"interval\";i:60;}}s:19:\"litespeed_task_ccss\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:16:\"litespeed_filter\";s:4:\"args\";a:0:{}s:8:\"interval\";i:60;}}s:19:\"litespeed_task_lqip\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:16:\"litespeed_filter\";s:4:\"args\";a:0:{}s:8:\"interval\";i:60;}}}i:1628532695;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1628565095;a:4:{s:18:\"wp_https_detection\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1628608293;a:1:{s:32:\"recovery_mode_clean_expired_keys\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1628608295;a:1:{s:30:\"wp_site_health_scheduled_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}i:1628608456;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1628608458;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1628609377;a:1:{s:16:\"stm_listing_cron\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:17:\"stm_cron_interval\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}s:7:\"version\";i:2;}', 'yes'),
(106, 'widget_pages', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(107, 'widget_calendar', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(108, 'widget_archives', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(109, 'widget_media_audio', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(110, 'widget_media_image', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(111, 'widget_media_gallery', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(112, 'widget_media_video', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(113, 'widget_meta', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(114, 'widget_search', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(115, 'widget_tag_cloud', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(116, 'widget_nav_menu', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(117, 'widget_custom_html', 'a:2:{i:2;a:2:{s:5:\"title\";s:11:\"Sekretariat\";s:7:\"content\";s:119:\"Bangsri 11/04<br>Sukodono Sidoarjo<br>Kode Pos 61258<br>Chat Wa. <a href=\"https://wa.me/6285645473999\">085645473999</a>\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(119, 'recovery_keys', 'a:0:{}', 'yes'),
(121, 'https_detection_errors', 'a:1:{s:20:\"https_request_failed\";a:1:{i:0;s:23:\"Permintaan HTTPS gagal.\";}}', 'yes'),
(120, 'theme_mods_twentytwentyone', 'a:2:{s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1628522913;s:4:\"data\";a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:3:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";}s:9:\"sidebar-2\";a:2:{i:0;s:7:\"block-5\";i:1;s:7:\"block-6\";}}}}', 'yes'),
(148, 'theme_switched_via_customizer', '', 'yes'),
(136, 'finished_updating_comment_type', '1', 'yes'),
(130, 'can_compress_scripts', '1', 'no'),
(131, 'widget_links', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(171, 'stm_lms_add_review_status', 'skip', 'yes'),
(172, 'cosmoswp_admin_notice_welcome', '1', 'yes'),
(170, 'stm_lms_settings', 'a:97:{s:10:\"main_color\";s:17:\"rgba(25,114,28,1)\";s:15:\"secondary_color\";s:17:\"rgba(61,186,44,1)\";s:15:\"currency_symbol\";s:3:\"Rp.\";s:17:\"currency_position\";s:4:\"left\";s:18:\"currency_thousands\";s:1:\".\";s:17:\"currency_decimals\";s:1:\",\";s:12:\"decimals_num\";i:2;s:19:\"wocommerce_checkout\";b:0;s:14:\"guest_checkout\";b:0;s:21:\"guest_checkout_notice\";s:0:\"\";s:10:\"author_fee\";s:2:\"10\";s:20:\"courses_featured_num\";i:1;s:21:\"deny_instructor_admin\";s:0:\"\";s:11:\"demo_import\";s:0:\"\";s:12:\"courses_page\";i:21;s:12:\"courses_view\";s:4:\"list\";s:15:\"courses_per_row\";s:1:\"3\";s:16:\"courses_per_page\";s:1:\"9\";s:14:\"load_more_type\";s:6:\"button\";s:17:\"course_card_style\";s:7:\"style_1\";s:16:\"course_card_view\";s:6:\"center\";s:18:\"courses_image_size\";s:0:\"\";s:16:\"disable_lazyload\";s:0:\"\";s:23:\"courses_categories_slug\";s:5:\"modul\";s:24:\"disable_featured_courses\";s:0:\"\";s:26:\"number_featured_in_archive\";i:3;s:21:\"enable_courses_filter\";b:1;s:30:\"enable_courses_filter_category\";b:1;s:33:\"enable_courses_filter_subcategory\";b:1;s:28:\"enable_courses_filter_levels\";b:1;s:28:\"enable_courses_filter_rating\";b:1;s:28:\"enable_courses_filter_status\";b:1;s:32:\"enable_courses_filter_instructor\";b:1;s:27:\"enable_courses_filter_price\";b:1;s:12:\"course_style\";s:7:\"default\";s:11:\"course_tabs\";s:0:\"\";s:22:\"course_tab_description\";b:1;s:21:\"course_tab_curriculum\";b:1;s:14:\"course_tab_faq\";b:1;s:23:\"course_tab_announcement\";b:1;s:18:\"course_tab_reviews\";b:1;s:20:\"course_levels_config\";a:8:{i:0;a:2:{s:2:\"id\";s:6:\"kelas1\";s:5:\"label\";s:7:\"Kelas 1\";}i:1;a:2:{s:2:\"id\";s:6:\"kelas2\";s:5:\"label\";s:7:\"Kelas 2\";}i:2;a:2:{s:2:\"id\";s:6:\"kelas3\";s:5:\"label\";s:7:\"Kelas 3\";}i:3;a:3:{s:10:\"closed_tab\";b:1;s:2:\"id\";s:6:\"kelas4\";s:5:\"label\";s:7:\"Kelas 4\";}i:4;a:3:{s:10:\"closed_tab\";b:1;s:2:\"id\";s:6:\"kelas5\";s:5:\"label\";s:7:\"Kelas 5\";}i:5;a:3:{s:10:\"closed_tab\";b:1;s:2:\"id\";s:6:\"kelas6\";s:5:\"label\";s:7:\"Kelas 6\";}i:6;a:3:{s:10:\"closed_tab\";b:1;s:2:\"id\";s:9:\"pelatihan\";s:5:\"label\";s:9:\"Pelatihan\";}i:7;a:3:{s:10:\"closed_tab\";b:1;s:2:\"id\";s:4:\"umum\";s:5:\"label\";s:4:\"Umum\";}}s:12:\"lesson_style\";s:7:\"default\";s:23:\"redirect_after_purchase\";b:1;s:27:\"course_allow_new_categories\";b:0;s:18:\"allow_upload_video\";b:0;s:13:\"enable_sticky\";s:0:\"\";s:19:\"enable_sticky_title\";s:0:\"\";s:20:\"enable_sticky_rating\";s:0:\"\";s:21:\"enable_sticky_teacher\";s:0:\"\";s:22:\"enable_sticky_category\";s:0:\"\";s:19:\"enable_sticky_price\";s:0:\"\";s:20:\"enable_sticky_button\";s:0:\"\";s:22:\"enable_related_courses\";s:0:\"\";s:14:\"related_option\";s:7:\"default\";s:26:\"finish_popup_image_disable\";s:0:\"\";s:25:\"finish_popup_image_failed\";s:0:\"\";s:26:\"finish_popup_image_success\";s:0:\"\";s:10:\"quiz_style\";s:10:\"pagination\";s:8:\"user_url\";i:17;s:16:\"user_url_profile\";i:18;s:12:\"wishlist_url\";i:19;s:12:\"checkout_url\";i:20;s:15:\"payment_methods\";a:4:{s:4:\"cash\";a:2:{s:7:\"enabled\";b:1;s:6:\"fields\";a:1:{s:11:\"description\";s:3:\"BCA\";}}s:13:\"wire_transfer\";a:2:{s:7:\"enabled\";s:0:\"\";s:6:\"fields\";a:5:{s:14:\"account_number\";s:0:\"\";s:11:\"holder_name\";s:0:\"\";s:9:\"bank_name\";s:0:\"\";s:5:\"swift\";s:0:\"\";s:11:\"description\";s:0:\"\";}}s:6:\"paypal\";a:2:{s:7:\"enabled\";s:0:\"\";s:6:\"fields\";a:4:{s:12:\"paypal_email\";s:0:\"\";s:13:\"currency_code\";s:3:\"USD\";s:11:\"paypal_mode\";s:7:\"sandbox\";s:11:\"description\";s:0:\"\";}}s:6:\"stripe\";a:2:{s:7:\"enabled\";s:0:\"\";s:6:\"fields\";a:4:{s:21:\"stripe_public_api_key\";s:0:\"\";s:10:\"secret_key\";s:0:\"\";s:11:\"description\";s:0:\"\";s:8:\"currency\";s:0:\"\";}}}s:18:\"recaptcha_site_key\";s:0:\"\";s:21:\"recaptcha_private_key\";s:0:\"\";s:18:\"user_premoderation\";s:0:\"\";s:22:\"register_as_instructor\";b:1;s:32:\"disable_instructor_premoderation\";b:0;s:27:\"instructor_can_add_students\";b:1;s:20:\"course_premoderation\";s:0:\"\";s:16:\"instructors_page\";s:0:\"\";s:19:\"cancel_subscription\";s:0:\"\";s:10:\"float_menu\";s:0:\"\";s:16:\"float_menu_guest\";b:1;s:19:\"float_menu_position\";s:4:\"left\";s:21:\"certificate_threshold\";i:70;s:18:\"certificate_banner\";s:0:\"\";s:26:\"certificate_settings_title\";s:0:\"\";s:17:\"certificate_image\";s:0:\"\";s:24:\"certificate_title_notice\";s:0:\"\";s:17:\"certificate_title\";s:0:\"\";s:23:\"certificate_title_color\";s:0:\"\";s:21:\"certificate_title_fsz\";i:60;s:27:\"certificate_subtitle_notice\";s:0:\"\";s:20:\"certificate_subtitle\";s:0:\"\";s:26:\"certificate_subtitle_color\";s:0:\"\";s:24:\"certificate_subtitle_fsz\";i:40;s:23:\"certificate_text_notice\";s:0:\"\";s:16:\"certificate_text\";s:0:\"\";s:22:\"certificate_text_color\";s:0:\"\";s:20:\"certificate_text_fsz\";i:17;s:6:\"addons\";s:0:\"\";s:6:\"payout\";s:0:\"\";s:12:\"gdpr_warning\";s:61:\"I agree with storage and handling of my data by this website.\";s:9:\"gdpr_page\";s:0:\"\";s:18:\"stm_lms_shortcodes\";s:0:\"\";}', 'yes'),
(140, 'category_children', 'a:0:{}', 'yes');
INSERT INTO `sd_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(142, 'theme_mods_cosmoswp', 'a:48:{s:17:\"cwp_dynamic_fonts\";s:70:\"//fonts.googleapis.com/css?family=Montserrat:700,600|Lato:400|Lora:400\";s:12:\"primary_menu\";s:8:\"lUpdated\";s:42:\"cosmoswp_header_builder_section_controller\";s:488:\"{\"desktop\":{\"top\":[{\"x\":\"0\",\"y\":\"1\",\"width\":\"4\",\"height\":\"1\",\"id\":\"title_tagline\"},{\"x\":\"6\",\"y\":\"1\",\"width\":\"6\",\"height\":\"1\",\"id\":\"contact_information\"}],\"main\":[{\"x\":\"0\",\"y\":\"1\",\"width\":\"12\",\"height\":\"1\",\"id\":\"primary_menu\"}],\"bottom\":[]},\"mobile\":{\"top\":[],\"main\":[{\"x\":\"0\",\"y\":\"1\",\"width\":\"9\",\"height\":\"1\",\"id\":\"title_tagline\"},{\"x\":\"9\",\"y\":\"1\",\"width\":\"3\",\"height\":\"1\",\"id\":\"menu_icon\"}],\"bottom\":[]},\"all\":{\"sidebar\":[{\"x\":\"0\",\"y\":\"1\",\"width\":\"1\",\"height\":\"1\",\"id\":\"primary_menu\"}]}}\";s:42:\"cosmoswp_footer_builder_section_controller\";s:422:\"{\"desktop\":{\"top\":[],\"main\":[{\"x\":\"0\",\"y\":\"1\",\"width\":\"4\",\"height\":\"1\",\"id\":\"sidebar-widgets-footer-sidebar-1\"},{\"x\":\"4\",\"y\":\"1\",\"width\":\"4\",\"height\":\"1\",\"id\":\"sidebar-widgets-footer-sidebar-2\"},{\"x\":\"8\",\"y\":\"1\",\"width\":\"4\",\"height\":\"1\",\"id\":\"sidebar-widgets-footer-sidebar-3\"}],\"bottom\":[{\"x\":\"0\",\"y\":\"1\",\"width\":\"6\",\"height\":\"1\",\"id\":\"footer_copyright\"},{\"x\":\"6\",\"y\":\"1\",\"width\":\"6\",\"height\":\"1\",\"id\":\"footer_social\"}]}}\";s:18:\"custom_css_post_id\";i:-1;s:15:\"cwp_dynamic_css\";s:18260:\"body{color:#333333;font-family :Verdana;font-weight :400;font-style :normal;text-decoration:none;text-transform :none;font-size:14px;line-height:28px}h1,h1 a,h2,h2 a,h3,h3 a,h4,h4 a,h5,h5 a,h6,h6 a{color:#202020}.site-title a,a,.woocommerce .woocommerce-breadcrumb a,.cwp-woocommerce-active .wc-block-product-categories.is-list li{color:#ffffff}a:hover,.entry-meta a:hover,.entry-meta span a:hover,.woocommerce .woocommerce-breadcrumb a:hover,.cwp-sidebar .widget a:not([class*=\"gutentor-\"]):hover,.cwp-sidebar .widget li a:not([class*=\"gutentor-\"]):hover,.cwp-sidebar .widget article:not([class*=\"gutentor-\"]) *a:hover,.cwp-woocommerce-active .wc-block-product-categories.is-list li:hover{color:#dd3333}.entry-meta a,.entry-meta span{color:#999999}.post.sticky,.search-form input[type=\"submit\"],.cwp-woocommerce-active .widget_price_filter .ui-slider-horizontal .ui-slider-range,.cwp-woocommerce-active .widget_price_filter .ui-slider .ui-slider-handle,.cwp-woocommerce-active .woocommerce-MyAccount-navigation ul li.is-active a{background:#275cf6}h1,h1 a{font-family :Verdana;font-weight :700;font-style :normal;text-decoration:none;text-transform :none;font-size :30px;line-height :40px;letter-spacing :0}h2,h2 a{font-family :Verdana;font-weight :700;font-style :normal;text-decoration:none;text-transform :none;font-size :30px;line-height :35px;letter-spacing :0}h3,h3 a{font-family :Verdana;font-weight :600;font-style :normal;text-decoration:none;text-transform :none;font-size :24px;line-height :32px;letter-spacing :0}h4,h4 a{font-family :Verdana;font-weight :500;font-style :normal;text-decoration:none;text-transform :none;font-size :22px;line-height :24px;letter-spacing :0}h5,h5 a{font-family :Verdana;font-weight :400;font-style :normal;text-decoration:none;text-transform :none;font-size :24px;line-height :32px;letter-spacing :0}h6,h6 a{font-family :Verdana;font-weight :300;font-style :normal;text-decoration:none;text-transform :none;font-size :18px;line-height :24px;letter-spacing :0}.cwp-dynamic-header{background-color:#f5f5f5}.cwp-top-header{height:auto;padding:10px 0 10px 0}.cwp-main-header{height:auto;padding:10px 0 10px 0;-webkit-box-shadow:inset 0 35px 100px 0 #19721c;-moz-box-shadow:inset 0 35px 100px 0 #19721c;box-shadow:inset 0 35px 100px 0 #19721c}.cwp-bottom-header{height:auto}.cwp-logo .site-title,.cwp-logo .site-title a{font-family:Montserrat;font-weight:700;font-style:normal;text-decoration:none;text-transform:uppercase;font-size:20px;line-height:24px;color:#275cf6}.cwp-logo .site-title:hover,.cwp-logo .site-title:hover a,.site-title:focus-within,.site-title:focus-within a{color:#275cf6}.cwp-logo .site-description{font-family:Lato;font-weight:400;font-style:normal;text-decoration:none;text-transform:none;font-size:13px;color:#333}.cwp-logo .site-description:hover,.site-description:focus{color:#333}.cwp-social-links li a{font-size:14px;width:30px;height:30px;line-height:30px}.cwp-social-links ul li.fab-fa-facebook-f a{color:#ffffff;background:#3b5998}.cwp-social-links ul li.fab-fa-facebook-f a:hover,.cwp-social-links ul li.fab-fa-facebook-f a:focus{color:#ffffff;background:#4b69a8}.cwp-social-links ul li.fab-fa-twitter a{color:#ffffff;background:#55ACEE}.cwp-social-links ul li.fab-fa-twitter a:hover,.cwp-social-links ul li.fab-fa-twitter a:focus{color:#ffffff;background:#75CCFF}.cwp-social-links ul li.fab-fa-linkedin-in a{color:#ffffff;background:#0077B5}.cwp-social-links ul li.fab-fa-linkedin-in a:hover,.cwp-social-links ul li.fab-fa-linkedin-in a:focus{color:#ffffff;background:#1087C5}.cwp-search-dropdown .cwp-search-form-wrapper .search-form .search-field{color:#ddd;background-color:#fff;border-style:solid;border-color:#ddd;border-width:1px 1px 1px 1px}.cwp-search-dropdown .cwp-search-form-wrapper .search-form .search-field:hover{color:#444;background-color:#fff;border-style:solid;border-color:#cdcdcd}.cwp-search-dropdown .cwp-search-form-wrapper .search-form .search-field,.cwp-search-dropdown .cwp-search-form-wrapper .search-form .search-submit{height:45px}.cwp-search-dropdown .search-icon,.cwp-search-dropdown .cwp-search-form-wrapper .search-form .search-submit{font-size:18px;color:#333;background:transparent}.cwp-search-dropdown .search-icon:hover,.cwp-search-dropdown .cwp-search-form-wrapper .search-form .search-submit:hover{color:#275cf6}.cwp-search-box .cwp-search-form-wrapper .search-form .search-field{color:#333;background:transparent;border-style:solid;border-color:#ddd;border-width:1px 1px 1px 1px}.cwp-search-box .cwp-search-form-wrapper .search-form .search-field:hover{color:#444;background-color:#fff;border-style:solid;border-color:#999}.cwp-search-box .cwp-search-form-wrapper .search-form .search-field,.cwp-search-box .cwp-search-form-wrapper .search-form .search-submit{height:45px}.cwp-search-box .search-submit{font-size:18px;color:#333;background:transparent}.cwp-search-box .search-submit:hover{color:#275cf6}.cwp-button-one .btn{color:#333;background:#fff;border-style:solid;border-color:#ddd;border-width:1px 1px 1px 1px;border-radius:3px 3px 3px 3px;padding:6px 12px 6px 12px}.cwp-button-one .btn:hover,.cwp-button-one .btn:focus{color:#fff;background-color:#275cf6;border-style:solid;border-color:#275cf6;border-width:1px 1px 1px 1px}.cwp-secondary-menu li a{color:#333}.cwp-secondary-menu li a:hover,.cwp-secondary-menu li a:focus{color:#275cf6}.cwp-secondary-menu li.active a,.cwp-secondary-menu li:active a,.cwp-secondary-menu li.current-menu-item a{color:#275cf6}.navigation .cwp-secondary-menu li li a{color:#fff}.cwp-secondary-menu li li a:hover,.cwp-secondary-menu li li a:focus{color:#275cf6}.cwp-secondary-menu li li.active a,.cwp-secondary-menu li li:active a,.cwp-secondary-menu li li.current-menu-item a{color:#275cf6}.cwp-secondary-menu .sub-menu,.cwp-secondary-menu .children{background-color:#000}.cwp-primary-menu li a{color:#333;padding:10px 10px 10px 10px}.cwp-primary-menu li a:hover,.cwp-primary-menu li a:focus{color:#275cf6}.cwp-primary-menu li.active >a,.cwp-primary-menu li.current-menu-item >a{color:#275cf6}.navigation .cwp-primary-menu li li a{color:#333}.cwp-primary-menu li li a:hover,.cwp-primary-menu li li a:focus{color:#275cf6}.cwp-primary-menu li li.active >a,.cwp-primary-menu li li.current-menu-item >a{color:#275cf6}.cwp-primary-menu .sub-menu,.cwp-primary-menu .children{background-color:#fff}.cwp-header-menu-sidebar{background-color:#444;color:#fff}.cwp-header-menu-sidebar h1,.cwp-header-menu-sidebar h1 a,.cwp-header-menu-sidebar h2,.cwp-header-menu-sidebar h2 a,.cwp-header-menu-sidebar h3,.cwp-header-menu-sidebar h3 a,.cwp-header-menu-sidebar h4,.cwp-header-menu-sidebar h4 a,.cwp-header-menu-sidebar h5,.cwp-header-menu-sidebar h5 a,.cwp-header-menu-sidebar h6,.cwp-header-menu-sidebar h6 a{color:#fff}.cwp-header-menu-sidebar a,.cwp-header-menu-sidebar li a{color:#fff}.cwp-header-menu-sidebar a:hover,.cwp-header-menu-sidebar li a:hover,.cwp-header-menu-sidebar li.active >a,.cwp-header-menu-sidebar li.current-menu-item >a{color:#275cf6}.cwp-menu-icon-btn i{font-size:18px}.cwp-menu-icon-btn .cwp-toggle-btn-text{color:#333;background:transparent;padding:10px 10px 10px 10px}.cwp-menu-icon-btn:hover .cwp-toggle-btn-text{color:#275cf6}.cwp-header-menu-sidebar .cwp-primary-menu .sub-menu,.cwp-header-menu-sidebar .cwp-primary-menu .children{background-color:rgba(0,0,0,0.2)}.cwp-header-menu-sidebar .cwp-primary-menu li li a{color:#fff}.cwp-header-menu-sidebar .cwp-primary-menu li li a:hover,.cwp-header-menu-sidebar .cwp-primary-menu li li a:focus{color:#275cf6}.cwp-header-menu-sidebar .cwp-primary-menu li li.active >a,.cwp-header-menu-sidebar .cwp-primary-menu li li.current-menu-item >a{color:#275cf6}.cwp-header-menu-sidebar .cwp-close-btn i{font-size:18px}.cwp-header-menu-sidebar .cwp-close-btn-box{color:#333;background:transparent;padding:10px 10px 10px 10px}.cwp-header-menu-sidebar .cwp-close-btn-box:hover{color:#275cf6}.cwp-contact-info-icon i{font-size:14px;color:#19721c}.cwp-contact-info-title{color:#19721c;font-family:Lora;font-weight:400;font-style:normal;text-decoration:none;text-transform:none;font-size:14px;line-height:24px;letter-spacing:1px}.cwp-contact-info-text,.cwp-contact-info-text a{color:#19721c;font-family:Arial;font-weight:400;font-style:normal;text-decoration:none;text-transform:none;font-size:14px;line-height:12px}.cwp-custom-html,.cwp-custom-html *{color:#fff}.cwp-dynamic-footer{background-color:#19721c}.cwp-top-footer{height:auto}.cwp-top-footer .widget-title{color:#fff}.cwp-top-footer .widget:not(.widget_gutentor_wp_block_widget){color:#333333}.cwp-top-footer .widget:not(.widget_gutentor_wp_block_widget) a{color:#275cf6}.cwp-top-footer .widget:not(.widget_gutentor_wp_block_widget) a:hover{color:#1949d4}.cwp-main-footer{height:auto}.cwp-main-footer .widget-title{font-family:Tahoma;font-weight:700;font-style:bold;text-decoration:none;text-transform:none;font-size:14px;line-height:24px;border-style:dashed;border-width:0 0 1px 0;color:#fff}.cwp-main-footer .widget,.cwp-main-footer .widget a:not([class*=\"gutentor-\"]){font-family:Tahoma;font-weight:300;font-style:normal;text-decoration:none;text-transform:none;font-size:14px;line-height:24px}.cwp-main-footer .widget:not(.widget_gutentor_wp_block_widget){color:#ffffff}.cwp-main-footer .widget:not(.widget_gutentor_wp_block_widget) a{color:#eeee22}.cwp-main-footer .widget:not(.widget_gutentor_wp_block_widget) a:hover{color:#dd3333}.cwp-bottom-footer{height:auto;padding:20px 0 20px 0;background-color:#147216}.cwp-bottom-footer .widget-title{color:#fff}.cwp-bottom-footer .widget:not(.widget_gutentor_wp_block_widget){color:#202020}.cwp-bottom-footer .widget:not(.widget_gutentor_wp_block_widget) a{color:#275cf6}.cwp-bottom-footer .widget:not(.widget_gutentor_wp_block_widget) a:hover{color:#1949d4}.cwp-footer-copyright{color:#fff}.cwp-footer-social-links ul li a{font-size:14px;border-radius:50px;width:30px;height:30px;line-height:30px}.cwp-footer-social-links ul li.fab-fa-facebook-f a{color:#1e73be;background:#ffffff}.cwp-footer-social-links ul li.fab-fa-facebook-f a:hover,.cwp-footer-social-links ul li.fab-fa-facebook-f a:focus{color:#ffffff;background:#1e73be}.cwp-footer-social-links ul li.fab-fa-twitter a{color:#75CCFF;background:#ffffff}.cwp-footer-social-links ul li.fab-fa-twitter a:hover,.cwp-footer-social-links ul li.fab-fa-twitter a:focus{color:#ffffff;background:#75CCFF}.cwp-footer-social-links ul li.fab-fa-linkedin-in a{color:#0077B5;background:#ffffff}.cwp-footer-social-links ul li.fab-fa-linkedin-in a:hover,.cwp-footer-social-links ul li.fab-fa-linkedin-in a:focus{color:#ffffff;background:#0077B5}.cwp-footer-navigation li a{color:#fff}.cwp-footer-navigation li a:hover,.cwp-footer-navigation li a:focus{color:#81d742}.cwp-footer-navigation li.active a,.cwp-footer-navigation li.current-menu-item a{color:#81d742}.cwp-footer-menu-title{color:#fff}.cwp-footer-custom-html,.cwp-footer-custom-html *{color:#fff}.cwp-blog-pagination .pagination .nav-links .page-numbers{background:#f5f5f5;color:#333}.cwp-blog-pagination .pagination .nav-links .page-numbers.current,.cwp-blog-pagination .pagination .nav-links .page-numbers:hover{border-color:#275cf6}.cwp-blog-pagination .pagination .nav-links .page-numbers.current,.cwp-blog-pagination .pagination .nav-links .page-numbers:hover{background:#275cf6;color:#fff}.cwp-blog-pagination .posts-navigation .nav-links .nav-previous a,.cwp-blog-pagination .posts-navigation .nav-links .nav-next a{color:#275cf6}.cwp-blog-pagination .posts-navigation .nav-links .nav-previous:hover a,.cwp-blog-pagination .posts-navigation .nav-links .nav-next:hover a{color:#1949d4}.cwp-blog.cwp-content-wrapper{padding:20px 0 40px 0}.single-post .post-navigation .nav-links .post-title{color:#275cf6}.single-post .post-navigation .nav-links .post-title:hover{color:#1949d4}.single-post .post-navigation .nav-links .title{color:#999}.single-post .post-navigation .nav-links .title:hover{color:#444}.cwp-single-post.cwp-content-wrapper{padding:20px 0 40px 0}.cosmoswp-btn,#cwp-main-wrap .comments-area .submit,#cwp-main-wrap form:not(.search-form) input[type=\"submit\"]:not(.gutentor-button){color:#fff;background:#275cf6;border-style:solid;border-color:#275cf6;border-width:1px 1px 1px 1px;border-radius:3px 3px 3px 3px}.cosmoswp-btn:hover,.cosmoswp-btn:focus,#cwp-main-wrap form:not(.search-form) input[type=\"submit\"]:not(.gutentor-button):hover,#cwp-main-wrap form:not(.search-form) input[type=\"submit\"]:not(.gutentor-button):focus{color:#fff;background-color:#1949d4;border-style:solid;border-color:#1949d4;border-width:1px 1px 1px 1px}.cwp-sidebar .widget .widget-title{padding:0 0 0 15px;font-family:Montserrat;font-weight:600;font-style:normal;text-decoration:none;text-transform:none;font-size:20px;line-height:24px;border-style:solid;border-width:0 0 0 5px;border-color:#275cf6}.cwp-sidebar .widget a:not([class*=\"gutentor-\"]),.cwp-sidebar .widget article:not([class*=\"gutentor-\"]) *a,.cwp-sidebar .widget li a:not([class*=\"gutentor-\"]){color:#40454a}.cwp-banner .breadcrumbs,.woocommerce .cwp-banner .woocommerce-breadcrumb{color:#fff}.cwp-banner .breadcrumbs a,.cwp-breadcrumbs a,.woocommerce .cwp-banner .woocommerce-breadcrumb a{color:#275cf6}.cwp-banner .breadcrumbs a:hover,.woocommerce .cwp-banner .woocommerce-breadcrumb a:hover,.cwp-breadcrumbs a:hover{color:#1949d4}.cwp-scroll-to-top{color:#fff;background:#275cf6}.cwp-scroll-to-top:hover{color:#fff;background:#1949d4}.cwp-body-main-wrap{background-color:#fcfcfc}.cwp-banner{margin:0 0 20px 0}.cwp-banner .banner-title,.cwp-banner .page-title{color:#fff}.cwp-banner.cwp-enable-overlay:after{background-color:rgba(0,0,0,0.4)}.cwp-page.cwp-content-wrapper{padding:20px 0 40px 0}@media (min-width:720px){body{font-size:16px;line-height:28px}h1,h1 a{font-size:32px;line-height:40px}h2,h2 a{font-size:30px;line-height:35px}h3,h3 a{font-size:28px;line-height:32px}h4,h4 a{font-size:22px;line-height:24px}h5,h5 a{font-size:24px;line-height:32px}h6,h6 a{font-size:18px;line-height:24px}.cwp-top-header{height:auto;padding:10px 0 10px 0}.cwp-main-header{height:auto;padding:10px 0 10px 0}.cwp-bottom-header{height:auto}.cwp-logo .site-title,.cwp-logo .site-title a{font-size:20px;line-height:24px}.cwp-logo .site-description{font-size:13px}.cwp-social-links li a{font-size:14px;width:30px;height:30px;line-height:30px}.cwp-button-one .btn{padding:6px 12px 6px 12px}.cwp-menu-icon-btn i{font-size:18px}.cwp-menu-icon-btn .cwp-toggle-btn-text{padding:10px 10px 10px 10px}.cwp-header-menu-sidebar .cwp-close-btn i{font-size:18px}.cwp-header-menu-sidebar .cwp-close-btn-box{padding:10px 10px 10px 10px}.cwp-contact-info-icon i{font-size:14px}.cwp-contact-info-title{font-size:14px;line-height:24px;letter-spacing:1px}.cwp-contact-info-text,.cwp-contact-info-text a{font-size:14px;line-height:12px}.cwp-main-footer .widget-title{font-size:16px;line-height:24px}.cwp-main-footer .widget,.cwp-main-footer .widget a:not([class*=\"gutentor-\"]){font-size:15px;line-height:24px}.cwp-bottom-footer .widget,.cwp-bottom-footer .widget a:not([class*=\"gutentor-\"]){font-size:15px;line-height:24px}.cwp-blog.cwp-content-wrapper{padding:40px 0 60px 0}.cwp-single-post.cwp-content-wrapper{padding:40px 0 60px 0}.cwp-sidebar .widget .widget-title{font-size:20px;line-height:24px}.cwp-banner{margin:0 0 30px 0}.cwp-page.cwp-content-wrapper{padding:40px 0 60px 0}}@media (min-width:992px){body{font-size:17px;line-height:28px}h1,h1 a{font-size:44px;line-height:40px}h2,h2 a{font-size:34px;line-height:35px}h3,h3 a{font-size:32px;line-height:32px}h4,h4 a{font-size:28px;line-height:24px}h5,h5 a{font-size:24px;line-height:32px}h6,h6 a{font-size:18px;line-height:24px}.cwp-vertical-header .cwp-dynamic-header{width:280px;background-color:#f5f5f5}.cwp-vertical-header.cwp-show-menu-sidebar .cwp-left-push .cwp-vertical-header-left{left:280px}.cwp-vertical-header.cwp-show-menu-sidebar .cwp-left-push .cwp-vertical-header-right{right:-280px}.cwp-vertical-header.cwp-show-menu-sidebar .cwp-right-push .cwp-vertical-header-right{right:280px}.cwp-vertical-header.cwp-show-menu-sidebar .cwp-right-push .cwp-vertical-header-left{left:-280px}.cwp-vertical-header .cwp-vertical-body-content-left .cwp-body-main-wrap,.cwp-vertical-header .cwp-vertical-body-content-left .cwp-dynamic-footer{margin-left:280px;max-width:calc(100% - 280px)}.cwp-vertical-header .cwp-vertical-body-content-right .cwp-body-main-wrap,.cwp-vertical-header .cwp-vertical-body-content-right .cwp-dynamic-footer{margin-right:280px;max-width:calc(100% - 280px)}.cwp-top-header{height:auto;padding:10px 0 10px 0}.cwp-main-header{height:auto;padding:10px 0 10px 0}.cwp-bottom-header{height:auto;padding:10px 0 10px 0}.cwp-logo .site-title,.cwp-logo .site-title a{font-size:20px;line-height:24px}.cwp-logo .site-description{font-size:13px}.cwp-social-links li a{font-size:14px;width:30px;height:30px;line-height:30px}.cwp-button-one .btn{padding:6px 12px 6px 12px}.cwp-secondary-menu li a{padding:10px 10px 10px 10px}.cwp-primary-menu li a{padding:10px 10px 10px 10px}.cwp-menu-icon-btn i{font-size:18px}.cwp-menu-icon-btn .cwp-toggle-btn-text{padding:10px 10px 10px 10px}.cwp-header-menu-sidebar .cwp-close-btn i{font-size:18px}.cwp-header-menu-sidebar .cwp-close-btn-box{padding:10px 10px 10px 10px}.cwp-contact-info-item{margin:0 25px 0 0;padding:0 25px 0 0}.cwp-contact-info-icon i{font-size:28px}.cwp-contact-info-title{font-size:16px;line-height:24px;letter-spacing:1px}.cwp-contact-info-text,.cwp-contact-info-text a{font-size:14px;line-height:12px}.cwp-top-footer{padding:25px 0 25px 0}.cwp-main-footer .widget-title{font-size:18px;line-height:24px}.cwp-main-footer .widget,.cwp-main-footer .widget a:not([class*=\"gutentor-\"]){font-size:17px;line-height:24px}.cwp-bottom-footer .widget,.cwp-bottom-footer .widget a:not([class*=\"gutentor-\"]){font-size:17px;line-height:24px}.cwp-footer-navigation li a{padding:0 5px 0 5px}.cwp-blog.cwp-content-wrapper{padding:80px 0 80px 0}.cwp-single-post.cwp-content-wrapper{padding:80px 0 80px 0}.cosmoswp-btn,#cwp-main-wrap .comments-area .submit,#cwp-main-wrap form:not(.search-form) input[type=\"submit\"]:not(.gutentor-button){padding:8px 16px 8px 16px}.cwp-sidebar .widget .widget-title{font-size:20px;line-height:24px}.cwp-banner{margin:0 0 40px 0}.cwp-page.cwp-content-wrapper{padding:80px 0 80px 0}}\";s:19:\"dynamic-css-options\";s:4:\"file\";s:22:\"general-setting-layout\";s:19:\"cwp-full-width-body\";s:24:\"contact-information-data\";s:267:\"[{\"enabled\":\"1\",\"icon\":\"fab fa-whatsapp\",\"title\":\"Chatting WA\",\"text\":\"+6285645473999\",\"link-type\":\"disable\",\"link\":\"\",\"checkbox\":false},{\"enabled\":\"1\",\"icon\":\"far fa-envelope\",\"title\":\"Email\",\"text\":\"test@gmail.com\",\"link-type\":\"disable\",\"link\":\"\",\"checkbox\":false}]\";s:33:\"general-setting-body-p-typography\";s:346:\"{\"font-type\":\"system\",\"system-font\":\"Verdana\",\"google-font\":\"\",\"custom-font\":\"\",\"font-weight\":\"400\",\"font-style\":\"normal\",\"text-decoration\":\"none\",\"text-transform\":\"none\",\"font-size\":{\"desktop\":\"17\",\"tablet\":\"16\",\"mobile\":\"14\"},\"line-height\":{\"desktop\":\"28\",\"tablet\":\"28\",\"mobile\":\"28\"},\"letter-spacing\":{\"desktop\":\"0\",\"tablet\":\"0\",\"mobile\":\"0\"}}\";s:29:\"general-setting-h1-typography\";s:346:\"{\"font-type\":\"system\",\"system-font\":\"Verdana\",\"google-font\":\"\",\"custom-font\":\"\",\"font-weight\":\"700\",\"font-style\":\"normal\",\"text-decoration\":\"none\",\"text-transform\":\"none\",\"font-size\":{\"desktop\":\"44\",\"tablet\":\"32\",\"mobile\":\"30\"},\"line-height\":{\"desktop\":\"40\",\"tablet\":\"40\",\"mobile\":\"40\"},\"letter-spacing\":{\"desktop\":\"0\",\"tablet\":\"0\",\"mobile\":\"0\"}}\";s:29:\"general-setting-h2-typography\";s:346:\"{\"font-type\":\"system\",\"system-font\":\"Verdana\",\"google-font\":\"\",\"custom-font\":\"\",\"font-weight\":\"700\",\"font-style\":\"normal\",\"text-decoration\":\"none\",\"text-transform\":\"none\",\"font-size\":{\"desktop\":\"34\",\"tablet\":\"30\",\"mobile\":\"30\"},\"line-height\":{\"desktop\":\"35\",\"tablet\":\"35\",\"mobile\":\"35\"},\"letter-spacing\":{\"desktop\":\"0\",\"tablet\":\"0\",\"mobile\":\"0\"}}\";s:29:\"general-setting-h3-typography\";s:346:\"{\"font-type\":\"system\",\"system-font\":\"Verdana\",\"google-font\":\"\",\"custom-font\":\"\",\"font-weight\":\"600\",\"font-style\":\"normal\",\"text-decoration\":\"none\",\"text-transform\":\"none\",\"font-size\":{\"desktop\":\"32\",\"tablet\":\"28\",\"mobile\":\"24\"},\"line-height\":{\"desktop\":\"32\",\"tablet\":\"32\",\"mobile\":\"32\"},\"letter-spacing\":{\"desktop\":\"0\",\"tablet\":\"0\",\"mobile\":\"0\"}}\";s:29:\"general-setting-h4-typography\";s:346:\"{\"font-type\":\"system\",\"system-font\":\"Verdana\",\"google-font\":\"\",\"custom-font\":\"\",\"font-weight\":\"500\",\"font-style\":\"normal\",\"text-decoration\":\"none\",\"text-transform\":\"none\",\"font-size\":{\"desktop\":\"28\",\"tablet\":\"22\",\"mobile\":\"22\"},\"line-height\":{\"desktop\":\"24\",\"tablet\":\"24\",\"mobile\":\"24\"},\"letter-spacing\":{\"desktop\":\"0\",\"tablet\":\"0\",\"mobile\":\"0\"}}\";s:29:\"general-setting-h5-typography\";s:346:\"{\"font-type\":\"system\",\"system-font\":\"Verdana\",\"google-font\":\"\",\"custom-font\":\"\",\"font-weight\":\"400\",\"font-style\":\"normal\",\"text-decoration\":\"none\",\"text-transform\":\"none\",\"font-size\":{\"desktop\":\"24\",\"tablet\":\"24\",\"mobile\":\"24\"},\"line-height\":{\"desktop\":\"32\",\"tablet\":\"32\",\"mobile\":\"32\"},\"letter-spacing\":{\"desktop\":\"0\",\"tablet\":\"0\",\"mobile\":\"0\"}}\";s:29:\"general-setting-h6-typography\";s:346:\"{\"font-type\":\"system\",\"system-font\":\"Verdana\",\"google-font\":\"\",\"custom-font\":\"\",\"font-weight\":\"300\",\"font-style\":\"normal\",\"text-decoration\":\"none\",\"text-transform\":\"none\",\"font-size\":{\"desktop\":\"18\",\"tablet\":\"18\",\"mobile\":\"18\"},\"line-height\":{\"desktop\":\"24\",\"tablet\":\"24\",\"mobile\":\"24\"},\"letter-spacing\":{\"desktop\":\"0\",\"tablet\":\"0\",\"mobile\":\"0\"}}\";s:22:\"banner-section-display\";s:4:\"hide\";s:16:\"footer_copyright\";s:40:\"Copyright © {current_year} {site_title}\";s:22:\"header-main-bg-options\";s:4:\"none\";s:18:\"primary-menu-align\";s:19:\"cwp-flex-align-left\";s:25:\"contact-information-align\";s:76:\"{\"desktop\":\"cwp-flex-align-left\",\"mobile\":\"cwp-flex-align-left\",\"tablet\":\"\"}\";s:26:\"header-main-border-styling\";s:337:\"{\"border-style\":\"none\",\"border-color\":\"\",\"box-shadow-color\":\"#19721c\",\"border-width\":{\"desktop\":{\"top\":\"\",\"right\":\"\",\"bottom\":\"\",\"left\":\"\",\"cssbox_link\":true}},\"border-radius\":{\"desktop\":{\"top\":\"\",\"right\":\"\",\"bottom\":\"\",\"left\":\"\",\"cssbox_link\":true}},\"box-shadow-css\":{\"desktop\":{\"x\":0,\"Y\":35,\"BLUR\":100,\"SPREAD\":\"\",\"cssbox_link\":true}}}\";s:18:\"nav_menu_locations\";a:1:{s:19:\"header-primary-menu\";i:4;}s:24:\"primary-menu-custom-menu\";i:4;s:33:\"footer-general-background-options\";s:224:\"{\"background-color\":\"#19721c\",\"background-image\":\"\",\"background-size\":\"cover\",\"background-position\":\"center\",\"background-repeat\":\"no-repeat\",\"background-attachment\":\"scroll\",\"enable-overlay\":\"\",\"background-overlay-color\":\"\"}\";s:19:\"footer-main-padding\";s:218:\"{\"desktop\":{\"top\":\"\",\"right\":\"\",\"bottom\":\"\",\"left\":\"\",\"cssbox_link\":true},\"tablet\":{\"top\":\"\",\"right\":\"\",\"bottom\":\"\",\"left\":\"\",\"cssbox_link\":true},\"mobile\":{\"top\":\"\",\"right\":\"\",\"bottom\":\"\",\"left\":\"\",\"cssbox_link\":true}}\";s:39:\"footer-main-widget-title-border-styling\";s:133:\"{\"border-style\":\"dashed\",\"border-color\":\"\",\"border-width\":{\"desktop\":{\"top\":\"\",\"right\":\"\",\"bottom\":1,\"left\":\"\",\"cssbox_link\":false}}}\";s:40:\"footer-main-widget-content-color-options\";s:76:\"{\"text-color\":\"#ffffff\",\"link-color\":\"#eeee22\",\"link-hover-color\":\"#dd3333\"}\";s:43:\"footer-main-widget-title-typography-options\";s:6:\"custom\";s:35:\"footer-main-widget-title-typography\";s:340:\"{\"font-type\":\"system\",\"system-font\":\"Tahoma\",\"google-font\":\"\",\"custom-font\":\"\",\"font-weight\":\"700\",\"font-style\":\"bold\",\"text-decoration\":\"none\",\"text-transform\":\"none\",\"font-size\":{\"desktop\":\"18\",\"tablet\":\"16\",\"mobile\":\"14\"},\"line-height\":{\"desktop\":\"24\",\"tablet\":\"24\",\"mobile\":\"24\"},\"letter-spacing\":{\"desktop\":\"\",\"tablet\":\"\",\"mobile\":\"\"}}\";s:45:\"footer-main-widget-content-typography-options\";s:6:\"custom\";s:37:\"footer-main-widget-content-typography\";s:346:\"{\"font-type\":\"system\",\"system-font\":\"Tahoma\",\"google-font\":\"Lato\",\"custom-font\":\"\",\"font-weight\":\"300\",\"font-style\":\"normal\",\"text-decoration\":\"none\",\"text-transform\":\"none\",\"font-size\":{\"desktop\":\"17\",\"tablet\":\"15\",\"mobile\":\"14\"},\"line-height\":{\"desktop\":\"24\",\"tablet\":\"24\",\"mobile\":\"24\"},\"letter-spacing\":{\"desktop\":\"\",\"tablet\":\"\",\"mobile\":\"\"}}\";s:24:\"footer-bottom-bg-options\";s:6:\"custom\";s:32:\"footer-bottom-background-options\";s:224:\"{\"background-color\":\"#147216\",\"background-image\":\"\",\"background-size\":\"cover\",\"background-position\":\"center\",\"background-repeat\":\"no-repeat\",\"background-attachment\":\"scroll\",\"enable-overlay\":\"\",\"background-overlay-color\":\"\"}\";s:21:\"sticky-header-options\";s:11:\"scroll-down\";s:31:\"sticky-header-animation-options\";s:18:\"cwp-fade-animation\";s:25:\"sticky-header-include-top\";b:0;s:26:\"sticky-header-include-main\";b:1;s:34:\"enable-sticky-header-color-options\";b:0;s:38:\"footer-sidebar-3-widget-setting-option\";s:7:\"inherit\";s:12:\"page-sidebar\";s:6:\"ful-ct\";s:23:\"contact-info-icon-color\";s:7:\"#19721c\";s:24:\"contact-info-title-color\";s:7:\"#19721c\";s:27:\"contact-info-subtitle-color\";s:7:\"#19721c\";s:37:\"contact-info-title-typography-options\";s:6:\"custom\";s:32:\"contact-info-subtitle-typography\";s:351:\"{\"font-type\":\"system\",\"system-font\":\"Arial\",\"google-font\":\"Montserrat\",\"custom-font\":\"\",\"font-weight\":\"400\",\"font-style\":\"normal\",\"text-decoration\":\"none\",\"text-transform\":\"none\",\"font-size\":{\"desktop\":\"14\",\"tablet\":\"14\",\"mobile\":\"14\"},\"line-height\":{\"desktop\":\"12\",\"tablet\":\"12\",\"mobile\":\"12\"},\"letter-spacing\":{\"desktop\":\"\",\"tablet\":\"\",\"mobile\":\"\"}}\";s:22:\"contact-info-icon-size\";s:38:\"{\"desktop\":28,\"tablet\":14,\"mobile\":14}\";s:29:\"general-setting-color-options\";s:149:\"{\"primary-color\":\"#275cf6\",\"text-color\":\"#333333\",\"title-color\":\"#202020\",\"link-color\":\"#ffffff\",\"link-hover-color\":\"#dd3333\",\"meta-color\":\"#999999\"}\";}', 'yes'),
(150, 'cosmoswp_theme_installed_time', '1628522919', 'yes'),
(151, 'recently_activated', 'a:0:{}', 'yes'),
(152, '__gutentor_do_redirect', '', 'yes'),
(153, 'widget_gutentor_wp_block_widget', 'a:2:{i:2;a:2:{s:5:\"title\";s:10:\"Pengumuman\";s:11:\"wp_block_id\";i:29;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(167, 'ulisting_listing_cron_time', '15:29', 'yes'),
(168, 'stm_lms_wizard_redirect', '1', 'no'),
(169, 'stm_lms_business_type', 'marketplace', 'no'),
(228, 'stm_lms_course_taxonomy_children', 'a:0:{}', 'yes'),
(186, 'stm_lms_styles_v', '387', 'yes'),
(187, 'nav_menu_options', 'a:2:{i:0;b:0;s:8:\"auto_add\";a:0:{}}', 'yes'),
(243, 'litespeed.cloud._summary', 'a:5:{s:19:\"curr_request.wp/ver\";i:0;s:19:\"last_request.wp/ver\";i:1628530909;s:10:\"news.utime\";i:1628530916;s:20:\"curr_request.wp/news\";i:0;s:20:\"last_request.wp/news\";i:1628530916;}', 'yes'),
(244, 'litespeed.conf._version', '3.6.4', 'yes'),
(245, 'litespeed.conf.hash', 'geDOqmNxvimwGhKqovMDune6kPS6T7Rm', 'yes'),
(246, 'litespeed.conf.auto_upgrade', '', 'yes'),
(247, 'litespeed.conf.api_key', '', 'yes'),
(248, 'litespeed.conf.server_ip', '', 'yes'),
(249, 'litespeed.conf.news', '1', 'yes'),
(250, 'litespeed.conf.cache', '1', 'yes'),
(251, 'litespeed.conf.cache-priv', '1', 'yes'),
(252, 'litespeed.conf.cache-commenter', '1', 'yes'),
(253, 'litespeed.conf.cache-rest', '1', 'yes'),
(254, 'litespeed.conf.cache-page_login', '1', 'yes'),
(255, 'litespeed.conf.cache-favicon', '1', 'yes'),
(256, 'litespeed.conf.cache-resources', '1', 'yes'),
(257, 'litespeed.conf.cache-mobile', '', 'yes'),
(258, 'litespeed.conf.cache-mobile_rules', 'a:7:{i:0;s:6:\"Mobile\";i:1;s:7:\"Android\";i:2;s:5:\"Silk/\";i:3;s:6:\"Kindle\";i:4;s:10:\"BlackBerry\";i:5;s:10:\"Opera Mini\";i:6;s:10:\"Opera Mobi\";}', 'yes'),
(259, 'litespeed.conf.cache-browser', '', 'yes'),
(260, 'litespeed.conf.cache-exc_useragents', 'a:0:{}', 'yes'),
(261, 'litespeed.conf.cache-exc_cookies', 'a:0:{}', 'yes'),
(262, 'litespeed.conf.cache-exc_qs', 'a:0:{}', 'yes'),
(263, 'litespeed.conf.cache-exc_cat', 'a:0:{}', 'yes'),
(264, 'litespeed.conf.cache-exc_tag', 'a:0:{}', 'yes'),
(265, 'litespeed.conf.cache-force_uri', 'a:0:{}', 'yes'),
(266, 'litespeed.conf.cache-force_pub_uri', 'a:0:{}', 'yes'),
(267, 'litespeed.conf.cache-priv_uri', 'a:0:{}', 'yes'),
(268, 'litespeed.conf.cache-exc', 'a:0:{}', 'yes'),
(269, 'litespeed.conf.cache-exc_roles', 'a:0:{}', 'yes'),
(270, 'litespeed.conf.cache-drop_qs', 'a:4:{i:0;s:6:\"fbclid\";i:1;s:5:\"gclid\";i:2;s:4:\"utm*\";i:3;s:3:\"_ga\";}', 'yes'),
(271, 'litespeed.conf.cache-ttl_pub', '604800', 'yes'),
(272, 'litespeed.conf.cache-ttl_priv', '1800', 'yes'),
(273, 'litespeed.conf.cache-ttl_frontpage', '604800', 'yes'),
(274, 'litespeed.conf.cache-ttl_feed', '604800', 'yes'),
(275, 'litespeed.conf.cache-ttl_rest', '604800', 'yes'),
(276, 'litespeed.conf.cache-ttl_browser', '31557600', 'yes'),
(277, 'litespeed.conf.cache-ttl_status', 'a:3:{i:0;s:8:\"403 3600\";i:1;s:8:\"404 3600\";i:2;s:8:\"500 3600\";}', 'yes'),
(278, 'litespeed.conf.cache-login_cookie', '', 'yes'),
(279, 'litespeed.conf.cache-vary_group', 'a:0:{}', 'yes'),
(280, 'litespeed.conf.purge-upgrade', '1', 'yes'),
(281, 'litespeed.conf.purge-stale', '', 'yes'),
(282, 'litespeed.conf.purge-post_all', '', 'yes'),
(283, 'litespeed.conf.purge-post_f', '1', 'yes'),
(284, 'litespeed.conf.purge-post_h', '1', 'yes'),
(285, 'litespeed.conf.purge-post_p', '1', 'yes'),
(286, 'litespeed.conf.purge-post_pwrp', '1', 'yes'),
(287, 'litespeed.conf.purge-post_a', '1', 'yes'),
(288, 'litespeed.conf.purge-post_y', '', 'yes'),
(289, 'litespeed.conf.purge-post_m', '1', 'yes'),
(290, 'litespeed.conf.purge-post_d', '', 'yes'),
(291, 'litespeed.conf.purge-post_t', '1', 'yes'),
(292, 'litespeed.conf.purge-post_pt', '1', 'yes'),
(293, 'litespeed.conf.purge-timed_urls', 'a:0:{}', 'yes'),
(294, 'litespeed.conf.purge-timed_urls_time', '', 'yes'),
(295, 'litespeed.conf.purge-hook_all', 'a:10:{i:0;s:12:\"switch_theme\";i:1;s:18:\"wp_create_nav_menu\";i:2;s:18:\"wp_update_nav_menu\";i:3;s:18:\"wp_delete_nav_menu\";i:4;s:11:\"create_term\";i:5;s:10:\"edit_terms\";i:6;s:11:\"delete_term\";i:7;s:8:\"add_link\";i:8;s:9:\"edit_link\";i:9;s:11:\"delete_link\";}', 'yes'),
(296, 'litespeed.conf.esi', '', 'yes'),
(297, 'litespeed.conf.esi-cache_admbar', '1', 'yes'),
(298, 'litespeed.conf.esi-cache_commform', '1', 'yes'),
(299, 'litespeed.conf.esi-nonce', 'a:2:{i:0;s:11:\"stats_nonce\";i:1;s:15:\"subscribe_nonce\";}', 'yes'),
(300, 'litespeed.conf.util-instant_click', '', 'yes'),
(301, 'litespeed.conf.util-no_https_vary', '', 'yes'),
(302, 'litespeed.conf.debug-disable_all', '', 'yes'),
(303, 'litespeed.conf.debug', '', 'yes'),
(304, 'litespeed.conf.debug-ips', 'a:1:{i:0;s:9:\"127.0.0.1\";}', 'yes'),
(305, 'litespeed.conf.debug-level', '', 'yes'),
(306, 'litespeed.conf.debug-filesize', '3', 'yes'),
(307, 'litespeed.conf.debug-cookie', '', 'yes'),
(308, 'litespeed.conf.debug-collaps_qs', '', 'yes'),
(309, 'litespeed.conf.debug-inc', 'a:0:{}', 'yes'),
(310, 'litespeed.conf.debug-exc', 'a:0:{}', 'yes'),
(311, 'litespeed.conf.db_optm-revisions_max', '0', 'yes'),
(312, 'litespeed.conf.db_optm-revisions_age', '0', 'yes'),
(313, 'litespeed.conf.optm-css_min', '', 'yes'),
(314, 'litespeed.conf.optm-css_comb', '', 'yes'),
(315, 'litespeed.conf.optm-css_comb_ext_inl', '', 'yes'),
(316, 'litespeed.conf.optm-ucss', '', 'yes'),
(317, 'litespeed.conf.optm-ucss_async', '', 'yes'),
(318, 'litespeed.conf.optm-css_http2', '', 'yes'),
(319, 'litespeed.conf.optm-css_exc', 'a:0:{}', 'yes'),
(320, 'litespeed.conf.optm-js_min', '', 'yes'),
(321, 'litespeed.conf.optm-js_comb', '', 'yes'),
(322, 'litespeed.conf.optm-js_comb_ext_inl', '', 'yes'),
(323, 'litespeed.conf.optm-js_http2', '', 'yes'),
(324, 'litespeed.conf.optm-js_exc', 'a:2:{i:0;s:9:\"jquery.js\";i:1;s:13:\"jquery.min.js\";}', 'yes'),
(325, 'litespeed.conf.optm-ttl', '604800', 'yes'),
(326, 'litespeed.conf.optm-html_min', '', 'yes'),
(327, 'litespeed.conf.optm-qs_rm', '', 'yes'),
(328, 'litespeed.conf.optm-ggfonts_rm', '', 'yes'),
(329, 'litespeed.conf.optm-css_async', '', 'yes'),
(330, 'litespeed.conf.optm-ccss_gen', '1', 'yes'),
(331, 'litespeed.conf.optm-ccss_async', '1', 'yes'),
(332, 'litespeed.conf.optm-css_async_inline', '1', 'yes'),
(333, 'litespeed.conf.optm-css_font_display', '', 'yes'),
(334, 'litespeed.conf.optm-js_defer', '', 'yes'),
(335, 'litespeed.conf.optm-js_inline_defer', '', 'yes'),
(336, 'litespeed.conf.optm-emoji_rm', '', 'yes'),
(337, 'litespeed.conf.optm-noscript_rm', '', 'yes'),
(338, 'litespeed.conf.optm-ggfonts_async', '', 'yes'),
(339, 'litespeed.conf.optm-exc_roles', 'a:0:{}', 'yes'),
(340, 'litespeed.conf.optm-ccss_con', '', 'yes'),
(341, 'litespeed.conf.optm-js_defer_exc', 'a:2:{i:0;s:9:\"jquery.js\";i:1;s:13:\"jquery.min.js\";}', 'yes'),
(342, 'litespeed.conf.optm-dns_prefetch', 'a:0:{}', 'yes'),
(343, 'litespeed.conf.optm-dns_prefetch_ctrl', '', 'yes'),
(344, 'litespeed.conf.optm-exc', 'a:0:{}', 'yes'),
(345, 'litespeed.conf.optm-ccss_sep_posttype', 'a:0:{}', 'yes'),
(346, 'litespeed.conf.optm-ccss_sep_uri', 'a:0:{}', 'yes'),
(347, 'litespeed.conf.object', '', 'yes'),
(348, 'litespeed.conf.object-kind', '', 'yes'),
(349, 'litespeed.conf.object-host', 'localhost', 'yes'),
(350, 'litespeed.conf.object-port', '11211', 'yes'),
(351, 'litespeed.conf.object-life', '360', 'yes'),
(352, 'litespeed.conf.object-persistent', '1', 'yes'),
(353, 'litespeed.conf.object-admin', '1', 'yes'),
(354, 'litespeed.conf.object-transients', '1', 'yes'),
(355, 'litespeed.conf.object-db_id', '0', 'yes'),
(356, 'litespeed.conf.object-user', '', 'yes'),
(357, 'litespeed.conf.object-pswd', '', 'yes'),
(358, 'litespeed.conf.object-global_groups', 'a:12:{i:0;s:5:\"users\";i:1;s:10:\"userlogins\";i:2;s:8:\"usermeta\";i:3;s:9:\"user_meta\";i:4;s:14:\"site-transient\";i:5;s:12:\"site-options\";i:6;s:11:\"site-lookup\";i:7;s:11:\"blog-lookup\";i:8;s:12:\"blog-details\";i:9;s:3:\"rss\";i:10;s:12:\"global-posts\";i:11;s:13:\"blog-id-cache\";}', 'yes'),
(359, 'litespeed.conf.object-non_persistent_groups', 'a:4:{i:0;s:7:\"comment\";i:1;s:6:\"counts\";i:2;s:7:\"plugins\";i:3;s:13:\"wc_session_id\";}', 'yes'),
(360, 'litespeed.conf.discuss-avatar_cache', '', 'yes'),
(361, 'litespeed.conf.discuss-avatar_cron', '', 'yes'),
(362, 'litespeed.conf.discuss-avatar_cache_ttl', '604800', 'yes'),
(363, 'litespeed.conf.optm-localize', '', 'yes'),
(364, 'litespeed.conf.optm-localize_domains', 'a:7:{i:0;s:23:\"### Popular scripts ###\";i:1;s:39:\"https://platform.twitter.com/widgets.js\";i:2;s:39:\"https://www.google.com/recaptcha/api.js\";i:3;s:45:\"https://www.google-analytics.com/analytics.js\";i:4;s:39:\"https://www.googletagmanager.com/gtm.js\";i:5;s:47:\"https://www.googletagservices.com/tag/js/gpt.js\";i:6;s:46:\"https://connect.facebook.net/en_US/fbevents.js\";}', 'yes'),
(365, 'litespeed.conf.media-lazy', '', 'yes'),
(366, 'litespeed.conf.media-lazy_placeholder', '', 'yes'),
(367, 'litespeed.conf.media-placeholder_resp', '', 'yes'),
(368, 'litespeed.conf.media-placeholder_resp_color', '#cfd4db', 'yes'),
(369, 'litespeed.conf.media-placeholder_resp_svg', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"{width}\" height=\"{height}\" viewBox=\"0 0 {width} {height}\"><rect width=\"100%\" height=\"100%\" fill=\"{color}\"/></svg>', 'yes'),
(370, 'litespeed.conf.media-lqip', '', 'yes'),
(371, 'litespeed.conf.media-lqip_qual', '4', 'yes'),
(372, 'litespeed.conf.media-lqip_min_w', '150', 'yes'),
(373, 'litespeed.conf.media-lqip_min_h', '150', 'yes'),
(374, 'litespeed.conf.media-placeholder_resp_async', '1', 'yes'),
(375, 'litespeed.conf.media-iframe_lazy', '', 'yes'),
(376, 'litespeed.conf.media-lazyjs_inline', '', 'yes'),
(377, 'litespeed.conf.media-lazy_exc', 'a:0:{}', 'yes'),
(378, 'litespeed.conf.media-lazy_cls_exc', 'a:1:{i:0;s:15:\"wmu-preview-img\";}', 'yes'),
(379, 'litespeed.conf.media-lazy_parent_cls_exc', 'a:0:{}', 'yes'),
(380, 'litespeed.conf.media-iframe_lazy_cls_exc', 'a:0:{}', 'yes'),
(381, 'litespeed.conf.media-iframe_lazy_parent_cls_exc', 'a:0:{}', 'yes'),
(382, 'litespeed.conf.media-lazy_uri_exc', 'a:0:{}', 'yes'),
(383, 'litespeed.conf.media-lqip_exc', 'a:0:{}', 'yes'),
(384, 'litespeed.conf.img_optm-auto', '', 'yes'),
(385, 'litespeed.conf.img_optm-cron', '1', 'yes'),
(386, 'litespeed.conf.img_optm-ori', '1', 'yes'),
(387, 'litespeed.conf.img_optm-rm_bkup', '', 'yes'),
(388, 'litespeed.conf.img_optm-webp', '', 'yes'),
(389, 'litespeed.conf.img_optm-lossless', '', 'yes'),
(390, 'litespeed.conf.img_optm-exif', '', 'yes'),
(391, 'litespeed.conf.img_optm-webp_replace', '', 'yes'),
(392, 'litespeed.conf.img_optm-webp_attr', 'a:7:{i:0;s:7:\"img.src\";i:1;s:14:\"div.data-thumb\";i:2;s:12:\"img.data-src\";i:3;s:20:\"div.data-large_image\";i:4;s:19:\"img.retina_logo_url\";i:5;s:23:\"div.data-parallax-image\";i:6;s:12:\"video.poster\";}', 'yes'),
(393, 'litespeed.conf.img_optm-webp_replace_srcset', '', 'yes'),
(394, 'litespeed.conf.img_optm-jpg_quality', '82', 'yes'),
(395, 'litespeed.conf.crawler', '', 'yes'),
(396, 'litespeed.conf.crawler-usleep', '500', 'yes'),
(397, 'litespeed.conf.crawler-run_duration', '400', 'yes'),
(398, 'litespeed.conf.crawler-run_interval', '600', 'yes'),
(399, 'litespeed.conf.crawler-crawl_interval', '302400', 'yes'),
(400, 'litespeed.conf.crawler-threads', '3', 'yes'),
(401, 'litespeed.conf.crawler-timeout', '30', 'yes'),
(402, 'litespeed.conf.crawler-load_limit', '1', 'yes'),
(403, 'litespeed.conf.crawler-sitemap', '', 'yes'),
(404, 'litespeed.conf.crawler-drop_domain', '1', 'yes'),
(405, 'litespeed.conf.crawler-map_timeout', '120', 'yes'),
(406, 'litespeed.conf.crawler-roles', 'a:0:{}', 'yes'),
(407, 'litespeed.conf.crawler-cookies', 'a:0:{}', 'yes'),
(408, 'litespeed.conf.misc-htaccess_front', '', 'yes'),
(409, 'litespeed.conf.misc-htaccess_back', '', 'yes'),
(410, 'litespeed.conf.misc-heartbeat_front', '', 'yes'),
(411, 'litespeed.conf.misc-heartbeat_front_ttl', '60', 'yes'),
(412, 'litespeed.conf.misc-heartbeat_back', '', 'yes'),
(413, 'litespeed.conf.misc-heartbeat_back_ttl', '60', 'yes'),
(414, 'litespeed.conf.misc-heartbeat_editor', '', 'yes'),
(415, 'litespeed.conf.misc-heartbeat_editor_ttl', '15', 'yes'),
(416, 'litespeed.conf.cdn', '', 'yes'),
(417, 'litespeed.conf.cdn-ori', 'a:0:{}', 'yes'),
(418, 'litespeed.conf.cdn-ori_dir', 'a:2:{i:0;s:10:\"wp-content\";i:1;s:11:\"wp-includes\";}', 'yes'),
(419, 'litespeed.conf.cdn-exc', 'a:0:{}', 'yes'),
(420, 'litespeed.conf.cdn-quic', '', 'yes'),
(421, 'litespeed.conf.cdn-cloudflare', '', 'yes'),
(422, 'litespeed.conf.cdn-cloudflare_email', '', 'yes'),
(423, 'litespeed.conf.cdn-cloudflare_key', '', 'yes'),
(424, 'litespeed.conf.cdn-cloudflare_name', '', 'yes'),
(425, 'litespeed.conf.cdn-cloudflare_zone', '', 'yes'),
(426, 'litespeed.conf.cdn-mapping', 'a:1:{i:0;a:5:{s:3:\"url\";b:0;s:7:\"inc_img\";s:1:\"1\";s:7:\"inc_css\";s:1:\"1\";s:6:\"inc_js\";s:1:\"1\";s:8:\"filetype\";a:17:{i:0;s:4:\".aac\";i:1;s:4:\".css\";i:2;s:4:\".eot\";i:3;s:4:\".gif\";i:4;s:5:\".jpeg\";i:5;s:3:\".js\";i:6;s:4:\".jpg\";i:7;s:5:\".less\";i:8;s:4:\".mp3\";i:9;s:4:\".mp4\";i:10;s:4:\".ogg\";i:11;s:4:\".otf\";i:12;s:4:\".pdf\";i:13;s:4:\".png\";i:14;s:4:\".svg\";i:15;s:4:\".ttf\";i:16;s:5:\".woff\";}}}', 'yes'),
(427, 'litespeed.conf.cdn-attr', 'a:5:{i:0;s:4:\".src\";i:1;s:9:\".data-src\";i:2;s:5:\".href\";i:3;s:7:\".poster\";i:4;s:13:\"source.srcset\";}', 'yes'),
(430, 'litespeed.gui._summary', 'a:2:{s:11:\"new_version\";i:1628617315;s:5:\"score\";i:1628962915;}', 'yes'),
(435, '_site_transient_update_core', 'O:8:\"stdClass\":4:{s:7:\"updates\";a:1:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:63:\"https://downloads.wordpress.org/release/id_ID/wordpress-5.8.zip\";s:6:\"locale\";s:5:\"id_ID\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:63:\"https://downloads.wordpress.org/release/id_ID/wordpress-5.8.zip\";s:10:\"no_content\";s:0:\"\";s:11:\"new_bundled\";s:0:\"\";s:7:\"partial\";s:0:\"\";s:8:\"rollback\";s:0:\"\";}s:7:\"current\";s:3:\"5.8\";s:7:\"version\";s:3:\"5.8\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.6\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1628530965;s:15:\"version_checked\";s:3:\"5.8\";s:12:\"translations\";a:0:{}}', 'no'),
(436, '_site_transient_update_plugins', 'O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1628530965;s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:3:{s:21:\"gutentor/gutentor.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:22:\"w.org/plugins/gutentor\";s:4:\"slug\";s:8:\"gutentor\";s:6:\"plugin\";s:21:\"gutentor/gutentor.php\";s:11:\"new_version\";s:5:\"3.1.4\";s:3:\"url\";s:39:\"https://wordpress.org/plugins/gutentor/\";s:7:\"package\";s:57:\"https://downloads.wordpress.org/plugin/gutentor.3.1.4.zip\";s:5:\"icons\";a:3:{s:2:\"2x\";s:61:\"https://ps.w.org/gutentor/assets/icon-256x256.png?rev=2144459\";s:2:\"1x\";s:53:\"https://ps.w.org/gutentor/assets/icon.svg?rev=2144459\";s:3:\"svg\";s:53:\"https://ps.w.org/gutentor/assets/icon.svg?rev=2144459\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:64:\"https://ps.w.org/gutentor/assets/banner-1544x500.png?rev=2144459\";s:2:\"1x\";s:63:\"https://ps.w.org/gutentor/assets/banner-772x250.png?rev=2144459\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"5.0\";}s:35:\"litespeed-cache/litespeed-cache.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:29:\"w.org/plugins/litespeed-cache\";s:4:\"slug\";s:15:\"litespeed-cache\";s:6:\"plugin\";s:35:\"litespeed-cache/litespeed-cache.php\";s:11:\"new_version\";s:5:\"3.6.4\";s:3:\"url\";s:46:\"https://wordpress.org/plugins/litespeed-cache/\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/plugin/litespeed-cache.3.6.4.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:68:\"https://ps.w.org/litespeed-cache/assets/icon-256x256.png?rev=2554181\";s:2:\"1x\";s:68:\"https://ps.w.org/litespeed-cache/assets/icon-128x128.png?rev=2554181\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:71:\"https://ps.w.org/litespeed-cache/assets/banner-1544x500.png?rev=2554181\";s:2:\"1x\";s:70:\"https://ps.w.org/litespeed-cache/assets/banner-772x250.png?rev=2554181\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"4.0\";}s:89:\"masterstudy-lms-learning-management-system/masterstudy-lms-learning-management-system.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:56:\"w.org/plugins/masterstudy-lms-learning-management-system\";s:4:\"slug\";s:42:\"masterstudy-lms-learning-management-system\";s:6:\"plugin\";s:89:\"masterstudy-lms-learning-management-system/masterstudy-lms-learning-management-system.php\";s:11:\"new_version\";s:5:\"2.6.6\";s:3:\"url\";s:73:\"https://wordpress.org/plugins/masterstudy-lms-learning-management-system/\";s:7:\"package\";s:91:\"https://downloads.wordpress.org/plugin/masterstudy-lms-learning-management-system.2.6.6.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:95:\"https://ps.w.org/masterstudy-lms-learning-management-system/assets/icon-256x256.png?rev=2364576\";s:2:\"1x\";s:95:\"https://ps.w.org/masterstudy-lms-learning-management-system/assets/icon-128x128.png?rev=2364576\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:98:\"https://ps.w.org/masterstudy-lms-learning-management-system/assets/banner-1544x500.jpg?rev=2364576\";s:2:\"1x\";s:97:\"https://ps.w.org/masterstudy-lms-learning-management-system/assets/banner-772x250.jpg?rev=2364576\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"4.6\";}}}', 'no'),
(437, '_site_transient_timeout_theme_roots', '1628532766', 'no'),
(438, '_site_transient_theme_roots', 'a:2:{s:8:\"cosmoswp\";s:7:\"/themes\";s:15:\"twentytwentyone\";s:7:\"/themes\";}', 'no'),
(439, '_site_transient_update_themes', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1628530967;s:7:\"checked\";a:2:{s:8:\"cosmoswp\";s:5:\"1.3.4\";s:15:\"twentytwentyone\";s:3:\"1.4\";}s:8:\"response\";a:0:{}s:9:\"no_update\";a:2:{s:8:\"cosmoswp\";a:6:{s:5:\"theme\";s:8:\"cosmoswp\";s:11:\"new_version\";s:5:\"1.3.4\";s:3:\"url\";s:38:\"https://wordpress.org/themes/cosmoswp/\";s:7:\"package\";s:56:\"https://downloads.wordpress.org/theme/cosmoswp.1.3.4.zip\";s:8:\"requires\";s:3:\"5.0\";s:12:\"requires_php\";s:3:\"5.6\";}s:15:\"twentytwentyone\";a:6:{s:5:\"theme\";s:15:\"twentytwentyone\";s:11:\"new_version\";s:3:\"1.4\";s:3:\"url\";s:45:\"https://wordpress.org/themes/twentytwentyone/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/theme/twentytwentyone.1.4.zip\";s:8:\"requires\";s:3:\"5.3\";s:12:\"requires_php\";s:3:\"5.6\";}}s:12:\"translations\";a:0:{}}', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `sd_postmeta`
--

DROP TABLE IF EXISTS `sd_postmeta`;
CREATE TABLE IF NOT EXISTS `sd_postmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM AUTO_INCREMENT=271 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `sd_postmeta`
--

INSERT INTO `sd_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 3, '_wp_page_template', 'default'),
(3, 1, '_edit_last', '1'),
(22, 17, 'lms_page', 'user_url'),
(6, 1, '_edit_lock', '1628522172:1'),
(8, 6, '_customize_changeset_uuid', '1f2232f0-633b-4b18-942f-0675deb4ba5a'),
(21, 17, 'breadcrumbs', 'hide'),
(10, 7, '_customize_changeset_uuid', '1f2232f0-633b-4b18-942f-0675deb4ba5a'),
(20, 17, 'title', 'hide'),
(12, 8, '_customize_changeset_uuid', '1f2232f0-633b-4b18-942f-0675deb4ba5a'),
(19, 11, '_wp_trash_meta_time', '1628522915'),
(14, 9, '_customize_changeset_uuid', '1f2232f0-633b-4b18-942f-0675deb4ba5a'),
(18, 11, '_wp_trash_meta_status', 'publish'),
(16, 10, '_customize_changeset_uuid', '1f2232f0-633b-4b18-942f-0675deb4ba5a'),
(17, 11, '_edit_lock', '1628522884:1'),
(23, 18, 'title', 'hide'),
(24, 18, 'breadcrumbs', 'hide'),
(25, 18, 'lms_page', 'user_url_profile'),
(26, 19, 'title', 'hide'),
(27, 19, 'breadcrumbs', 'hide'),
(28, 19, 'lms_page', 'wishlist_url'),
(29, 20, 'title', 'hide'),
(30, 20, 'breadcrumbs', 'hide'),
(31, 20, 'lms_page', 'checkout_url'),
(32, 21, 'title', 'hide'),
(33, 21, 'breadcrumbs', 'hide'),
(34, 21, 'lms_page', 'courses_page'),
(35, 22, '_wp_trash_meta_status', 'publish'),
(36, 22, '_wp_trash_meta_time', '1628523387'),
(37, 24, '_menu_item_stm_lms_badge', ''),
(38, 24, '_menu_item_stm_lms_badge_color', '#000000'),
(39, 24, '_menu_item_stm_lms_badge_bg_color', '#000000'),
(40, 24, '_menu_item_type', 'post_type'),
(41, 24, '_menu_item_menu_item_parent', '0'),
(42, 24, '_menu_item_object_id', '6'),
(43, 24, '_menu_item_object', 'page'),
(44, 24, '_menu_item_target', ''),
(45, 24, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(46, 24, '_menu_item_xfn', ''),
(47, 24, '_menu_item_url', ''),
(49, 25, '_menu_item_stm_lms_badge', ''),
(50, 25, '_menu_item_stm_lms_badge_color', '#000000'),
(51, 25, '_menu_item_stm_lms_badge_bg_color', '#000000'),
(52, 25, '_menu_item_type', 'post_type'),
(53, 25, '_menu_item_menu_item_parent', '0'),
(54, 25, '_menu_item_object_id', '21'),
(55, 25, '_menu_item_object', 'page'),
(56, 25, '_menu_item_target', ''),
(57, 25, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(58, 25, '_menu_item_xfn', ''),
(59, 25, '_menu_item_url', ''),
(61, 26, '_menu_item_stm_lms_badge', ''),
(62, 26, '_menu_item_stm_lms_badge_color', '#000000'),
(63, 26, '_menu_item_stm_lms_badge_bg_color', '#000000'),
(64, 26, '_menu_item_type', 'post_type'),
(65, 26, '_menu_item_menu_item_parent', '0'),
(66, 26, '_menu_item_object_id', '10'),
(67, 26, '_menu_item_object', 'page'),
(68, 26, '_menu_item_target', ''),
(69, 26, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(70, 26, '_menu_item_xfn', ''),
(71, 26, '_menu_item_url', ''),
(73, 27, '_menu_item_stm_lms_badge', ''),
(74, 27, '_menu_item_stm_lms_badge_color', '#000000'),
(75, 27, '_menu_item_stm_lms_badge_bg_color', '#000000'),
(76, 27, '_menu_item_type', 'post_type'),
(77, 27, '_menu_item_menu_item_parent', '0'),
(78, 27, '_menu_item_object_id', '17'),
(79, 27, '_menu_item_object', 'page'),
(80, 27, '_menu_item_target', ''),
(81, 27, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(82, 27, '_menu_item_xfn', ''),
(83, 27, '_menu_item_url', ''),
(85, 28, '_menu_item_stm_lms_badge', ''),
(86, 28, '_menu_item_stm_lms_badge_color', '#000000'),
(87, 28, '_menu_item_stm_lms_badge_bg_color', '#000000'),
(88, 28, '_menu_item_type', 'post_type'),
(89, 28, '_menu_item_menu_item_parent', '0'),
(90, 28, '_menu_item_object_id', '9'),
(91, 28, '_menu_item_object', 'page'),
(92, 28, '_menu_item_target', ''),
(93, 28, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(94, 28, '_menu_item_xfn', ''),
(95, 28, '_menu_item_url', ''),
(97, 29, '_edit_lock', '1628528647:1'),
(179, 29, 'gutentor_dynamic_css', '#section-4066e0ba-6a90-495c-bd34-2997f2d83b55 .gutentor-single-item .gutentor-single-item-title,#section-4066e0ba-6a90-495c-bd34-2997f2d83b55 .gutentor-single-item .gutentor-single-item-title a{color:#ffffff}#section-4066e0ba-6a90-495c-bd34-2997f2d83b55 .gutentor-single-item:hover .gutentor-single-item-title,#section-4066e0ba-6a90-495c-bd34-2997f2d83b55 .gutentor-single-item:hover .gutentor-single-item-title a{color:#fcb900}#section-4066e0ba-6a90-495c-bd34-2997f2d83b55 .gutentor-single-item .gutentor-single-item-desc{color:#ffffff}#section-4066e0ba-6a90-495c-bd34-2997f2d83b55 .gutentor-single-item:hover .gutentor-single-item-desc{color:#fcb900}#section-4066e0ba-6a90-495c-bd34-2997f2d83b55 .entry-meta div{color:#ffffff}#section-4066e0ba-6a90-495c-bd34-2997f2d83b55 .entry-meta div:hover{color:#fcb900}'),
(102, 33, '_wp_trash_meta_status', 'publish'),
(103, 33, '_wp_trash_meta_time', '1628526166'),
(104, 34, '_edit_lock', '1628526421:1'),
(105, 34, '_wp_trash_meta_status', 'publish'),
(106, 34, '_wp_trash_meta_time', '1628526418'),
(107, 35, '_edit_lock', '1628526560:1'),
(108, 35, '_wp_trash_meta_status', 'publish'),
(109, 35, '_wp_trash_meta_time', '1628526572'),
(110, 36, '_wp_trash_meta_status', 'publish'),
(111, 36, '_wp_trash_meta_time', '1628526591'),
(112, 37, '_edit_lock', '1628526620:1'),
(113, 37, '_wp_trash_meta_status', 'publish'),
(180, 29, 'gutentor_css_info', 'a:5:{s:7:\"version\";s:5:\"3.1.4\";s:13:\"saved_version\";i:5;s:6:\"is_rtl\";b:0;s:6:\"blocks\";a:1:{i:0;s:18:\"gutentor/blog-post\";}s:18:\"load_optimized_css\";b:0;}'),
(114, 37, '_wp_trash_meta_time', '1628526635'),
(115, 38, '_wp_trash_meta_status', 'publish'),
(116, 38, '_wp_trash_meta_time', '1628526680'),
(117, 39, '_edit_lock', '1628526741:1'),
(118, 39, '_wp_trash_meta_status', 'publish'),
(119, 39, '_wp_trash_meta_time', '1628526774'),
(120, 40, '_wp_trash_meta_status', 'publish'),
(121, 40, '_wp_trash_meta_time', '1628526826'),
(122, 41, '_wp_trash_meta_status', 'publish'),
(123, 41, '_wp_trash_meta_time', '1628526908'),
(124, 42, '_wp_trash_meta_status', 'publish'),
(125, 42, '_wp_trash_meta_time', '1628526931'),
(126, 43, '_wp_trash_meta_status', 'publish'),
(127, 43, '_wp_trash_meta_time', '1628527029'),
(128, 44, '_edit_lock', '1628527111:1'),
(129, 44, '_wp_trash_meta_status', 'publish'),
(130, 44, '_wp_trash_meta_time', '1628527124'),
(131, 45, '_wp_trash_meta_status', 'publish'),
(132, 45, '_wp_trash_meta_time', '1628527175'),
(133, 46, '_edit_lock', '1628527324:1'),
(134, 46, '_wp_trash_meta_status', 'publish'),
(135, 46, '_wp_trash_meta_time', '1628527348'),
(136, 47, '_edit_lock', '1628527407:1'),
(137, 47, '_wp_trash_meta_status', 'publish'),
(138, 47, '_wp_trash_meta_time', '1628527435'),
(139, 48, '_wp_trash_meta_status', 'publish'),
(140, 48, '_wp_trash_meta_time', '1628527481'),
(141, 49, '_wp_trash_meta_status', 'publish'),
(142, 49, '_wp_trash_meta_time', '1628527522'),
(143, 50, '_edit_lock', '1628527585:1'),
(144, 50, '_wp_trash_meta_status', 'publish'),
(145, 50, '_wp_trash_meta_time', '1628527605'),
(146, 51, '_edit_lock', '1628527640:1'),
(147, 51, '_wp_trash_meta_status', 'publish'),
(148, 51, '_wp_trash_meta_time', '1628527647'),
(149, 20, '_wp_page_template', 'default'),
(150, 21, '_wp_page_template', 'default'),
(151, 17, '_wp_page_template', 'default'),
(152, 18, '_wp_page_template', 'default'),
(153, 19, '_wp_page_template', 'default'),
(154, 57, '_edit_lock', '1628527926:1'),
(155, 57, '_wp_trash_meta_status', 'publish'),
(156, 57, '_wp_trash_meta_time', '1628527941'),
(157, 58, '_wp_trash_meta_status', 'publish'),
(158, 58, '_wp_trash_meta_time', '1628528011'),
(159, 59, '_edit_lock', '1628528048:1'),
(160, 59, '_wp_trash_meta_status', 'publish'),
(161, 59, '_wp_trash_meta_time', '1628528054'),
(164, 62, '_edit_lock', '1628528311:1'),
(165, 62, 'gutentor_dynamic_css', ''),
(166, 62, 'gutentor_css_info', 'a:5:{s:7:\"version\";s:5:\"3.1.4\";s:13:\"saved_version\";i:1;s:6:\"is_rtl\";b:0;s:6:\"blocks\";a:0:{}s:18:\"load_optimized_css\";b:0;}'),
(170, 62, '_pingme', '1'),
(169, 62, '_edit_last', '1'),
(171, 62, '_encloseme', '1'),
(172, 62, 'cosmoswp_site_layout', 'default-layout'),
(173, 62, 'cosmoswp_sidebar_options', 'default'),
(174, 62, 'cosmoswp_header_layout', 'default-header'),
(175, 62, 'cosmoswp_footer_layout', 'default-footer'),
(176, 62, 'cosmoswp_banner_options_layout', 'default'),
(181, 66, '_wp_trash_meta_status', 'publish'),
(182, 66, '_wp_trash_meta_time', '1628528606'),
(183, 67, '_edit_lock', '1628528623:1'),
(184, 67, '_wp_trash_meta_status', 'publish'),
(185, 67, '_wp_trash_meta_time', '1628528660'),
(186, 68, '_wp_trash_meta_status', 'publish'),
(187, 68, '_wp_trash_meta_time', '1628528766'),
(188, 69, '_wp_trash_meta_status', 'publish'),
(189, 69, '_wp_trash_meta_time', '1628528839'),
(190, 70, '_edit_lock', '1628529045:1'),
(191, 70, '_wp_trash_meta_status', 'publish'),
(192, 70, '_wp_trash_meta_time', '1628529069'),
(193, 71, '_edit_lock', '1628529140:1'),
(194, 71, '_wp_trash_meta_status', 'publish'),
(195, 71, '_wp_trash_meta_time', '1628529160'),
(196, 72, '_wp_trash_meta_status', 'publish'),
(197, 72, '_wp_trash_meta_time', '1628529186'),
(198, 73, '_edit_lock', '1628529320:1'),
(199, 73, '_wp_trash_meta_status', 'publish'),
(200, 73, '_wp_trash_meta_time', '1628529328'),
(201, 21, '_edit_last', '1'),
(202, 21, '_edit_lock', '1628529340:1'),
(203, 75, '_edit_lock', '1628530117:1'),
(204, 75, '_edit_last', '1'),
(205, 88, '_wp_attached_file', '2021/08/ibu-guru-250x333px.jpg'),
(206, 88, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:250;s:6:\"height\";i:333;s:4:\"file\";s:30:\"2021/08/ibu-guru-250x333px.jpg\";s:5:\"sizes\";a:5:{s:6:\"medium\";a:4:{s:4:\"file\";s:30:\"ibu-guru-250x333px-225x300.jpg\";s:5:\"width\";i:225;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:30:\"ibu-guru-250x333px-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:11:\"img-300-225\";a:4:{s:4:\"file\";s:30:\"ibu-guru-250x333px-250x225.jpg\";s:5:\"width\";i:250;s:6:\"height\";i:225;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"img-75-75\";a:4:{s:4:\"file\";s:28:\"ibu-guru-250x333px-75x75.jpg\";s:5:\"width\";i:75;s:6:\"height\";i:75;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:14:\"post-thumbnail\";a:4:{s:4:\"file\";s:30:\"ibu-guru-250x333px-250x240.jpg\";s:5:\"width\";i:250;s:6:\"height\";i:240;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(207, 89, '_wp_attached_file', '2021/08/bu-guru-250x333px.jpg'),
(208, 89, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:250;s:6:\"height\";i:333;s:4:\"file\";s:29:\"2021/08/bu-guru-250x333px.jpg\";s:5:\"sizes\";a:5:{s:6:\"medium\";a:4:{s:4:\"file\";s:29:\"bu-guru-250x333px-225x300.jpg\";s:5:\"width\";i:225;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:29:\"bu-guru-250x333px-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:11:\"img-300-225\";a:4:{s:4:\"file\";s:29:\"bu-guru-250x333px-250x225.jpg\";s:5:\"width\";i:250;s:6:\"height\";i:225;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"img-75-75\";a:4:{s:4:\"file\";s:27:\"bu-guru-250x333px-75x75.jpg\";s:5:\"width\";i:75;s:6:\"height\";i:75;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:14:\"post-thumbnail\";a:4:{s:4:\"file\";s:29:\"bu-guru-250x333px-250x240.jpg\";s:5:\"width\";i:250;s:6:\"height\";i:240;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(209, 90, '_wp_attached_file', '2021/08/pak-guru-250x333px.jpg'),
(210, 90, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:250;s:6:\"height\";i:333;s:4:\"file\";s:30:\"2021/08/pak-guru-250x333px.jpg\";s:5:\"sizes\";a:5:{s:6:\"medium\";a:4:{s:4:\"file\";s:30:\"pak-guru-250x333px-225x300.jpg\";s:5:\"width\";i:225;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:30:\"pak-guru-250x333px-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:11:\"img-300-225\";a:4:{s:4:\"file\";s:30:\"pak-guru-250x333px-250x225.jpg\";s:5:\"width\";i:250;s:6:\"height\";i:225;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"img-75-75\";a:4:{s:4:\"file\";s:28:\"pak-guru-250x333px-75x75.jpg\";s:5:\"width\";i:75;s:6:\"height\";i:75;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:14:\"post-thumbnail\";a:4:{s:4:\"file\";s:30:\"pak-guru-250x333px-250x240.jpg\";s:5:\"width\";i:250;s:6:\"height\";i:240;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(211, 91, '_wp_attached_file', '2021/08/box1.jpg'),
(212, 91, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:300;s:6:\"height\";i:168;s:4:\"file\";s:16:\"2021/08/box1.jpg\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:16:\"box1-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"img-75-75\";a:4:{s:4:\"file\";s:14:\"box1-75x75.jpg\";s:5:\"width\";i:75;s:6:\"height\";i:75;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(213, 92, '_wp_attached_file', '2021/08/box2.jpg'),
(214, 92, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:300;s:6:\"height\";i:168;s:4:\"file\";s:16:\"2021/08/box2.jpg\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:16:\"box2-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"img-75-75\";a:4:{s:4:\"file\";s:14:\"box2-75x75.jpg\";s:5:\"width\";i:75;s:6:\"height\";i:75;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(215, 93, '_wp_attached_file', '2021/08/box3.jpg'),
(216, 93, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:300;s:6:\"height\";i:168;s:4:\"file\";s:16:\"2021/08/box3.jpg\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:16:\"box3-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"img-75-75\";a:4:{s:4:\"file\";s:14:\"box3-75x75.jpg\";s:5:\"width\";i:75;s:6:\"height\";i:75;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(217, 94, '_wp_attached_file', '2021/08/hormat.jpg'),
(218, 94, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1280;s:6:\"height\";i:720;s:4:\"file\";s:18:\"2021/08/hormat.jpg\";s:5:\"sizes\";a:12:{s:6:\"medium\";a:4:{s:4:\"file\";s:18:\"hormat-300x169.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:169;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:19:\"hormat-1024x576.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:576;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:18:\"hormat-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:18:\"hormat-768x432.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:432;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"img-1100-450\";a:4:{s:4:\"file\";s:19:\"hormat-1100x450.jpg\";s:5:\"width\";i:1100;s:6:\"height\";i:450;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"img-1120-800\";a:4:{s:4:\"file\";s:19:\"hormat-1120x720.jpg\";s:5:\"width\";i:1120;s:6:\"height\";i:720;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:11:\"img-870-440\";a:4:{s:4:\"file\";s:18:\"hormat-870x440.jpg\";s:5:\"width\";i:870;s:6:\"height\";i:440;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:11:\"img-850-600\";a:4:{s:4:\"file\";s:18:\"hormat-850x600.jpg\";s:5:\"width\";i:850;s:6:\"height\";i:600;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:11:\"img-480-380\";a:4:{s:4:\"file\";s:18:\"hormat-480x380.jpg\";s:5:\"width\";i:480;s:6:\"height\";i:380;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:11:\"img-300-225\";a:4:{s:4:\"file\";s:18:\"hormat-300x225.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:225;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"img-75-75\";a:4:{s:4:\"file\";s:16:\"hormat-75x75.jpg\";s:5:\"width\";i:75;s:6:\"height\";i:75;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:14:\"post-thumbnail\";a:4:{s:4:\"file\";s:18:\"hormat-340x240.jpg\";s:5:\"width\";i:340;s:6:\"height\";i:240;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(219, 75, '_thumbnail_id', '91'),
(220, 75, 'status_dates_start', ''),
(221, 75, 'status_dates_end', ''),
(222, 75, 'curriculum', 'Subtema 1,76,77,78,79,80,81,Subtema 2,82,83,84,85,86,87'),
(223, 75, 'featured', ''),
(224, 75, 'views', '1'),
(225, 75, 'level', 'kelas1'),
(226, 75, 'current_students', ''),
(227, 75, 'duration_info', ''),
(228, 75, 'video_duration', ''),
(229, 75, 'status', 'new'),
(230, 75, 'status_dates', ''),
(231, 75, 'not_single_sale', ''),
(232, 75, 'price', ''),
(233, 75, 'sale_price', ''),
(234, 75, 'sale_price_dates', ''),
(235, 75, 'enterprise_price', ''),
(236, 75, 'not_membership', ''),
(237, 75, 'affiliate_course', ''),
(238, 75, 'affiliate_course_text', ''),
(239, 75, 'affiliate_course_link', ''),
(240, 75, 'expiration_course', 'on'),
(241, 75, 'end_time', '30'),
(242, 75, 'drip_content', ''),
(243, 75, 'prerequisites', ''),
(244, 75, 'prerequisite_passing_level', ''),
(245, 75, 'announcement', ''),
(246, 75, 'faq', '[{\"question\":\"Siapa yang boleh ikut kursus ini?\",\"answer\":\"Siapa saja\"},{\"question\":\"Apa syarat mengikuti kursus ini?\",\"answer\":\"Bebas tanpa bayar\"}]'),
(247, 75, 'course_files_pack', ''),
(248, 75, 'course_certificate', ''),
(249, 75, 'type', ''),
(250, 75, 'duration', ''),
(251, 75, 'preview', ''),
(252, 75, 'lesson_excerpt', ''),
(253, 75, 'lesson_video_poster', ''),
(254, 75, 'lesson_video_url', ''),
(255, 75, 'lesson_video', ''),
(256, 75, 'lesson_video_width', ''),
(257, 75, 'lesson_files_pack', ''),
(258, 75, 'questions', ''),
(259, 75, 'quiz_style', ''),
(260, 75, 'duration_measure', ''),
(261, 75, 'correct_answer', ''),
(262, 75, 'passing_grade', ''),
(263, 75, 're_take_cut', ''),
(264, 75, 'random_questions', ''),
(265, 75, 'answers', ''),
(266, 75, 'question_explanation', ''),
(267, 75, 'review_course', ''),
(268, 75, 'review_user', ''),
(269, 75, 'review_mark', ''),
(270, 75, 'order', '');

-- --------------------------------------------------------

--
-- Table structure for table `sd_posts`
--

DROP TABLE IF EXISTS `sd_posts`;
CREATE TABLE IF NOT EXISTS `sd_posts` (
  `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=MyISAM AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `sd_posts`
--

INSERT INTO `sd_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2021-08-09 15:11:33', '2021-08-09 15:11:33', '<!-- wp:paragraph -->\n<p>Selamt datang di WordPress. Ini adalah pos pertama Anda. Sunting atau hapus, kemudian mulai menulis!</p>\n<!-- /wp:paragraph -->', 'Halo dunia!', '', 'publish', 'open', 'open', '', 'halo-dunia', '', '', '2021-08-09 15:16:12', '2021-08-09 15:16:12', '', 0, 'http://localhost/sd-sinau.sch.id/?p=1', 0, 'post', '', 1),
(2, 1, '2021-08-09 15:11:33', '2021-08-09 15:11:33', '<!-- wp:paragraph -->\n<p>Ini adalah laman contoh. Laman ini berbeda dari artikel blog karena akan tetap di satu tempat dan akan muncul di navigasi situs Anda (di sebagian besar tema). Kebanyakan orang memulai dengan laman \"Tentang\" yang bertujuan untuk mengenalkan mereka kepada pengunjung potensial situs. Biasanya berisi seperti ini:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>Hai yang disana! Saya seorang kurir bersepeda di siang hari, di malam hari bermimpi menjadi seorang aktor, dan ini adalah situs web saya. Saya tinggal di Los Angeles, punya anjing besar bernama Jack, dan saya suka pi&#241;a minuman Colada. (Dan terjebak dalam hujan.)</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>...atau seperti ini:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>Perusahaan Doohickey XYZ didirikan pada tahun 1971, dan telah menyediakan doohickey berkualitas untuk masyarakat umum sejak saat itu. Terletak di Kota Gotham, XYZ mempekerjakan lebih dari 2.000 orang dan melakukan segala macam hal luar biasa untuk komunitas Gotham.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>Sebagai pengguna baru WordPress, Anda harus membuka <a href=\"http://localhost/sd-sinau.sch.id/wp-admin/\">dasbor Anda</a> untuk menghapus laman ini dan membuat laman-laman baru untuk konten Anda. Have fun!</p>\n<!-- /wp:paragraph -->', 'Laman Contoh', '', 'publish', 'closed', 'open', '', 'laman-contoh', '', '', '2021-08-09 15:11:33', '2021-08-09 15:11:33', '', 0, 'http://localhost/sd-sinau.sch.id/?page_id=2', 0, 'page', '', 0),
(3, 1, '2021-08-09 15:11:33', '2021-08-09 15:11:33', '<!-- wp:heading --><h2>Siapa kami</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Teks yang disarankan: </strong>Alamat situs web kami adalah: http://localhost/sd-sinau.sch.id.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Komentar</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Teks yang disarankan: </strong>Saat pengunjung meninggalkan komentar pada situs, kita mengumpulkan data yang ditampilkan pada form komentar, alamat IP pengunjung dan user agent browser untuk membantu pendeteksian spam.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>String anonim yang dibuat dari alamat email Anda (juga disebut hash) dapat diberikan ke layanan Gravatar untuk melihat apakah Anda menggunakannya. Kebijakan privasi layanan Gravatar tersedia di sini: https://automattic.com/privacy/. Setelah persetujuan atas komentar Anda, gambar profil Anda dapat dilihat oleh publik dalam konteks komentar Anda.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Media</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Teks yang disarankan: </strong>Jika Anda mengunggah gambar ke situs web, Anda harus menghindari mengunggah gambar dengan data lokasi tertanam (GPS EXIF) yang disertakan. Pengunjung ke situs web dapat mengunduh dan mengekstrak data lokasi apa pun dari gambar di situs web.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Cookies</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Teks yang disarankan: </strong>Jika Anda meninggalkan komentar di situs kami, Anda dapat memilih untuk menyimpan nama, alamat email, dan situs web Anda dalam cookie. Ini untuk kenyamanan Anda sehingga Anda tidak perlu mengisi detail Anda lagi ketika Anda meninggalkan komentar lain. Cookie ini akan bertahan selama satu tahun.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Jika Anda mengunjungi laman login kami, kami akan memasang cookie sementara untuk memastikan apakah browser Anda menerima cookie. Cookie ini tidak mengandung data pribadi dan dibuang ketika Anda menutup browser Anda.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Saat Anda log masuk, kami akan menyiapkan beberapa cookie untuk menyimpan informasi log masuk Anda dan tampilan yang Anda pilih. Cookie log masuk berlaku selama dua hari, dan cookie pengaturan tampilan berlaku selama satu tahun. Jika Anda memilih &quot;Ingatkan Saya&quot;, log masuk anda akan bertahan selama dua minggu. Jika Anda log keluar dari akun, cookie log masuk akan dihapus.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Jika Anda menyunting atau menerbitkan artikel, cookie tambahan akan disimpan di browser Anda. Cookie ini tidak menyertakan data pribadi dan hanya menunjukkan ID posting dari artikel yang baru saja Anda sunting. Kadaluwarsa setelah 1 hari.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Konten yang disematkan dari situs web lain</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Teks yang disarankan: </strong>Artikel-artikel di dalam situs ini dapat menyertakan konten terembed (seperti video, gambar, artikel, dll). Konten terembed dari situs web lain akan berlaku sama dengan pengunjung yang mengunjungi situs web lain.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Situs-situs web ini dapat mengumpulkan data tentang Anda, menggunakan cookies, menanamkan pelacak dari pihak ketiga, dan memonitor interaksi Anda dengan muatan tertanam, termasuk menggunakannya untuk melacak interaksi Anda jika Anda memiliki sebuah akun dan masuk ke dalam situs web tersebut.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Dengan siapa kami membagi data Anda</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Teks yang disarankan: </strong>Jika Anda meminta pengaturan ulang kata sandi, alamat IP Anda akan dimasukkan dalam email pengaturan ulang.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Berapa lama kami menyimpan data Anda</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Teks yang disarankan: </strong>Jika Anda meninggalkan komentar, komentar dan metadatanya dipertahankan tanpa batas. Ini agar kami dapat mengenali dan menyetujui komentar tindak lanjut secara otomatis dan tidak menahannya dalam antrean moderasi.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Untuk pengguna yang mendaftar pada website kami (jika ada), kami juga menyimpan informasi pribadi yang mereka berikan dalam profil pengguna mereka. Semua pengguna dapat melihat, mengedit, atau menghapus informasi pribadi mereka kapan saja (kecuali mereka tidak dapat mengubah nama pengguna mereka). Administrator situs juga dapat melihat dan mengedit informasi tersebut.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Hak apa yang Anda miliki atas data ANda</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Teks yang disarankan: </strong>Jika anda mempunyai akun di situs ini, atau telah meninggalkan komentar, anda dapat meminta untuk mendapat data personal dalam file export dari kami, termasuk data yang anda berikan kepada kami. Anda juga dapat meminta kami menghapus data personal mengenai anda. Ini tidak termasuk data yang wajib kami simpan untuk keperluan administratif, hukum, atau keamanan.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Ke mana kami kirim data Anda</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Teks yang disarankan: </strong>Komentar pengunjung dapat diperiksa melalui layanan deteksi spam otomatis.</p><!-- /wp:paragraph -->', 'Kebijakan Privasi', '', 'publish', 'closed', 'open', '', 'kebijakan-privasi', '', '', '2021-08-09 15:11:33', '2021-08-09 15:11:33', '', 0, 'http://localhost/sd-sinau.sch.id/?page_id=3', 0, 'page', '', 0),
(6, 1, '2021-08-09 15:28:33', '2021-08-09 15:28:33', '', 'Home', '', 'publish', 'closed', 'closed', '', 'home', '', '', '2021-08-09 15:28:33', '2021-08-09 15:28:33', '', 0, 'http://localhost/sd-sinau.sch.id/?page_id=6', 0, 'page', '', 0),
(7, 1, '2021-08-09 15:28:33', '2021-08-09 15:28:33', '', 'Blog', '', 'publish', 'closed', 'closed', '', 'blog', '', '', '2021-08-09 15:28:33', '2021-08-09 15:28:33', '', 0, 'http://localhost/sd-sinau.sch.id/?page_id=7', 0, 'page', '', 0),
(8, 1, '2021-08-09 15:28:33', '2021-08-09 15:28:33', '', 'Profil', '', 'publish', 'closed', 'closed', '', 'profil', '', '', '2021-08-09 15:28:33', '2021-08-09 15:28:33', '', 0, 'http://localhost/sd-sinau.sch.id/?page_id=8', 0, 'page', '', 0),
(9, 1, '2021-08-09 15:28:33', '2021-08-09 15:28:33', '', 'Panduan', '', 'publish', 'closed', 'closed', '', 'panduan', '', '', '2021-08-09 15:28:33', '2021-08-09 15:28:33', '', 0, 'http://localhost/sd-sinau.sch.id/?page_id=9', 0, 'page', '', 0),
(10, 1, '2021-08-09 15:28:33', '2021-08-09 15:28:33', '', 'Kontak', '', 'publish', 'closed', 'closed', '', 'kontak', '', '', '2021-08-09 15:28:33', '2021-08-09 15:28:33', '', 0, 'http://localhost/sd-sinau.sch.id/?page_id=10', 0, 'page', '', 0),
(17, 1, '2021-08-09 15:30:17', '2021-08-09 15:30:17', '', 'User Account', '', 'publish', 'closed', 'closed', '', 'user-account', '', '', '2021-08-09 17:05:36', '2021-08-09 17:05:36', '', 0, 'http://localhost/sd-sinau.sch.id/?page_id=17', 0, 'page', '', 0),
(18, 1, '2021-08-09 15:30:18', '2021-08-09 15:30:18', '', 'User Public Account', '', 'publish', 'closed', 'closed', '', 'user-public-account', '', '', '2021-08-09 17:05:36', '2021-08-09 17:05:36', '', 0, 'http://localhost/sd-sinau.sch.id/?page_id=18', 0, 'page', '', 0),
(19, 1, '2021-08-09 15:30:18', '2021-08-09 15:30:18', '', 'Wishlist', '', 'publish', 'closed', 'closed', '', 'wishlist', '', '', '2021-08-09 17:05:36', '2021-08-09 17:05:36', '', 0, 'http://localhost/sd-sinau.sch.id/?page_id=19', 0, 'page', '', 0),
(20, 1, '2021-08-09 15:30:18', '2021-08-09 15:30:18', '', 'Checkout', '', 'publish', 'closed', 'closed', '', 'checkout', '', '', '2021-08-09 17:05:36', '2021-08-09 17:05:36', '', 0, 'http://localhost/sd-sinau.sch.id/?page_id=20', 0, 'page', '', 0),
(21, 1, '2021-08-09 15:30:28', '2021-08-09 15:30:28', '', 'Courses', '', 'publish', 'closed', 'closed', '', 'courses', '', '', '2021-08-09 17:15:40', '2021-08-09 17:15:40', '', 0, 'http://localhost/sd-sinau.sch.id/?page_id=21', 0, 'page', '', 0),
(24, 1, '2021-08-09 16:15:49', '2021-08-09 16:15:49', ' ', '', '', 'publish', 'closed', 'closed', '', '24', '', '', '2021-08-09 16:15:49', '2021-08-09 16:15:49', '', 0, 'http://localhost/sd-sinau.sch.id/?p=24', 1, 'nav_menu_item', '', 0),
(25, 1, '2021-08-09 16:15:49', '2021-08-09 16:15:49', ' ', '', '', 'publish', 'closed', 'closed', '', '25', '', '', '2021-08-09 16:15:49', '2021-08-09 16:15:49', '', 0, 'http://localhost/sd-sinau.sch.id/?p=25', 2, 'nav_menu_item', '', 0),
(26, 1, '2021-08-09 16:15:49', '2021-08-09 16:15:49', ' ', '', '', 'publish', 'closed', 'closed', '', '26', '', '', '2021-08-09 16:15:49', '2021-08-09 16:15:49', '', 0, 'http://localhost/sd-sinau.sch.id/?p=26', 5, 'nav_menu_item', '', 0),
(27, 1, '2021-08-09 16:15:49', '2021-08-09 16:15:49', ' ', '', '', 'publish', 'closed', 'closed', '', '27', '', '', '2021-08-09 16:15:49', '2021-08-09 16:15:49', '', 0, 'http://localhost/sd-sinau.sch.id/?p=27', 3, 'nav_menu_item', '', 0),
(28, 1, '2021-08-09 16:15:49', '2021-08-09 16:15:49', ' ', '', '', 'publish', 'closed', 'closed', '', '28', '', '', '2021-08-09 16:15:49', '2021-08-09 16:15:49', '', 0, 'http://localhost/sd-sinau.sch.id/?p=28', 4, 'nav_menu_item', '', 0),
(29, 1, '2021-08-09 16:18:31', '2021-08-09 16:18:31', '<!-- wp:gutentor/blog-post {\"blockID\":\"4066e0ba-6a90-495c-bd34-2997f2d83b55\",\"gutentorBlockName\":\"gutentor/blog-post\",\"blockBlogStyle\":\"blog-list\",\"postsToShow\":4,\"enablePostImage\":false,\"enablePostCategory\":false,\"excerptLength\":\"50\",\"blockComponentTitleEnable\":false,\"entryMetaColor\":{\"enable\":true,\"normal\":{\"hex\":\"#ffffff\",\"rgb\":{\"r\":255,\"g\":255,\"b\":255,\"a\":1}},\"hover\":{\"hex\":\"#fcb900\",\"rgb\":{\"r\":252,\"g\":185,\"b\":0,\"a\":1}}},\"blockSingleItemBoxColor\":{\"enable\":false,\"normal\":\"\",\"hover\":\"\"},\"blockSingleItemDescriptionColor\":{\"enable\":true,\"normal\":{\"hex\":\"#ffffff\",\"rgb\":{\"r\":255,\"g\":255,\"b\":255,\"a\":1}},\"hover\":{\"hex\":\"#fcb900\",\"rgb\":{\"r\":252,\"g\":185,\"b\":0,\"a\":1}}},\"blockSingleItemTitleColor\":{\"enable\":true,\"normal\":{\"hex\":\"#ffffff\",\"rgb\":{\"r\":255,\"g\":255,\"b\":255,\"a\":1}},\"hover\":{\"hex\":\"#fcb900\",\"rgb\":{\"r\":252,\"g\":185,\"b\":0,\"a\":1}}}} /-->', 'Bawah', '', 'publish', 'closed', 'closed', '', 'bawah', '', '', '2021-08-09 17:01:58', '2021-08-09 17:01:58', '', 0, 'http://localhost/sd-sinau.sch.id/?p=29', 0, 'wp_block', '', 0),
(62, 1, '2021-08-09 16:58:25', '2021-08-09 16:58:25', '<!-- wp:paragraph -->\n<p>Artikel Pendidikan Indonesia Artikel Pendidikan Indonesia Artikel Pendidikan Indonesia Artikel Pendidikan Indonesia Artikel Pendidikan Indonesia Artikel Pendidikan Indonesia Artikel Pendidikan Indonesia Artikel Pendidikan Indonesia</p>\n<!-- /wp:paragraph -->', 'Artikel Pendidikan Indonesia', '', 'publish', 'open', 'open', '', 'artikel-pendidikan-indonesia', '', '', '2021-08-09 16:58:27', '2021-08-09 16:58:27', '', 0, 'http://localhost/sd-sinau.sch.id/?p=62', 0, 'post', '', 0),
(75, 1, '2021-08-09 17:30:48', '2021-08-09 17:30:48', 'Deskripsi kursus', 'Tematik', '', 'publish', 'closed', 'closed', '', 'tematik', '', '', '2021-08-09 17:30:48', '2021-08-09 17:30:48', '', 0, 'http://localhost/sd-sinau.sch.id/?post_type=stm-courses&#038;p=75', 0, 'stm-courses', '', 0),
(76, 1, '2021-08-09 17:24:12', '2021-08-09 17:24:12', '', 'Subtema 1 Pelajaran 1', '', 'publish', 'open', 'closed', '', 'subtema-1-pelajaran-1', '', '', '2021-08-09 17:24:12', '2021-08-09 17:24:12', '', 0, 'http://localhost/sd-sinau.sch.id/?stm-lessons=subtema-1-pelajaran-1', 0, 'stm-lessons', '', 0),
(77, 1, '2021-08-09 17:24:16', '2021-08-09 17:24:16', '', 'Subtema 1 Pelajaran 2', '', 'publish', 'open', 'closed', '', 'subtema-1-pelajaran-2', '', '', '2021-08-09 17:24:16', '2021-08-09 17:24:16', '', 0, 'http://localhost/sd-sinau.sch.id/?stm-lessons=subtema-1-pelajaran-2', 0, 'stm-lessons', '', 0),
(78, 1, '2021-08-09 17:24:20', '2021-08-09 17:24:20', '', 'Subtema 1 Pelajaran 3', '', 'publish', 'open', 'closed', '', 'subtema-1-pelajaran-3', '', '', '2021-08-09 17:24:20', '2021-08-09 17:24:20', '', 0, 'http://localhost/sd-sinau.sch.id/?stm-lessons=subtema-1-pelajaran-3', 0, 'stm-lessons', '', 0),
(79, 1, '2021-08-09 17:24:23', '2021-08-09 17:24:23', '', 'Subtema 1 Pelajaran 4', '', 'publish', 'open', 'closed', '', 'subtema-1-pelajaran-4', '', '', '2021-08-09 17:24:23', '2021-08-09 17:24:23', '', 0, 'http://localhost/sd-sinau.sch.id/?stm-lessons=subtema-1-pelajaran-4', 0, 'stm-lessons', '', 0),
(80, 1, '2021-08-09 17:24:27', '2021-08-09 17:24:27', '', 'Subtema 1 Pelajaran 5', '', 'publish', 'open', 'closed', '', 'subtema-1-pelajaran-5', '', '', '2021-08-09 17:24:27', '2021-08-09 17:24:27', '', 0, 'http://localhost/sd-sinau.sch.id/?stm-lessons=subtema-1-pelajaran-5', 0, 'stm-lessons', '', 0),
(81, 1, '2021-08-09 17:24:31', '2021-08-09 17:24:31', '', 'Subtema 1 Pelajaran 6', '', 'publish', 'open', 'closed', '', 'subtema-1-pelajaran-6', '', '', '2021-08-09 17:24:31', '2021-08-09 17:24:31', '', 0, 'http://localhost/sd-sinau.sch.id/?stm-lessons=subtema-1-pelajaran-6', 0, 'stm-lessons', '', 0),
(82, 1, '2021-08-09 17:25:11', '2021-08-09 17:25:11', '', 'Subtema 2 Pelajaran 1', '', 'publish', 'open', 'closed', '', 'subtema-2-pelajaran-1', '', '', '2021-08-09 17:25:11', '2021-08-09 17:25:11', '', 0, 'http://localhost/sd-sinau.sch.id/?stm-lessons=subtema-2-pelajaran-1', 0, 'stm-lessons', '', 0),
(83, 1, '2021-08-09 17:25:15', '2021-08-09 17:25:15', '', 'Subtema 2 Pelajaran 2', '', 'publish', 'open', 'closed', '', 'subtema-2-pelajaran-2', '', '', '2021-08-09 17:25:15', '2021-08-09 17:25:15', '', 0, 'http://localhost/sd-sinau.sch.id/?stm-lessons=subtema-2-pelajaran-2', 0, 'stm-lessons', '', 0),
(84, 1, '2021-08-09 17:25:19', '2021-08-09 17:25:19', '', 'Subtema 2 Pelajaran 3', '', 'publish', 'open', 'closed', '', 'subtema-2-pelajaran-3', '', '', '2021-08-09 17:25:19', '2021-08-09 17:25:19', '', 0, 'http://localhost/sd-sinau.sch.id/?stm-lessons=subtema-2-pelajaran-3', 0, 'stm-lessons', '', 0),
(85, 1, '2021-08-09 17:25:25', '2021-08-09 17:25:25', '', 'Subtema 2 Pelajaran 4', '', 'publish', 'open', 'closed', '', 'subtema-2-pelajaran-4', '', '', '2021-08-09 17:25:25', '2021-08-09 17:25:25', '', 0, 'http://localhost/sd-sinau.sch.id/?stm-lessons=subtema-2-pelajaran-4', 0, 'stm-lessons', '', 0),
(86, 1, '2021-08-09 17:25:29', '2021-08-09 17:25:29', '', 'Subtema 2 Pelajaran', '', 'publish', 'open', 'closed', '', 'subtema-2-pelajaran', '', '', '2021-08-09 17:25:29', '2021-08-09 17:25:29', '', 0, 'http://localhost/sd-sinau.sch.id/?stm-lessons=subtema-2-pelajaran', 0, 'stm-lessons', '', 0),
(87, 1, '2021-08-09 17:25:35', '2021-08-09 17:25:35', '', 'Subtema 2 Pelajaran 6', '', 'publish', 'open', 'closed', '', 'subtema-2-pelajaran-6', '', '', '2021-08-09 17:25:35', '2021-08-09 17:25:35', '', 0, 'http://localhost/sd-sinau.sch.id/?stm-lessons=subtema-2-pelajaran-6', 0, 'stm-lessons', '', 0),
(88, 1, '2021-08-09 17:28:46', '2021-08-09 17:28:46', '', 'ibu-guru-250x333px', '', 'inherit', 'open', 'closed', '', 'ibu-guru-250x333px', '', '', '2021-08-09 17:28:46', '2021-08-09 17:28:46', '', 75, 'http://localhost/sd-sinau.sch.id/wp-content/uploads/2021/08/ibu-guru-250x333px.jpg', 0, 'attachment', 'image/jpeg', 0),
(89, 1, '2021-08-09 17:28:54', '2021-08-09 17:28:54', '', 'bu-guru-250x333px', '', 'inherit', 'open', 'closed', '', 'bu-guru-250x333px', '', '', '2021-08-09 17:28:54', '2021-08-09 17:28:54', '', 75, 'http://localhost/sd-sinau.sch.id/wp-content/uploads/2021/08/bu-guru-250x333px.jpg', 0, 'attachment', 'image/jpeg', 0),
(90, 1, '2021-08-09 17:29:05', '2021-08-09 17:29:05', '', 'pak-guru-250x333px', '', 'inherit', 'open', 'closed', '', 'pak-guru-250x333px', '', '', '2021-08-09 17:29:05', '2021-08-09 17:29:05', '', 75, 'http://localhost/sd-sinau.sch.id/wp-content/uploads/2021/08/pak-guru-250x333px.jpg', 0, 'attachment', 'image/jpeg', 0),
(91, 1, '2021-08-09 17:30:32', '2021-08-09 17:30:32', '', 'box1', '', 'inherit', 'open', 'closed', '', 'box1', '', '', '2021-08-09 17:30:32', '2021-08-09 17:30:32', '', 75, 'http://localhost/sd-sinau.sch.id/wp-content/uploads/2021/08/box1.jpg', 0, 'attachment', 'image/jpeg', 0),
(92, 1, '2021-08-09 17:30:33', '2021-08-09 17:30:33', '', 'box2', '', 'inherit', 'open', 'closed', '', 'box2', '', '', '2021-08-09 17:30:33', '2021-08-09 17:30:33', '', 75, 'http://localhost/sd-sinau.sch.id/wp-content/uploads/2021/08/box2.jpg', 0, 'attachment', 'image/jpeg', 0),
(93, 1, '2021-08-09 17:30:34', '2021-08-09 17:30:34', '', 'box3', '', 'inherit', 'open', 'closed', '', 'box3', '', '', '2021-08-09 17:30:34', '2021-08-09 17:30:34', '', 75, 'http://localhost/sd-sinau.sch.id/wp-content/uploads/2021/08/box3.jpg', 0, 'attachment', 'image/jpeg', 0),
(94, 1, '2021-08-09 17:30:35', '2021-08-09 17:30:35', '', 'hormat', '', 'inherit', 'open', 'closed', '', 'hormat', '', '', '2021-08-09 17:30:35', '2021-08-09 17:30:35', '', 75, 'http://localhost/sd-sinau.sch.id/wp-content/uploads/2021/08/hormat.jpg', 0, 'attachment', 'image/jpeg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sd_stm_lms_curriculum_bind`
--

DROP TABLE IF EXISTS `sd_stm_lms_curriculum_bind`;
CREATE TABLE IF NOT EXISTS `sd_stm_lms_curriculum_bind` (
  `bind_id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `item_id` mediumint(9) NOT NULL,
  `course_id` bigint(20) NOT NULL,
  `item_type` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `date` int(11) NOT NULL,
  PRIMARY KEY (`bind_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `sd_stm_lms_curriculum_bind`
--

INSERT INTO `sd_stm_lms_curriculum_bind` (`bind_id`, `item_id`, `course_id`, `item_type`, `date`) VALUES
(1, 76, 75, 'stm-lessons', 1628530249),
(2, 77, 75, 'stm-lessons', 1628530249),
(3, 78, 75, 'stm-lessons', 1628530249),
(4, 79, 75, 'stm-lessons', 1628530249),
(5, 80, 75, 'stm-lessons', 1628530249),
(6, 81, 75, 'stm-lessons', 1628530249),
(7, 82, 75, 'stm-lessons', 1628530249),
(8, 83, 75, 'stm-lessons', 1628530249),
(9, 84, 75, 'stm-lessons', 1628530249),
(10, 85, 75, 'stm-lessons', 1628530249),
(11, 86, 75, 'stm-lessons', 1628530249),
(12, 87, 75, 'stm-lessons', 1628530249);

-- --------------------------------------------------------

--
-- Table structure for table `sd_stm_lms_curriculum_log`
--

DROP TABLE IF EXISTS `sd_stm_lms_curriculum_log`;
CREATE TABLE IF NOT EXISTS `sd_stm_lms_curriculum_log` (
  `log_id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `course_id` bigint(20) NOT NULL,
  `item_id` mediumint(9) NOT NULL,
  `item_type` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `item_title` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `old_title` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `item_action` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `date` int(11) NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `sd_stm_lms_curriculum_log`
--

INSERT INTO `sd_stm_lms_curriculum_log` (`log_id`, `course_id`, `item_id`, `item_type`, `item_title`, `old_title`, `item_action`, `date`) VALUES
(1, 75, 76, 'stm-lessons', 'Subtema 1 Pelajaran 1', '', 'added', 1628530249),
(2, 75, 77, 'stm-lessons', 'Subtema 1 Pelajaran 2', '', 'added', 1628530249),
(3, 75, 78, 'stm-lessons', 'Subtema 1 Pelajaran 3', '', 'added', 1628530249),
(4, 75, 79, 'stm-lessons', 'Subtema 1 Pelajaran 4', '', 'added', 1628530249),
(5, 75, 80, 'stm-lessons', 'Subtema 1 Pelajaran 5', '', 'added', 1628530249),
(6, 75, 81, 'stm-lessons', 'Subtema 1 Pelajaran 6', '', 'added', 1628530249),
(7, 75, 82, 'stm-lessons', 'Subtema 2 Pelajaran 1', '', 'added', 1628530249),
(8, 75, 83, 'stm-lessons', 'Subtema 2 Pelajaran 2', '', 'added', 1628530249),
(9, 75, 84, 'stm-lessons', 'Subtema 2 Pelajaran 3', '', 'added', 1628530249),
(10, 75, 85, 'stm-lessons', 'Subtema 2 Pelajaran 4', '', 'added', 1628530249),
(11, 75, 86, 'stm-lessons', 'Subtema 2 Pelajaran', '', 'added', 1628530249),
(12, 75, 87, 'stm-lessons', 'Subtema 2 Pelajaran 6', '', 'added', 1628530249);

-- --------------------------------------------------------

--
-- Table structure for table `sd_stm_lms_order_items`
--

DROP TABLE IF EXISTS `sd_stm_lms_order_items`;
CREATE TABLE IF NOT EXISTS `sd_stm_lms_order_items` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `object_id` bigint(20) UNSIGNED NOT NULL,
  `payout_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` float(24,2) DEFAULT NULL,
  `transaction` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sd_stm_lms_order_items_order_id_index` (`order_id`),
  KEY `sd_stm_lms_order_items_object_id_index` (`object_id`),
  KEY `sd_stm_lms_order_items_payout_id_index` (`payout_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_stm_lms_user_answers`
--

DROP TABLE IF EXISTS `sd_stm_lms_user_answers`;
CREATE TABLE IF NOT EXISTS `sd_stm_lms_user_answers` (
  `user_answer_id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `course_id` mediumint(9) NOT NULL,
  `quiz_id` mediumint(9) NOT NULL,
  `question_id` mediumint(9) NOT NULL,
  `user_answer` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `correct_answer` tinyint(1) NOT NULL,
  `attempt_number` mediumint(9) NOT NULL,
  PRIMARY KEY (`user_answer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_stm_lms_user_cart`
--

DROP TABLE IF EXISTS `sd_stm_lms_user_cart`;
CREATE TABLE IF NOT EXISTS `sd_stm_lms_user_cart` (
  `user_cart_id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `item_id` mediumint(9) NOT NULL,
  `quantity` mediumint(9) NOT NULL,
  `price` float NOT NULL,
  `enterprise` float DEFAULT '0',
  `bundle` float DEFAULT '0',
  PRIMARY KEY (`user_cart_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_stm_lms_user_chat`
--

DROP TABLE IF EXISTS `sd_stm_lms_user_chat`;
CREATE TABLE IF NOT EXISTS `sd_stm_lms_user_chat` (
  `message_id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `user_to` bigint(20) NOT NULL,
  `user_from` bigint(20) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `message` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `status` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `conversation_id` int(11) NOT NULL,
  PRIMARY KEY (`message_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_stm_lms_user_conversation`
--

DROP TABLE IF EXISTS `sd_stm_lms_user_conversation`;
CREATE TABLE IF NOT EXISTS `sd_stm_lms_user_conversation` (
  `conversation_id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `user_to` mediumint(9) NOT NULL,
  `user_from` mediumint(9) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `messages_number` int(11) NOT NULL,
  `ut_new_messages` int(11) NOT NULL,
  `uf_new_messages` int(11) NOT NULL,
  PRIMARY KEY (`conversation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_stm_lms_user_courses`
--

DROP TABLE IF EXISTS `sd_stm_lms_user_courses`;
CREATE TABLE IF NOT EXISTS `sd_stm_lms_user_courses` (
  `user_course_id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `course_id` mediumint(9) NOT NULL,
  `current_lesson_id` mediumint(9) DEFAULT NULL,
  `progress_percent` mediumint(9) NOT NULL,
  `status` varchar(45) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `lng_code` varchar(45) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'id_ID',
  `subscription_id` mediumint(9) DEFAULT NULL,
  `enterprise_id` float DEFAULT '0',
  `instructor_id` float DEFAULT '0',
  `bundle_id` float DEFAULT '0',
  `start_time` int(11) NOT NULL,
  `end_time` int(11) DEFAULT '0',
  PRIMARY KEY (`user_course_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `sd_stm_lms_user_courses`
--

INSERT INTO `sd_stm_lms_user_courses` (`user_course_id`, `user_id`, `course_id`, `current_lesson_id`, `progress_percent`, `status`, `lng_code`, `subscription_id`, `enterprise_id`, `instructor_id`, `bundle_id`, `start_time`, `end_time`) VALUES
(1, 1, 75, 0, 0, 'enrolled', 'id_ID', NULL, 0, 0, 0, 1628530261, 1631122262);

-- --------------------------------------------------------

--
-- Table structure for table `sd_stm_lms_user_lessons`
--

DROP TABLE IF EXISTS `sd_stm_lms_user_lessons`;
CREATE TABLE IF NOT EXISTS `sd_stm_lms_user_lessons` (
  `user_lesson_id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `course_id` mediumint(9) NOT NULL,
  `lesson_id` mediumint(9) NOT NULL,
  `start_time` int(11) DEFAULT NULL,
  `end_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_lesson_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_stm_lms_user_quizzes`
--

DROP TABLE IF EXISTS `sd_stm_lms_user_quizzes`;
CREATE TABLE IF NOT EXISTS `sd_stm_lms_user_quizzes` (
  `user_quiz_id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `course_id` mediumint(9) NOT NULL,
  `quiz_id` mediumint(9) NOT NULL,
  `progress` mediumint(9) NOT NULL,
  `status` varchar(45) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `sequency` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`user_quiz_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_stm_lms_user_quizzes_times`
--

DROP TABLE IF EXISTS `sd_stm_lms_user_quizzes_times`;
CREATE TABLE IF NOT EXISTS `sd_stm_lms_user_quizzes_times` (
  `user_quiz_time_id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `quiz_id` mediumint(9) NOT NULL,
  `start_time` int(11) NOT NULL,
  `end_time` int(11) NOT NULL,
  PRIMARY KEY (`user_quiz_time_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_stm_lms_user_searches`
--

DROP TABLE IF EXISTS `sd_stm_lms_user_searches`;
CREATE TABLE IF NOT EXISTS `sd_stm_lms_user_searches` (
  `user_search_id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `search` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`user_search_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_stm_lms_user_searches_stats`
--

DROP TABLE IF EXISTS `sd_stm_lms_user_searches_stats`;
CREATE TABLE IF NOT EXISTS `sd_stm_lms_user_searches_stats` (
  `user_search_stat_id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `search` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `stat` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`user_search_stat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_termmeta`
--

DROP TABLE IF EXISTS `sd_termmeta`;
CREATE TABLE IF NOT EXISTS `sd_termmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_terms`
--

DROP TABLE IF EXISTS `sd_terms`;
CREATE TABLE IF NOT EXISTS `sd_terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `sd_terms`
--

INSERT INTO `sd_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Pengumuman', 'pengumuman', 0),
(2, 'Agenda', 'agenda', 0),
(3, 'Artikel', 'artikel', 0),
(4, 'Menu1', 'menu1', 0),
(5, 'Tematik', 'tematik', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sd_term_relationships`
--

DROP TABLE IF EXISTS `sd_term_relationships`;
CREATE TABLE IF NOT EXISTS `sd_term_relationships` (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `sd_term_relationships`
--

INSERT INTO `sd_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(1, 2, 0),
(1, 3, 0),
(24, 4, 0),
(25, 4, 0),
(27, 4, 0),
(28, 4, 0),
(26, 4, 0),
(62, 1, 0),
(75, 5, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sd_term_taxonomy`
--

DROP TABLE IF EXISTS `sd_term_taxonomy`;
CREATE TABLE IF NOT EXISTS `sd_term_taxonomy` (
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `sd_term_taxonomy`
--

INSERT INTO `sd_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 2),
(2, 2, 'category', '', 0, 1),
(3, 3, 'category', '', 0, 1),
(4, 4, 'nav_menu', '', 0, 5),
(5, 5, 'stm_lms_course_taxonomy', '', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sd_usermeta`
--

DROP TABLE IF EXISTS `sd_usermeta`;
CREATE TABLE IF NOT EXISTS `sd_usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `sd_usermeta`
--

INSERT INTO `sd_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'admin'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'false'),
(8, 1, 'admin_color', 'fresh'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'true'),
(11, 1, 'locale', ''),
(12, 1, 'sd_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),
(13, 1, 'sd_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', ''),
(15, 1, 'show_welcome_panel', '0'),
(54, 1, 'session_tokens', 'a:1:{s:64:\"141a02532d7f6dd7bc9f99324f9bd3d500fdc88f6aaad6a0417b50f0a45f240d\";a:4:{s:10:\"expiration\";i:1628702338;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36\";s:5:\"login\";i:1628529538;}}'),
(17, 1, 'sd_dashboard_quick_press_last_post_id', '4'),
(18, 1, 'managepluginscolumnshidden', 'a:2:{i:0;s:11:\"description\";i:1;s:12:\"auto-updates\";}'),
(19, 2, 'nickname', 'pendidik'),
(20, 2, 'first_name', 'Pendidik'),
(21, 2, 'last_name', 'SD'),
(22, 2, 'description', ''),
(23, 2, 'rich_editing', 'true'),
(24, 2, 'syntax_highlighting', 'true'),
(25, 2, 'comment_shortcuts', 'false'),
(26, 2, 'admin_color', 'fresh'),
(27, 2, 'use_ssl', '0'),
(28, 2, 'show_admin_bar_front', 'true'),
(29, 2, 'locale', ''),
(30, 2, 'sd_capabilities', 'a:1:{s:18:\"stm_lms_instructor\";b:1;}'),
(31, 2, 'sd_user_level', '0'),
(32, 2, 'dismissed_wp_pointers', ''),
(33, 3, 'nickname', 'pelajar'),
(34, 3, 'first_name', 'Pelajar'),
(35, 3, 'last_name', 'SD'),
(36, 3, 'description', ''),
(37, 3, 'rich_editing', 'true'),
(38, 3, 'syntax_highlighting', 'true'),
(39, 3, 'comment_shortcuts', 'false'),
(40, 3, 'admin_color', 'fresh'),
(41, 3, 'use_ssl', '0'),
(42, 3, 'show_admin_bar_front', 'true'),
(43, 3, 'locale', ''),
(44, 3, 'sd_capabilities', 'a:1:{s:10:\"subscriber\";b:1;}'),
(45, 3, 'sd_user_level', '0'),
(46, 3, 'dismissed_wp_pointers', ''),
(48, 2, 'sd_dashboard_quick_press_last_post_id', '23'),
(50, 1, 'closedpostboxes_dashboard', 'a:0:{}'),
(51, 1, 'metaboxhidden_dashboard', 'a:5:{i:0;s:21:\"dashboard_site_health\";i:1;s:28:\"pearl_dashboard_announcement\";i:2;s:20:\"pearl_dashboard_news\";i:3;s:21:\"dashboard_quick_press\";i:4;s:17:\"dashboard_primary\";}'),
(52, 1, 'managenav-menuscolumnshidden', 'a:5:{i:0;s:11:\"link-target\";i:1;s:11:\"css-classes\";i:2;s:3:\"xfn\";i:3;s:11:\"description\";i:4;s:15:\"title-attribute\";}'),
(53, 1, 'metaboxhidden_nav-menus', 'a:5:{i:0;s:25:\"add-post-type-stm-courses\";i:1;s:25:\"add-post-type-stm-lessons\";i:2;s:12:\"add-post_tag\";i:3;s:15:\"add-post_format\";i:4;s:27:\"add-stm_lms_course_taxonomy\";}'),
(55, 1, 'sd_user-settings', 'libraryContent=browse'),
(56, 1, 'sd_user-settings-time', '1628530246');

-- --------------------------------------------------------

--
-- Table structure for table `sd_users`
--

DROP TABLE IF EXISTS `sd_users`;
CREATE TABLE IF NOT EXISTS `sd_users` (
  `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `sd_users`
--

INSERT INTO `sd_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'admin', '$P$B.y7KJ/ktkwsB1y6FeoldxrDP7yOdz/', 'admin', 'admin@sinau.web.id', 'http://localhost/sd-sinau.sch.id', '2021-08-09 15:11:33', '', 0, 'admin'),
(2, 'pendidik', '$P$BlRBklLqydYIlUJfdZaCqK/kGow.sx/', 'pendidik', 'guru@sinau.web.id', '', '2021-08-09 15:37:59', '', 0, 'Pendidik SD'),
(3, 'pelajar', '35f6ce383ff9f7b1734d2f348b1f76b3', 'pelajar', 'pelajar@sinau.web.id', '', '2021-08-09 15:38:39', '', 0, 'Pelajar SD');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
