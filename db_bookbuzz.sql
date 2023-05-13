-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 192.168.177.173:3306
-- Generation Time: May 12, 2023 at 04:35 PM
-- Server version: 5.7.42-0ubuntu0.18.04.1
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_bookbuzz`
--

-- --------------------------------------------------------

--
-- Table structure for table `genre_details`
--

CREATE TABLE `genre_details` (
  `id` int(11) NOT NULL,
  `genre_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `genre_details`
--

INSERT INTO `genre_details` (`id`, `genre_name`) VALUES
(1, 'Fiction'),
(2, 'Mystery/Thriller'),
(3, 'Popular Science');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `product_id` varchar(5) NOT NULL,
  `title_book` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `genre` int(11) NOT NULL,
  `description` text NOT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `stock` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_id`, `title_book`, `author`, `genre`, `description`, `thumbnail`, `price`, `stock`, `createdAt`, `updatedAt`) VALUES
(1, 'B0001', 'Man Tiger (Lelaki Harimau): A Novel', 'Eka Kurniawan', 1, 'Pada lanskap yang sureal, Margio adalah bocah yang menggiring babi ke dalam perangkap. Namun di sore ketika seharusnya rehat menanti musim perburuan, ia terperosok dalam tragedi pembunuhan paling brutal. Di balik motif-motif yang berhamburan, antara cinta dan pengkhianatan, rasa takut dan berahi, bunga dan darah, ia menyangkal dengan tandas. Bukan aku yang melakukannya, ia berkata dan melanjutkan, Ada harimau di dalam tubuhku.\r\n\r\n', 'https://drive.google.com/file/d/1lA7KnjoV33zv4YuMKB4hGmvXdi4Xr5KT/view?usp=share_link', 10, 3, '2023-05-11 20:49:12', '2023-05-11 20:49:12'),
(2, 'B0002', 'To Kill a Mockingbird', 'Harper Lee', 1, 'To Kill a Mockingbird is both a young girl\'s coming-of-age story and a darker drama about the roots and consequences of racism and prejudice, probing how good and evil can coexist within a single community or individual.', 'https://drive.google.com/file/d/1vMYfId1CO3jvPK2bAKZe4zP17OdNKZqs/view?usp=share_link', 15, 5, '2023-05-11 20:50:42', '2023-05-11 20:50:42'),
(3, 'B0003', 'One Hundred Years of Solitude', 'García Márquez', 1, 'One Hundred Years of Solitude is a 1967 novel by Colombian author Gabriel García Márquez that tells the multi-generational story of the Buendía family, whose patriarch, José Arcadio Buendía, founded the fictitious town of Macondo. The novel is often cited as one of the supreme achievements in world literature.', 'https://drive.google.com/file/d/1wEKlJKFefE0HwG3y3ro7z3udB8s57W6J/view?usp=share_link', 10, 10, '2023-05-11 20:52:10', '2023-05-11 20:52:10'),
(4, 'B0004', 'The Great Gatsby', 'F. Scott Fitzgerald', 1, 'The Great Gatsby is a 1925 novel by American writer F. Scott Fitzgerald. Set in the Jazz Age on Long Island, near New York City, the novel depicts first-person narrator Nick Carraway\'s interactions with mysterious millionaire Jay Gatsby and Gatsby\'s obsession to reunite with his former lover, Daisy Buchanan.', 'https://drive.google.com/file/d/1w2N2C0XVA0ERzDVlovaalCyf_BiRFenG/view?usp=share_link', 20, 10, '2023-05-11 20:53:21', '2023-05-11 20:53:21'),
(5, 'B0005', 'Pride and Prejudice', 'Jane Austen', 1, 'Pride and Prejudice is an 1813 novel of manners by Jane Austen. The novel follows the character development of Elizabeth Bennet, the protagonist of the book, who learns about the repercussions of hasty judgments and comes to appreciate the difference between superficial goodness and actual goodness.', 'https://drive.google.com/file/d/1NTWvQEBMqcrVAxvcBu67MJnBqmWw4b2L/view?usp=share_link', 4, 20, '2023-05-11 20:55:06', '2023-05-11 20:55:06'),
(6, 'B0006', 'The Girl with the Dragon Tattoo', 'Stieg Larsson', 2, 'The Girl with the Dragon Tattoo is a psychological thriller novel by Swedish author and journalist Stieg Larsson. It was published posthumously in 2005, translated into English in 2008, and became an international bestseller. The Girl with the Dragon Tattoo is the first book of the Millennium series.', 'https://drive.google.com/file/d/19iBaMnrz9hyg1iwqnDFj4dgo32YIzUVT/view?usp=share_link', 8, 4, '2023-05-11 20:57:19', '2023-05-11 20:57:19'),
(7, 'B0007', 'Gone Girl', 'Gillian Flynn', 2, 'Gone Girl is a 2012 crime thriller novel by American writer Gillian Flynn. It was published by Crown Publishing Group in June 2012. The novel was popular and made the New York Times Best Seller list. The sense of suspense in the novel comes from whether Nick Dunne is responsible for the disappearance of his wife Amy.', 'https://drive.google.com/file/d/1B8vpBj0W8NqHDcVUxieH9nx3xtDEIKcw/view?usp=share_link', 7, 1, '2023-05-11 21:02:48', '2023-05-11 21:02:48'),
(8, 'B0008', 'The Da Vinci Code', 'Dan Brown', 2, 'The Da Vinci Code is a 2003 mystery thriller novel by Dan Brown. It is Brown\'s second novel to include the character Robert Langdon: the first was his 2000 novel Angels & Demons. ', 'https://drive.google.com/file/d/1Voigds8HsIZ_94XdfvV7Mw1A2z0YL0NK/view?usp=share_link', 25, 2, '2023-05-11 21:04:44', '2023-05-11 21:04:44'),
(9, 'B0009', 'And Then There Were None', 'Agatha Christie', 2, 'And Then There Were None\" is a dramatic adaptation of the best-selling crime novel by Agatha Christie. The story follows 10 strangers who receive an unusual invitation to a solitary mansion based remotely off Britain\'s Devon Coast. Among the guests is an unstable doctor, an anxious businessman, an irresponsible playboy, and a governess with a secret. Cut off from the outside world, the group arrives at its destination, only to find that darkness awaits them. As people start to mysteriously die, the members of the group realize there is a killer among them.', 'https://drive.google.com/file/d/114Xtx1aPtKjJ2FOTsF7NxDyltgxJtQQw/view?usp=share_link', 10, 4, '2023-05-11 21:06:37', '2023-05-11 21:06:37'),
(10, 'B0010', 'The Silent Patient', 'Alex Michaelides', 2, 'The Silent Patient is a 2019 psychological thriller novel written by British–Cypriot author Alex Michaelides. The successful debut novel was published by Celadon Books, a division of Macmillan Publishers, on 5 February 2019. The audiobook version, released on the same date, is read by Louise Brealey and Jack Hawkins.', 'https://drive.google.com/file/d/1V5HXP4ZmQop7bHhMJMcCK7UlQL9oq6MH/view?usp=sharing', 7, 20, '2023-05-11 21:08:29', '2023-05-11 21:08:29'),
(11, 'B0011', 'Sapiens: A Brief History of Humankind', 'Yuval Noah Harari', 3, 'Sapiens: A Brief History of Humankind is a book by Yuval Noah Harari, first published in Hebrew in Israel in 2011 based on a series of lectures Harari taught at The Hebrew University of Jerusalem, and in English in 2014.', 'https://drive.google.com/file/d/1yaJOQjYf99Cgel-z4rDDPIgLTKrcQE3a/view?usp=sharing', 8, 10, '2023-05-11 21:10:17', '2023-05-11 21:10:17'),
(12, 'B0012', 'The Gene: An Intimate History', 'Siddhartha Mukherjee', 3, 'The Gene: An Intimate History is a book written by Siddhartha Mukherjee, an Indian-born American physician and oncologist. It was published on 17 May 2016 by Scribner.', 'https://drive.google.com/file/d/1OFVRowB8HFBsaFnUuXjChDYPM5ut9tAS/view?usp=sharing', 4, 1, '2023-05-11 21:12:20', '2023-05-11 21:12:20'),
(13, 'B0013', 'A Short History of Nearly Everything', 'Bill Bryson', 3, 'A Short History of Nearly Everything by American-British author Bill Bryson is a popular science book that explains some areas of science, using easily accessible language that appeals more to the general public than many other books dedicated to the subject.', 'https://drive.google.com/file/d/1a3qhxwOfcTupTaCk0sPREF8vuxDDFzhf/view?usp=sharing', 2, 30, '2023-05-11 21:13:57', '2023-05-11 21:13:57'),
(14, 'B0014', 'The Immortal Life of Henrietta Lacks', 'Rebecca Skloot', 3, 'The Immortal Life of Henrietta Lacks is a non-fiction book by American author Rebecca Skloot. It was the 2011 winner of the National Academies Communication Award for best creative work that helps the public understanding of topics in science, engineering or medicine', 'https://drive.google.com/file/d/1XReKC7ANfA4yqGuEJsaMkK9KGFw-sJY9/view?usp=sharing', 10, 5, '2023-05-11 21:16:22', '2023-05-11 21:16:22'),
(15, 'B0015', 'The Man Who Knew Infinity: A Life of the Genius Ramanujan', 'Robert Kanigel', 3, 'The Man Who Knew Infinity: A Life of the Genius Ramanujan is a biography of the Indian mathematician Srinivasa Ramanujan, written in 1991 by Robert Kanigel. The book gives a detailed account of his upbringing in India, his mathematical achievements and his mathematical collaboration with mathematician G. H. Hardy.', 'https://drive.google.com/file/d/1Mr5dRCWxgHla0LvVcW9TqW1dcyDOB1hd/view?usp=sharing', 7, 10, '2023-05-11 21:18:21', '2023-05-11 21:18:21');

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
('20230510064141-create-product.js');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `genre_details`
--
ALTER TABLE `genre_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`,`product_id`),
  ADD UNIQUE KEY `title_book` (`title_book`),
  ADD KEY `genre` (`genre`);

--
-- Indexes for table `SequelizeMeta`
--
ALTER TABLE `SequelizeMeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `genre_details`
--
ALTER TABLE `genre_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`genre`) REFERENCES `genre_details` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
