-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 172.29.114.152:3306
-- Generation Time: May 18, 2023 at 11:05 PM
-- Server version: 5.7.42-0ubuntu0.18.04.1
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookbuzz`
--

-- --------------------------------------------------------

--
-- Table structure for table `genres_details`
--

CREATE TABLE `genres_details` (
  `id` int(11) NOT NULL,
  `genre_id` int(11) DEFAULT NULL,
  `genre_name` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `genres_details`
--

INSERT INTO `genres_details` (`id`, `genre_id`, `genre_name`, `createdAt`, `updatedAt`) VALUES
(1, 1, 'Fiction', '2023-05-15 15:05:53', '2023-05-15 15:05:53'),
(2, 2, 'Mystery/Thriller', '2023-05-15 15:06:37', '2023-05-15 15:06:37'),
(3, 3, 'Popular Science', '2023-05-15 15:06:53', '2023-05-15 15:06:53');

-- --------------------------------------------------------

--
-- Table structure for table `historys`
--

CREATE TABLE `historys` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  `is_checkout` tinyint(1) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `historys`
--

INSERT INTO `historys` (`id`, `user_id`, `order_id`, `is_checkout`, `createdAt`, `updatedAt`) VALUES
(55, 2, '18052023/BB0001', 1, '2023-05-18 14:00:36', '2023-05-18 14:00:36'),
(56, 2, '18052023/BB0001', 1, '2023-05-18 14:01:07', '2023-05-18 14:01:07');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orders_details`
--

CREATE TABLE `orders_details` (
  `id` int(11) NOT NULL,
  `order_id` varchar(255) NOT NULL,
  `product_id` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders_details`
--

INSERT INTO `orders_details` (`id`, `order_id`, `product_id`, `quantity`, `createdAt`, `updatedAt`) VALUES
(54, '18052023/BB0001', 'B0005', 2, '2023-05-18 13:52:23', '2023-05-18 13:52:23'),
(55, '18052023/BB0001', 'B0010', 2, '2023-05-18 13:52:23', '2023-05-18 13:52:23'),
(56, '18052023/BB0001', 'B0007', 2, '2023-05-18 13:52:23', '2023-05-18 13:52:23'),
(57, '18052023/BB0001', 'B0005', 2, '2023-05-18 14:00:48', '2023-05-18 14:00:48'),
(58, '18052023/BB0001', 'B0010', 2, '2023-05-18 14:00:48', '2023-05-18 14:00:48'),
(59, '18052023/BB0001', 'B0007', 2, '2023-05-18 14:00:48', '2023-05-18 14:00:48');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `product_id` varchar(255) DEFAULT NULL,
  `title_book` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `genre_id` int(11) DEFAULT NULL,
  `description` text,
  `thumbnail` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `review_id` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_id`, `title_book`, `author`, `genre_id`, `description`, `thumbnail`, `price`, `stock`, `review_id`, `createdAt`, `updatedAt`) VALUES
