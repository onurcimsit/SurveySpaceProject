-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 02 Mar 2017, 08:19:55
-- Sunucu sürümü: 10.1.8-MariaDB
-- PHP Sürümü: 5.6.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `mydb`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `examanswers`
--

CREATE TABLE `examanswers` (
  `id` int(11) NOT NULL,
  `answersname` varchar(150) NOT NULL,
  `isTrue` bit(1) DEFAULT NULL,
  `ExamQuestion_id` int(11) NOT NULL,
  `Exams_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `examquestion`
--

CREATE TABLE `examquestion` (
  `id` int(11) NOT NULL,
  `questionName` varchar(150) NOT NULL,
  `Exams_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `exams`
--

CREATE TABLE `exams` (
  `id` int(11) NOT NULL,
  `Users_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `examuseranswers`
--

CREATE TABLE `examuseranswers` (
  `id` int(11) NOT NULL,
  `Users_id` int(11) NOT NULL,
  `ExamAnswers_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `examusers`
--

CREATE TABLE `examusers` (
  `id` int(11) NOT NULL,
  `Exams_id` int(11) NOT NULL,
  `Users_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `roleName` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `surveyanswers`
--

CREATE TABLE `surveyanswers` (
  `id` int(11) NOT NULL,
  `questionName` varchar(150) DEFAULT NULL,
  `SurveyQuestion_id` int(11) NOT NULL,
  `Surveys_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `surveyquestion`
--

CREATE TABLE `surveyquestion` (
  `id` int(11) NOT NULL,
  `questionNames` varchar(150) NOT NULL,
  `Surveys_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `surveys`
--

CREATE TABLE `surveys` (
  `id` int(11) NOT NULL,
  `Users_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `surveyuseranswers`
--

CREATE TABLE `surveyuseranswers` (
  `id` int(11) NOT NULL,
  `Users_id` int(11) NOT NULL,
  `SurveyAnswers_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `surveyusers`
--

CREATE TABLE `surveyusers` (
  `id` int(11) NOT NULL,
  `Surveys_id` int(11) NOT NULL,
  `Users_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `Roles_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `examanswers`
--
ALTER TABLE `examanswers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ExamAnswers_ExamQuestion1_idx` (`ExamQuestion_id`),
  ADD KEY `fk_ExamAnswers_Exams1_idx` (`Exams_id`);

--
-- Tablo için indeksler `examquestion`
--
ALTER TABLE `examquestion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ExamQuestion_Exams1_idx` (`Exams_id`);

--
-- Tablo için indeksler `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Exams_Users1_idx` (`Users_id`);

--
-- Tablo için indeksler `examuseranswers`
--
ALTER TABLE `examuseranswers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ExamUserAnswers_Users1_idx` (`Users_id`),
  ADD KEY `fk_ExamUserAnswers_ExamAnswers1_idx` (`ExamAnswers_id`);

--
-- Tablo için indeksler `examusers`
--
ALTER TABLE `examusers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ExamUsers_Exams1_idx` (`Exams_id`),
  ADD KEY `fk_ExamUsers_Users1_idx` (`Users_id`);

--
-- Tablo için indeksler `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `surveyanswers`
--
ALTER TABLE `surveyanswers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_SurveyAnswers_SurveyQuestion1_idx` (`SurveyQuestion_id`),
  ADD KEY `fk_SurveyAnswers_Surveys1_idx` (`Surveys_id`);

--
-- Tablo için indeksler `surveyquestion`
--
ALTER TABLE `surveyquestion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_SurveyQuestion_Surveys1_idx` (`Surveys_id`);

--
-- Tablo için indeksler `surveys`
--
ALTER TABLE `surveys`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Surveys_Users1_idx` (`Users_id`);

--
-- Tablo için indeksler `surveyuseranswers`
--
ALTER TABLE `surveyuseranswers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_SurveyUserAnswers_Users1_idx` (`Users_id`),
  ADD KEY `fk_SurveyUserAnswers_SurveyAnswers1_idx` (`SurveyAnswers_id`);

--
-- Tablo için indeksler `surveyusers`
--
ALTER TABLE `surveyusers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_SurveyUsers_Surveys1_idx` (`Surveys_id`),
  ADD KEY `fk_SurveyUsers_Users1_idx` (`Users_id`);

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Users_Roles_idx` (`Roles_id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `examanswers`
--
ALTER TABLE `examanswers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Tablo için AUTO_INCREMENT değeri `examquestion`
--
ALTER TABLE `examquestion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Tablo için AUTO_INCREMENT değeri `exams`
--
ALTER TABLE `exams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Tablo için AUTO_INCREMENT değeri `examuseranswers`
--
ALTER TABLE `examuseranswers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Tablo için AUTO_INCREMENT değeri `examusers`
--
ALTER TABLE `examusers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Tablo için AUTO_INCREMENT değeri `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Tablo için AUTO_INCREMENT değeri `surveyanswers`
--
ALTER TABLE `surveyanswers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Tablo için AUTO_INCREMENT değeri `surveyquestion`
--
ALTER TABLE `surveyquestion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Tablo için AUTO_INCREMENT değeri `surveys`
--
ALTER TABLE `surveys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Tablo için AUTO_INCREMENT değeri `surveyuseranswers`
--
ALTER TABLE `surveyuseranswers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Tablo için AUTO_INCREMENT değeri `surveyusers`
--
ALTER TABLE `surveyusers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `examanswers`
--
ALTER TABLE `examanswers`
  ADD CONSTRAINT `fk_ExamAnswers_ExamQuestion1` FOREIGN KEY (`ExamQuestion_id`) REFERENCES `examquestion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ExamAnswers_Exams1` FOREIGN KEY (`Exams_id`) REFERENCES `exams` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Tablo kısıtlamaları `examquestion`
--
ALTER TABLE `examquestion`
  ADD CONSTRAINT `fk_ExamQuestion_Exams1` FOREIGN KEY (`Exams_id`) REFERENCES `exams` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Tablo kısıtlamaları `exams`
--
ALTER TABLE `exams`
  ADD CONSTRAINT `fk_Exams_Users1` FOREIGN KEY (`Users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Tablo kısıtlamaları `examuseranswers`
--
ALTER TABLE `examuseranswers`
  ADD CONSTRAINT `fk_ExamUserAnswers_ExamAnswers1` FOREIGN KEY (`ExamAnswers_id`) REFERENCES `examanswers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ExamUserAnswers_Users1` FOREIGN KEY (`Users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Tablo kısıtlamaları `examusers`
--
ALTER TABLE `examusers`
  ADD CONSTRAINT `fk_ExamUsers_Exams1` FOREIGN KEY (`Exams_id`) REFERENCES `exams` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ExamUsers_Users1` FOREIGN KEY (`Users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Tablo kısıtlamaları `surveyanswers`
--
ALTER TABLE `surveyanswers`
  ADD CONSTRAINT `fk_SurveyAnswers_SurveyQuestion1` FOREIGN KEY (`SurveyQuestion_id`) REFERENCES `surveyquestion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_SurveyAnswers_Surveys1` FOREIGN KEY (`Surveys_id`) REFERENCES `surveys` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Tablo kısıtlamaları `surveyquestion`
--
ALTER TABLE `surveyquestion`
  ADD CONSTRAINT `fk_SurveyQuestion_Surveys1` FOREIGN KEY (`Surveys_id`) REFERENCES `surveys` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Tablo kısıtlamaları `surveys`
--
ALTER TABLE `surveys`
  ADD CONSTRAINT `fk_Surveys_Users1` FOREIGN KEY (`Users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Tablo kısıtlamaları `surveyuseranswers`
--
ALTER TABLE `surveyuseranswers`
  ADD CONSTRAINT `fk_SurveyUserAnswers_SurveyAnswers1` FOREIGN KEY (`SurveyAnswers_id`) REFERENCES `surveyanswers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_SurveyUserAnswers_Users1` FOREIGN KEY (`Users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Tablo kısıtlamaları `surveyusers`
--
ALTER TABLE `surveyusers`
  ADD CONSTRAINT `fk_SurveyUsers_Surveys1` FOREIGN KEY (`Surveys_id`) REFERENCES `surveys` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_SurveyUsers_Users1` FOREIGN KEY (`Users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Tablo kısıtlamaları `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_Users_Roles` FOREIGN KEY (`Roles_id`) REFERENCES `roles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
