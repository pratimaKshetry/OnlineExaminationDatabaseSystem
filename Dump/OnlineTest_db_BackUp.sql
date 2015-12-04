CREATE DATABASE  IF NOT EXISTS `onlinetest` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `onlinetest`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: localhost    Database: onlinetest
-- ------------------------------------------------------
-- Server version	5.6.22-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `exam`
--

DROP TABLE IF EXISTS `exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam` (
  `ExamID` int(11) NOT NULL AUTO_INCREMENT,
  `TeacherSubjectID` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Duration` varchar(30) NOT NULL,
  PRIMARY KEY (`ExamID`),
  KEY `TeacherID_idx` (`TeacherSubjectID`),
  CONSTRAINT `TeacherSubjectID` FOREIGN KEY (`TeacherSubjectID`) REFERENCES `teacher_subject` (`TeacherSubjectID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam`
--

LOCK TABLES `exam` WRITE;
/*!40000 ALTER TABLE `exam` DISABLE KEYS */;
INSERT INTO `exam` VALUES (1,1,'2015-05-05','30 mins'),(2,2,'2015-05-05','45 mins'),(3,3,'2015-05-05','45 mins'),(4,4,'2015-05-05','60 mins'),(5,5,'2015-05-05','30 mins'),(6,6,'2015-05-05','60 mins'),(7,7,'2015-05-05','60 mins'),(8,8,'2015-05-06','60 mins'),(9,9,'2015-05-07','30 mins'),(10,10,'2015-05-08','45 mins'),(11,11,'2015-05-09','35 mins'),(12,12,'2015-05-10','45 mins'),(13,13,'2015-06-05','45 mins'),(14,14,'2015-06-06','60 mins'),(15,15,'2015-06-07','60 mins'),(16,16,'2015-06-08','60 mins'),(17,17,'2015-07-05','30 mins'),(18,18,'2015-07-06','60 mins'),(19,19,'2015-07-07','30 mins'),(20,20,'2015-07-08','45 mins'),(21,21,'2015-07-09','30 mins'),(22,22,'2015-08-05','30 mins'),(23,23,'2015-08-06','45 mins'),(24,24,'2015-08-07','45 mins'),(25,25,'2015-08-08','30 mins'),(26,26,'2015-08-09','30 mins'),(27,27,'2015-08-10','60 mins'),(28,28,'2015-09-05','45 mins'),(29,29,'2015-09-06','30 mins'),(30,30,'2015-09-07','60 mins');
/*!40000 ALTER TABLE `exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_question`
--

DROP TABLE IF EXISTS `exam_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam_question` (
  `ExamQuestionID` int(11) NOT NULL AUTO_INCREMENT,
  `QuestionID` int(11) NOT NULL,
  `ExamID` int(11) NOT NULL,
  PRIMARY KEY (`ExamQuestionID`),
  KEY `fk_Questions_has_Exam_Exam1_idx` (`ExamID`),
  KEY `QuestionID_idx` (`QuestionID`),
  CONSTRAINT `fk_QuestionID` FOREIGN KEY (`QuestionID`) REFERENCES `questions` (`QuestionID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Questions_has_Exam_Exam1` FOREIGN KEY (`ExamID`) REFERENCES `exam` (`ExamID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_question`
--

LOCK TABLES `exam_question` WRITE;
/*!40000 ALTER TABLE `exam_question` DISABLE KEYS */;
INSERT INTO `exam_question` VALUES (1,1,1),(3,2,1),(4,3,2),(5,4,4),(6,5,5),(7,6,6),(8,7,7),(9,8,8),(10,9,9),(11,10,10),(12,11,11),(13,12,12),(14,13,13),(15,14,14),(16,15,15),(17,16,16),(18,17,17),(19,18,18),(20,19,19),(21,20,20),(22,21,21),(23,22,22),(24,23,23),(25,24,24),(26,25,25),(27,26,26),(28,27,27),(29,28,28),(30,29,29),(31,30,30);
/*!40000 ALTER TABLE `exam_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_registration`
--

DROP TABLE IF EXISTS `exam_registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam_registration` (
  `ExamRegistrationID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL,
  `ExamID` int(11) NOT NULL,
  `GPA` varchar(45) NOT NULL,
  PRIMARY KEY (`ExamRegistrationID`),
  KEY `StudentID_idx` (`UserID`),
  KEY `ExamID_idx` (`ExamID`),
  CONSTRAINT `ExamID` FOREIGN KEY (`ExamID`) REFERENCES `exam` (`ExamID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `UserID` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_registration`
--

LOCK TABLES `exam_registration` WRITE;
/*!40000 ALTER TABLE `exam_registration` DISABLE KEYS */;
INSERT INTO `exam_registration` VALUES (1,3,1,'3.5'),(4,3,2,'3.5'),(5,6,2,'3.6'),(6,5,3,'2.7'),(7,5,4,'3.7'),(8,5,6,'3.7'),(9,30,4,'3.1'),(10,6,7,'3.5'),(43,33,8,'3.56'),(44,34,9,'3.43'),(45,17,10,'3.55'),(46,37,2,'3.45'),(47,36,3,'3.25'),(48,35,4,'3.59'),(49,18,6,'3.25'),(50,52,11,'3.55'),(51,53,10,'3.45'),(52,54,7,'3.85'),(53,19,8,'3.35'),(54,43,7,'3.95'),(55,42,8,'3.45'),(56,41,11,'3.45'),(57,20,12,'3.83'),(58,21,7,'3.45'),(59,37,8,'3.25'),(60,38,9,'3.25'),(61,39,12,'3.33'),(62,46,13,'3.45'),(63,45,14,'3.15'),(64,44,15,'3.75'),(65,23,16,'3.83'),(66,48,13,'3.15'),(67,49,14,'3.34'),(68,24,15,'3.95'),(69,47,16,'3.80'),(70,55,8,'3.15'),(71,50,7,'3.34'),(72,25,5,'3.95'),(73,51,6,'3.80');
/*!40000 ALTER TABLE `exam_registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `instructornamesubjectname`
--

DROP TABLE IF EXISTS `instructornamesubjectname`;
/*!50001 DROP VIEW IF EXISTS `instructornamesubjectname`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `instructornamesubjectname` (
  `Instructor Name` tinyint NOT NULL,
  `SubjectName` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `question_option`
--

DROP TABLE IF EXISTS `question_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_option` (
  `QuestionOptionID` int(11) NOT NULL AUTO_INCREMENT,
  `QuestionID` int(11) NOT NULL,
  `Text` varchar(205) NOT NULL,
  `IsCorrect` int(11) DEFAULT '0',
  PRIMARY KEY (`QuestionOptionID`),
  KEY `QuestionID_idx` (`QuestionID`),
  CONSTRAINT `QuestionID` FOREIGN KEY (`QuestionID`) REFERENCES `questions` (`QuestionID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_option`
--

LOCK TABLES `question_option` WRITE;
/*!40000 ALTER TABLE `question_option` DISABLE KEYS */;
INSERT INTO `question_option` VALUES (1,1,'A.	Database application and the database\n',1),(2,1,'B.	Data and the database\n',0),(3,1,'C.	The user and the database application\n',0),(4,1,'D.	Database application and SQL',0),(5,2,'A.	IDMS',0),(6,2,'B.	DB2',1),(7,2,'C.	dBase-II',0),(8,2,'D.	 R:base',0),(9,3,'A.      Multiple Regression',1),(10,3,'B.   Chi-square test',0),(11,3,'C.   Anova',0),(12,3,'T test',0),(13,4,'Write you answer in the textbox below.',0),(14,5,'CPU',1),(15,5,'Hard Disk',0),(16,5,'ALU',0),(17,5,'Control Unit',0),(18,6,'A. 10',0),(19,6,'B. 100',0),(20,6,'C. 19',0),(21,6,'A. None',1),(22,7,'Explain your answer Here',0),(23,8,'A',0),(24,8,'A Compliment',0),(25,8,'B',0),(26,8,'B Compliment',1),(27,10,'A. Volume',0),(28,10,'B. Velocity',0),(29,10,'C. Variety',0),(30,10,'D. All of the above',1),(31,11,'Operator overloading',1),(32,11,'Virtual functions',0),(33,11,'Function overloading',0),(34,11,'Reference Variables',0),(35,12,'1',1),(36,12,'-1',0),(37,12,'0',0),(38,12,'0.1',0),(39,13,'Explain your answer in the textbox',0),(40,14,'A. Statisticians',1),(41,14,'B. Professors',0),(42,14,'C. Students',0),(43,14,'A. Doctors',0),(44,15,'A. Create',0),(45,15,'B. Insert',1),(46,15,'C. Add',0),(47,15,'A. Make',0),(48,16,'A. Control file',1),(49,16,'B. Password file',0),(50,16,'C. Parameter file',0),(51,16,'D. Archived log file',0),(52,17,'A. limits the column data that are returned.',0),(53,17,'B. limits the row data are returned.',0),(54,17,'C. Both A and B are correct.',1),(55,17,'D. None',0),(56,18,'An exact match is necessary in a SELECT statement.',0),(57,18,'An exact match is not possible in a SELECT statement.',1),(58,18,'An exact match is necessary in a CREATE statement.',0),(59,18,'An exact match is not possible in a CREATE statement.',0),(60,19,'A. A map drawn by using CAD/CAM tools',0),(61,19,'B. A form of map drawn by using Braille for the visually impaired',0),(62,19,'C. A form of map where objects are drawn using non-Euclidean coordinates',1),(63,19,'D. A form of map based on photogrametric principles.',0),(64,20,' A. Unreadable maps and graphs',1),(65,20,' B. Unnecessary detail around maps and diagrams',0),(66,20,' C. Awful pop music.',0),(67,20,' D. Incorrect plots generated by GIS',0),(68,21,'A. Potassium chloride',0),(69,21,'B. Potassium carbonate',0),(70,21,'C. Potassium BIcarbonate',1),(71,21,'D. Potassium hydroxide',0),(72,22,'A. hole in ozone layer',0),(73,22,'B. decrease in the ozone layer in troposphere',0),(74,22,'C. decrease in thickness of ozone layer in stratosphere',1),(75,22,'D. increase in the thickness of ozone layer in troposphere',0),(76,23,'A. transfer of pollen from anther to stigma',1),(77,23,'B. germination of pollen grains',0),(78,23,'C. growth of pollen tube in ovule',0),(79,23,'D. visiting flowers by insects ',0),(80,24,'A. viscosity of ink',0),(81,24,'B. capillary action phenomenon',1),(82,24,'C. diffusion of ink through the blotting',0),(83,24,'D. siphon action',0),(84,25,'A. Fermi',0),(85,25,'B. Newton',0),(86,25,'c.  Angstrom',1),(87,25,'D. Tesla',0),(91,26,'A. Bihar',0),(92,26,'B. WestBengal',1),(93,26,'C. Orissa',0),(94,26,'D. Madhya Pradesh',0),(95,27,'A. Max Weber',0),(96,27,'B. Ernst Troeltsch',1),(97,27,'C. Howard Becker',0),(98,27,'D. Robert K. Mertonr',0),(99,28,'Please explain your answer in the textbox',0),(100,29,'A. Mark Zuckerburg',1),(101,29,'B. Bill Gates',0),(102,29,'C. Larry Page',0),(103,29,'D. Sergey Brin',0),(108,30,'A. Larry Page and Sergey Brin',1),(109,30,'B. Mark ZuckerBurg',0),(110,30,'C. Bill Gates',0),(111,30,'D. None of the above',0);
/*!40000 ALTER TABLE `question_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `QuestionID` int(11) NOT NULL AUTO_INCREMENT,
  `QuestionTypeID` int(11) NOT NULL,
  `SubjectID` int(11) NOT NULL,
  `Description` varchar(200) NOT NULL,
  PRIMARY KEY (`QuestionID`),
  KEY `fk_Questions_QuestionType1_idx` (`QuestionTypeID`),
  KEY `SubjectID_idx` (`SubjectID`),
  CONSTRAINT `SubjectID` FOREIGN KEY (`SubjectID`) REFERENCES `subject` (`SubjectID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Questions_QuestionType1` FOREIGN KEY (`QuestionTypeID`) REFERENCES `questiontype` (`QuestionTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,1,1,'1. The DBMS acts as an interface between what two components of an enterprise-class database system?'),(2,1,1,'2. Which of the following products was an early implementation of the relational model developed by E.F. Codd of IBM?'),(3,1,3,'Which statistical method would you apply to ascertain that age a stronger predictor of education level attainment?'),(4,2,4,'2.What is virtual memory? Differentiate between logical & physical memory.'),(5,1,4,'1.. The brain of any computer system is'),(6,1,5,'The given numbers are 82,85,92,95,97,100,103. The Mean is'),(7,2,5,'Explain Central Limit Theorem'),(8,1,6,'1. If A and B are any two sets, then A ∩ (A ∪ B) is equal to:'),(9,1,6,'2. The set of intelligent students in a class is.'),(10,1,8,'What are the three \"V\"s of Big data?'),(11,1,10,'Which of the following supports polymorphism?'),(12,1,10,'Which of the following evaluates to TRUE?'),(13,2,11,'What is a view state'),(14,1,14,'Who uses R programming the most'),(15,1,18,'You can add a row using SQL in a database with which of the following?'),(16,1,18,'Which type of file is part of the Oracle database?'),(17,1,18,'The SQL WHERE clause:'),(18,1,18,'The wildcard in a WHERE clause is useful when?'),(19,1,17,'What is a cartogram?\n'),(20,1,17,'What is chart junk?'),(21,1,21,'1. Ordinary table salt is sodium chloride. What is baking soda?'),(22,1,22,'Ozone hole refers to'),(23,1,22,'Pollination is best defined as'),(24,1,22,'The absorption of ink by blotting paper involves'),(25,1,22,'1. Nuclear sizes are expressed in a unit named'),(26,1,25,'In which of the following States did the Naxalite Movement emerge in 1960s?'),(27,1,25,'Who among the following has divided religious organization into denominations and cults?'),(28,2,25,'1. Describe the scope of sociology'),(29,1,29,'1. Who is the founder of Facebook?'),(30,1,29,'Who founded Google?');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions_answers`
--

DROP TABLE IF EXISTS `questions_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions_answers` (
  `QuestionAnswerID` int(11) NOT NULL AUTO_INCREMENT,
  `QuestionID` int(11) NOT NULL,
  `QuestionOptionID` int(11) NOT NULL,
  PRIMARY KEY (`QuestionAnswerID`),
  KEY `fk_Questions_has_Question_Option_Question_Option1_idx` (`QuestionOptionID`),
  KEY `fk_Questions_has_Question_Option_Questions1_idx` (`QuestionID`),
  CONSTRAINT `fk_Questions_has_Question_Option_Question_Option1` FOREIGN KEY (`QuestionOptionID`) REFERENCES `question_option` (`QuestionOptionID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Questions_has_Question_Option_Questions1` FOREIGN KEY (`QuestionID`) REFERENCES `questions` (`QuestionID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions_answers`
--

LOCK TABLES `questions_answers` WRITE;
/*!40000 ALTER TABLE `questions_answers` DISABLE KEYS */;
INSERT INTO `questions_answers` VALUES (1,1,1),(2,2,3),(3,3,1),(4,4,2),(5,5,3),(6,6,1),(7,7,1),(8,8,2),(9,9,2),(10,10,4),(11,11,4),(12,12,3),(13,13,3),(14,14,1),(15,15,1),(16,16,4),(17,17,2),(18,18,1),(19,19,3),(20,20,2),(21,21,1),(22,22,2),(23,23,4),(24,24,2),(25,25,1),(26,26,3),(27,27,4),(28,28,2),(29,29,1),(30,30,4);
/*!40000 ALTER TABLE `questions_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questiontype`
--

DROP TABLE IF EXISTS `questiontype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questiontype` (
  `QuestionTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(45) NOT NULL,
  `Description` varchar(45) NOT NULL,
  PRIMARY KEY (`QuestionTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questiontype`
--

LOCK TABLES `questiontype` WRITE;
/*!40000 ALTER TABLE `questiontype` DISABLE KEYS */;
INSERT INTO `questiontype` VALUES (1,'Objective','Objective Type Questions'),(2,'Subjective','Subjective Type Questions');
/*!40000 ALTER TABLE `questiontype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `RoleID` int(11) NOT NULL AUTO_INCREMENT,
  `Role` varchar(45) NOT NULL,
  `Comment` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`RoleID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Admin','Admin is the SuperUser'),(2,'Teacher','Teacher can be an Instructors or a Professor'),(3,'Teaching Assistant','Teaching Assistants'),(4,'Student','Students');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_exam_answer`
--

DROP TABLE IF EXISTS `student_exam_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_exam_answer` (
  `StudentExamAnswerID` int(11) NOT NULL AUTO_INCREMENT,
  `StudentID` int(11) NOT NULL,
  `ExamQuestionID` int(11) NOT NULL,
  `QuestionOptionID` int(11) NOT NULL,
  `Text` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`StudentExamAnswerID`),
  KEY `StudentID_idx` (`StudentID`),
  KEY `ExamQuestionID_idx` (`ExamQuestionID`),
  KEY `fk_QuestionAnswerID_idx` (`QuestionOptionID`),
  CONSTRAINT `fk_ExamQuestionID` FOREIGN KEY (`ExamQuestionID`) REFERENCES `exam_question` (`ExamQuestionID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_QuestionAnswerID` FOREIGN KEY (`QuestionOptionID`) REFERENCES `question_option` (`QuestionOptionID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_StudentID` FOREIGN KEY (`StudentID`) REFERENCES `user` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_exam_answer`
--

LOCK TABLES `student_exam_answer` WRITE;
/*!40000 ALTER TABLE `student_exam_answer` DISABLE KEYS */;
INSERT INTO `student_exam_answer` VALUES (1,5,1,1,NULL),(6,6,3,8,NULL),(8,17,4,10,NULL),(9,18,5,13,NULL),(10,19,6,20,NULL),(11,20,8,23,NULL),(12,21,29,99,NULL),(13,22,10,28,NULL),(14,23,11,32,NULL),(15,24,12,38,NULL),(16,25,13,41,NULL),(17,26,14,47,NULL),(18,27,15,50,NULL),(19,28,16,56,NULL),(20,29,17,57,NULL),(21,30,18,62,NULL),(22,18,14,45,NULL),(23,19,15,52,NULL),(24,20,16,53,NULL),(25,21,17,59,NULL),(26,22,18,62,NULL),(27,18,14,45,NULL),(28,19,15,52,NULL),(29,20,16,53,NULL),(30,21,17,59,NULL),(31,22,18,62,NULL),(32,23,24,78,NULL),(33,24,25,81,NULL),(34,25,26,87,NULL),(35,26,27,91,NULL),(36,27,28,95,NULL),(37,28,29,103,NULL),(38,29,30,108,NULL);
/*!40000 ALTER TABLE `student_exam_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_exam_grader`
--

DROP TABLE IF EXISTS `student_exam_grader`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_exam_grader` (
  `StudentExamGraderID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL,
  `ExamRegistrationID` int(11) NOT NULL,
  PRIMARY KEY (`StudentExamGraderID`),
  KEY `UserID_idx` (`UserID`),
  KEY `RegistrationID_idx` (`ExamRegistrationID`),
  CONSTRAINT `RegistrationID` FOREIGN KEY (`ExamRegistrationID`) REFERENCES `exam_registration` (`ExamRegistrationID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_UserID` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_exam_grader`
--

LOCK TABLES `student_exam_grader` WRITE;
/*!40000 ALTER TABLE `student_exam_grader` DISABLE KEYS */;
INSERT INTO `student_exam_grader` VALUES (1,4,4),(2,2,4),(8,7,5),(9,9,7),(10,10,8),(11,11,9),(12,31,10),(13,32,43),(61,33,44),(62,35,46),(63,36,47),(64,37,48),(65,38,49),(66,39,50),(67,40,51),(68,41,52),(69,42,53),(70,43,54),(71,44,55),(72,45,56),(73,46,57),(74,47,58),(75,48,59),(76,49,60),(77,50,61),(78,51,62),(79,52,63),(80,53,64),(81,54,65),(82,55,66);
/*!40000 ALTER TABLE `student_exam_grader` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `studentsanswer`
--

DROP TABLE IF EXISTS `studentsanswer`;
/*!50001 DROP VIEW IF EXISTS `studentsanswer`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `studentsanswer` (
  `Student Name` tinyint NOT NULL,
  `subjectname` tinyint NOT NULL,
  `Question` tinyint NOT NULL,
  `Selected Answer` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject` (
  `SubjectID` int(11) NOT NULL AUTO_INCREMENT,
  `SubjectName` varchar(45) NOT NULL,
  `Comment` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`SubjectID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (1,'Database','This subject involves designing database.'),(2,'Users and Use Context','This course forms the base for UI/UX.'),(3,'Data Analytics','This subject forms base for Digging into Data'),(4,'Computer Science',NULL),(5,'Statistics',NULL),(6,'Maths',NULL),(7,'Digging Into Data',NULL),(8,'Big Data Infrastructure',NULL),(9,'Data To Insights',NULL),(10,'C++ Programming',NULL),(11,'ASP.Net Programming',NULL),(12,'Psychology',NULL),(13,'Health Informatics',NULL),(14,'R programming',NULL),(15,'Machine Learning',NULL),(16,'Marketing Analytics',NULL),(17,'GIS',NULL),(18,'Web Enabled Database',NULL),(19,'Business Intelligence',NULL),(20,'Web Informatics',NULL),(21,'Biology',NULL),(22,'Physics',NULL),(23,'Aeronautics',NULL),(24,'Library Science',NULL),(25,'Sociology',NULL),(26,'Human Biology',NULL),(27,'Mechanical Engineering',NULL),(28,'Generall Science',NULL),(29,'Social Network Analysis',NULL),(30,'InterNetworking',NULL);
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher_subject`
--

DROP TABLE IF EXISTS `teacher_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher_subject` (
  `TeacherSubjectID` int(11) NOT NULL AUTO_INCREMENT,
  `SubjectID` int(11) NOT NULL,
  `TeacherID` int(11) NOT NULL,
  PRIMARY KEY (`TeacherSubjectID`),
  KEY `fk_Subject_has_Teacher_Subject1_idx` (`SubjectID`),
  KEY `UserID_idx` (`TeacherID`),
  CONSTRAINT `fk_Subject_has_Teacher_Subject1` FOREIGN KEY (`SubjectID`) REFERENCES `subject` (`SubjectID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_teacherid` FOREIGN KEY (`TeacherID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_subject`
--

LOCK TABLES `teacher_subject` WRITE;
/*!40000 ALTER TABLE `teacher_subject` DISABLE KEYS */;
INSERT INTO `teacher_subject` VALUES (1,3,4),(2,2,2),(3,1,2),(4,5,7),(5,3,7),(6,3,7),(7,5,8),(8,5,7),(9,5,9),(10,6,8),(11,6,11),(12,7,11),(13,5,10),(14,14,7),(15,15,8),(16,16,8),(17,17,9),(18,18,9),(19,19,9),(20,20,7),(21,21,8),(22,22,9),(23,23,10),(24,24,11),(25,25,7),(26,26,8),(27,27,9),(28,28,10),(29,29,11),(30,30,7);
/*!40000 ALTER TABLE `teacher_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `Password` varchar(45) NOT NULL,
  `FirstName` varchar(45) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Admin','Brian','Butler'),(2,'Teacher','Vedat','Diker'),(3,'Test3','Christina','Dawn'),(4,'Test4','Andrea','Wiggins'),(5,'Test5','Vera','Rhoads'),(6,'test12','Allen','Tuladhar'),(7,'test7','Natalie','Brees'),(8,'test4','Dipesh','Karki'),(9,'test9','Sudeep','Karki'),(10,'test10','Pratima','Karki'),(11,'test11','Shree','Karkee'),(12,'test12','Nisha','Raut'),(13,'test13','Muna','Chaula'),(14,'test14','Prashant','Kshetry'),(15,'test15','Christina','Saremi'),(16,'test16','Dipesh','Thapa'),(17,'test17','John','Chettri'),(18,'test18','Manoj','Kc'),(19,'test19','Lily','Yadav'),(20,'test20','Ruby','Yadav'),(21,'test21','Sazal','Sthapit'),(22,'test22','Shyam','Poudel'),(23,'test23','Suman','Gautam'),(24,'test24','Samira','Regmi'),(25,'test25','Shankar','Devkota'),(26,'test26','Nancy','Shrestha'),(27,'test27','Daya','Subedi'),(28,'test28','Prakash','Subedi'),(29,'test29','Rishi','Dhamala'),(30,'test30','Annie','Wood'),(31,'test','Preet','Jha'),(32,'test','Reety','Jha'),(33,'test','Geet','Jha'),(34,'test','Bina','Jhadu'),(35,'test','Tinay','Bhok'),(36,'test','Manis','Jhalna'),(37,'test','Malvika','Subba'),(38,'test','Malina','Joshi'),(39,'test','Prinsha','Shrestha'),(40,'test','Richa','Kc'),(41,'test','Renee','Mana'),(42,'test','Alok','Katwal'),(43,'test','Sangy','Sharna'),(44,'test','Sony','Saud'),(45,'test','Mala','Pokh'),(46,'test','Andy','Adams'),(47,'test','Gauri','Malla'),(48,'test','Ujina','Shrestha'),(49,'test','Geeta','Tajhya'),(50,'test','Geeta','Shrestha'),(51,'test','Deepak','Paudel'),(52,'test','Rita','JDawadi'),(53,'test','Mandira','Jha'),(54,'test','Avish','Shrestha'),(55,'test','Pinky','Sharma');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `UserRoleID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL,
  `RoleID` int(11) NOT NULL,
  PRIMARY KEY (`UserRoleID`),
  KEY `fk_Role_has_User_User1_idx` (`UserID`),
  KEY `fk_Role_has_User_Role_idx` (`RoleID`),
  CONSTRAINT `fk_Role_has_User_Role` FOREIGN KEY (`RoleID`) REFERENCES `role` (`RoleID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Role_has_User_User1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,2),(5,5,4),(6,6,4),(7,7,2),(8,8,2),(9,9,2),(10,10,2),(11,11,2),(12,12,3),(13,13,3),(14,14,3),(15,15,3),(16,16,3),(32,17,4),(33,18,4),(34,19,4),(35,20,4),(36,21,4),(37,22,4),(38,23,4),(39,24,4),(40,25,4),(41,26,4),(42,27,4),(43,28,4),(44,29,4),(45,30,4),(46,32,3),(47,33,3),(48,34,3),(49,35,3),(50,36,3),(51,37,3),(52,38,3),(53,39,3),(54,40,3),(55,41,3),(56,42,3),(57,43,3),(58,44,3),(59,45,3),(60,46,3),(61,47,3),(62,48,3),(63,49,3),(64,50,3),(65,51,3),(66,52,3),(67,53,3),(68,54,3),(69,55,3),(70,31,3);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `v_gpatable`
--

DROP TABLE IF EXISTS `v_gpatable`;
/*!50001 DROP VIEW IF EXISTS `v_gpatable`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_gpatable` (
  `Name` tinyint NOT NULL,
  `ExamID` tinyint NOT NULL,
  `SubjectName` tinyint NOT NULL,
  `GPA` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_grader`
--

DROP TABLE IF EXISTS `v_grader`;
/*!50001 DROP VIEW IF EXISTS `v_grader`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_grader` (
  `GraderName` tinyint NOT NULL,
  `examRegistrationID` tinyint NOT NULL,
  `subjectName` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_instructornamesubjectname`
--

DROP TABLE IF EXISTS `v_instructornamesubjectname`;
/*!50001 DROP VIEW IF EXISTS `v_instructornamesubjectname`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_instructornamesubjectname` (
  `InstructorName` tinyint NOT NULL,
  `SubjectName` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_questionbank`
--

DROP TABLE IF EXISTS `v_questionbank`;
/*!50001 DROP VIEW IF EXISTS `v_questionbank`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_questionbank` (
  `ExamID` tinyint NOT NULL,
  `SubjectName` tinyint NOT NULL,
  `Question` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_questionsoption`
--

DROP TABLE IF EXISTS `v_questionsoption`;
/*!50001 DROP VIEW IF EXISTS `v_questionsoption`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_questionsoption` (
  `ExamID` tinyint NOT NULL,
  `subjectname` tinyint NOT NULL,
  `Question` tinyint NOT NULL,
  `type` tinyint NOT NULL,
  `Options` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_statisticsexam`
--

DROP TABLE IF EXISTS `v_statisticsexam`;
/*!50001 DROP VIEW IF EXISTS `v_statisticsexam`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_statisticsexam` (
  `Name` tinyint NOT NULL,
  `SubjectName` tinyint NOT NULL,
  `ExamRegistrationID` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_studentanswer`
--

DROP TABLE IF EXISTS `v_studentanswer`;
/*!50001 DROP VIEW IF EXISTS `v_studentanswer`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_studentanswer` (
  `UserName` tinyint NOT NULL,
  `Subject` tinyint NOT NULL,
  `Question` tinyint NOT NULL,
  `SelectedAnswer` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_studentanswers`
--

DROP TABLE IF EXISTS `v_studentanswers`;
/*!50001 DROP VIEW IF EXISTS `v_studentanswers`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_studentanswers` (
  `Student Name` tinyint NOT NULL,
  `Subject` tinyint NOT NULL,
  `Question` tinyint NOT NULL,
  `Selected Answer` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_usernamerole`
--

DROP TABLE IF EXISTS `v_usernamerole`;
/*!50001 DROP VIEW IF EXISTS `v_usernamerole`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_usernamerole` (
  `UserName` tinyint NOT NULL,
  `Role` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_usernamesubjectgpa`
--

DROP TABLE IF EXISTS `v_usernamesubjectgpa`;
/*!50001 DROP VIEW IF EXISTS `v_usernamesubjectgpa`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_usernamesubjectgpa` (
  `Name` tinyint NOT NULL,
  `Subject` tinyint NOT NULL,
  `GPA` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `instructornamesubjectname`
--

/*!50001 DROP TABLE IF EXISTS `instructornamesubjectname`*/;
/*!50001 DROP VIEW IF EXISTS `instructornamesubjectname`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `instructornamesubjectname` AS select concat(`us`.`FirstName`,'  ',`us`.`LastName`) AS `Instructor Name`,`sub`.`SubjectName` AS `SubjectName` from ((`user` `us` join `subject` `sub`) join `teacher_subject` `teachsub`) where ((`us`.`UserID` = `teachsub`.`TeacherID`) and (`teachsub`.`SubjectID` = `sub`.`SubjectID`)) group by `us`.`FirstName` order by `sub`.`SubjectName` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `studentsanswer`
--

/*!50001 DROP TABLE IF EXISTS `studentsanswer`*/;
/*!50001 DROP VIEW IF EXISTS `studentsanswer`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `studentsanswer` AS select concat(`us`.`FirstName`,' ',`us`.`LastName`) AS `Student Name`,`sub`.`SubjectName` AS `subjectname`,`ques`.`Description` AS `Question`,`question_option`.`Text` AS `Selected Answer` from ((((((((`user` `us` join `exam_registration` `ex_reg` on((`us`.`UserID` = `ex_reg`.`UserID`))) join `exam` on((`ex_reg`.`ExamID` = `exam`.`ExamID`))) join `teacher_subject` on((`exam`.`TeacherSubjectID` = `teacher_subject`.`SubjectID`))) join `subject` `sub` on((`teacher_subject`.`SubjectID` = `sub`.`SubjectID`))) join `questions` `ques` on((`sub`.`SubjectID` = `ques`.`SubjectID`))) join `exam_question` on((`ques`.`QuestionID` = `exam_question`.`QuestionID`))) join `student_exam_answer` on((`exam_question`.`ExamQuestionID` = `student_exam_answer`.`ExamQuestionID`))) join `question_option` on((`student_exam_answer`.`QuestionOptionID` = `question_option`.`QuestionOptionID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_gpatable`
--

/*!50001 DROP TABLE IF EXISTS `v_gpatable`*/;
/*!50001 DROP VIEW IF EXISTS `v_gpatable`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_gpatable` AS select concat(`us`.`FirstName`,' ',`us`.`LastName`) AS `Name`,`exam_registration`.`ExamID` AS `ExamID`,`subject`.`SubjectName` AS `SubjectName`,`exam_registration`.`GPA` AS `GPA` from ((((`user` `us` join `exam_registration` on((`us`.`UserID` = `exam_registration`.`UserID`))) join `exam` on((`exam_registration`.`ExamID` = `exam`.`ExamID`))) join `teacher_subject` on((`exam`.`TeacherSubjectID` = `teacher_subject`.`TeacherSubjectID`))) join `subject` on((`teacher_subject`.`SubjectID` = `subject`.`SubjectID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_grader`
--

/*!50001 DROP TABLE IF EXISTS `v_grader`*/;
/*!50001 DROP VIEW IF EXISTS `v_grader`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_grader` AS select concat(`us`.`FirstName`,' ',`us`.`LastName`) AS `GraderName`,`examreg`.`ExamRegistrationID` AS `examRegistrationID`,`sub`.`SubjectName` AS `subjectName` from (((`user` `us` join `student_exam_grader` `examreg` on((`us`.`UserID` = `examreg`.`UserID`))) join `teacher_subject` on((`examreg`.`UserID` = `teacher_subject`.`TeacherID`))) join `subject` `sub` on((`teacher_subject`.`SubjectID` = `sub`.`SubjectID`))) where (`sub`.`SubjectName` = 'Database') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_instructornamesubjectname`
--

/*!50001 DROP TABLE IF EXISTS `v_instructornamesubjectname`*/;
/*!50001 DROP VIEW IF EXISTS `v_instructornamesubjectname`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_instructornamesubjectname` AS select concat(`us`.`FirstName`,'  ',`us`.`LastName`) AS `InstructorName`,`sub`.`SubjectName` AS `SubjectName` from ((`user` `us` join `subject` `sub`) join `teacher_subject` `teachsub`) where ((`us`.`UserID` = `teachsub`.`TeacherID`) and (`teachsub`.`SubjectID` = `sub`.`SubjectID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_questionbank`
--

/*!50001 DROP TABLE IF EXISTS `v_questionbank`*/;
/*!50001 DROP VIEW IF EXISTS `v_questionbank`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_questionbank` AS select `ex`.`ExamID` AS `ExamID`,`sub`.`SubjectName` AS `SubjectName`,`ques`.`Description` AS `Question` from (((`exam` `ex` join `teacher_subject` `ts` on((`ex`.`TeacherSubjectID` = `ts`.`TeacherSubjectID`))) join `subject` `sub` on((`ts`.`SubjectID` = `sub`.`SubjectID`))) join `questions` `ques` on((`sub`.`SubjectID` = `ques`.`SubjectID`))) where (`sub`.`SubjectName` = 'Database') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_questionsoption`
--

/*!50001 DROP TABLE IF EXISTS `v_questionsoption`*/;
/*!50001 DROP VIEW IF EXISTS `v_questionsoption`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_questionsoption` AS select `exam`.`ExamID` AS `ExamID`,`subject`.`SubjectName` AS `subjectname`,`questions`.`Description` AS `Question`,`questiontype`.`Type` AS `type`,`question_option`.`Text` AS `Options` from (((((`exam` join `exam_question` on((`exam`.`ExamID` = `exam_question`.`ExamID`))) join `questions` on((`exam_question`.`QuestionID` = `questions`.`QuestionID`))) join `questiontype` on((`questions`.`QuestionTypeID` = `questiontype`.`QuestionTypeID`))) join `subject` on((`questions`.`SubjectID` = `subject`.`SubjectID`))) join `question_option` on((`questions`.`QuestionID` = `question_option`.`QuestionID`))) where ((`subject`.`SubjectName` = 'database') and (`questiontype`.`Type` = 'objective')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_statisticsexam`
--

/*!50001 DROP TABLE IF EXISTS `v_statisticsexam`*/;
/*!50001 DROP VIEW IF EXISTS `v_statisticsexam`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_statisticsexam` AS select concat(`us`.`FirstName`,' ',`us`.`LastName`) AS `Name`,`subject`.`SubjectName` AS `SubjectName`,`exam_registration`.`ExamRegistrationID` AS `ExamRegistrationID` from ((((`user` `us` join `exam_registration` on((`us`.`UserID` = `exam_registration`.`UserID`))) join `exam` on((`exam_registration`.`ExamID` = `exam`.`ExamID`))) join `teacher_subject` on((`exam`.`TeacherSubjectID` = `teacher_subject`.`TeacherSubjectID`))) join `subject` on((`teacher_subject`.`SubjectID` = `subject`.`SubjectID`))) where (`subject`.`SubjectName` = 'Statistics') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_studentanswer`
--

/*!50001 DROP TABLE IF EXISTS `v_studentanswer`*/;
/*!50001 DROP VIEW IF EXISTS `v_studentanswer`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_studentanswer` AS select concat(`us`.`FirstName`,' ',`us`.`LastName`) AS `UserName`,`sub`.`SubjectName` AS `Subject`,`ques`.`Description` AS `Question`,`question_option`.`Text` AS `SelectedAnswer` from ((((((((`user` `us` join `exam_registration` `ex_reg` on((`us`.`UserID` = `ex_reg`.`UserID`))) join `exam` on((`ex_reg`.`ExamID` = `exam`.`ExamID`))) join `teacher_subject` on((`exam`.`TeacherSubjectID` = `teacher_subject`.`SubjectID`))) join `subject` `sub` on((`teacher_subject`.`SubjectID` = `sub`.`SubjectID`))) join `questions` `ques` on((`sub`.`SubjectID` = `ques`.`SubjectID`))) join `exam_question` on((`ques`.`QuestionID` = `exam_question`.`QuestionID`))) join `student_exam_answer` on((`exam_question`.`ExamQuestionID` = `student_exam_answer`.`ExamQuestionID`))) join `question_option` on((`student_exam_answer`.`QuestionOptionID` = `question_option`.`QuestionOptionID`))) where ((`sub`.`SubjectName` = 'Database') and (`us`.`UserID` = 3)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_studentanswers`
--

/*!50001 DROP TABLE IF EXISTS `v_studentanswers`*/;
/*!50001 DROP VIEW IF EXISTS `v_studentanswers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_studentanswers` AS select concat(`us`.`FirstName`,' ',`us`.`LastName`) AS `Student Name`,`sub`.`SubjectName` AS `Subject`,`ques`.`Description` AS `Question`,`question_option`.`Text` AS `Selected Answer` from ((((((((`user` `us` join `exam_registration` `ex_reg` on((`us`.`UserID` = `ex_reg`.`UserID`))) join `exam` on((`ex_reg`.`ExamID` = `exam`.`ExamID`))) join `teacher_subject` on((`exam`.`TeacherSubjectID` = `teacher_subject`.`SubjectID`))) join `subject` `sub` on((`teacher_subject`.`SubjectID` = `sub`.`SubjectID`))) join `questions` `ques` on((`sub`.`SubjectID` = `ques`.`SubjectID`))) join `exam_question` on((`ques`.`QuestionID` = `exam_question`.`QuestionID`))) join `student_exam_answer` on((`exam_question`.`ExamQuestionID` = `student_exam_answer`.`ExamQuestionID`))) join `question_option` on((`student_exam_answer`.`QuestionOptionID` = `question_option`.`QuestionOptionID`))) where (`sub`.`SubjectName` = 'Database') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_usernamerole`
--

/*!50001 DROP TABLE IF EXISTS `v_usernamerole`*/;
/*!50001 DROP VIEW IF EXISTS `v_usernamerole`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_usernamerole` AS select concat(`us`.`FirstName`,`us`.`LastName`) AS `UserName`,`rr`.`Role` AS `Role` from ((`user` `us` join `role` `rr`) join `user_role` `ur`) where ((`us`.`UserID` = `ur`.`UserID`) and (`ur`.`RoleID` = `rr`.`RoleID`) and (`rr`.`Role` = 'student')) order by `us`.`FirstName` limit 10 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_usernamesubjectgpa`
--

/*!50001 DROP TABLE IF EXISTS `v_usernamesubjectgpa`*/;
/*!50001 DROP VIEW IF EXISTS `v_usernamesubjectgpa`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_usernamesubjectgpa` AS select concat(`us`.`FirstName`,' ',`us`.`LastName`) AS `Name`,`subject`.`SubjectName` AS `Subject`,`exam_registration`.`GPA` AS `GPA` from ((((`user` `us` join `exam_registration` on((`us`.`UserID` = `exam_registration`.`UserID`))) join `exam` on((`exam_registration`.`ExamID` = `exam`.`ExamID`))) join `teacher_subject` on((`exam`.`TeacherSubjectID` = `teacher_subject`.`TeacherSubjectID`))) join `subject` on((`teacher_subject`.`SubjectID` = `subject`.`SubjectID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-05-16 13:40:46
