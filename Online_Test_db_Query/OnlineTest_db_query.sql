 use onlinetest;

/* username, subject GPA*/
Create view v_UserNameSubjectGPA as
select concat(us.FirstName,' ', us.LastName) as "Name", subject.SubjectName as "Subject",
exam_registration.GPA as "GPA" from user us JOIN exam_registration ON
us.UserID=exam_registration.UserID
JOIN exam ON exam_registration.ExamID=exam.ExamID
JOIN teacher_subject ON exam.TeacherSubjectID=teacher_subject.TeacherSubjectID
JOIN subject on teacher_subject.SubjectID=subject.SubjectID  ;

Select name, subject, gpa from v_usernameSubjectGPA order by name asc  ;  
 
 
 /*Highest GPA for each subject*/ 
Create View V_GPATABLE as select concat(us.FirstName,' ', us.LastName) as "Name", exam_registration.ExamID, 
subject.SubjectName, exam_registration.GPA from user us JOIN exam_registration ON us.UserID=exam_registration.UserID 
JOIN exam ON exam_registration.ExamID=exam.ExamID 
JOIN teacher_subject ON exam.TeacherSubjectID=teacher_subject.TeacherSubjectID
JOIN subject on teacher_subject.SubjectID=subject.SubjectID;

Select Name,SubjectName,ExamID,GPA from V_GPATABLE v1, (select subjectName as Sn,max(GPA) as mxgpa from V_GPATABLE
group by subjectName) v2 where v1.subjectName=v2.Sn and v1.GPA=v2.mxGPA order by SubjectName;
 

/* Instructor name and subjects sorted by Subject name in Descendig Order*/
CREATE view v_InstructorNameSubjectName as
select concat(us.FirstName,"  ", us.lastname) as "InstructorName", sub.SubjectName from user us, 
subject sub, teacher_subject teachSub WHERE us.UserID=teachSub.TeacherID 
AND teachSub.SubjectID=sub.SubjectID ;
Select InstructorName, subjectName from v_InstructorNameSubjectName order BY subjectName;

/* Users Name and their respective Role */
CREATE view v_UsernameRole as
select concat(us.FirstName, us.lastname) as "UserName", rr.role as "Role" from user us, role rr, user_role ur
 WHERE us.UserID=ur.UserID and ur.RoleID=rr.RoleID and rr.Role="student" ORDER BY us.FirstName ASC LIMIT 10;

select username, role from v_userNameRole;
 
 
/*Questions and its options */
CREATE view v_QuestionsOption as
SELECT exam.ExamID, subject.subjectname, questions.Description as "Question", questiontype.type,
question_Option.Text as "Options" from exam
JOIN exam_question on exam.examID=exam_question.examID
JOIN questions ON exam_question.questionID=questions.questionID 
join questiontype on questions.QuestionTypeID=questionType.QuestionTypeID
JOIN subject ON questions.SubjectID=subject.SubjectID 
JOIN question_option ON questions.QuestionID=question_option.QuestionID 
WHERE subject.SubjectName="database" AND questiontype.Type="objective" and questions.QuestionID=1;

Select examID, subjectName, question,type,options from v_QuestionsOption where (select questions.QuestionID from questions 
where QuestionID=1) ;

/* Total users registered as Students*/
select  count(concat (FirstName,LastName)) as "Total Students" from user JOIN user_role on
 user.UserID=user_role.UserID JOIN role ON user_role.RoleID=role.RoleID where role.Role="student" ;

/* Which students are registered for which exams*/
CREATE view v_StatisticsExam as
select concat (us.FirstName," ",us.LastName) as "Name", subject.SubjectName, exam_registration.ExamRegistrationID
from user us join exam_registration On us.UserID=exam_registration.UserID
JOIN exam on exam_registration.ExamID=exam.ExamID
JOIN teacher_subject ON exam.TeacherSubjectID=teacher_Subject.teacherSubjectID
JOIN subject ON teacher_subject.SubjectID=subject.SubjectID where subject.subjectName="Statistics" ;

select name,subjectName,ExamregistrationID from v_StatisticsExam order By name;

/*Grader of a subject */
CREATE view v_grader as
SELECT concat(us.firstname," ", us.lastname) as "GraderName", examReg.examRegistrationID, sub.subjectName
  from user us join student_exam_grader examReg ON
       us.userID=examReg.UserID
	INNER JOIN teacher_subject ON
       examReg.UserID=teacher_subject.TeacherID
      INNER JOIN subject sub ON
       teacher_subject.SubjectID=sub.SubjectID ;
       
select GraderName, subjectname from v_grader where v_grader.subjectName="database";

 	/* CHECKPOINT....Students answer to questions */ 
  CREATE view v_StudentAnswer as
  SELECT concat(us.firstname," ", us.lastname) as "UserName", sub.subjectname as "Subject", 
  ques.description as "Question", question_option.Text as "SelectedAnswer" from user us
  JOIN exam_registration ex_reg ON us.UserID=ex_reg.UserID 
  JOIN  exam ex ON ex_reg.ExamID=ex.ExamID
  JOIN teacher_subject ON exam.TeacherSubjectID=teacher_subject.SubjectID
  JOIN subject sub ON teacher_subject.subjectID= sub.SubjectID
  JOIN questions ques ON sub.subjectID=ques.SubjectID
  JOIN exam_question ON ques.QuestionID=exam_question.QuestionID
  JOIN student_exam_answer ON exam_question.ExamQuestionID=student_exam_answer.ExamQuestionID
  JOIN question_Option ON student_exam_answer.QuestionOptionID=question_Option.QuestionOptionID
  WHERE sub.SubjectName="Database" and us.userID=3;
  
SELECT username, subject, question, SelectedAnswer from v_StudentAnswer;  
    
    /* question Bank for each subject*/
    CREATE view v_QuestionBank as
select ex.examID as "ExamID", sub.subjectname AS "SubjectName", ques.description as "Question" from exam ex
  JOIN teacher_subject ts ON
  ex.TeacherSubjectID=ts.TeacherSubjectID
  JOIN  subject sub ON
  ts.SubjectID=sub.SubjectID
  JOIN questions ques ON
  sub.SubjectID=ques.SubjectID where sub.subjectName="Database";
  
  SELECT ExamID, subjectName, Question from v_questionBank;
  
  /*List of Subjective Questions */
select sub.subjectname, qt.type as "Question Type", ques.description AS "Question" from subject sub
  JOIN questions ques on
  sub.SubjectID=ques.SubjectID
  join questiontype qt on
  ques.QuestionTypeID=qt.QuestionTypeID
  WHERE qt.Type="subjective"  Group By sub.SubjectName;
  
  
  

       
 



    


 
 