(1, 'B0001', 'Man Tiger (Lelaki Harimau): A Novel', 'Eka Kurniawan', 1, 'Pada lanskap yang sureal, Margio adalah bocah yang menggiring babi ke dalam perangkap. Namun di sore ketika seharusnya rehat menanti musim perburuan, ia terperosok dalam tragedi pembunuhan paling brutal. Di balik motif-motif yang berhamburan, antara cinta dan pengkhianatan, rasa takut dan berahi, bunga dan darah, ia menyangkal dengan tandas. Bukan aku yang melakukannya, ia berkata dan melanjutkan, Ada harimau di dalam tubuhku.\r\n\r\n', 'https://res.cloudinary.com/dmbmtypco/image/upload/v1684441007/ManTiger_dbyghh.jpg', 10, 52, 1, '2023-05-11 20:49:12', '2023-05-18 07:40:37'),
(2, 'B0002', 'To Kill a Mockingbird', 'Harper Lee', 1, 'To Kill a Mockingbird is both a young girl\'s coming-of-age story and a darker drama about the roots and consequences of racism and prejudice, probing how good and evil can coexist within a single community or individual.', 'https://res.cloudinary.com/dmbmtypco/image/upload/v1684441012/To_Kill_a_Mockingbird__first_edition_cover_nv9lwh.jpg', 15, 41, 2, '2023-05-11 20:50:42', '2023-05-18 07:40:37'),
(3, 'B0003', 'One Hundred Years of Solitude', 'García Márquez', 1, 'One Hundred Years of Solitude is a 1967 novel by Colombian author Gabriel García Márquez that tells the multi-generational story of the Buendía family, whose patriarch, José Arcadio Buendía, founded the fictitious town of Macondo. The novel is often cited as one of the supreme achievements in world literature.', 'https://res.cloudinary.com/dmbmtypco/image/upload/v1684441007/One_Hundred_Years_gdy7et.jpg', 10, 98, 3, '2023-05-11 20:52:10', '2023-05-18 07:40:37'),
(4, 'B0004', 'The Great Gatsby', 'F. Scott Fitzgerald', 1, 'The Great Gatsby is a 1925 novel by American writer F. Scott Fitzgerald. Set in the Jazz Age on Long Island, near New York City, the novel depicts first-person narrator Nick Carraway\'s interactions with mysterious millionaire Jay Gatsby and Gatsby\'s obsession to reunite with his former lover, Daisy Buchanan.', 'https://res.cloudinary.com/dmbmtypco/image/upload/v1684441020/The_Great_Gatsby_Cover_1925_Retouched_yc6gkp.jpg', 20, 100, 4, '2023-05-11 20:53:21', '2023-05-11 20:53:21'),
(5, 'B0005', 'Pride and Prejudice', 'Jane Austen', 1, 'Pride and Prejudice is an 1813 novel of manners by Jane Austen. The novel follows the character development of Elizabeth Bennet, the protagonist of the book, who learns about the repercussions of hasty judgments and comes to appreciate the difference between superficial goodness and actual goodness.', 'https://res.cloudinary.com/dmbmtypco/image/upload/v1684442746/Pride_Prejudice_Jane_Austen_bzfoh1.jpg', 4, 96, 5, '2023-05-11 20:55:06', '2023-05-18 14:01:07'),
(6, 'B0006', 'The Girl with the Dragon Tattoo', 'Stieg Larsson', 2, 'The Girl with the Dragon Tattoo is a psychological thriller novel by Swedish author and journalist Stieg Larsson. It was published posthumously in 2005, translated into English in 2008, and became an international bestseller. The Girl with the Dragon Tattoo is the first book of the Millennium series.', 'https://res.cloudinary.com/dmbmtypco/image/upload/v1684441008/The_Girl_Dragon_Tattoo_fcvfnb.jpg', 8, 100, 6, '2023-05-11 20:57:19', '2023-05-11 20:57:19'),
(7, 'B0007', 'Gone Girl', 'Gillian Flynn', 2, 'Gone Girl is a 2012 crime thriller novel by American writer Gillian Flynn. It was published by Crown Publishing Group in June 2012. The novel was popular and made the New York Times Best Seller list. The sense of suspense in the novel comes from whether Nick Dunne is responsible for the disappearance of his wife Amy.', 'https://res.cloudinary.com/dmbmtypco/image/upload/v1684441009/gone-girl-cover_dkqgri.jpg', 7, 96, 7, '2023-05-11 21:02:48', '2023-05-18 14:01:07'),
(8, 'B0008', 'The Da Vinci Code', 'Dan Brown', 2, 'The Da Vinci Code is a 2003 mystery thriller novel by Dan Brown. It is Brown\'s second novel to include the character Robert Langdon: the first was his 2000 novel Angels & Demons. ', 'https://res.cloudinary.com/dmbmtypco/image/upload/v1684441009/davinci_code_igsg3i.jpg', 25, 100, 8, '2023-05-11 21:04:44', '2023-05-11 21:04:44'),
(9, 'B0009', 'And Then There Were None', 'Agatha Christie', 2, 'And Then There Were None\" is a dramatic adaptation of the best-selling crime novel by Agatha Christie. The story follows 10 strangers who receive an unusual invitation to a solitary mansion based remotely off Britain\'s Devon Coast. Among the guests is an unstable doctor, an anxious businessman, an irresponsible playboy, and a governess with a secret. Cut off from the outside world, the group arrives at its destination, only to find that darkness awaits them. As people start to mysteriously die, the members of the group realize there is a killer among them.', 'https://res.cloudinary.com/dmbmtypco/image/upload/v1684441009/And_then_there_were_none_lribuk.jpg', 10, 100, 9, '2023-05-11 21:06:37', '2023-05-11 21:06:37'),
(10, 'B0010', 'The Silent Patient', 'Alex Michaelides', 2, 'The Silent Patient is a 2019 psychological thriller novel written by British–Cypriot author Alex Michaelides. The successful debut novel was published by Celadon Books, a division of Macmillan Publishers, on 5 February 2019. The audiobook version, released on the same date, is read by Louise Brealey and Jack Hawkins.', 'https://res.cloudinary.com/dmbmtypco/image/upload/v1684441022/Silent_patient_p8cdnt.png', 7, 96, 10, '2023-05-11 21:08:29', '2023-05-18 14:01:07'),
(11, 'B0011', 'Sapiens: A Brief History of Humankind', 'Yuval Noah Harari', 3, 'Sapiens: A Brief History of Humankind is a book by Yuval Noah Harari, first published in Hebrew in Israel in 2011 based on a series of lectures Harari taught at The Hebrew University of Jerusalem, and in English in 2014.', 'https://res.cloudinary.com/dmbmtypco/image/upload/v1684441008/Sapiens_A_brief_l4s9qi.jpg', 8, 100, 11, '2023-05-11 21:10:17', '2023-05-11 21:10:17'),
(12, 'B0012', 'The Gene: An Intimate History', 'Siddhartha Mukherjee', 3, 'The Gene: An Intimate History is a book written by Siddhartha Mukherjee, an Indian-born American physician and oncologist. It was published on 17 May 2016 by Scribner.', 'https://res.cloudinary.com/dmbmtypco/image/upload/v1684441008/The_Gene_An_Intimate_History_cover_jujdhc.jpg', 4, 100, 12, '2023-05-11 21:12:20', '2023-05-11 21:12:20'),
(13, 'B0013', 'A Short History of Nearly Everything', 'Bill Bryson', 3, 'A Short History of Nearly Everything by American-British author Bill Bryson is a popular science book that explains some areas of science, using easily accessible language that appeals more to the general public than many other books dedicated to the subject.', 'https://res.cloudinary.com/dmbmtypco/image/upload/v1684441008/short_history_everthing_xlckpz.jpg', 2, 100, 13, '2023-05-11 21:13:57', '2023-05-11 21:13:57'),
(14, 'B0014', 'The Immortal Life of Henrietta Lacks', 'Rebecca Skloot', 3, 'The Immortal Life of Henrietta Lacks is a non-fiction book by American author Rebecca Skloot. It was the 2011 winner of the National Academies Communication Award for best creative work that helps the public understanding of topics in science, engineering or medicine', 'https://res.cloudinary.com/dmbmtypco/image/upload/v1684441008/immortal_life_qvyrza.jpg', 10, 100, 14, '2023-05-11 21:16:22', '2023-05-11 21:16:22'),
(15, 'B0015', 'The Man Who Knew Infinity: A Life of the Genius Ramanujan', 'Robert Kanigel', 3, 'The Man Who Knew Infinity: A Life of the Genius Ramanujan is a biography of the Indian mathematician Srinivasa Ramanujan, written in 1991 by Robert Kanigel. The book gives a detailed account of his upbringing in India, his mathematical achievements and his mathematical collaboration with mathematician G. H. Hardy.', 'https://res.cloudinary.com/dmbmtypco/image/upload/v1684441007/infinity_genius_y94vkx.jpg', 7, 100, 15, '2023-05-11 21:18:21', '2023-05-11 21:18:21');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `review_id` int(11) DEFAULT NULL,
  `product_id` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `review_id`, `product_id`, `createdAt`, `updatedAt`) VALUES
