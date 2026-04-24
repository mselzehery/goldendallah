-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 24, 2026 at 03:42 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `golden_dallah_local_hotel1`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` int(11) NOT NULL,
  `actorUserId` int(11) DEFAULT NULL,
  `actorName` varchar(255) DEFAULT NULL,
  `action` varchar(100) NOT NULL,
  `entityType` varchar(100) NOT NULL,
  `entityId` varchar(100) DEFAULT NULL,
  `details` text DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_logs`
--

INSERT INTO `activity_logs` (`id`, `actorUserId`, `actorName`, `action`, `entityType`, `entityId`, `details`, `createdAt`) VALUES
(282, 1, 'جولدن دلة', 'login', 'auth', '1', 'Admin login via username golden@dallah', '2026-04-24 13:31:34');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `bookingRef` varchar(20) NOT NULL,
  `roomId` int(11) NOT NULL,
  `guestName` varchar(255) NOT NULL,
  `guestEmail` varchar(320) NOT NULL,
  `guestPhone` varchar(30) DEFAULT NULL,
  `guestNationality` varchar(100) DEFAULT NULL,
  `checkIn` datetime NOT NULL,
  `checkOut` datetime NOT NULL,
  `adults` int(11) NOT NULL DEFAULT 1,
  `children` int(11) NOT NULL DEFAULT 0,
  `totalNights` int(11) NOT NULL,
  `totalPrice` decimal(10,2) NOT NULL,
  `status` enum('pending','confirmed','cancelled','completed') NOT NULL DEFAULT 'pending',
  `specialRequests` text DEFAULT NULL,
  `internalNotes` text DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `customer_notifications`
--

CREATE TABLE `customer_notifications` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `bookingId` int(11) DEFAULT NULL,
  `type` varchar(64) NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `isRead` tinyint(1) NOT NULL DEFAULT 0,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `readAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_notifications`
--

