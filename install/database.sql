-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 28, 2024 at 12:26 PM
-- Server version: 8.0.30
-- PHP Version: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bloodlab`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `username`, `email_verified_at`, `image`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Super Admins', 'admin@site.com', 'admin', NULL, '6624ee96387ea1713696406.png', '$2y$12$vc.c.pNxefhOjFzLFNMEW.16i/h1vQCigtZeTLDY12QlIlS0KTWbm', NULL, NULL, '2024-04-21 04:46:46');

-- --------------------------------------------------------

--
-- Table structure for table `admin_notifications`
--

CREATE TABLE `admin_notifications` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `click_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_password_resets`
--

CREATE TABLE `admin_password_resets` (
  `id` bigint UNSIGNED NOT NULL,
  `email` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `advertisements`
--

CREATE TABLE `advertisements` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `click` int NOT NULL DEFAULT '0',
  `impression` int NOT NULL DEFAULT '0',
  `type` tinyint(1) DEFAULT '0' COMMENT 'Banner : 1, Script : 2',
  `size` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `script` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) DEFAULT '0' COMMENT 'Enable : 1, Disable : 2',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bloods`
--

CREATE TABLE `bloods` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0' COMMENT 'Enable : 1 Disable : 0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0' COMMENT 'Enable : 1, Disable : 0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `donors`
--