(1, 1, 'B0001', '2023-05-11 20:49:12', '2023-05-11 20:49:12'),
(2, 2, 'B0002', '2023-05-11 20:49:12', '2023-05-11 20:49:12'),
(3, 3, 'B0003', '2023-05-11 20:49:12', '2023-05-11 20:49:12'),
(4, 4, 'B0004', '2023-05-11 20:49:12', '2023-05-11 20:49:12'),
(5, 5, 'B0005', '2023-05-11 20:49:12', '2023-05-11 20:49:12'),
(6, 6, 'B0006', '2023-05-11 20:49:12', '2023-05-11 20:49:12'),
(7, 7, 'B0007', '2023-05-11 20:49:12', '2023-05-11 20:49:12'),
(8, 8, 'B0008', '2023-05-11 20:49:12', '2023-05-11 20:49:12'),
(9, 9, 'B0009', '2023-05-11 20:49:12', '2023-05-11 20:49:12'),
(10, 10, 'B0010', '2023-05-11 20:49:12', '2023-05-11 20:49:12'),
(11, 11, 'B0011', '2023-05-11 20:49:12', '2023-05-11 20:49:12'),
(12, 12, 'B0012', '2023-05-11 20:49:12', '2023-05-11 20:49:12'),
(13, 13, 'B0013', '2023-05-11 20:49:12', '2023-05-11 20:49:12'),
(14, 14, 'B0014', '2023-05-11 20:49:12', '2023-05-11 20:49:12'),
(15, 15, 'B0015', '2023-05-11 20:49:12', '2023-05-11 20:49:12'),
(16, 16, 'B0016', '2023-05-11 20:49:12', '2023-05-11 20:49:12'),
(17, 17, 'B0017', '2023-05-11 20:49:12', '2023-05-11 20:49:12');

