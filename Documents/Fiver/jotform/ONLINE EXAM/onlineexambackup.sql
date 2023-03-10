USE [onlineexam]
GO
/****** Object:  Table [dbo].[admin]    Script Date: 12/24/2022 1:58:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin](
	[admin_id] [int] NOT NULL,
	[admin_name] [nvarchar](500) NULL,
	[admin_email] [nvarchar](50) NULL,
	[admin_password] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[admin_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 12/24/2022 1:58:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[category_id] [int] NOT NULL,
	[category_name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[exam]    Script Date: 12/24/2022 1:58:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[exam](
	[exam_id] [int] NOT NULL,
	[exam_name] [nvarchar](500) NULL,
	[exam_description] [nvarchar](3276) NULL,
	[exam_date] [date] NULL,
	[exam_duration] [int] NULL,
	[exam_marks] [int] NULL,
	[exam_negativemarks] [int] NULL,
	[exam_totalquestion] [int] NULL,
	[category_fid] [int] NULL,
	[subject_fid] [int] NULL,
	[exampass_marks] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[exam_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[question]    Script Date: 12/24/2022 1:58:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[question](
	[question_id] [int] NOT NULL,
	[question_name] [nvarchar](3276) NULL,
	[option_one] [nvarchar](3276) NULL,
	[option_two] [nvarchar](3276) NULL,
	[option_three] [nvarchar](3276) NULL,
	[option_four] [nvarchar](3276) NULL,
	[question_answer] [int] NULL,
	[exam_fid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[question_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[result]    Script Date: 12/24/2022 1:58:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[result](
	[result_id] [int] NOT NULL,
	[result_status] [nvarchar](50) NULL,
	[result_score] [int] NULL,
	[user_email] [nvarchar](50) NULL,
	[totalquestion] [int] NULL,
	[exam_fid] [int] NULL,
	[exam_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[result_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[subject]    Script Date: 12/24/2022 1:58:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[subject](
	[subject_id] [int] IDENTITY(1,1) NOT NULL,
	[subject_name] [nvarchar](50) NULL,
	[category_fid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[subject_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 12/24/2022 1:58:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[user_fname] [nvarchar](50) NULL,
	[user_lname] [nvarchar](50) NULL,
	[user_email] [nvarchar](50) NULL,
	[user_password] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[spaddexam]    Script Date: 12/24/2022 1:58:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spaddexam]

@examname nvarchar(500),
@examdis nvarchar(MAX),
@examdate date,
@examduration int,
@exampassmarks int,
@exammarks int,
@examsubjectfid int,
@examcategoryfid int
as
begin
      insert into exam
	  (exam_name,exam_description,exam_date,exam_duration,exampass_marks,exam_marks,subject_fid,category_fid) values
	  (@examname,@examdis,@examdate,@examduration,@exampassmarks,@exammarks,@examsubjectfid,@examcategoryfid)
	  
	  
	  
end

GO
/****** Object:  StoredProcedure [dbo].[spAddquestion]    Script Date: 12/24/2022 1:58:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[spAddquestion]
@questionname nvarchar(MAX),
@optionone nvarchar(MAX),
@optiontwo nvarchar(MAX),
@optionthree nvarchar(MAX),
@optionfour nvarchar(MAX),
@questionanswer int,
@examfid int
as
begin
        insert into question( question_name,option_one,option_two,option_three,option_four,question_answer,exam_fid) values
		(@questionname,@optionone,@optiontwo,@optionthree,@optionfour,@questionanswer,@examfid)
		

end
GO
/****** Object:  StoredProcedure [dbo].[spAdminlogin]    Script Date: 12/24/2022 1:58:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spAdminlogin]

@admin_email nvarchar(50),
@password nvarchar(100)
as
begin

  Declare @count int
  select @count =COUNT(admin_email) from admin
  where admin_email=@admin_email and admin_password=@password
  if (@count=1)
        begin
		    select 1 as retunvalue
			end
			
			
	else
	
	    begin
		  select -1 as retunvalue
		  end
		  
end
GO
/****** Object:  StoredProcedure [dbo].[spEditquestion]    Script Date: 12/24/2022 1:58:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spEditquestion]
	@questionid int,
	@questionname nvarchar(MAX),
	@optionone nvarchar(MAX),
	@optiontwo nvarchar(MAX),
	@optionthree nvarchar(MAX),
	@optionfour nvarchar(MAX),
	@questionanswer int,
	@examfid int
	as
	begin
	  update question set question_name=@questionname, option_one=@optionone,option_two=@optiontwo, option_three=@optionthree, option_four=@optionfour,question_answer=@questionanswer, exam_fid=@examfid 
	  where question_id=@questionid
	  
	  end
	  
GO
/****** Object:  StoredProcedure [dbo].[spEditquestionfill]    Script Date: 12/24/2022 1:58:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[spEditquestionfill]
	  @questionid int
	  as 
	  
	  begin
	     select * from question
		 left join exam on
		 question.exam_fid =exam.exam_id
		 where question_id= @questionid
end
GO
/****** Object:  StoredProcedure [dbo].[spExamList]    Script Date: 12/24/2022 1:58:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spExamList]
as 

begin
     select *  from exam
	 left join subject on exam.subject_fid = subject.subject_id
	 left join category on exam.category_fid =category.category_id
end
GO
/****** Object:  StoredProcedure [dbo].[spExamListDetails]    Script Date: 12/24/2022 1:58:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spExamListDetails]
@exam_id int
as
begin
     select * from exam
	 left join subject on exam.subject_fid=subject.subject_id
	 left join category on exam.category_fid =category.category_id
	 where exam_id =@exam_id
end
GO
/****** Object:  StoredProcedure [dbo].[spExamquestion]    Script Date: 12/24/2022 1:58:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spExamquestion]
@examfid int
as
begin
     select * from question
	 left join exam on
	 question.exam_fid =exam.exam_id
	where exam_fid=@examfid
	
end
GO
/****** Object:  StoredProcedure [dbo].[spExamserachcategory]    Script Date: 12/24/2022 1:58:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spExamserachcategory]
@subjectid int
as
begin
     select * from subject
	 join exam
	 on
	 subject.subject_id = exam.subject_fid
	 where subject_id = @subjectid
end
GO
/****** Object:  StoredProcedure [dbo].[spgetallquestion]    Script Date: 12/24/2022 1:58:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spgetallquestion]
as

begin 
      select * from question
	  left join exam on
	  question.exam_fid = exam.exam_id
	  
end
GO
/****** Object:  StoredProcedure [dbo].[spQuestionserachexam]    Script Date: 12/24/2022 1:58:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[spQuestionserachexam]
@examid int
as
begin
     select * from question
	 join exam
	 on
	 exam.exam_id = question.exam_fid
	 where exam_fid = @examid
	 
end
GO
/****** Object:  StoredProcedure [dbo].[spResultinsert]    Script Date: 12/24/2022 1:58:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spResultinsert]
@examfid nvarchar(150),
@resultstatus nvarchar(150),
@resultscore int,
@totalquestion int,
@username nvarchar(50),
@examdate date
as
begin
      insert into result (exam_fid,result_status,result_score,totalquestion,user_email,exam_date) values
	  (@examfid,@resultstatus,@resultscore,@totalquestion,@username,@examdate)
	  
end
GO
/****** Object:  StoredProcedure [dbo].[spSubjectedit]    Script Date: 12/24/2022 1:58:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spSubjectedit]
@subject_name nvarchar(50),
@category_id int,
@subject_id int
as
begin
     update subject set subject_name= @subject_name, category_fid=@category_id where subject_id=@subject_id 
	 
	 
end

GO
/****** Object:  StoredProcedure [dbo].[spSubjecteditfill]    Script Date: 12/24/2022 1:58:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spSubjecteditfill]
@id int
as
begin
     select * from subject
	 left join category
	 on
	 subject.category_fid=category.category_id where subject_id=@id
	 
end
GO
/****** Object:  StoredProcedure [dbo].[spSubjectList]    Script Date: 12/24/2022 1:58:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spSubjectList]
as
begin
select * from subject
left join category
on
subject.category_fid=category.category_id

end
GO
/****** Object:  StoredProcedure [dbo].[spUserresult]    Script Date: 12/24/2022 1:58:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spUserresult]
@email nvarchar(50)
as 
begin
     select * from result
	 join exam
	 on
	 result.exam_fid = exam.exam_id
	 where user_email= @email
end
GO
/****** Object:  StoredProcedure [dbo].[spUserslogin]    Script Date: 12/24/2022 1:58:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[spUserslogin]
@user_email nvarchar(50),
@password nvarchar(100)
as
begin
      Declare @count int
	  select @count =COUNT(user_email) from users
	  where user_email= @user_email and user_password=@password
	  if (@count = 1)
	         begin
			      select 1 as retunvalue
			end
			
	   else
	       begin
		       select -1 as retunvalue
			end
end
GO
/****** Object:  StoredProcedure [dbo].[spUsersRegisterinsert]    Script Date: 12/24/2022 1:58:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spUsersRegisterinsert]
@user_fname nvarchar(50),
@user_lname nvarchar(50),
@email nvarchar(50),
@password nvarchar(100)
as
begin
     declare @count int
	 declare @returnvalue int
	 select @count = COUNT(user_email) from users where user_email = @email
	     if @count>0
		      begin
			      set @returnvalue =-1
				  
			   end
			   
		else
		  begin
		      set @returnvalue =1
			  insert into users (user_fname,user_lname,user_password,user_email) values
			  (@user_fname,@user_lname,@password,@email)
			 end
		select @returnvalue as returnvalue
end
GO