INSERT INTO `customer_notifications` (`id`, `userId`, `bookingId`, `type`, `title`, `message`, `isRead`, `createdAt`, `readAt`) VALUES
(1, 420005, NULL, 'password_reset', 'طلب استعادة كلمة المرور', 'تم إنشاء رابط جديد لاستعادة كلمة المرور. ينتهي هذا الرابط في ٣٠‏/٣‏/٢٠٢٦، ٧:٢٧:٣١ ص.', 1, '2026-03-30 06:57:31', '2026-03-30 04:10:08'),
(2, 420005, 210010, 'booking_confirmed', 'تم تأكيد الحجز', 'تم تأكيد حجزك رقم 2603300656536219. نتطلع لاستقبالك في الفندق.', 1, '2026-03-30 07:10:31', '2026-03-30 04:12:19'),
(3, 420005, 210011, 'booking_confirmed', 'تم تأكيد الحجز', 'تم تأكيد حجزك رقم 2603300710524058. نتطلع لاستقبالك في الفندق.', 1, '2026-03-30 07:11:08', '2026-03-30 04:12:19'),
(4, 420005, 210012, 'booking_confirmed', 'تم تأكيد الحجز', 'تم تأكيد حجزك رقم 2603300711564459. نتطلع لاستقبالك في الفندق.', 1, '2026-03-30 07:12:05', '2026-03-30 04:12:19'),
(5, 1, 210007, 'booking_cancelled', 'تم إلغاء الحجز', 'تم تحديث الحجز رقم GD-1FZNK_7G إلى حالة ملغي. إذا كان هذا غير متوقع، يرجى التواصل مع الفندق.', 0, '2026-03-30 07:46:47', NULL),
(6, 1, 210008, 'booking_completed', 'اكتمل الحجز', 'شكرًا لإقامتك معنا. تم إغلاق الحجز رقم 2603300549371565 بنجاح.', 0, '2026-03-30 07:46:50', NULL),
(7, 420005, 210010, 'booking_completed', 'اكتمل الحجز', 'شكرًا لإقامتك معنا. تم إغلاق الحجز رقم 2603300656536219 بنجاح.', 1, '2026-03-30 07:46:52', '2026-03-30 04:57:44'),
(8, 420005, 210011, 'booking_completed', 'اكتمل الحجز', 'شكرًا لإقامتك معنا. تم إغلاق الحجز رقم 2603300710524058 بنجاح.', 1, '2026-03-30 07:46:53', '2026-03-30 04:57:44'),
(9, 420005, 210012, 'booking_completed', 'اكتمل الحجز', 'شكرًا لإقامتك معنا. تم إغلاق الحجز رقم 2603300711564459 بنجاح.', 1, '2026-03-30 07:46:54', '2026-03-30 04:57:44'),
(10, 420005, 210015, 'booking_confirmed', 'تم تأكيد الحجز', 'تم تأكيد حجزك رقم 2603300757368026. نتطلع لاستقبالك في الفندق.', 1, '2026-03-30 07:59:53', '2026-03-30 04:59:56'),
(11, 420005, NULL, 'password_reset', 'طلب استعادة كلمة المرور', 'تم إنشاء رابط جديد لاستعادة كلمة المرور. ينتهي هذا الرابط في ٣٠‏/٣‏/٢٠٢٦، ٨:٣٩:٠٨ ص.', 1, '2026-03-30 08:09:08', '2026-03-30 05:11:46'),
(12, 420005, 210015, 'booking_completed', 'اكتمل الحجز', 'شكرًا لإقامتك معنا. تم إغلاق الحجز رقم 2603300757368026 بنجاح.', 1, '2026-03-30 08:14:45', '2026-03-30 05:18:20'),
(13, 420005, 210014, 'booking_confirmed', 'تم تأكيد الحجز', 'تم تأكيد حجزك رقم 2603300749125914. نتطلع لاستقبالك في الفندق.', 1, '2026-03-30 08:14:46', '2026-03-30 05:18:20'),
(14, 420005, 210014, 'booking_completed', 'اكتمل الحجز', 'شكرًا لإقامتك معنا. تم إغلاق الحجز رقم 2603300749125914 بنجاح.', 1, '2026-03-30 08:14:47', '2026-03-30 05:18:20'),
(15, 420005, 210013, 'booking_confirmed', 'تم تأكيد الحجز', 'تم تأكيد حجزك رقم 2603300748096983. نتطلع لاستقبالك في الفندق.', 1, '2026-03-30 08:14:47', '2026-03-30 05:18:20'),
(16, 420005, 210013, 'booking_completed', 'اكتمل الحجز', 'شكرًا لإقامتك معنا. تم إغلاق الحجز رقم 2603300748096983 بنجاح.', 1, '2026-03-30 08:14:49', '2026-03-30 05:18:20'),
(17, 420005, NULL, 'password_reset', 'طلب استعادة كلمة المرور', 'تم إنشاء رابط جديد لاستعادة كلمة المرور. ينتهي هذا الرابط في ٣٠‏/٣‏/٢٠٢٦، ٨:٤٧:١٩ ص.', 1, '2026-03-30 08:17:19', '2026-03-30 05:18:20'),
(18, 420005, NULL, 'password_reset', 'طلب استعادة كلمة المرور', 'تم إنشاء رابط جديد لاستعادة كلمة المرور. ينتهي هذا الرابط في ٤‏/٤‏/٢٠٢٦، ١٢:٣٣:٢٣ ص.', 1, '2026-04-04 00:03:23', '2026-04-03 21:04:52'),
(19, 420005, 210026, 'booking_confirmed', 'تم تأكيد الحجز', 'تم تأكيد حجزك رقم 2604040215105328. نتطلع لاستقبالك في الفندق.', 1, '2026-04-04 02:16:35', '2026-04-03 23:17:03'),
(20, 420005, 210028, 'booking_confirmed', 'تم تأكيد الحجز', 'تم تأكيد حجزك رقم 2604040240073211. نتطلع لاستقبالك في الفندق.', 1, '2026-04-04 02:40:57', '2026-04-04 00:16:18'),
(21, 420005, 210028, 'booking_completed', 'اكتمل الحجز', 'شكرًا لإقامتك معنا. تم إغلاق الحجز رقم 2604040240073211 بنجاح.', 1, '2026-04-04 02:42:14', '2026-04-04 00:16:18'),
(22, 1, 210029, 'booking_confirmed', 'تم تأكيد الحجز', 'تم تأكيد حجزك رقم 2604040243599008. نتطلع لاستقبالك في الفندق.', 0, '2026-04-04 02:44:58', NULL),
(23, 1, 210029, 'booking_completed', 'اكتمل الحجز', 'شكرًا لإقامتك معنا. تم إغلاق الحجز رقم 2604040243599008 بنجاح.', 0, '2026-04-04 02:46:27', NULL),
(24, 420005, NULL, 'password_reset', 'طلب استعادة كلمة المرور', 'تم إنشاء رابط جديد لاستعادة كلمة المرور. ينتهي هذا الرابط في ٤‏/٤‏/٢٠٢٦، ٣:٢٧:٢٦ ص.', 1, '2026-04-04 02:57:26', '2026-04-04 00:16:18'),
(25, 1, 210030, 'booking_cancelled', 'تم إلغاء الحجز', 'تم تحديث الحجز رقم 2604040252458785 إلى حالة ملغي. إذا كان هذا غير متوقع، يرجى التواصل مع الفندق.', 0, '2026-04-04 03:03:20', NULL),
(26, 1, 210032, 'booking_confirmed', 'تم تأكيد الحجز', 'تم تأكيد حجزك رقم 2604040322389489. نتطلع لاستقبالك في الفندق.', 0, '2026-04-05 04:41:10', NULL),
(27, 1, 210032, 'booking_completed', 'اكتمل الحجز', 'شكرًا لإقامتك معنا. تم إغلاق الحجز رقم 2604040322389489 بنجاح.', 0, '2026-04-05 04:41:41', NULL),
(28, 1, 210039, 'booking_completed', 'اكتمل الحجز', 'شكرًا لإقامتك معنا. تم إغلاق الحجز رقم 26040611044124 بنجاح.', 0, '2026-04-06 02:26:28', NULL),
(29, 1, 210046, 'booking_completed', 'اكتمل الحجز', 'شكرًا لإقامتك معنا. تم إغلاق الحجز رقم 26040633646517 بنجاح.', 0, '2026-04-06 05:11:55', NULL),
(30, 1, 210046, 'booking_completed', 'اكتمل الحجز', 'شكرًا لإقامتك معنا. تم إغلاق الحجز رقم 26040633646517 بنجاح.', 0, '2026-04-06 05:11:57', NULL),
(31, 1, 210047, 'booking_completed', 'اكتمل الحجز', 'شكرًا لإقامتك معنا. تم إغلاق الحجز رقم 26040697000970 بنجاح.', 0, '2026-04-06 05:13:26', NULL),
(32, 420005, NULL, 'password_reset', 'طلب استعادة كلمة المرور', 'تم إنشاء رابط جديد لاستعادة كلمة المرور. ينتهي هذا الرابط في ٦‏/٤‏/٢٠٢٦، ٥:٤٤:٠٨ ص.', 1, '2026-04-06 05:14:08', '2026-04-10 13:26:25'),
(33, 420010, NULL, 'booking_pending', 'تم إنشاء الحجز', 'تم إنشاء حجزك رقم 26040912855887. يرجى إتمام عملية الدفع لتأكيد الحجز.', 1, '2026-04-09 02:47:55', '2026-04-08 23:48:07'),
(34, 1, 210052, 'booking_confirmed', 'تم تأكيد الحجز', 'تم تأكيد حجزك رقم 26040912996336. نتطلع لاستقبالك في الفندق.', 0, '2026-04-09 03:23:13', NULL),
(35, 1, 210053, 'booking_confirmed', 'تم تأكيد الحجز', 'تم تأكيد حجزك رقم 26040921780990. نتطلع لاستقبالك في الفندق.', 0, '2026-04-10 00:35:38', NULL),
(36, 1, 210053, 'booking_completed', 'اكتمل الحجز', 'شكرًا لإقامتك معنا. تم إغلاق الحجز رقم 26040921780990 بنجاح.', 0, '2026-04-10 00:35:49', NULL),
(37, 1, 210054, 'booking_confirmed', 'تم تأكيد الحجز', 'تم تأكيد حجزك رقم 26041017765312. نتطلع لاستقبالك في الفندق.', 0, '2026-04-10 00:41:42', NULL),
(38, 1, 210054, 'booking_completed', 'اكتمل الحجز', 'شكرًا لإقامتك معنا. تم إغلاق الحجز رقم 26041017765312 بنجاح.', 0, '2026-04-10 00:42:04', NULL),
(39, 1, 210055, 'booking_confirmed', 'تم تأكيد الحجز', 'تم تأكيد حجزك رقم 26041097513188. نتطلع لاستقبالك في الفندق.', 0, '2026-04-10 00:45:21', NULL),
(40, 1, 210055, 'booking_completed', 'اكتمل الحجز', 'شكرًا لإقامتك معنا. تم إغلاق الحجز رقم 26041097513188 بنجاح.', 0, '2026-04-10 00:45:40', NULL),
(41, 1, 210056, 'booking_confirmed', 'تم تأكيد الحجز', 'تم تأكيد حجزك رقم 26041062253024. نتطلع لاستقبالك في الفندق.', 0, '2026-04-10 00:46:47', NULL),
(42, 1, 210056, 'booking_completed', 'اكتمل الحجز', 'شكرًا لإقامتك معنا. تم إغلاق الحجز رقم 26041062253024 بنجاح.', 0, '2026-04-10 00:46:58', NULL),
(43, 1, 1, 'booking_confirmed', 'تم تأكيد الحجز', 'تم تأكيد حجزك رقم 26041058759371. نتطلع لاستقبالك في الفندق.', 0, '2026-04-10 03:17:34', NULL),
(44, 1, 1, 'booking_completed', 'اكتمل الحجز', 'شكرًا لإقامتك معنا. تم إغلاق الحجز رقم 26041058759371 بنجاح.', 0, '2026-04-10 03:18:07', NULL),
(45, 1, 2, 'booking_cancelled', 'تم إلغاء الحجز', 'تم تحديث الحجز رقم 26041009107085 إلى حالة ملغي. إذا كان هذا غير متوقع، يرجى التواصل مع الفندق.', 0, '2026-04-10 03:19:56', NULL),
(46, 1, 3, 'booking_confirmed', 'تم تأكيد الحجز', 'تم تأكيد حجزك رقم 26041038240197. نتطلع لاستقبالك في الفندق.', 0, '2026-04-10 03:27:46', NULL),
(47, 1, 3, 'booking_completed', 'اكتمل الحجز', 'شكرًا لإقامتك معنا. تم إغلاق الحجز رقم 26041038240197 بنجاح.', 0, '2026-04-10 03:28:07', NULL),
(48, 1, 1, 'booking_cancelled', 'تم إلغاء الحجز', 'تم تحديث الحجز رقم 26041020324129 إلى حالة ملغي. إذا كان هذا غير متوقع، يرجى التواصل مع الفندق.', 0, '2026-04-10 07:20:56', NULL),
(49, 1, 3, 'booking_confirmed', 'تم تأكيد الحجز', 'تم تأكيد حجزك رقم 26041114776684. نتطلع لاستقبالك في الفندق.', 0, '2026-04-11 03:54:59', NULL),
(50, 1, 2, 'booking_cancelled', 'تم إلغاء الحجز', 'تم تحديث الحجز رقم 26041090830261 إلى حالة ملغي. إذا كان هذا غير متوقع، يرجى التواصل مع الفندق.', 0, '2026-04-11 03:55:16', NULL),
(51, 420005, NULL, 'password_reset', 'طلب استعادة كلمة المرور', 'تم إنشاء رابط جديد لاستعادة كلمة المرور. ينتهي هذا الرابط في ١٨‏/٤‏/٢٠٢٦، ٤:٣٥:٥٩ ص.', 1, '2026-04-18 04:05:59', '2026-04-18 01:06:26'),
(52, 420003, 2, 'booking_confirmed', 'تم تأكيد الحجز', 'تم تأكيد حجزك رقم 0002. نتطلع لاستقبالك في الفندق.', 0, '2026-04-18 06:50:47', NULL),
(53, 1, 4, 'booking_confirmed', 'تم تأكيد الحجز', 'تم تأكيد حجزك رقم 0004. نتطلع لاستقبالك في الفندق.', 0, '2026-04-18 06:51:19', NULL),
(54, 1, 4, 'booking_completed', 'اكتمل الحجز', 'شكرًا لإقامتك معنا. تم إغلاق الحجز رقم 0004 بنجاح.', 0, '2026-04-18 06:51:37', NULL),
(55, 420005, NULL, 'password_reset', 'طلب استعادة كلمة المرور', 'تم إنشاء رابط جديد لاستعادة كلمة المرور. ينتهي هذا الرابط في ١٨‏/٤‏/٢٠٢٦، ٨:٢١:٤٤ ص.', 0, '2026-04-18 07:51:44', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_reviews`
--

CREATE TABLE `customer_reviews` (
  `id` int(11) NOT NULL,
  `guestName` varchar(255) NOT NULL,
  `guestRoleAr` varchar(255) DEFAULT NULL,
  `guestRoleEn` varchar(255) DEFAULT NULL,
  `reviewTextAr` text DEFAULT NULL,
  `reviewTextEn` text DEFAULT NULL,
  `rating` int(11) NOT NULL DEFAULT 5,
  `avatarImageUrl` text DEFAULT NULL,
  `sortOrder` int(11) NOT NULL DEFAULT 0,
  `isActive` tinyint(1) NOT NULL DEFAULT 1,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer_reviews`
--

INSERT INTO `customer_reviews` (`id`, `guestName`, `guestRoleAr`, `guestRoleEn`, `reviewTextAr`, `reviewTextEn`, `rating`, `avatarImageUrl`, `sortOrder`, `isActive`, `createdAt`, `updatedAt`) VALUES
(2, 'Shatha Almehmadi', 'زائر', 'visitor', 'الفندق نضيف جدا يستحق تكرار الزيارة ⭐️ ⭐️ ⭐️ ⭐️\nو تعامل موظف الاستقبال مميز\nالموقع متوفر بنفس الشارع مطاعم وكافيهات متنوعة.\n', 'The hotel is very clean, worth a repeat visit ⭐️ ⭐️ ⭐️ ⭐️\nThe receptionist\'s behavior is exceptional\nThe location has various restaurants and cafes available on the same street.', 5, '', 1, 1, '2026-04-09 21:04:07', '2026-04-19 07:42:50'),
(3, 'محمد العياف', 'زائر', 'visitor', 'كانت الزياره الأولى  للفندق. وراح اعتمده صراحه إذا استمرو على النظافه والترتيب لهاذا الفندق\n', 'It was the first visit to the hotel. I would honestly adopt it if they continued the cleanliness and tidiness of this hotel', 5, ' ', 2, 1, '2026-04-09 21:05:35', '2026-04-19 07:42:34'),
(4, 'MUHAMMAD ABDALLAH', 'عائلة', 'family', 'فندق نظيف وقريب من شارع البخاري وعدد كبير من المطاعم والمقاهي. وأشكر العاملين فيه على حسن استقبالهم.', 'Clean hotel, close to Al-Bukhari Street and a large number of restaurants and cafes.\nI thank the staff for their warm reception.', 5, ' ', 3, 1, '2026-04-09 21:07:54', '2026-04-19 07:42:37'),
(5, '  رافع قصه Rafie Gessa', 'مهندس', 'engineer', 'فندق رائع بكل معنى الكلمة\nالموقع مثالي، خطوات من المحلات والمطاعم والكافيهات اللي تحبها. استقبال الموظفين راقي جددداً وعفوي وأخوي، (تعامل راقي بجد).\nالغرف نظيفة ومرتبة بشكل جميل، والأسعار معقولة مقارنة بالخدمة .\n\nللأمانة أنا نزلت فيه أكثر من مرة في أوقات مختلفة ومواسم مختلفة. الصراحة الفندق يعطيك شعور إنك ضيف عزيز عند أصحابك .\nأنصح فيه بشدة لكل اللي يدورون على راحة حقيقية مع تعامل كويس.\n\nما راح تندمون\n', 'A wonderful hotel in every sense of the word\nThe location is ideal, steps from Taghreer and the cafes you love. Receiving new employees in a spontaneous and brotherly manner (sophisticated and serious treatment).\nClean and beautifully arranged rooms, reasonable prices for the service.\n\nThe queen who stayed there more than once in different seasons. Honestly, the hotel gives you a guest that you are dear to your friends.\nI recommend starting out all soft on a real break with some goodies.\n\nYou won\'t regret it', 5, ' ', 4, 1, '2026-04-10 03:48:02', '2026-04-19 07:42:43');

-- --------------------------------------------------------

--
-- Table structure for table `facilities`
--

CREATE TABLE `facilities` (
  `id` int(11) NOT NULL,
  `nameAr` varchar(255) NOT NULL,
  `nameEn` varchar(255) NOT NULL,
  `descriptionAr` text DEFAULT NULL,
  `descriptionEn` text DEFAULT NULL,
  `category` enum('dining','wellness','recreation','business','services') NOT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `imageUrl` text DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT 1,
  `sortOrder` int(11) NOT NULL DEFAULT 0,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `facilities`
--

INSERT INTO `facilities` (`id`, `nameAr`, `nameEn`, `descriptionAr`, `descriptionEn`, `category`, `icon`, `imageUrl`, `isActive`, `sortOrder`, `createdAt`) VALUES
(6, 'خدمة الكونسيرج', 'Concierge Service', 'فريق كونسيرج متخصص متاح على مدار الساعة لتلبية جميع احتياجاتكم', 'Specialized concierge team available 24/7 to meet all your needs', 'services', 'BellRing', NULL, 1, 6, '2026-03-12 04:04:37'),
(7, 'مواقف السيارات', 'Valet Parking', 'خدمة صف السيارات المجانية ', 'Free valet parking service', 'services', 'Car', NULL, 1, 7, '2026-03-12 04:04:37'),
(8, 'إنترنت مجاني', 'Free internet', 'إنترنت قوي', 'Strong internet', 'services', 'wifi', NULL, 1, 8, '2026-03-12 04:04:37'),
(30004, 'غسيل ملابس', 'Laundry', 'غسيل وكي ملابس', 'Washing and ironing clothes', 'services', 'laundry', NULL, 1, 5, '2026-04-18 01:13:45');

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `id` int(11) NOT NULL,
  `titleAr` varchar(255) DEFAULT NULL,
  `titleEn` varchar(255) DEFAULT NULL,
  `imageUrl` text NOT NULL,
  `category` enum('lobby','rooms','dining','pool','spa','exterior','events') NOT NULL DEFAULT 'lobby',
  `sortOrder` int(11) NOT NULL DEFAULT 0,
  `isActive` tinyint(1) NOT NULL DEFAULT 1,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`id`, `titleAr`, `titleEn`, `imageUrl`, `category`, `sortOrder`, `isActive`, `createdAt`) VALUES
(1, 'لوبي الإستقبال', 'Luxury Hotel Lobby', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/312396066.jpg?k=a735b8a11b649f733f68e626853968eef6ae04ea2311c950042f4680edf6dd98&o=', 'lobby', 1, 1, '2026-03-12 04:04:38'),
(2, 'لوبي الاستقبال', 'Reception Lobby', '/reception.jpg', 'lobby', 2, 1, '2026-03-12 04:04:38'),
(3, 'لوبي الغرف', 'Crystal Lobby', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/736231349.jpg?k=9c4cd92d8871c2542e957674c76d44b24af3d65921fab8e92c555e88ec7295a9&o=', 'lobby', 3, 1, '2026-03-12 04:04:38'),
(4, 'غرفة مزدوجة', 'Royal Suite', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/736233887.jpg?k=e473c276126b9c57fd27f310cbaa7b60eee72ccab8af610b5f4bbcdaa9a0b50c&o=', 'rooms', 1, 1, '2026-03-12 04:04:38'),
(5, 'غرفة وصالة', 'Deluxe Room', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/736231324.jpg?k=91fb0ac09a4dccd53b2f6906e46d22556e5efd6163f148346417823e4f6d8fae&o=', 'rooms', 2, 1, '2026-03-12 04:04:38'),
(6, 'جناح عائلي', 'King Room', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/736233833.jpg?k=33eb6498cb852fe934910c23d1c9eee04b482e21ec0df78b4206903ca9b8265a&o=', 'rooms', 3, 1, '2026-03-12 04:04:38'),
(12, 'واجهة الفندق', 'Hotel Exterior', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/736231250.jpg?k=29304b9867dcd112a89fadfca8c5fda1c508f42df0b062728113c18287479164&o=', 'exterior', 1, 1, '2026-03-12 04:04:38');

-- --------------------------------------------------------

--
-- Table structure for table `hotel_settings`
--

CREATE TABLE `hotel_settings` (
  `id` int(11) NOT NULL,
  `hotelNameAr` varchar(255) NOT NULL DEFAULT 'جولدن دلة',
  `hotelNameEn` varchar(255) NOT NULL DEFAULT 'Golden Dallah',
  `supportEmail` varchar(320) DEFAULT NULL,
  `supportPhone` varchar(30) DEFAULT NULL,
  `whatsappNumber` varchar(30) DEFAULT NULL,
  `addressAr` text DEFAULT NULL,
  `addressEn` text DEFAULT NULL,
  `checkInTime` varchar(20) NOT NULL DEFAULT '14:00',
  `checkOutTime` varchar(20) NOT NULL DEFAULT '12:00',
  `notificationEmail` varchar(320) DEFAULT NULL,
  `notificationWhatsapp` varchar(30) DEFAULT NULL,
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hotel_settings`
--

INSERT INTO `hotel_settings` (`id`, `hotelNameAr`, `hotelNameEn`, `supportEmail`, `supportPhone`, `whatsappNumber`, `addressAr`, `addressEn`, `checkInTime`, `checkOutTime`, `notificationEmail`, `notificationWhatsapp`, `updatedAt`) VALUES
(1, 'جولدن دلة', 'Golden Dallah', 'goldendallah9@gmail.com', '0163269881', '552633372', 'بريدة حي الريان طريق عمر بن سليم', 'Buraidah, Al Rayyan District, Omar Bin Salim Road', '14:00', '12:00', 'goldendallah9@gmail.com', '0163269881', '2026-04-10 01:58:27');

-- --------------------------------------------------------

--
-- Table structure for table `inquiries`
--

CREATE TABLE `inquiries` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(320) NOT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` text NOT NULL,
  `status` enum('new','read','replied') NOT NULL DEFAULT 'new',
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `email` varchar(320) NOT NULL,
  `token` varchar(128) NOT NULL,
  `expiresAt` datetime NOT NULL,
  `usedAt` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`id`, `userId`, `email`, `token`, `expiresAt`, `usedAt`, `createdAt`) VALUES
(1, 420005, 'saadsalem791@gmail.com', 'dAj9v_WspjXvECgUi4Q2GCsDtvZ87AE5UYLd-eKha7bbKksu', '2026-03-30 04:27:31', '2026-03-30 05:09:08', '2026-03-30 06:57:31'),
(2, 420005, 'saadsalem791@gmail.com', '4sal6TtUmf6ROfvINWa-758qMYkrD_OSG0UpK8AVNHPogacG', '2026-03-30 05:39:08', '2026-03-30 05:17:19', '2026-03-30 08:09:08'),
(3, 420005, 'saadsalem791@gmail.com', 'DP899SszV46CutBTi5bQTbdbnyesyQKM5ctvrwd36FLuVMiK', '2026-03-30 05:47:19', '2026-04-03 21:03:23', '2026-03-30 08:17:19'),
(4, 420005, 'saadsalem791@gmail.com', 'u6Rix57KOI4etT7797GBVh0YbARzlSCpGUWZqmIx0WGQT00y', '2026-04-03 21:33:23', '2026-04-03 23:57:26', '2026-04-04 00:03:23'),
(5, 420005, 'saadsalem791@gmail.com', 'ZR3SAELhi0Lee6rxoVwh2Ww3Qtk6imHQSPwQExR_NNBr8pSB', '2026-04-04 00:27:26', '2026-04-06 02:14:08', '2026-04-04 02:57:26'),
(6, 420005, 'saadsalem791@gmail.com', 'Dj6W85pILe2mqy_fUjOiOl2ax4SrPFTkFb137aSTsgVzafjv', '2026-04-06 02:44:08', '2026-04-18 01:05:59', '2026-04-06 05:14:08'),
(7, 420005, 'saadsalem791@gmail.com', '76y5RoPQWGPPWzQS8uh4_3iSZzKF-DMQipT_IvAwjWiyN1CW', '2026-04-18 01:35:59', '2026-04-18 04:51:44', '2026-04-18 04:05:59'),
(8, 420005, 'saadsalem791@gmail.com', 'zmYKtX5CE2HU0G8tBH--OaKjOqFd5Zh_q6OhN4JZo3kfadfe', '2026-04-18 05:21:44', NULL, '2026-04-18 07:51:44');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `bookingId` int(11) NOT NULL,
  `provider` enum('paymob') NOT NULL DEFAULT 'paymob',
  `amount` decimal(10,2) NOT NULL,
  `currency` varchar(10) NOT NULL DEFAULT 'SAR',
  `status` enum('pending','processing','paid','failed','cancelled','refunded') NOT NULL DEFAULT 'pending',
  `merchantOrderId` varchar(120) NOT NULL,
  `providerOrderId` varchar(120) DEFAULT NULL,
  `providerTransactionId` varchar(120) DEFAULT NULL,
  `checkoutUrl` text DEFAULT NULL,
  `failureReason` text DEFAULT NULL,
  `paidAt` timestamp NULL DEFAULT NULL,
  `rawRequest` text DEFAULT NULL,
  `rawResponse` text DEFAULT NULL,
  `rawCallback` text DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_settings`
--

CREATE TABLE `payment_settings` (
  `id` int(11) NOT NULL,
  `provider` enum('paymob') NOT NULL DEFAULT 'paymob',
  `paymobApiKey` text DEFAULT NULL,
  `paymobPublicKey` text DEFAULT NULL,
  `paymobIntegrationId` varchar(100) DEFAULT NULL,
  `paymobIframeId` varchar(100) DEFAULT NULL,
  `paymobHmacSecret` text DEFAULT NULL,
  `paymobBaseUrl` varchar(255) NOT NULL DEFAULT 'https://accept.paymob.com/api',
  `callbackUrl` text DEFAULT NULL,
  `returnUrl` text DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT 0,
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment_settings`
--

INSERT INTO `payment_settings` (`id`, `provider`, `paymobApiKey`, `paymobPublicKey`, `paymobIntegrationId`, `paymobIframeId`, `paymobHmacSecret`, `paymobBaseUrl`, `callbackUrl`, `returnUrl`, `isActive`, `updatedAt`) VALUES
(1, 'paymob', NULL, NULL, NULL, NULL, NULL, 'https://accept.paymob.com/api', NULL, NULL, 0, '2026-04-06 01:07:31');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `nameAr` varchar(255) NOT NULL,
  `nameEn` varchar(255) NOT NULL,
  `descriptionAr` text DEFAULT NULL,
  `descriptionEn` text DEFAULT NULL,
  `type` enum('junior-suite','studio','family-suite','accessible') NOT NULL DEFAULT 'junior-suite',
  `pricePerNight` decimal(10,2) NOT NULL,
  `inventoryCount` int(11) NOT NULL DEFAULT 1,
  `capacity` int(11) NOT NULL DEFAULT 2,
  `size` int(11) DEFAULT NULL,
  `floor` int(11) DEFAULT NULL,
  `imageUrl` text DEFAULT NULL,
  `images` text DEFAULT NULL,
  `amenities` text DEFAULT NULL,
  `isAvailable` tinyint(1) NOT NULL DEFAULT 1,
  `isFeatured` tinyint(1) NOT NULL DEFAULT 0,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `nameAr`, `nameEn`, `descriptionAr`, `descriptionEn`, `type`, `pricePerNight`, `inventoryCount`, `capacity`, `size`, `floor`, `imageUrl`, `images`, `amenities`, `isAvailable`, `isFeatured`, `createdAt`, `updatedAt`) VALUES
(150034, 'غرفة ستوديو', 'Studio Room', ' لوازم استحمام مجانية دش رداء حمّام صندوق أمانات شطافة خدمة البث (مثل Netflix) مرحاض مناشف بياضات أسرّة أدوات تنظيف تلفزيون نعال ثلاجة هاتف قنوات فضائية مكواة ميكروويف تدفئة مجفف شعر مناشف / بياضات (بتكلفة إضافية) غلاية كهربائية خدمة إيقاظ ساعة منبّهة خزانة منطقة لتناول الطعام يمكن الوصول إلى الطوابق العلوية عن طريق المصعد يمكن الوصول إلى الطوابق العليا عن طريق السلالم فقط حمّالة ملابس ورق حمام ملائمة لذوي الاحتياجات السمعية الخاصة', ' Free toiletries Shower Bathrobe Safety deposit box Bidet Streaming service (e.g. Netflix) Toilet Towels Linen Cleaning supplies TV Slippers Refrigerator Telephone Satellite channels Iron Microwave Heating Hairdryer Towels/linens (surcharge) Electric kettle Wake-up service Alarm clock Wardrobe Dining area Upper floors accessible by elevator Upper floors accessible by stairs only Clothes rack Toilet paper Suitable for people with special hearing needs', 'studio', 200.00, 4, 2, 30, 2, 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/312396756.jpg?k=88ea188ead04b12279c38710405436a2281e7d3155913b41ab74cdeb36f70b0d&o=', NULL, '[{\"ar\":\"واي فاي\",\"en\":\"Wi-Fi\"},{\"ar\":\"مواقف سيارات\",\"en\":\"parking\"},{\"ar\":\"خدمة نظافة يومي\",\"en\":\"daily cleaning service\"}]', 1, 0, '2026-04-03 23:01:12', '2026-04-18 02:20:26'),
(150035, 'جناح جونيور', 'Junior Suite', 'لوازم استحمام مجانية دش رداء حمّام صندوق أمانات شطافة خدمة البث (مثل Netflix) مرحاض مناشف بياضات أسرّة أدوات تنظيف تلفزيون نعال ثلاجة هاتف قنوات فضائية مكواة ميكروويف تدفئة مجفف شعر مناشف / بياضات (بتكلفة إضافية) غلاية كهربائية خدمة إيقاظ ساعة منبّهة خزانة منطقة لتناول الطعام يمكن الوصول إلى الطوابق العلوية عن طريق المصعد يمكن الوصول إلى الطوابق العليا عن طريق السلالم فقط حمّالة ملابس ورق حمام ملائمة لذوي الاحتياجات السمعية الخاصة', 'Free toiletries Shower Bathrobe Safety deposit box Bidet Streaming service (e.g. Netflix) Toilet Towels Linen Cleaning supplies TV Slippers Refrigerator Telephone Satellite channels Iron Microwave Heating Hairdryer Towels/linens (surcharge) Electric kettle Wake-up service Alarm clock Wardrobe Dining area Upper floors accessible by elevator Upper floors accessible by stairs only Clothes rack Toilet paper Suitable for people with special hearing needs', 'junior-suite', 250.00, 1, 3, 30, 3, 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/312397437.jpg?k=3b2e8229cebd176db9dcb0c71966af22bb564ce56188730a9c94cc0c6570c037&o=', NULL, '[{\"ar\":\"واي فاي\",\"en\":\"Wi-Fi\"},{\"ar\":\"مواقف سيارات\",\"en\":\"parking\"},{\"ar\":\"daily cleaning service\",\"en\":\"daily cleaning service\"}]', 1, 1, '2026-04-03 23:01:12', '2026-04-10 04:11:10'),
(150036, 'جناح عائلي', 'Family Suite', 'لوازم استحمام مجانية دش رداء حمّام صندوق أمانات شطافة خدمة البث (مثل Netflix) مرحاض مناشف بياضات أسرّة أدوات تنظيف تلفزيون نعال ثلاجة هاتف قنوات فضائية مكواة ميكروويف تدفئة مجفف شعر مناشف / بياضات (بتكلفة إضافية) غلاية كهربائية خدمة إيقاظ ساعة منبّهة خزانة منطقة لتناول الطعام يمكن الوصول إلى الطوابق العلوية عن طريق المصعد يمكن الوصول إلى الطوابق العليا عن طريق السلالم فقط حمّالة ملابس ورق حمام ملائمة لذوي الاحتياجات السمعية الخاصة', 'Free toiletries Shower Bathrobe Safety deposit box Bidet Streaming service (e.g. Netflix) Toilet Towels Linen Cleaning supplies TV Slippers Refrigerator Telephone Satellite channels Iron Microwave Heating Hairdryer Towels/linens (surcharge) Electric kettle Wake-up service Alarm clock Wardrobe Dining area Upper floors accessible by elevator Upper floors accessible by stairs only Clothes rack Toilet paper Suitable for people with special hearing needs', 'family-suite', 350.00, 1, 5, 40, 3, 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/312397449.jpg?k=fd7f177ba30b0b79aa80c3e54dd8779b1c2f0a8edef3b8ba2396d24fef24f8c2&o=', NULL, '[{\"ar\":\"واي فاي\",\"en\":\"Wi-Fi\"},{\"ar\":\"مواقف سيارات\",\"en\":\"parking\"},{\"ar\":\"خدمة نظافة يومي\",\"en\":\"daily cleaning service\"}]', 1, 1, '2026-04-03 23:01:12', '2026-04-10 04:11:17'),
(150037, 'غرفة ذوي الاحتياجات', 'Accessible Room', 'لوازم استحمام مجانية دش رداء حمّام صندوق أمانات شطافة خدمة البث (مثل Netflix) مرحاض مناشف بياضات أسرّة أدوات تنظيف تلفزيون نعال ثلاجة هاتف قنوات فضائية مكواة ميكروويف تدفئة مجفف شعر مناشف / بياضات (بتكلفة إضافية) غلاية كهربائية خدمة إيقاظ ساعة منبّهة خزانة منطقة لتناول الطعام يمكن الوصول إلى الطوابق العلوية عن طريق المصعد يمكن الوصول إلى الطوابق العليا عن طريق السلالم فقط حمّالة ملابس ورق حمام ملائمة لذوي الاحتياجات السمعية الخاصة', 'Free toiletries Shower Bathrobe Safety deposit box Bidet Streaming service (e.g. Netflix) Toilet Towels Linen Cleaning supplies TV Slippers Refrigerator Telephone Satellite channels Iron Microwave Heating Hairdryer Towels/linens (surcharge) Electric kettle Wake-up service Alarm clock Wardrobe Dining area Upper floors accessible by elevator Upper floors accessible by stairs only Clothes rack Toilet paper Suitable for people with special hearing needs', 'accessible', 200.00, 1, 2, 30, 3, 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/312397018.jpg?k=22d61d08e17e139ad83614c6d8f4bc555094c2472faa0a2847f814e0ccdeb3bd&o=', NULL, '[{\"ar\":\"واي فاي\",\"en\":\"Wi-Fi\"},{\"ar\":\"مواقف سيارات\",\"en\":\"parking\"},{\"ar\":\"خدمة نظافة يومي\",\"en\":\"daily cleaning service\"}]', 1, 0, '2026-04-03 23:01:12', '2026-04-10 04:10:40');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `openId` varchar(64) NOT NULL,
  `name` text DEFAULT NULL,
  `email` varchar(320) DEFAULT NULL,
  `username` varchar(64) DEFAULT NULL,
  `passwordHash` text DEFAULT NULL,
  `loginMethod` varchar(64) DEFAULT NULL,
  `role` enum('user','admin') NOT NULL DEFAULT 'user',
  `isActive` tinyint(1) NOT NULL DEFAULT 1,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `lastSignedIn` timestamp NOT NULL DEFAULT current_timestamp(),
  `dateOfBirth` timestamp NULL DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `openId`, `name`, `email`, `username`, `passwordHash`, `loginMethod`, `role`, `isActive`, `createdAt`, `updatedAt`, `lastSignedIn`, `dateOfBirth`, `phone`) VALUES
(1, 'Sc7yEPXmrhBAQxyLG5ck6Z', 'جولدن دلة', 'goldendallah@gmail.com', 'golden@dallah', 'scrypt$8ac9213ed2f89c9626509dcd4e38e736$cf8d93b71406d307b81b762cceafae7c417ebdb2c2df5886c269697050679cfc83cf11cc8b76c4655dec6bd6eb12859e3d4c108872dd3d6dd754427e7d8c0648', 'password', 'admin', 1, '2026-03-12 04:09:22', '2026-04-24 13:31:34', '2026-04-24 10:31:34', NULL, NULL),
(420003, 'local_admin_2', 'سعد سالم', 'saadwaelsalem@gmail.com', 'saad@salem', 'scrypt$fa64d2b042a85233d55b1518080d0d3b$7a0c8cf395eb3d019f1de05997cb8deb35839adbf916bc0a0cf8e874b2ffe7d7eac1d65ab5ea688d5e7c309b72ff77b89c02da2231884d89b7487daff4c1c38e', 'password', 'admin', 1, '2026-03-30 00:43:34', '2026-04-12 04:31:49', '2026-04-12 01:31:49', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `__drizzle_migrations`
--

CREATE TABLE `__drizzle_migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `hash` text NOT NULL,
  `created_at` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `__drizzle_migrations`
--

INSERT INTO `__drizzle_migrations` (`id`, `hash`, `created_at`) VALUES
(1, '814a08e40d7fc2bcfd458759d18319198ca8ae394f2fa15617a78678e9c9c93b', 1773288040878);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_activity_logs_createdAt` (`createdAt`),
  ADD KEY `idx_activity_logs_actorUserId` (`actorUserId`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bookings_bookingRef_unique` (`bookingRef`);

--
-- Indexes for table `customer_notifications`
--
ALTER TABLE `customer_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_notifications_user_idx` (`userId`),
  ADD KEY `customer_notifications_booking_idx` (`bookingId`);

--
-- Indexes for table `customer_reviews`
--
ALTER TABLE `customer_reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `facilities`
--
ALTER TABLE `facilities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hotel_settings`
--
ALTER TABLE `hotel_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inquiries`
--
ALTER TABLE `inquiries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `password_reset_tokens_token_unique` (`token`),
  ADD KEY `password_reset_tokens_user_idx` (`userId`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payments_merchantOrderId_unique` (`merchantOrderId`);

--
-- Indexes for table `payment_settings`
--
ALTER TABLE `payment_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_openId_unique` (`openId`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `__drizzle_migrations`
--
ALTER TABLE `__drizzle_migrations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=283;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `customer_notifications`
--
ALTER TABLE `customer_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `customer_reviews`
--
ALTER TABLE `customer_reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `facilities`
--
ALTER TABLE `facilities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30005;

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30001;

--
-- AUTO_INCREMENT for table `hotel_settings`
--
ALTER TABLE `hotel_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `inquiries`
--
ALTER TABLE `inquiries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_settings`
--
ALTER TABLE `payment_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150039;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=420011;

--
-- AUTO_INCREMENT for table `__drizzle_migrations`
--
ALTER TABLE `__drizzle_migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=235477;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