-- --------------------------------------------------------

--
-- Table structure for table `reviews_details`
--

CREATE TABLE `reviews_details` (
  `id` int(11) NOT NULL,
  `review_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `comment` text,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reviews_details`
--

INSERT INTO `reviews_details` (`id`, `review_id`, `user_id`, `rating`, `comment`, `createdAt`, `updatedAt`) VALUES
(1, 1, 1, 5, 'Buku yang bagus', '2023-05-11 20:49:12', '2023-05-11 20:49:12'),
(2, 1, 2, 3, 'Buku standar', '2023-05-11 20:49:12', '2023-05-11 20:49:12'),
(3, 1, 3, 3, 'Buku standar', '2023-05-11 20:49:12', '2023-05-11 20:49:12');

-- --------------------------------------------------------

--
-- Table structure for table `SequelizeMeta`
--

CREATE TABLE `SequelizeMeta` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `SequelizeMeta`
--

INSERT INTO `SequelizeMeta` (`name`) VALUES
('20230516160146-create-orders-detail.js'),
('20230516160156-create-orders.js'),
('20230516160204-create-genres-detail.js'),
('20230516160214-create-historys.js'),
('20230516160244-create-reviews-detail.js'),
('20230516160249-create-reviews.js'),
('20230516160256-create-shippings.js'),
('20230516162838-create-products.js'),
('20230516191116-create-users.js'),
('20230518033333-create-wishlist.js');

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

CREATE TABLE `shippings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `phone_number` int(11) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `address` text,
  `apartment` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `postal_code` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `fullname`, `username`, `email`, `password`, `createdAt`, `updatedAt`) VALUES
(1, 'ardy', 'ardy', 'ardy@gmail', '123456789', '2023-05-17 07:23:12', '2023-05-17 07:23:12'),
(2, 'yusuf', 'yusuf', 'yusuf@gmail.com', '123456789', '2023-05-17 07:23:31', '2023-05-17 07:23:31');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `user_id`, `product_id`, `quantity`, `createdAt`, `updatedAt`) VALUES
(8, 2, NULL, NULL, '2023-05-18 13:45:26', '2023-05-18 13:45:26'),
(9, 2, NULL, NULL, '2023-05-18 13:46:08', '2023-05-18 13:46:08'),
(10, 2, NULL, NULL, '2023-05-18 13:48:38', '2023-05-18 13:48:38'),
(11, 2, NULL, NULL, '2023-05-18 13:50:31', '2023-05-18 13:50:31'),
(12, 2, NULL, NULL, '2023-05-18 13:50:37', '2023-05-18 13:50:37'),
(13, 2, NULL, NULL, '2023-05-18 13:52:41', '2023-05-18 13:52:41'),
(14, 2, 'B0003', 2, '2023-05-18 13:56:22', '2023-05-18 13:56:22'),
(15, 2, NULL, NULL, '2023-05-18 13:58:11', '2023-05-18 13:58:11'),
(16, 2, NULL, NULL, '2023-05-18 13:59:10', '2023-05-18 13:59:10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `genres_details`
--
ALTER TABLE `genres_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `historys`
--
ALTER TABLE `historys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_id` (`order_id`);

--
-- Indexes for table `orders_details`
--
ALTER TABLE `orders_details`
  ADD PRIMARY KEY (`id`,`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews_details`
--
ALTER TABLE `reviews_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `SequelizeMeta`
--
ALTER TABLE `SequelizeMeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_id` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `genres_details`
--
ALTER TABLE `genres_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `historys`
--
ALTER TABLE `historys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `orders_details`
--
ALTER TABLE `orders_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `reviews_details`
--
ALTER TABLE `reviews_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
