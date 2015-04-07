-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 07, 2015 at 05:53 PM
-- Server version: 5.5.41-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `shema`
--

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE IF NOT EXISTS `authors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `hashed_password` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`id`, `email`, `name`, `hashed_password`) VALUES
(1, 'antonskubiev94@yandex.ru', 'woopy', '$2a$12$BQVGozowGxSPsph99xJTWuOxHoEy7bqGz7nHGiHXXtURD8YTCuZbC');

-- --------------------------------------------------------

--
-- Table structure for table `entries`
--

CREATE TABLE IF NOT EXISTS `entries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `title` varchar(512) NOT NULL,
  `markdown` mediumtext NOT NULL,
  `html` mediumtext NOT NULL,
  `published` datetime NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `published` (`published`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `entries`
--

INSERT INTO `entries` (`id`, `author_id`, `slug`, `title`, `markdown`, `html`, `published`, `updated`) VALUES
(1, 1, 'privet', 'Настройка elasticsearch', '1. Устанавливаем elasticsearch(1.5...)\r\n2. Индексируем базу <a href="http://django-haystack.readthedocs.org/en/latest/tutorial.html">http://django-haystack.readthedocs.org/en/latest/tutorial.html</a>\r\n./manage.py rebuild_index\r\n3. Устанавливаем плагин <a href="https://github.com/jprante/elasticsearch-river-jdbc">river-jdbc</a> для elasticsearch, для взаимодействия с mysql.\r\n3. Добавляем привязку к url\r\ncurl -XPUT ''localhost:8000/search'' -d ''{"type" : "jdbc","jdbc" : {"driver" : "com.mysql.jdbc.Driver","url" : "jdbc:mysql://localhost:3306","user" : "root","password" : "bernard94","sql" : " select * from НАЗВАНИЕ БАЗЫ ИЗ http://localhost:9200/_plugin/head/ ;"},"index" : {"index" : "jdbc","type" : "jdbc"}}''\r\n\r\nhttp://localhost:9200/_plugin/head/ просмотр результата индексирования базы данных', '<ol>\n<li>Устанавливаем elasticsearch(1.5...)</li>\n<li>Индексируем базу <a href="http://django-haystack.readthedocs.org/en/latest/tutorial.html">http://django-haystack.readthedocs.org/en/latest/tutorial.html</a>\n./manage.py rebuild_index</li>\n<li>Устанавливаем плагин <a href="https://github.com/jprante/elasticsearch-river-jdbc">river-jdbc</a> для elasticsearch, для взаимодействия с mysql.</li>\n<li>Добавляем привязку к url\ncurl -XPUT ''localhost:8000/search'' -d ''{"type" : "jdbc","jdbc" : {"driver" : "com.mysql.jdbc.Driver","url" : "jdbc:mysql://localhost:3306","user" : "root","password" : "bernard94","sql" : " select * from НАЗВАНИЕ БАЗЫ ИЗ http://localhost:9200/_plugin/head/ ;"},"index" : {"index" : "jdbc","type" : "jdbc"}}''</li>\n</ol>\n<p>http://localhost:9200/_plugin/head/ просмотр результата индексирования базы данных</p>', '2015-04-07 05:20:15', '2015-04-07 11:37:32'),
(2, 1, 'git', 'Заметки о работе с git', '1. Push удаленной ветки на сервер.\r\nhttp://stackoverflow.com/questions/2765421/push-a-new-local-branch-to-a-remote-git-repo-and-track-it-too. <br>\r\n<b>$ git checkout -b feature_branch_name</b> - создание новой ветки.\r\n<b>$ git push -u origin feature_branch_name</b> - отправка ветки на сервер.', '<ol>\n<li>Push удаленной ветки на сервер.\nhttp://stackoverflow.com/questions/2765421/push-a-new-local-branch-to-a-remote-git-repo-and-track-it-too. <br>\n<b>$ git checkout -b feature_branch_name</b> - создание новой ветки.\n<b>$ git push -u origin feature_branch_name</b> - отправка ветки на сервер.</li>\n</ol>', '2015-04-07 11:16:39', '2015-04-07 11:18:11'),
(3, 1, 'pypy', 'Настройка pypy', '1. <a href="http://pypy.org/download.html">Качаем версию</a> <b>pypy</b> подходящую Вам. (Python2.7 соответствует PyPy 2.5.1) \r\n\r\n2. Разархивируем.\r\n3. Копируем папку pypy-2.5.1-linux64 в /opt\r\n\r\n4. Создаем символьную ссылку:<br>\r\n<b>sudo ln -s /opt/pypy-2.5.1-linux64/bin/pypy /usr/bin/pypy</b><br>\r\nили<br>\r\n<b>sudo ln -s /home/anton/Downloads/pypy-2.5.1-linux64/bin/pypy /usr/bin/pypy</b>\r\n\r\n5. Устанавливаем окружение для pypy.<br>\r\n<b>virtualenv -p /opt/pypy-2.5.1-linux64/bin/pypy my-pypy-env</b>\r\n<br>или<br>\r\n<b>virtualenv -p pypy my-pypy-env</b>(если установили символьную ссылку)\r\n\r\n6. Устнавливаем пакеты.<br>\r\n<b>source my-pypy-env/bin/activate</b><br>\r\n<b>pip install requirements.txt</b>\r\n\r\n7. Особенности.<br>\r\nuJson и gevent не имеют поддержки в PYPY<br>\r\n<a href="http://baroquesoftware.com/blog">http://baroquesoftware.com/blog</a><br>\r\n<a href="http://kracekumar.com/post/36532666649/can-pypy-be-used-for-web-application-deployment">http://kracekumar.com/post/36532666649/can-pypy-be-used-for-web-application-deployment</a><br><br>\r\nGevent вроде заработало, после:<br><b>sudo apt-get install libevent-devel</b><br>\r\n<b>pip install git+git://github.com/surfly/gevent.git#egg=gevent</b><br>\r\n<b>pip install git+git://github.com/gevent-on-pypy/pypycore</b><br>\r\n<b>pip install cffi</b><br>\r\n<b>pip install git+git://github.com/schmir/gevent@pypy-hacks</b>\r\n<br>Заменил весь ujson на json, сервак поднялся.', '<ol>\n<li>\n<p><a href="http://pypy.org/download.html">Качаем версию</a> <b>pypy</b> подходящую Вам. (Python2.7 соответствует PyPy 2.5.1) </p>\n</li>\n<li>\n<p>Разархивируем.</p>\n</li>\n<li>\n<p>Копируем папку pypy-2.5.1-linux64 в /opt</p>\n</li>\n<li>\n<p>Создаем символьную ссылку:<br>\n<b>sudo ln -s /opt/pypy-2.5.1-linux64/bin/pypy /usr/bin/pypy</b><br>\nили<br>\n<b>sudo ln -s /home/anton/Downloads/pypy-2.5.1-linux64/bin/pypy /usr/bin/pypy</b></p>\n</li>\n<li>\n<p>Устанавливаем окружение для pypy.<br>\n<b>virtualenv -p /opt/pypy-2.5.1-linux64/bin/pypy my-pypy-env</b>\n<br>или<br>\n<b>virtualenv -p pypy my-pypy-env</b>(если установили символьную ссылку)</p>\n</li>\n<li>\n<p>Устнавливаем пакеты.<br>\n<b>source my-pypy-env/bin/activate</b><br>\n<b>pip install requirements.txt</b></p>\n</li>\n<li>\n<p>Особенности.<br>\nuJson и gevent не имеют поддержки в PYPY<br>\n<a href="http://baroquesoftware.com/blog">http://baroquesoftware.com/blog</a><br>\n<a href="http://kracekumar.com/post/36532666649/can-pypy-be-used-for-web-application-deployment">http://kracekumar.com/post/36532666649/can-pypy-be-used-for-web-application-deployment</a><br><br>\nGevent вроде заработало, после:<br><b>sudo apt-get install libevent-devel</b><br>\n<b>pip install git+git://github.com/surfly/gevent.git#egg=gevent</b><br>\n<b>pip install git+git://github.com/gevent-on-pypy/pypycore</b><br>\n<b>pip install cffi</b><br>\n<b>pip install git+git://github.com/schmir/gevent@pypy-hacks</b>\n<br>Заменил весь ujson на json, сервак поднялся.</p>\n</li>\n</ol>', '2015-04-07 11:18:43', '2015-04-07 11:28:16'),
(4, 1, 'mysql-linux', 'Работа с MySQL из консоли Linux', '1. Импорт из файла в базу данных.<br>\r\n<b>mysql -u username -p password database_name < file.sql</b><br>\r\n2. Разархивирование файлов .gz.<br>\r\n<b>gunzip FILENAME</b><br>\r\n<a href="http://serverfault.com/questions/137965/how-do-i-load-a-sql-gz-file-to-my-database-importing">http://serverfault.com/questions/137965/how-do-i-load-a-sql-gz-file-to-my-database-importing</a>\r\n3. Вход в консоль, для выполнения команд базы данных.<br>\r\n<b>mysql -u username -p password</b><br>\r\n<b>CREATE DATABASE tutorial_database;</b> - создание новой базы данных.', '<ol>\n<li>Импорт из файла в базу данных.<br>\n<b>mysql -u username -p password database_name &lt; file.sql</b><br></li>\n<li>Разархивирование файлов .gz.<br>\n<b>gunzip FILENAME</b><br>\n<a href="http://serverfault.com/questions/137965/how-do-i-load-a-sql-gz-file-to-my-database-importing">http://serverfault.com/questions/137965/how-do-i-load-a-sql-gz-file-to-my-database-importing</a></li>\n<li>Вход в консоль, для выполнения команд базы данных.<br>\n<b>mysql -u username -p password</b><br>\n<b>CREATE DATABASE tutorial_database;</b> - создание новой базы данных.</li>\n</ol>', '2015-04-07 11:34:39', '2015-04-07 11:35:16'),
(5, 1, 'superuser-django', 'Получение прав superuser Django', '<b>source virt_env/bin/activate</b><br>\r\n<b>./manage.py shell_plus</b><br>\r\n<b>from django.contrib.auth import get_user_model</b><br>\r\n<b>>>> User = get_user_model()</b><br>\r\n<b>>>> u = User.objects.filter(username=''anton.skubev'')</b><br>\r\n<b>>>> u.update(is_superuser=True)</b><br>', '<p><b>source virt_env/bin/activate</b><br>\n<b>./manage.py shell_plus</b><br>\n<b>from django.contrib.auth import get_user_model</b><br>\n<b>&gt;&gt;&gt; User = get_user_model()</b><br>\n<b>&gt;&gt;&gt; u = User.objects.filter(username=''anton.skubev'')</b><br>\n<b>&gt;&gt;&gt; u.update(is_superuser=True)</b><br></p>', '2015-04-07 11:42:25', '2015-04-07 11:42:25');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