CREATE TABLE `donors` (
  `id` bigint UNSIGNED NOT NULL,
  `featured` tinyint(1) DEFAULT '0',
  `name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blood_id` int DEFAULT NULL,
  `city_id` int DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `religion` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profession` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_donate` int NOT NULL DEFAULT '0',
  `gender` tinyint DEFAULT '0' COMMENT 'Male : 1, Female : 2',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT 'Pending : 0, Approved : 1, Banned : 2',
  `birth_date` date DEFAULT NULL,
  `last_donate` date DEFAULT NULL,
  `socialMedia` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `extensions`
--

CREATE TABLE `extensions` (
  `id` bigint UNSIGNED NOT NULL,
  `act` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `script` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `shortcode` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'object',
  `support` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'help section',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=>enable, 2=>disable',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `extensions`
--

INSERT INTO `extensions` (`id`, `act`, `name`, `description`, `image`, `script`, `shortcode`, `support`, `status`, `created_at`, `updated_at`) VALUES
(1, 'tawk-chat', 'Tawk.to', 'Key location is shown bellow', 'tawky_big.png', '<script>\r\n                        var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();\r\n                        (function(){\r\n                        var s1=document.createElement(\"script\"),s0=document.getElementsByTagName(\"script\")[0];\r\n                        s1.async=true;\r\n                        s1.src=\"https://embed.tawk.to/{{app_key}}\";\r\n                        s1.charset=\"UTF-8\";\r\n                        s1.setAttribute(\"crossorigin\",\"*\");\r\n                        s0.parentNode.insertBefore(s1,s0);\r\n                        })();\r\n                    </script>', '{\"app_key\":{\"title\":\"App Key\",\"value\":\"------\"}}', 'twak.png', 0, '2019-10-18 11:16:05', '2024-05-16 06:23:02'),
(2, 'google-recaptcha2', 'Google Recaptcha 2', 'Key location is shown bellow', 'recaptcha3.png', '\n<script src=\"https://www.google.com/recaptcha/api.js\"></script>\n<div class=\"g-recaptcha\" data-sitekey=\"{{site_key}}\" data-callback=\"verifyCaptcha\"></div>\n<div id=\"g-recaptcha-error\"></div>', '{\"site_key\":{\"title\":\"Site Key\",\"value\":\"6LdPC88fAAAAADQlUf_DV6Hrvgm-pZuLJFSLDOWV\"},\"secret_key\":{\"title\":\"Secret Key\",\"value\":\"6LdPC88fAAAAAG5SVaRYDnV2NpCrptLg2XLYKRKB\"}}', 'recaptcha.png', 0, '2019-10-18 11:16:05', '2024-05-08 03:23:13'),
(3, 'custom-captcha', 'Custom Captcha', 'Just put any random string', 'customcaptcha.png', NULL, '{\"random_key\":{\"title\":\"Random String\",\"value\":\"SecureString\"}}', 'na', 0, '2019-10-18 11:16:05', '2022-10-12 17:02:43'),
(4, 'google-analytics', 'Google Analytics', 'Key location is shown bellow', 'google_analytics.png', '<script async src=\"https://www.googletagmanager.com/gtag/js?id={{measurement_id}}\"></script>\n                <script>\n                  window.dataLayer = window.dataLayer || [];\n                  function gtag(){dataLayer.push(arguments);}\n                  gtag(\"js\", new Date());\n                \n                  gtag(\"config\", \"{{measurement_id}}\");\n                </script>', '{\"measurement_id\":{\"title\":\"Measurement ID\",\"value\":\"------\"}}', 'ganalytics.png', 0, NULL, '2021-05-03 22:19:12'),
(5, 'fb-comment', 'Facebook Comment ', 'Key location is shown bellow', 'Facebook.png', '<div id=\"fb-root\"></div><script async defer crossorigin=\"anonymous\" src=\"https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v4.0&appId={{app_key}}&autoLogAppEvents=1\"></script>', '{\"app_key\":{\"title\":\"App Key\",\"value\":\"----\"}}', 'fb_com.png', 0, NULL, '2022-03-21 17:18:36');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `forms`
--

CREATE TABLE `forms` (
  `id` bigint UNSIGNED NOT NULL,
  `act` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `form_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `frontends`
--

CREATE TABLE `frontends` (
  `id` bigint UNSIGNED NOT NULL,
  `data_keys` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data_values` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `seo_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `tempname` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `frontends`
--

INSERT INTO `frontends` (`id`, `data_keys`, `data_values`, `seo_content`, `tempname`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'seo.data', '{\"seo_image\":\"1\",\"keywords\":[\"blood donation\",\"blood donors\",\"blood bank\",\"donate blood\",\"blood donation platform\",\"blood donation app\",\"find blood donors\",\"blood donation service\",\"blood donation drive\",\"blood donation events\",\"blood donation campaign\",\"volunteer blood donation\",\"save lives\",\"blood donation network\"],\"description\":\"BloodLab is a comprehensive blood donation platform connecting donors with those in need. Join our community to donate blood, find donors, and save lives. Together, we can make a difference.\",\"social_title\":\"Join BloodLab \\u2013 Save Lives by Donating Blood\",\"social_description\":\"BloodLab is your go-to platform for blood donation. Connect with donors, organize blood drives, and help save lives. Join us today and make a difference in your community.\",\"image\":\"66a6145f7f3e41722160223.png\"}', NULL, NULL, '', '2020-07-04 23:42:52', '2024-07-28 03:51:55'),
(24, 'about.content', '{\"has_image\":\"1\",\"heading\":\"Why BloodLab\",\"sub_heading\":\"Omnis harum qui vel repudiandae officiis nemo perferendis libero soluta consequuntur culpa, laborum facere, fugiat totam ratione.\",\"video_link\":\"https:\\/\\/www.youtube.com\\/embed\\/WOb4cj7izpE\",\"about_image\":\"66965a2661e471721129510.jpg\"}', NULL, 'basic', '', '2020-10-28 00:51:20', '2024-07-16 05:31:50'),
(25, 'blog.content', '{\"heading\":\"Latest News About\",\"subheading\":\"Hic tenetur nihil ex. Doloremque ipsa velit, ea molestias expedita sed voluptatem ex voluptatibus temporibus sequi\"}', NULL, 'basic', '', '2020-10-28 00:51:34', '2024-07-17 05:28:35'),
(27, 'contact_us.content', '{\"has_image\":\"1\",\"title\":\"Get in touch for any kind of help and information\'s\",\"email_address\":\"demo@gmail.com\",\"contact_details\":\"Usa , New York\",\"contact_number\":\"44983456780\",\"latitude\":\"12\",\"longitude\":\"32\",\"background_image\":\"66965b85c4d8e1721129861.png\"}', NULL, 'basic', '', '2020-10-28 00:59:19', '2024-07-16 05:37:41'),
(28, 'counter.content', '{\"heading\":\"Latest News\",\"subheading\":\"Lorem ipsum dolor sit, amet consectetur adipisicing elit. Doloribus necessitatibus repudiandae porro reprehenderit, beatae perferendis repellat quo ipsa omnis, vitae!\"}', NULL, 'basic', NULL, '2020-10-28 01:04:02', '2024-03-13 23:54:07'),
(31, 'social_icon.element', '{\"title\":\"Facebook\",\"social_icon\":\"<i class=\\\"fab fa-facebook\\\"><\\/i>\",\"url\":\"https:\\/\\/www.fb.com\\/\"}', NULL, 'basic', '', '2020-11-12 04:07:30', '2024-07-16 05:44:18'),
(33, 'feature.content', '{\"heading\":\"asdf\",\"sub_heading\":\"asdf\"}', NULL, 'basic', NULL, '2021-01-03 23:40:54', '2021-01-03 23:40:55'),
(34, 'feature.element', '{\"title\":\"asdf\",\"description\":\"asdf\",\"feature_icon\":\"asdf\"}', NULL, 'basic', NULL, '2021-01-03 23:41:02', '2021-01-03 23:41:02'),
(35, 'service.element', '{\"trx_type\":\"withdraw\",\"service_icon\":\"<i class=\\\"las la-highlighter\\\"><\\/i>\",\"title\":\"asdfasdf\",\"description\":\"asdfasdfasdfasdf\"}', NULL, 'basic', NULL, '2021-03-06 01:12:10', '2021-03-06 01:12:10'),
(36, 'service.content', '{\"trx_type\":\"deposit\",\"heading\":\"asdf fffff\",\"subheading\":\"555\"}', NULL, 'basic', NULL, '2021-03-06 01:27:34', '2022-03-30 08:07:06'),
(41, 'cookie.data', '{\"short_desc\":\"We may use cookies or any other tracking technologies when you visit our website, including any other media form, mobile website, or mobile application related or connected to help customize the Site and improve your experience.\",\"description\":\"<h4>Cookie Policy<\\/h4>\\r\\n\\r\\n<p>This Cookie Policy explains how to use cookies and similar technologies to recognize you when you visit our website. It explains what these technologies are and why we use them, as well as your rights to control our use of them.<\\/p>\\r\\n<br>\\r\\n<h4>What are cookies?<\\/h4>\\r\\n\\r\\n<p>Cookies are small pieces of data stored on your computer or mobile device when you visit a website. Cookies are widely used by website owners to make their websites work, or to work more efficiently, as well as to provide reporting information.<\\/p>\\r\\n<br>\\r\\n<h4>Why do we use cookies?<\\/h4>\\r\\n\\r\\n<p>We use cookies for several reasons. Some cookies are required for technical reasons for our Website to operate, and we refer to these as \\\"essential\\\" or \\\"strictly necessary\\\" cookies. Other cookies enable us to track and target the interests of our users to enhance the experience on our Website. Third parties serve cookies through our Website for advertising, analytics, and other purposes.<\\/p>\\r\\n<br>\\r\\n<h4>What types of cookies do we use?<\\/h4>\\r\\n\\r\\n<div>\\r\\n    <ul style=\\\"list-style: unset;\\\">\\r\\n        <li>\\r\\n            <strong>Essential Website Cookies:<\\/strong> \\r\\n            These cookies are strictly necessary to provide you with services available through our Website and to use some of its features.\\r\\n        <\\/li>\\r\\n        <li>\\r\\n            <strong>Analytics and Performance Cookies:<\\/strong> \\r\\n            These cookies allow us to count visits and traffic sources to measure and improve our Website\'s performance.\\r\\n        <\\/li>\\r\\n        <li>\\r\\n            <strong>Advertising Cookies:<\\/strong> \\r\\n            These cookies make advertising messages more relevant to you and your interests. They perform functions like preventing the same ad from continuously reappearing, ensuring that ads are properly displayed, and in some cases selecting advertisements that are based on your interests.\\r\\n        <\\/li>\\r\\n    <\\/ul>\\r\\n<\\/div>\\r\\n<br>\\r\\n<h4>Data Collected by Cookies<\\/h4>\\r\\n<p>Cookies may collect various types of data, including but not limited to:<\\/p>\\r\\n<ul style=\\\"list-style: unset;\\\">\\r\\n    <li>IP addresses<\\/li>\\r\\n    <li>Browser and device information<\\/li>\\r\\n    <li>Referring website addresses<\\/li>\\r\\n    <li>Pages visited on our website<\\/li>\\r\\n    <li>Interactions with our website, such as clicks and mouse movements<\\/li>\\r\\n    <li>Time spent on our website<\\/li>\\r\\n<\\/ul>\\r\\n<br>\\r\\n<h4>How We Use Collected Data<\\/h4>\\r\\n\\r\\n<p>We may use data collected by cookies for the following purposes:<\\/p>\\r\\n<ul style=\\\"list-style: unset;\\\">\\r\\n    <li>To personalize your experience on our website<\\/li>\\r\\n    <li>To improve our website\'s functionality and performance<\\/li>\\r\\n    <li>To analyze trends and gather demographic information about our user base<\\/li>\\r\\n    <li>To deliver targeted advertising based on your interests<\\/li>\\r\\n    <li>To prevent fraudulent activity and enhance website security<\\/li>\\r\\n<\\/ul>\\r\\n<br>\\r\\n<h4>Third-party cookies<\\/h4>\\r\\n\\r\\n<p>In addition to our cookies, we may also use various third-party cookies to report usage statistics of our Website, deliver advertisements on and through our Website, and so on.<\\/p>\\r\\n<br>\\r\\n<h4>How can we control cookies?<\\/h4>\\r\\n\\r\\n<p>You have the right to decide whether to accept or reject cookies. You can exercise your cookie preferences by clicking on the \\\"Cookie Settings\\\" link in the footer of our website. You can also set or amend your web browser controls to accept or refuse cookies. If you choose to reject cookies, you may still use our Website though your access to some functionality and areas of our Website may be restricted.<\\/p>\\r\\n<br>\\r\\n<h4>Changes to our Cookie Policy<\\/h4>\\r\\n\\r\\n<p>We may update our Cookie Policy from time to time. We will notify you of any changes by posting the new Cookie Policy on this page.<\\/p>\",\"status\":1}', NULL, NULL, NULL, '2020-07-04 23:42:52', '2024-04-25 06:26:36'),
(42, 'policy_pages.element', '{\"title\":\"Privacy Policy\",\"details\":\"<h4>Introduction<\\/h4>\\r\\n        <p>\\r\\n            This Privacy Policy describes how we collects, uses, and discloses information, including personal information, in connection with your use of our website.\\r\\n        <\\/p>\\r\\n        <br \\/>\\r\\n        <h4>Information We Collect<\\/h4>\\r\\n        <p>We collect two main types of information on the Website:<\\/p>\\r\\n        <ul>\\r\\n            <li><p><strong>Personal Information: <\\/strong>This includes data that can identify you as an individual, such as your name, email address, phone number, or mailing address. We only collect this information when you voluntarily provide it to us, like signing up for a newsletter, contacting us through a form, or making a purchase.<\\/p><\\/li>\\r\\n            <li><p><strong>Non-Personal Information: <\\/strong>This data cannot be used to identify you directly. It includes details like your browser type, device type, operating system, IP address, browsing activity, and usage statistics. We collect this information automatically through cookies and other tracking technologies.<\\/p><\\/li>\\r\\n        <\\/ul>\\r\\n        <br \\/>\\r\\n        <h4>How We Use Information<\\/h4>\\r\\n        <p>The information we collect allows us to:<\\/p>\\r\\n        <ul>\\r\\n            <li>Operate and maintain the Website effectively.<\\/li>\\r\\n            <li>Send you newsletters or marketing communications, but only with your consent.<\\/li>\\r\\n            <li>Respond to your inquiries and fulfill your requests.<\\/li>\\r\\n            <li>Improve the Website and your user experience.<\\/li>\\r\\n            <li>Personalize your experience on the Website based on your browsing habits.<\\/li>\\r\\n            <li>Analyze how the Website is used to improve our services.<\\/li>\\r\\n            <li>Comply with legal and regulatory requirements.<\\/li>\\r\\n        <\\/ul>\\r\\n        <br \\/>\\r\\n        <h4>Sharing of Information<\\/h4>\\r\\n        <p>We may share your information with trusted third-party service providers who assist us in operating the Website and delivering our services. These providers are obligated by contract to keep your information confidential and use it only for the specific purposes we disclose it for.<\\/p>\\r\\n        <p>We will never share your personal information with any third parties for marketing purposes without your explicit consent.<\\/p>\\r\\n        <br \\/>\\r\\n        <h4>Data Retention<\\/h4>\\r\\n        <p>We retain your personal information only for as long as necessary to fulfill the purposes it was collected for. We may retain it for longer periods only if required or permitted by law.<\\/p>\\r\\n        <br \\/>\\r\\n        <h4>Security Measures<\\/h4>\\r\\n        <p>We take reasonable precautions to protect your information from unauthorized access, disclosure, alteration, or destruction. However, complete security cannot be guaranteed for any website or internet transmission.<\\/p>\\r\\n        <br \\/>\\r\\n        <h4>Changes to this Privacy Policy<\\/h4>\\r\\n        <p>We may update this Privacy Policy periodically. We will notify you of any changes by posting the revised policy on the Website. We recommend reviewing this policy regularly to stay informed of any updates.<\\/p>\\r\\n        <p><strong>Remember:<\\/strong>  This is a sample policy and may need adjustments to comply with specific laws and reflect your website\'s unique data practices. Consider consulting with a legal professional to ensure your policy is fully compliant.<\\/p>\"}', '{\"image\":null,\"description\":null,\"social_title\":null,\"social_description\":null,\"keywords\":null}', 'basic', 'privacy-policy', '2021-06-09 08:50:42', '2024-04-24 05:43:19'),
(43, 'policy_pages.element', '{\"title\":\"Terms of Service\",\"details\":\"<h4>Introduction<\\/h4>\\r\\n        <p>\\r\\n            This Privacy Policy describes how we collects, uses, and discloses information, including personal information, in connection with your use of our website.\\r\\n        <\\/p>\\r\\n        <br \\/>\\r\\n        <h4>Information We Collect<\\/h4>\\r\\n        <p>We collect two main types of information on the Website:<\\/p>\\r\\n        <ul>\\r\\n            <li><p><strong>Personal Information: <\\/strong>This includes data that can identify you as an individual, such as your name, email address, phone number, or mailing address. We only collect this information when you voluntarily provide it to us, like signing up for a newsletter, contacting us through a form, or making a purchase.<\\/p><\\/li>\\r\\n            <li><p><strong>Non-Personal Information: <\\/strong>This data cannot be used to identify you directly. It includes details like your browser type, device type, operating system, IP address, browsing activity, and usage statistics. We collect this information automatically through cookies and other tracking technologies.<\\/p><\\/li>\\r\\n        <\\/ul>\\r\\n        <br \\/>\\r\\n        <h4>How We Use Information<\\/h4>\\r\\n        <p>The information we collect allows us to:<\\/p>\\r\\n        <ul>\\r\\n            <li>Operate and maintain the Website effectively.<\\/li>\\r\\n            <li>Send you newsletters or marketing communications, but only with your consent.<\\/li>\\r\\n            <li>Respond to your inquiries and fulfill your requests.<\\/li>\\r\\n            <li>Improve the Website and your user experience.<\\/li>\\r\\n            <li>Personalize your experience on the Website based on your browsing habits.<\\/li>\\r\\n            <li>Analyze how the Website is used to improve our services.<\\/li>\\r\\n            <li>Comply with legal and regulatory requirements.<\\/li>\\r\\n        <\\/ul>\\r\\n        <br \\/>\\r\\n        <h4>Sharing of Information<\\/h4>\\r\\n        <p>We may share your information with trusted third-party service providers who assist us in operating the Website and delivering our services. These providers are obligated by contract to keep your information confidential and use it only for the specific purposes we disclose it for.<\\/p>\\r\\n        <p>We will never share your personal information with any third parties for marketing purposes without your explicit consent.<\\/p>\\r\\n        <br \\/>\\r\\n        <h4>Data Retention<\\/h4>\\r\\n        <p>We retain your personal information only for as long as necessary to fulfill the purposes it was collected for. We may retain it for longer periods only if required or permitted by law.<\\/p>\\r\\n        <br \\/>\\r\\n        <h4>Security Measures<\\/h4>\\r\\n        <p>We take reasonable precautions to protect your information from unauthorized access, disclosure, alteration, or destruction. However, complete security cannot be guaranteed for any website or internet transmission.<\\/p>\\r\\n        <br \\/>\\r\\n        <h4>Changes to this Privacy Policy<\\/h4>\\r\\n        <p>We may update this Privacy Policy periodically. We will notify you of any changes by posting the revised policy on the Website. We recommend reviewing this policy regularly to stay informed of any updates.<\\/p>\\r\\n        <p><strong>Remember:<\\/strong>  This is a sample policy and may need adjustments to comply with specific laws and reflect your website\'s unique data practices. Consider consulting with a legal professional to ensure your policy is fully compliant.<\\/p>\"}', '{\"image\":\"6635d5d9618e71714804185.png\",\"description\":null,\"social_title\":null,\"social_description\":null,\"keywords\":null}', 'basic', 'terms-of-service', '2021-06-09 08:51:18', '2024-05-12 05:47:29'),
(44, 'maintenance.data', '{\"description\":\"<div class=\\\"mb-5\\\" style=\\\"font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"text-align: center; font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif;\\\"><font color=\\\"#ff0000\\\">THE SITE IS UNDER MAINTENANCE<\\/font><\\/h3><p class=\\\"font-18\\\" style=\\\"color: rgb(111, 111, 111); text-align: center; margin-right: 0px; margin-left: 0px; font-size: 18px !important;\\\">We\'re just tuning up a few things.We apologize for the inconvenience but Front is currently undergoing planned maintenance. Thanks for your patience.<\\/p><\\/div>\",\"image\":\"6603c203472ad1711522307.png\"}', NULL, NULL, NULL, '2020-07-04 23:42:52', '2024-03-27 06:51:47'),
(55, 'counter.content', '{\"heading\":\"Latest Newsss\",\"subheading\":\"Lorem ipsum dolor sit, amet consectetur adipisicing elit. Doloribus necessitatibus repudiandae porro reprehenderit, beatae perferendis repellat quo ipsa omnis, vitae!\"}', NULL, 'basic', '', '2024-04-21 01:13:50', '2024-04-21 01:13:50'),
(56, 'counter.content', '{\"heading\":\"Latest News\",\"subheading\":\"Lorem ipsum dolor sit, amet consectetur adipisicing elit. Doloribus necessitatibus repudiandae porro reprehenderit, beatae perferendis repellat quo ipsa omnis, vitae!\"}', NULL, 'basic', '', '2024-04-21 01:13:52', '2024-04-21 01:13:52'),
(64, 'banner.content', '{\"has_image\":\"1\",\"heading\":\"A lot of things hurt. Saving lives doesn\'t have to\",\"background_image\":\"66965aa258dbf1721129634.jpg\"}', NULL, 'basic', '', '2024-05-01 00:06:45', '2024-07-16 05:33:54'),
(67, 'footer.content', '{\"has_image\":\"1\",\"title\":\"Animi sequi aliquam illum voluptatum ratione, quaerat dignissimos fugiat. Ea, vitae odio quasi aspernatur expedita maiores, quidem voluptates libero quaerat fugiat nisi, ratione inventore iusto nostrum voluptas sint culpa.\",\"btn_name\":\"Blood Donor\",\"btn_url\":\"#\",\"first_count_digits\":\"4523\",\"first_count_title\":\"Donors\",\"second_count_digits\":\"5324\",\"second_count_title\":\"Volunteers\",\"background_image\":\"6696593272e701721129266.jpg\"}', NULL, 'basic', '', '2024-07-16 05:27:46', '2024-07-16 05:27:46'),
(68, 'about.element', '{\"title\":\"100% Automated\",\"sub_title\":\"Aamet consectetur adipisicing elit. Est voluptatibus accusamus nam labore, quam a quo. Quibusdam est voluptatibus animi quia\",\"about_icon\":\"<i class=\\\"fas fa-search\\\"><\\/i>\"}', NULL, 'basic', '', '2024-07-16 05:32:16', '2024-07-16 05:32:47'),
(69, 'about.element', '{\"title\":\"Always Free\",\"sub_title\":\"Aamet consectetur adipisicing elit. Est voluptatibus accusamus nam labore, quam a quo. Quibusdam est voluptatibus animi quia.\",\"about_icon\":\"<i class=\\\"fas fa-compass\\\"><\\/i>\"}', NULL, 'basic', '', '2024-07-16 05:33:14', '2024-07-16 05:33:14'),
(70, 'about.element', '{\"title\":\"Data is Secured\",\"sub_title\":\"Aamet consectetur adipisicing elit. Est voluptatibus accusamus nam labore, quam a quo. Quibusdam est voluptatibus animi quia.\",\"about_icon\":\"<i class=\\\"fas fa-lock\\\"><\\/i>\"}', NULL, 'basic', '', '2024-07-16 05:33:33', '2024-07-16 05:33:33'),
(75, 'blood.content', '{\"has_image\":\"1\",\"heading\":\"Avaiable Blood Donors\",\"background_image\":\"66965b3b3ea2a1721129787.png\"}', NULL, 'basic', '', '2024-07-16 05:36:27', '2024-07-16 05:36:27'),
(76, 'breadcrumb.content', '{\"has_image\":\"1\",\"background_image\":\"66965b4c3852f1721129804.jpg\"}', NULL, 'basic', '', '2024-07-16 05:36:44', '2024-07-16 05:36:44'),
(77, 'donor.content', '{\"has_image\":\"1\",\"heading\":\"Top Donors\",\"sub_heading\":\"Dolor sit amet, consectetur adipisicing elit. Dignissimos soluta est qui totam expedita eaque, deleniti quidem sequi magni iure nulla corporis.\",\"background_image\":\"66965ba62d5e01721129894.png\"}', NULL, 'basic', '', '2024-07-16 05:38:14', '2024-07-16 05:38:14'),
(78, 'faq.content', '{\"heading\":\"Frequently Asked Questions\",\"sub_heading\":\"Dolor sit amet consectetur adipisicing elit. Ad voluptatum fuga eius expedita, nulla quos blanditiis nobis laboriosam. Natus cum eum fuga praesentium.\"}', NULL, 'basic', '', '2024-07-16 05:38:29', '2024-07-16 05:38:29'),
(79, 'faq.element', '{\"title\":\"Eligendi in enim quisquam dolor voluptates nihil.\",\"answer\":\"Eligendi in enim quisquam dolor voluptates nihil.\\tEligendi in enim quisquam dolor voluptates nihil.\\tEligendi in enim quisquam dolor voluptates nihil.\\tEligendi in enim quisquam dolor voluptates nihil.\"}', NULL, 'basic', '', '2024-07-16 05:38:45', '2024-07-16 05:38:45'),
(80, 'faq.element', '{\"title\":\"Doloremque perspiciatis harum voluptatibus natus.\",\"answer\":\"Doloremque perspiciatis harum voluptatibus natus.\\tEligendi in enim quisquam dolor voluptates nihil.\"}', NULL, 'basic', '', '2024-07-16 05:38:57', '2024-07-16 05:38:57'),
(81, 'faq.element', '{\"title\":\"Eligendi in enim quisquam dolor voluptates nihil.\",\"answer\":\"Dolor sit amet consectetur adipisicing elit. Ad voluptatum fuga eius expedita, nulla quos blanditiis nobis laboriosam. Natus cum eum fuga praesentium.\"}', NULL, 'basic', '', '2024-07-16 05:39:08', '2024-07-16 05:39:08'),
(82, 'featured_donor.content', '{\"has_image\":\"1\",\"heading\":\"Featured Donor\",\"sub_heading\":\"Dolor sit amet, consectetur adipisicing elit. Dignissimos soluta est qui totam expedita eaque, deleniti quidem sequi magni iure nulla corporis.\",\"background_image\":\"66965bf80ed001721129976.png\"}', NULL, 'basic', '', '2024-07-16 05:39:36', '2024-07-16 05:39:36'),
(83, 'how_it_work.content', '{\"has_image\":\"1\",\"heading\":\"The Blood Donation Process\",\"background_image\":\"66965c143deb41721130004.jpg\"}', NULL, 'basic', '', '2024-07-16 05:40:04', '2024-07-16 05:40:04'),
(84, 'how_it_work.element', '{\"title\":\"Registration\",\"icon\":\"<i class=\\\"far fa-registered\\\"><\\/i>\"}', NULL, 'basic', '', '2024-07-16 05:40:21', '2024-07-16 05:40:21'),
(85, 'how_it_work.element', '{\"title\":\"Health History\",\"icon\":\"<i class=\\\"fas fa-briefcase-medical\\\"><\\/i>\"}', NULL, 'basic', '', '2024-07-16 05:40:32', '2024-07-16 05:40:32'),
(86, 'how_it_work.element', '{\"title\":\"Blood Donation\",\"icon\":\"<i class=\\\"fas fa-tint\\\"><\\/i>\"}', NULL, 'basic', '', '2024-07-16 05:40:43', '2024-07-16 05:40:43'),
(87, 'how_it_work.element', '{\"title\":\"Refreshment and Recovery\",\"icon\":\"<i class=\\\"fas fa-heart\\\"><\\/i>\"}', NULL, 'basic', '', '2024-07-16 05:40:58', '2024-07-16 05:40:58'),
(88, 'latest_donor.content', '{\"has_image\":\"1\",\"heading\":\"Latest Donor\",\"sub_heading\":\"Dolor sit amet, consectetur adipisicing elit. Dignissimos soluta est qui totam expedita eaque, deleniti quidem sequi magni iure nulla corporis.\",\"background_image\":\"66965c6209ed61721130082.png\"}', NULL, 'basic', '', '2024-07-16 05:41:22', '2024-07-16 05:41:22'),
(89, 'overview.content', '{\"has_image\":\"1\",\"heading\":\"Bloodlab is committed to advancing public policies that promote safety, increase availability, and spur innovation.\",\"background_image\":\"66965c78687d11721130104.jpg\"}', NULL, 'basic', '', '2024-07-16 05:41:44', '2024-07-16 05:41:44'),
(90, 'overview.element', '{\"title\":\"5012 Donors\",\"overview_icon\":\"<i class=\\\"fas fa-users-cog\\\"><\\/i>\"}', NULL, 'basic', '', '2024-07-16 05:42:02', '2024-07-16 05:42:02'),
(91, 'overview.element', '{\"title\":\"52 Areas\",\"overview_icon\":\"<i class=\\\"fas fa-globe-asia\\\"><\\/i>\"}', NULL, 'basic', '', '2024-07-16 05:42:17', '2024-07-16 05:42:17'),
(92, 'overview.element', '{\"title\":\"320 Volunteer\",\"overview_icon\":\"<i class=\\\"fas fa-user-injured\\\"><\\/i>\"}', NULL, 'basic', '', '2024-07-16 05:42:32', '2024-07-16 05:42:32'),
(93, 'overview.element', '{\"title\":\"8 Blood Groups\",\"overview_icon\":\"<i class=\\\"fas fa-tint\\\"><\\/i>\"}', NULL, 'basic', '', '2024-07-16 05:42:45', '2024-07-16 05:42:45'),
(94, 'patner.content', '{\"heading\":\"Our Community Partner\",\"sub_heading\":\"Earum optio in ipsum, non dolore, veritatis molestias assumenda sint aspernatur.\"}', NULL, 'basic', '', '2024-07-16 05:43:04', '2024-07-16 05:43:04'),
(95, 'patner.element', '{\"has_image\":\"1\",\"background_image\":\"66965cd32ec0b1721130195.png\"}', NULL, 'basic', '', '2024-07-16 05:43:15', '2024-07-16 05:43:15'),
(96, 'patner.element', '{\"has_image\":\"1\",\"background_image\":\"66965cdb947f11721130203.png\"}', NULL, 'basic', '', '2024-07-16 05:43:23', '2024-07-16 05:43:23'),
(97, 'patner.element', '{\"has_image\":\"1\",\"background_image\":\"66965ce2ae9031721130210.png\"}', NULL, 'basic', '', '2024-07-16 05:43:30', '2024-07-16 05:43:30'),
(98, 'patner.element', '{\"has_image\":\"1\",\"background_image\":\"66965ceae26ad1721130218.png\"}', NULL, 'basic', '', '2024-07-16 05:43:38', '2024-07-16 05:43:38'),
(99, 'patner.element', '{\"has_image\":\"1\",\"background_image\":\"66965cf180f691721130225.png\"}', NULL, 'basic', '', '2024-07-16 05:43:45', '2024-07-16 05:43:45'),
(100, 'social_icon.element', '{\"title\":\"X\",\"social_icon\":\"<i class=\\\"fab fa-twitter\\\"><\\/i>\",\"url\":\"https:\\/\\/x.com\"}', NULL, 'basic', '', '2024-07-16 05:44:33', '2024-07-16 05:44:33'),
(101, 'social_icon.element', '{\"title\":\"Instagram\",\"social_icon\":\"<i class=\\\"fab fa-instagram\\\"><\\/i>\",\"url\":\"https:\\/\\/instagram.com\\/coffeewithmahi\"}', NULL, 'basic', '', '2024-07-16 05:44:58', '2024-07-16 05:44:58'),
(102, 'testimonial.content', '{\"has_image\":\"1\",\"heading\":\"What Blood Donors say\",\"sub_heading\":\"Architecto corporis voluptate ut iure veritatis tempore vitae. Minima ea provident eaque.\",\"background_image\":\"66965d582f7361721130328.jpg\"}', NULL, 'basic', '', '2024-07-16 05:45:28', '2024-07-16 05:45:28'),
(103, 'testimonial.element', '{\"name\":\"Andrew Tate\",\"testimonial\":\"Repellat, laudantium soluta laborum distinctio iste modi consectetur, atque, consequatur facere quidem hic unde harum alias molestias eveniet accusantium. Quasi natus aut minima modi saepe beatae reprehenderit illum\",\"rating\":\"5.00\",\"donor_count\":\"16\"}', NULL, 'basic', '', '2024-07-16 05:45:56', '2024-07-16 05:45:56'),
(104, 'testimonial.element', '{\"name\":\"Diva Dadlani\",\"testimonial\":\"Repellat, laudantium soluta laborum distinctio iste modi consectetur, atque, consequatur facere quidem hic unde harum alias molestias eveniet accusantium. Quasi natus aut minima modi saepe beatae reprehenderit illum\",\"rating\":\"5.00\",\"donor_count\":\"24\"}', NULL, 'basic', '', '2024-07-16 05:46:24', '2024-07-16 05:46:24'),
(105, 'testimonial.element', '{\"name\":\"Di Marchent\",\"testimonial\":\"Repellat, laudantium soluta laborum distinctio iste modi consectetur, atque, consequatur facere quidem hic unde harum alias molestias eveniet accusantium. Quasi natus aut minima modi saepe beatae reprehenderit illum\",\"rating\":\"5.00\",\"donor_count\":\"27\"}', NULL, 'basic', '', '2024-07-16 05:46:52', '2024-07-17 01:02:28'),
(106, 'testimonial.element', '{\"name\":\"Ananat MohaRaja\",\"testimonial\":\"Repellat, laudantium soluta laborum distinctio iste modi consectetur, atque, consequatur facere quidem hic unde harum alias molestias eveniet accusantium. Quasi natus aut minima modi saepe beatae reprehenderit illum\",\"rating\":\"5.00\",\"donor_count\":\"29\"}', NULL, 'basic', '', '2024-07-16 05:47:14', '2024-07-16 05:47:14'),
(107, 'testimonial.element', '{\"name\":\"Rex Riana\",\"testimonial\":\"Repellat, laudantium soluta laborum distinctio iste modi consectetur, atque, consequatur facere quidem hic unde harum alias molestias eveniet accusantium. Quasi natus aut minima modi saepe beatae reprehenderit illum\",\"rating\":\"5.00\",\"donor_count\":\"28\"}', NULL, 'basic', '', '2024-07-17 01:01:29', '2024-07-17 01:01:29'),
(109, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Doloribus cumque fugit eligendi quisquam placeat quas voluptate. Quos\",\"description\":\"<p style=\\\"margin-top:20px;margin-right:0px;margin-left:0px;color:rgb(80,80,80);font-family:Roboto, sans-serif;font-size:16px;\\\">Excepturi quo porro autem, beatae at provident cum atque quidem reprehenderit quam explicabo neque vel laborum perferendis quas officiis ex voluptatum, laudantium alias fugit quae, nostrum hic. Animi expedita dolore libero odio corrupti ratione culpa, ipsum esse pariatur illo, excepturi vero, maiores omnis praesentium fuga dolores molestias accusamus illum! Ducimus laborum molestias unde iusto quaerat consectetur suscipit placeat, amet accusamus velit nihil voluptate harum ipsum debitis nam eius saepe! Eius culpa error itaque minima dolorum quae voluptates molestiae nesciunt natus accusamus ab, facere officia praesentium quod excepturi veritatis, ut magnam. Dolorem, quas.<\\/p><p style=\\\"margin-top:20px;margin-right:0px;margin-left:0px;color:rgb(80,80,80);font-family:Roboto, sans-serif;font-size:16px;\\\">Animi expedita dolore libero odio corrupti ratione culpa, ipsum esse pariatur illo, excepturi vero, maiores omnis praesentium fuga dolores molestias accusamus illum! Ducimus laborum molestias unde iusto quaerat consectetur suscipit placeat, amet accusamus velit nihil voluptate harum ipsum debitis nam eius saepe! Eius culpa error itaque minima dolorum quae voluptates molestiae nesciunt natus accusamus ab, facere officia praesentium quod.<\\/p><p style=\\\"margin-top:20px;margin-right:0px;margin-left:0px;color:rgb(80,80,80);font-family:Roboto, sans-serif;font-size:16px;\\\">Excepturi quo porro autem, beatae at provident cum atque quidem reprehenderit quam explicabo neque vel laborum perferendis quas officiis ex voluptatum, laudantium alias fugit quae, nostrum hic. Animi expedita dolore libero odio corrupti ratione culpa, ipsum esse pariatur illo, excepturi vero, maiores omnis praesentium fuga dolores molestias accusamus illum! Ducimus laborum molestias unde iusto quaerat consectetur suscipit placeat, amet accusamus velit nihil voluptate harum ipsum debitis nam eius saepe! Eius culpa error itaque minima dolorum quae voluptates molestiae nesciunt natus accusamus ab, facere officia praesentium quod excepturi veritatis, ut magnam. Dolorem, quas.<\\/p><p style=\\\"margin-top:20px;margin-right:0px;margin-left:0px;color:rgb(80,80,80);font-family:Roboto, sans-serif;font-size:16px;\\\">Animi expedita dolore libero odio corrupti ratione culpa, ipsum esse pariatur illo, excepturi vero, maiores omnis praesentium fuga dolores molestias accusamus illum! Ducimus laborum molestias unde iusto quaerat consectetur suscipit placeat, amet accusamus velit nihil voluptate harum ipsum debitis nam eius saepe! Eius culpa error itaque minima dolorum quae voluptates molestiae nesciunt natus accusamus ab, facere officia praesentium quod.<\\/p><p style=\\\"margin-top:20px;margin-right:0px;margin-left:0px;color:rgb(80,80,80);font-family:Roboto, sans-serif;font-size:16px;\\\">Excepturi quo porro autem, beatae at provident cum atque quidem reprehenderit quam explicabo neque vel laborum perferendis quas officiis ex voluptatum, laudantium alias fugit quae, nostrum hic. Animi expedita dolore libero odio corrupti ratione culpa, ipsum esse pariatur illo, excepturi vero, maiores omnis praesentium fuga dolores molestias accusamus illum! Ducimus laborum molestias unde iusto quaerat consectetur suscipit placeat, amet accusamus velit nihil voluptate harum ipsum debitis nam eius saepe! Eius culpa error itaque minima dolorum quae voluptates molestiae nesciunt natus accusamus ab, facere officia praesentium quod excepturi veritatis, ut magnam. Dolorem, quas.<\\/p>\",\"image\":\"66a1fab60b1821721891510.jpg\"}', '{\"image\":null,\"description\":null,\"social_title\":null,\"social_description\":null,\"keywords\":null}', 'basic', 'doloribus-cumque-fugit-eligendi-quisquam-placeat-quas-voluptate-quos', '2024-07-17 05:38:42', '2024-07-25 01:11:50'),
(110, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Cumque fugit eligendi quisquam placeat quas voluptate. Quos\",\"description\":\"<p style=\\\"margin-top:20px;margin-right:0px;margin-left:0px;color:rgb(80,80,80);font-family:Roboto, sans-serif;font-size:16px;\\\">Excepturi quo porro autem, beatae at provident cum atque quidem reprehenderit quam explicabo neque vel laborum perferendis quas officiis ex voluptatum, laudantium alias fugit quae, nostrum hic. Animi expedita dolore libero odio corrupti ratione culpa, ipsum esse pariatur illo, excepturi vero, maiores omnis praesentium fuga dolores molestias accusamus illum! Ducimus laborum molestias unde iusto quaerat consectetur suscipit placeat, amet accusamus velit nihil voluptate harum ipsum debitis nam eius saepe! Eius culpa error itaque minima dolorum quae voluptates molestiae nesciunt natus accusamus ab, facere officia praesentium quod excepturi veritatis, ut magnam. Dolorem, quas.<\\/p><p style=\\\"margin-top:20px;margin-right:0px;margin-left:0px;color:rgb(80,80,80);font-family:Roboto, sans-serif;font-size:16px;\\\">Animi expedita dolore libero odio corrupti ratione culpa, ipsum esse pariatur illo, excepturi vero, maiores omnis praesentium fuga dolores molestias accusamus illum! Ducimus laborum molestias unde iusto quaerat consectetur suscipit placeat, amet accusamus velit nihil voluptate harum ipsum debitis nam eius saepe! Eius culpa error itaque minima dolorum quae voluptates molestiae nesciunt natus accusamus ab, facere officia praesentium quod.<span style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;color:rgb(80,80,80);\\\">Excepturi quo porro autem,\\u00a0<\\/span><\\/p><p style=\\\"margin-top:20px;margin-right:0px;margin-left:0px;color:rgb(80,80,80);font-family:Roboto, sans-serif;font-size:16px;\\\"><span style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;color:rgb(80,80,80);\\\">beatae at provident cum atque quidem reprehenderit quam explicabo neque vel laborum perferendis quas officiis ex voluptatum, laudantium alias fugit quae, nostrum hic. Animi expedita dolore libero odio corrupti ratione culpa, ipsum esse pariatur illo, excepturi vero, maiores omnis praesentium fuga dolores molestias accusamus illum! Ducimus laborum molestias unde iusto quaerat consectetur suscipit placeat, amet accusamus velit nihil voluptate harum ipsum debitis nam eius saepe! Eius culpa error itaque minima dolorum quae voluptates molestiae nesciunt natus accusamus ab, facere officia praesentium quod excepturi veritatis, ut magnam. Dolorem, quas.<\\/span><\\/p><p style=\\\"margin-top:20px;margin-right:0px;margin-left:0px;color:rgb(80,80,80);font-family:Roboto, sans-serif;font-size:16px;\\\">Animi expedita dolore libero odio corrupti ratione culpa, ipsum esse pariatur illo, excepturi vero, maiores omnis praesentium fuga dolores molestias accusamus illum! Ducimus laborum molestias unde iusto quaerat consectetur suscipit placeat, amet accusamus velit nihil voluptate harum ipsum debitis nam eius saepe! Eius culpa error itaque minima dolorum quae voluptates molestiae nesciunt natus accusamus ab, facere officia praesentium quod.<\\/p>\",\"image\":\"66a1fa95163d91721891477.jpg\"}', '{\"image\":null,\"description\":null,\"social_title\":null,\"social_description\":null,\"keywords\":null}', 'basic', 'cumque-fugit-eligendi-quisquam-placeat-quas-voluptate-quos', '2024-07-17 05:39:21', '2024-07-25 01:11:18'),
(111, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Aliquid doloribus cumque fugit eligendi quisquam placeat quas voluptate. Quo\",\"description\":\"<p style=\\\"margin-top:20px;margin-right:0px;margin-left:0px;color:rgb(80,80,80);font-family:Roboto, sans-serif;font-size:16px;\\\">Excepturi quo porro autem, beatae at provident cum atque quidem reprehenderit quam explicabo neque vel laborum perferendis quas officiis ex voluptatum, laudantium alias fugit quae, nostrum hic. Animi expedita dolore libero odio corrupti ratione culpa, ipsum esse pariatur illo, excepturi vero, maiores omnis praesentium fuga dolores molestias accusamus illum! Ducimus laborum molestias unde iusto quaerat consectetur suscipit placeat, amet accusamus velit nihil voluptate harum ipsum debitis nam eius saepe! Eius culpa error itaque minima dolorum quae voluptates molestiae nesciunt natus accusamus ab, facere officia praesentium quod excepturi veritatis, ut magnam. Dolorem, quas.<\\/p><p style=\\\"margin-top:20px;margin-right:0px;margin-left:0px;color:rgb(80,80,80);font-family:Roboto, sans-serif;font-size:16px;\\\">Animi expedita dolore libero odio corrupti ratione culpa, ipsum esse pariatur illo, excepturi vero, maiores omnis praesentium fuga dolores molestias accusamus illum! Ducimus laborum molestias unde iusto quaerat consectetur suscipit placeat, amet accusamus velit nihil voluptate harum ipsum debitis nam eius saepe! Eius culpa error itaque minima dolorum quae voluptates molestiae nesciunt natus accusamus ab, facere officia praesentium quod.<span style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;color:rgb(80,80,80);\\\">Excepturi quo porro autem, beatae at provident cum atque quidem reprehenderit quam explicabo neque vel laborum perferendis quas officiis ex voluptatum, laudantium alias fugit quae, nostrum hic. Animi expedita dolore libero odio corrupti ratione culpa, ipsum esse pariatur illo, excepturi vero, maiores omnis praesentium fuga dolores molestias accusamus illum! Ducimus laborum molestias unde iusto quaerat consectetur suscipit placeat, amet accusamus velit nihil voluptate harum ipsum debitis nam eius saepe! Eius culpa error itaque minima dolorum quae voluptates molestiae nesciunt natus accusamus ab, facere officia praesentium quod excepturi veritatis, ut magnam. Dolorem, quas.<\\/span><\\/p><p style=\\\"margin-top:20px;margin-right:0px;margin-left:0px;color:rgb(80,80,80);font-family:Roboto, sans-serif;font-size:16px;\\\">Animi expedita dolore libero odio corrupti ratione culpa, ipsum esse pariatur illo, excepturi vero, maiores omnis praesentium fuga dolores molestias accusamus illum! Ducimus laborum molestias unde iusto quaerat consectetur suscipit placeat, amet accusamus velit nihil voluptate harum ipsum debitis nam eius saepe! Eius culpa error itaque minima dolorum quae voluptates molestiae nesciunt natus accusamus ab, facere officia praesentium quod.<\\/p>\",\"image\":\"66a1fac16576e1721891521.jpg\"}', '{\"image\":null,\"description\":null,\"social_title\":null,\"social_description\":null,\"keywords\":null}', 'basic', 'aliquid-doloribus-cumque-fugit-eligendi-quisquam-placeat-quas-voluptate-quo', '2024-07-17 05:40:07', '2024-07-25 01:12:01'),
(112, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"O-type blood donors needed emergency after London cyber-attack\",\"description\":\"<p class=\\\"sc-eb7bd5f6-0 fYAfXe\\\" style=\\\"margin-right:0px;margin-left:0px;padding:0px;border:0px;font-size:18px;line-height:26px;font-family:\'BBC Reith Serif\', Helvetica, Arial, sans-serif;vertical-align:baseline;color:rgb(32,34,36);letter-spacing:-0.36px;\\\">An appeal has been launched for O blood-type donors to book appointments across the country following the ransomware attack affecting major London hospitals.<\\/p><p class=\\\"sc-eb7bd5f6-0 fYAfXe\\\" style=\\\"margin-right:0px;margin-left:0px;padding:0px;border:0px;font-size:18px;line-height:26px;font-family:\'BBC Reith Serif\', Helvetica, Arial, sans-serif;vertical-align:baseline;color:rgb(32,34,36);letter-spacing:-0.36px;\\\">The IT attack means the affected hospitals cannot currently match patients\' blood at the same frequency as usual.<\\/p><p class=\\\"sc-eb7bd5f6-0 fYAfXe\\\" style=\\\"margin-right:0px;margin-left:0px;padding:0px;border:0px;font-size:18px;line-height:26px;font-family:\'BBC Reith Serif\', Helvetica, Arial, sans-serif;vertical-align:baseline;color:rgb(32,34,36);letter-spacing:-0.36px;\\\">Several<a href=\\\"https:\\/\\/www.bbc.co.uk\\/news\\/articles\\/c288n8rkpvno\\\" class=\\\"sc-c9299ecf-0 bZUiKB\\\" style=\\\"margin:0px;padding:0px;border:0px;font-style:inherit;font-variant:inherit;font-size:18px;line-height:26px;vertical-align:baseline;color:rgb(32,34,36);text-decoration-line:underline;letter-spacing:-0.36px;\\\">\\u00a0London hospitals declared a critical incident<\\/a>, cancelled operations and tests, and were unable to carry out blood transfusions last week after the attack on the pathology firm Synnovis, which Qilin, a Russian group of cyber criminals, is understood to have been behind.<\\/p><p class=\\\"sc-eb7bd5f6-0 fYAfXe\\\" style=\\\"margin-right:0px;margin-left:0px;padding:0px;border:0px;font-size:18px;line-height:26px;font-family:\'BBC Reith Serif\', Helvetica, Arial, sans-serif;vertical-align:baseline;color:rgb(32,34,36);letter-spacing:-0.36px;\\\">On Monday afternoon, the NHS blood donation website implemented a queuing system for booking appointments, which is used to manage times of higher demand.<\\/p><p class=\\\"sc-eb7bd5f6-0 fYAfXe\\\" style=\\\"margin-right:0px;margin-left:0px;padding:0px;border:0px;font-size:18px;line-height:26px;font-family:\'BBC Reith Serif\', Helvetica, Arial, sans-serif;vertical-align:baseline;color:rgb(32,34,36);letter-spacing:-0.36px;\\\"><span style=\\\"color:rgb(32,34,36);font-style:inherit;letter-spacing:-0.36px;\\\">NHS Blood and Transplant is calling for O positive and O negative blood donors to book appointments in one of the<\\/span><span style=\\\"color:rgb(32,34,36);font-style:inherit;letter-spacing:-0.36px;\\\">\\u00a0<\\/span><a href=\\\"https:\\/\\/www.blood.co.uk\\/the-donation-process\\/about-our-donation-venues\\/\\\" class=\\\"sc-c9299ecf-0 bZUiKB\\\" style=\\\"font-size:18px;font-style:inherit;font-variant:inherit;letter-spacing:-0.36px;color:rgb(32,34,36);text-decoration-line:underline;margin:0px;padding:0px;border:0px;line-height:26px;vertical-align:baseline;\\\">25 NHS Blood Donor Centres<\\/a><span style=\\\"color:rgb(32,34,36);font-style:inherit;letter-spacing:-0.36px;\\\">\\u00a0<\\/span><span style=\\\"color:rgb(32,34,36);font-style:inherit;letter-spacing:-0.36px;\\\">in England.<\\/span><\\/p><p class=\\\"sc-eb7bd5f6-0 fYAfXe\\\" style=\\\"margin-right:0px;margin-left:0px;color:rgb(32,34,36);font-size:18px;line-height:26px;font-style:inherit;font-variant:inherit;padding:0px;border:0px;font-family:\'BBC Reith Serif\', Helvetica, Arial, sans-serif;vertical-align:baseline;letter-spacing:-0.36px;\\\">For surgeries and procedures requiring blood to take place, hospitals need to use O- type blood - known as the universal blood type - as this is safe to use for all patients. It is used in emergencies or when a patient\'s blood type is unknown.<\\/p><p class=\\\"sc-eb7bd5f6-0 fYAfXe\\\" style=\\\"margin-right:0px;margin-left:0px;color:rgb(32,34,36);font-size:18px;line-height:26px;font-style:inherit;font-variant:inherit;padding:0px;border:0px;font-family:\'BBC Reith Serif\', Helvetica, Arial, sans-serif;vertical-align:baseline;letter-spacing:-0.36px;\\\">Blood has a shelf life of 35 days so stocks need to be continually replenished, the NHS said.<\\/p>\",\"image\":\"6697ae5da66a41721216605.png\"}', '{\"image\":null,\"description\":null,\"social_title\":null,\"social_description\":null,\"keywords\":null}', 'basic', 'o-type-blood-donors-needed-emergency-after-london-cyber-attack', '2024-07-17 05:43:25', '2024-07-17 05:44:13');

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

CREATE TABLE `general_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `site_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_from` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_from_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_template` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sms_template` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_from` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `push_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `push_template` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `base_color` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondary_color` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_config` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'email configuration',
  `sms_config` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `firebase_config` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `global_shortcodes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `en` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'email notification, 0 - dont send, 1 - send',
  `sn` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'sms notification, 0 - dont send, 1 - send',
  `pn` tinyint(1) NOT NULL DEFAULT '1',
  `force_ssl` tinyint(1) NOT NULL DEFAULT '0',
  `maintenance_mode` tinyint(1) NOT NULL DEFAULT '0',
  `agree` tinyint(1) NOT NULL DEFAULT '0',
  `multi_language` tinyint(1) NOT NULL DEFAULT '1',
  `active_template` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `available_version` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_customized` tinyint(1) NOT NULL DEFAULT '0',
  `paginate_number` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`id`, `site_name`, `email_from`, `email_from_name`, `email_template`, `sms_template`, `sms_from`, `push_title`, `push_template`, `base_color`, `secondary_color`, `mail_config`, `sms_config`, `firebase_config`, `global_shortcodes`, `en`, `sn`, `pn`, `force_ssl`, `maintenance_mode`, `agree`, `multi_language`, `active_template`, `available_version`, `system_customized`, `paginate_number`, `created_at`, `updated_at`) VALUES
(1, 'BloodLab', 'info@viserlab.com', '{{site_name}}', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n  <!--[if !mso]><!-->\r\n  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n  <!--<![endif]-->\r\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n  <title></title>\r\n  <style type=\"text/css\">\r\n.ReadMsgBody { width: 100%; background-color: #ffffff; }\r\n.ExternalClass { width: 100%; background-color: #ffffff; }\r\n.ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div { line-height: 100%; }\r\nhtml { width: 100%; }\r\nbody { -webkit-text-size-adjust: none; -ms-text-size-adjust: none; margin: 0; padding: 0; }\r\ntable { border-spacing: 0; table-layout: fixed; margin: 0 auto;border-collapse: collapse; }\r\ntable table table { table-layout: auto; }\r\n.yshortcuts a { border-bottom: none !important; }\r\nimg:hover { opacity: 0.9 !important; }\r\na { color: #0087ff; text-decoration: none; }\r\n.textbutton a { font-family: \'open sans\', arial, sans-serif !important;}\r\n.btn-link a { color:#FFFFFF !important;}\r\n\r\n@media only screen and (max-width: 480px) {\r\nbody { width: auto !important; }\r\n*[class=\"table-inner\"] { width: 90% !important; text-align: center !important; }\r\n*[class=\"table-full\"] { width: 100% !important; text-align: center !important; }\r\n/* image */\r\nimg[class=\"img1\"] { width: 100% !important; height: auto !important; }\r\n}\r\n</style>\r\n\r\n\r\n\r\n  <table bgcolor=\"#414a51\" width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n    <tbody><tr>\r\n      <td height=\"50\"></td>\r\n    </tr>\r\n    <tr>\r\n      <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n          <tbody><tr>\r\n            <td align=\"center\" width=\"600\">\r\n              <!--header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#0087ff\" style=\"border-top-left-radius:6px; border-top-right-radius:6px;text-align:center;vertical-align:top;font-size:0;\" align=\"center\">\r\n                    <table width=\"90%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#FFFFFF; font-size:16px; font-weight: bold;\">This is a System Generated Email</td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n              <!--end header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#FFFFFF\" align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"35\"></td>\r\n                      </tr>\r\n                      <!--logo-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"vertical-align:top;font-size:0;\">\r\n                          <a href=\"#\">\r\n                            <img style=\"display:block; line-height:0px; font-size:0px; border:0px;\" src=\"https://i.ibb.co/rw2fTRM/logo-dark.png\" width=\"220\" alt=\"img\">\r\n                          </a>\r\n                        </td>\r\n                      </tr>\r\n                      <!--end logo-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n                      <!--headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 22px;color:#414a51;font-weight: bold;\">Hello</td>\r\n                      </tr>\r\n                      <!--end headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                          <table width=\"40\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                            <tbody><tr>\r\n                              <td height=\"20\" style=\" border-bottom:3px solid #0087ff;\"></td>\r\n                            </tr>\r\n                          </tbody></table>\r\n                        </td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <!--content-->\r\n                      <tr>\r\n                        <td align=\"left\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#7f8c8d; font-size:16px; line-height: 28px;\">{{message}}</td>\r\n                      </tr>\r\n                      <!--end content-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n              \r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td height=\"45\" align=\"center\" bgcolor=\"#f4f4f4\" style=\"border-bottom-left-radius:6px;border-bottom-right-radius:6px;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                      <!--preference-->\r\n                      <tr>\r\n                        <td class=\"preference-link\" align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#95a5a6; font-size:14px;\">\r\n                          © 2024 <a href=\"#\">{{site_name}}</a>&nbsp;. All Rights Reserved. \r\n                        </td>\r\n                      </tr>\r\n                      <!--end preference-->\r\n                      <tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n            </td>\r\n          </tr>\r\n        </tbody></table>\r\n      </td>\r\n    </tr>\r\n    <tr>\r\n      <td height=\"60\"></td>\r\n    </tr>\r\n  </tbody></table>', 'hi {{fullname}} ({{username}}), {{message}}', '{{site_name}}', '{{site_name}}', 'hi {{fullname}} ({{username}}), {{message}}', 'FB3640', '17173A', '{\"name\":\"php\"}', '{\"name\":\"clickatell\",\"clickatell\":{\"api_key\":\"----------------\"},\"infobip\":{\"username\":\"------------8888888\",\"password\":\"-----------------\"},\"message_bird\":{\"api_key\":\"-------------------\"},\"nexmo\":{\"api_key\":\"----------------------\",\"api_secret\":\"----------------------\"},\"sms_broadcast\":{\"username\":\"----------------------\",\"password\":\"-----------------------------\"},\"twilio\":{\"account_sid\":\"-----------------------\",\"auth_token\":\"---------------------------\",\"from\":\"----------------------\"},\"text_magic\":{\"username\":\"-----------------------\",\"apiv2_key\":\"-------------------------------\"},\"custom\":{\"method\":\"get\",\"url\":\"https:\\/\\/hostname.com\\/demo-api-v1\",\"headers\":{\"name\":[\"api_key\"],\"value\":[\"test_api 555\"]},\"body\":{\"name\":[\"from_number\"],\"value\":[\"5657545757\"]}}}', '{\"apiKey\":\"AIzaSyCb6zm7_8kdStXjZMgLZpwjGDuTUg0e_qM\",\"authDomain\":\"flutter-prime-df1c5.firebaseapp.com\",\"projectId\":\"flutter-prime-df1c5\",\"storageBucket\":\"flutter-prime-df1c5.appspot.com\",\"messagingSenderId\":\"274514992002\",\"appId\":\"1:274514992002:web:4d77660766f4797500cd9b\",\"measurementId\":\"G-KFPM07RXRC\",\"serverKey\":\"AAAA14oqxFc:APA91bE9uJdrjU_FX3gg_EtCfApRqoNojV71m6J-9yCQC7GoL2pBFcN9pdJjLLQxEAUcNxxatfWKLcnl5qCuLsmpPdr_3QRtH9XzfIu1MrLUJU3dHkBc4CGIkYMM9EWgXCNFjudhhQmH\"}', '{\n    \"site_name\":\"Name of your site\"\n}', 1, 1, 0, 0, 0, 1, 1, 'basic', '0', 0, 20, NULL, '2024-07-28 02:44:23');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: not default language, 1: default language',
  `image` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `code`, `is_default`, `image`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', 1, '660b94fa876ac1712035066.png', '2020-07-06 03:47:55', '2024-04-01 23:17:46');

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_id` int DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0' COMMENT 'Enable : 1, Disable : 0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification_logs`
--

CREATE TABLE `notification_logs` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `sender` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sent_from` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sent_to` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `notification_type` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_read` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification_templates`
--

CREATE TABLE `notification_templates` (
  `id` bigint UNSIGNED NOT NULL,
  `act` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `push_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sms_body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `push_body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `shortcodes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `email_status` tinyint(1) NOT NULL DEFAULT '1',
  `email_sent_from_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_sent_from_address` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_status` tinyint(1) NOT NULL DEFAULT '1',
  `sms_sent_from` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `push_status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_templates`
--

INSERT INTO `notification_templates` (`id`, `act`, `name`, `subject`, `push_title`, `email_body`, `sms_body`, `push_body`, `shortcodes`, `email_status`, `email_sent_from_name`, `email_sent_from_address`, `sms_status`, `sms_sent_from`, `push_status`, `created_at`, `updated_at`) VALUES
(7, 'PASS_RESET_CODE', 'Password - Reset - Code', 'Password Reset', '{{site_name}} Password Reset Code', '<div>We\'ve received a request to reset the password for your account on <b>{{time}}</b>. The request originated from\r\n            the following IP address: <b>{{ip}}</b>, using <b>{{browser}}</b> on <b>{{operating_system}}</b>.\r\n    </div><br>\r\n    <div><span>To proceed with the password reset, please use the following account recovery code</span>: <span><b><font size=\"6\">{{code}}</font></b></span></div><br>\r\n    <div><span>If you did not initiate this password reset request, please disregard this message. Your account security\r\n            remains our top priority, and we advise you to take appropriate action if you suspect any unauthorized\r\n            access to your account.</span></div>', 'To proceed with the password reset, please use the following account recovery code: {{code}}', 'To proceed with the password reset, please use the following account recovery code: {{code}}', '{\"code\":\"Verification code for password reset\",\"ip\":\"IP address of the user\",\"browser\":\"Browser of the user\",\"operating_system\":\"Operating system of the user\",\"time\":\"Time of the request\"}', 1, '{{site_name}} Authentication Center', NULL, 0, NULL, 0, '2021-11-03 12:00:00', '2024-05-08 07:24:57'),
(8, 'PASS_RESET_DONE', 'Password - Reset - Confirmation', 'Password Reset Successful', NULL, '<div><div><span>We are writing to inform you that the password reset for your account was successful. This action was completed at {{time}} from the following browser</span>: <span>{{browser}}</span><span>on {{operating_system}}, with the IP address</span>: <span>{{ip}}</span>.</div><br><div><span>Your account security is our utmost priority, and we are committed to ensuring the safety of your information. If you did not initiate this password reset or notice any suspicious activity on your account, please contact our support team immediately for further assistance.</span></div></div>', 'We are writing to inform you that the password reset for your account was successful.', 'We are writing to inform you that the password reset for your account was successful.', '{\"ip\":\"IP address of the user\",\"browser\":\"Browser of the user\",\"operating_system\":\"Operating system of the user\",\"time\":\"Time of the request\"}', 1, '{{site_name}} Authentication Center', NULL, 1, NULL, 0, '2021-11-03 12:00:00', '2024-04-25 03:27:24'),
(9, 'ADMIN_SUPPORT_REPLY', 'Support - Reply', 'Re: {{ticket_subject}} - Ticket #{{ticket_id}}', '{{site_name}} - Support Ticket Replied', '<div>\r\n    <div><span>Thank you for reaching out to us regarding your support ticket with the subject</span>:\r\n        <span>\"{{ticket_subject}}\"&nbsp;</span><span>and ticket ID</span>: {{ticket_id}}.</div><br>\r\n    <div><span>We have carefully reviewed your inquiry, and we are pleased to provide you with the following\r\n            response</span><span>:</span></div><br>\r\n    <div>{{reply}}</div><br>\r\n    <div><span>If you have any further questions or need additional assistance, please feel free to reply by clicking on\r\n            the following link</span>: <a href=\"{{link}}\" title=\"\" target=\"_blank\">{{link}}</a><span>. This link will take you to\r\n            the ticket thread where you can provide further information or ask for clarification.</span></div><br>\r\n    <div><span>Thank you for your patience and cooperation as we worked to address your concerns.</span></div>\r\n</div>', 'Thank you for reaching out to us regarding your support ticket with the subject: \"{{ticket_subject}}\" and ticket ID: {{ticket_id}}. We have carefully reviewed your inquiry. To check the response, please go to the following link: {{link}}', 'Re: {{ticket_subject}} - Ticket #{{ticket_id}}', '{\"ticket_id\":\"ID of the support ticket\",\"ticket_subject\":\"Subject  of the support ticket\",\"reply\":\"Reply made by the admin\",\"link\":\"URL to view the support ticket\"}', 1, '{{site_name}} Support Team', NULL, 1, NULL, 0, '2021-11-03 12:00:00', '2024-05-08 07:26:06'),
(15, 'DEFAULT', 'Default Template', '{{subject}}', '{{subject}}', '{{message}}', '{{message}}', '{{message}}', '{\"subject\":\"Subject\",\"message\":\"Message\"}', 1, NULL, NULL, 1, NULL, 1, '2019-09-14 13:14:22', '2024-05-16 01:32:53'),
(18, 'DONOR_CONTACT', 'Contact Donor', 'Contact Donor', 'Contact Donor', '<p>\r\n{{name}} <br>\r\n{{email}} <br>\r\n{{message}}\r\n<br>\r\n</p>', '{{name}} {{email}} {{message}}', '{{name}} {{email}} {{message}}', '{\"name\" : \"Visitor Name\",\"email\": \"Visitor Email\", \"message\": \"Message\"}', 1, '{{site_name}}', NULL, 1, NULL, 0, '2024-07-28 08:37:00', '2024-07-28 08:37:00');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tempname` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'template name',
  `secs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `seo_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `slug`, `tempname`, `secs`, `seo_content`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'Home', '/', 'templates.basic.', '[\"blood\",\"about\",\"donor\",\"overview\",\"latest_donor\",\"how_it_work\",\"featured_donor\",\"patner\",\"testimonial\",\"blog\"]', '{\"image\":\"663212c9551ed1714557641.png\",\"description\":\"Et recusandae Minus\",\"social_title\":null,\"social_description\":\"Odit magna eos cons\",\"keywords\":null}', 1, '2020-07-11 06:23:58', '2024-07-17 07:24:35'),
(2, 'About', 'about', 'templates.basic.', '[\"about\",\"blog\"]', NULL, 0, '2024-07-16 06:37:33', '2024-07-27 08:18:29'),
(4, 'Blog', 'blog', 'templates.basic.', NULL, NULL, 1, '2020-10-22 01:14:43', '2024-07-17 05:12:59'),
(5, 'Contact', 'contact', 'templates.basic.', NULL, NULL, 1, '2020-10-22 01:14:53', '2020-10-22 01:14:53');

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` bigint UNSIGNED NOT NULL,
  `email` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_attachments`
--

CREATE TABLE `support_attachments` (
  `id` bigint UNSIGNED NOT NULL,
  `support_message_id` int UNSIGNED NOT NULL DEFAULT '0',
  `attachment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_messages`
--

CREATE TABLE `support_messages` (
  `id` bigint UNSIGNED NOT NULL,
  `support_ticket_id` int UNSIGNED NOT NULL DEFAULT '0',
  `admin_id` int UNSIGNED NOT NULL DEFAULT '0',
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int DEFAULT '0',
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ticket` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: Open, 1: Answered, 2: Replied, 3: Closed',
  `priority` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 = Low, 2 = medium, 3 = heigh',
  `last_reply` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `update_logs`
--

CREATE TABLE `update_logs` (
  `id` bigint UNSIGNED NOT NULL,
  `version` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_log` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `update_logs`
--

INSERT INTO `update_logs` (`id`, `version`, `update_log`, `created_at`, `updated_at`) VALUES
(1, '2.0', '[\r\n\"[ADD] Push Notification\",\r\n\"[ADD] Slug Management for Blogs\",\r\n\"[ADD] SEO Content Management for Blog\",\r\n\"[ADD] Slug Management for Policy Pages\",\r\n\"[ADD] SEO Content Management for Policy Pages\",\r\n\"[ADD] Automatic System Update\",\r\n\"[ADD] Configurable Number of Items Per Page for Pagination\",\r\n\"[ADD] Resend Code Countdown on Verification Pages\",\r\n\"[UPDATE] Admin Dashboard Widget Design\",\r\n\"[UPDATE] Notification Sending Process\",\r\n\"[UPDATE] User Experience of the Admin Sidebar\",\r\n\"[UPDATE] Improved Menu Searching Functionality on the Admin Panel\",\r\n\"[UPDATE] User Experience of the Select Fields of the Admin Panel\",\r\n\"[UPDATE] Centralized Settings System\",\r\n\"[UPDATE] Form Generator UI on the Admin Panel\",\r\n\"[UPDATE] Google Analytics Script\",\r\n\"[UPDATE] Notification Toaster UI\",\r\n\"[UPDATE] Support Ticket Attachment Upload UI\",\r\n\"[UPDATE] Notification Template Content Configuration\",\r\n\"[UPDATE] Configurable Email From Name and Address for Each Template\",\r\n\"[UPDATE] Configurable SMS From for Each Template\",\r\n\"[UPDATE] Overall User Interface of the Admin Panel\",\r\n\"[PATCH] Laravel 11\",\r\n\"[PATCH] PHP 8.3\",\r\n\"[PATCH] Latest System Patch\",\r\n\"[PATCH] Latest Security Patch\"\r\n]', '2024-07-28 10:45:25', '2024-07-28 10:45:25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`,`username`);

--
-- Indexes for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `advertisements`
--
ALTER TABLE `advertisements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bloods`
--
ALTER TABLE `bloods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `donors`
--
ALTER TABLE `donors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`,`phone`);

--
-- Indexes for table `extensions`
--
ALTER TABLE `extensions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `forms`
--
ALTER TABLE `forms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `frontends`
--
ALTER TABLE `frontends`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_logs`
--
ALTER TABLE `notification_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_templates`
--
ALTER TABLE `notification_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_attachments`
--
ALTER TABLE `support_attachments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_messages`
--
ALTER TABLE `support_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `update_logs`
--
ALTER TABLE `update_logs`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `advertisements`
--
ALTER TABLE `advertisements`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bloods`
--
ALTER TABLE `bloods`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `donors`
--
ALTER TABLE `donors`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `extensions`
--
ALTER TABLE `extensions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `forms`
--
ALTER TABLE `forms`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `frontends`
--
ALTER TABLE `frontends`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification_logs`
--
ALTER TABLE `notification_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification_templates`
--
ALTER TABLE `notification_templates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_attachments`
--
ALTER TABLE `support_attachments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_messages`
--
ALTER TABLE `support_messages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `update_logs`
--
ALTER TABLE `update_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
