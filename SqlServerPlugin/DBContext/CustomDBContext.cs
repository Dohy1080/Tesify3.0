using Azure;
using CoreEntities.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Diagnostics;
using Microsoft.Extensions.Hosting;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection.Metadata;
using System.Text;
using System.Threading.Tasks;

namespace SqlServerPlugin
{
    public class CustomDBContext : DbContext
    {
        public CustomDBContext(DbContextOptions<CustomDBContext> options) : base(options) { }
       

        public DbSet<Teacher> Teachers { get; set; }
        public DbSet<Student> Students { get; set; }
        public DbSet<Score> Scores { get; set; }
        public DbSet<Quiz> Quizzes { get; set; }
        public DbSet<Class> Classes { get; set; }
        public DbSet<Notification> Notifications { get; set; }
        public DbSet<User> Users { get; set; }
        public DbSet<Role> Roles { get; set; }
        public DbSet<Subject> Subjects { get; set; }
        public DbSet<Question> Questions { get; set; }
        public DbSet<Answer> Answers { get; set; }
        public DbSet<Grade> Grades { get; set; }
        public DbSet<Feedback> Feedbacks { get; set; }
        public DbSet<Teacher_Class> TeacherClasses { get; set; }
       


        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<User>().HasOne(u => u.Roles);

            modelBuilder.Entity<Teacher_Student>()
            .HasKey(e => new { e.StudentID, e.TeacherID }); // Composite key

            modelBuilder.Entity<Teacher_Student>()
                .HasOne(e => e.Student)
                .WithMany(s => s.Teacher_Students)
                .HasForeignKey(e => e.StudentID);

            modelBuilder.Entity<Teacher_Student>()
                .HasOne(e => e.Teachers)
                .WithMany(c => c.Teacher_Students)
                .HasForeignKey(e => e.TeacherID);

            modelBuilder.Entity<Teacher_Class>()
            .HasKey(ai => new { ai.ClassID, ai.TeacherID });

            modelBuilder.Entity<Teacher_Class>()
                .HasOne(ai => ai.Teachers)
                .WithMany(c => c.TeacherClasses)
                .HasForeignKey(ai => ai.TeacherID);

            modelBuilder.Entity<Teacher_Class>()
                .HasOne(ai => ai.Classes)
                .WithMany(c => c.TeacherClasses)
                .HasForeignKey(ai => ai.ClassID);

            modelBuilder.Entity<StudentAnswer>()
            .HasKey(ai => new { ai.StudentID, ai.AnswerID });

            modelBuilder.Entity<ClassQuiz>()
            .HasKey(ai => new { ai.ClassID, ai.QuizID });


            modelBuilder.Entity<StudentAnswer>()
                .HasOne(ei => ei.Students)
                .WithMany(m => m.StudentAnswers)
                .HasForeignKey(ei => ei.StudentID);

            modelBuilder.Entity<StudentAnswer>()
                .HasOne(ei => ei.Answers)
                .WithMany(m => m.StudentAnswers)
                .HasForeignKey(ei => ei.AnswerID);

            modelBuilder.Entity<Grade>()
               .HasMany(g => g.Classes) // Một Grade có nhiều Class
               .WithOne(c => c.Grades); // Một Class thuộc về một Grade

            modelBuilder.Entity<Notification>()
               .HasOne(n => n.Students) // Một Notification thuộc về một Student
               .WithMany(s => s.Notifications); // Một Student có nhiều Notifications


            modelBuilder.Entity<Notification>()
                .HasOne(n => n.Teachers) // Một Notification thuộc về một Teacher
                .WithMany(t => t.Notifications); // Một Teacher có nhiều Notifications

            modelBuilder.Entity<Feedback>()
                .HasOne(f => f.Students) // Một Feedback thuộc về một Student
                .WithMany(s => s.Feedbacks) // Một Student có nhiều Feedback
                .HasForeignKey(f => f.StudentID); // Chỉ định StudentId là khóa ngoại

            modelBuilder.Entity<Feedback>()
                .HasOne(f => f.Teachers) // Một Feedback thuộc về một Teacher
                .WithMany(t => t.Feedbacks) // Một Teacher có nhiều Feedback
                .HasForeignKey(f => f.TeacherID); // Chỉ định TeacherId là khóa ngoại

            modelBuilder.Entity<Question>()
                .HasMany(q => q.Answers); // Một Question có nhiều Answer

            modelBuilder.Entity<Quiz>()
                .HasOne(q => q.Scores) // Một Quiz có một Score
                .WithOne(s => s.Quizzes) // Một Score thuộc về một Quiz
                .HasForeignKey<Score>(s => s.QuizID); // Chỉ định QuizId là khóa ngoại

            modelBuilder.Entity<Score>()
               .HasOne(s => s.Students) // Một Score thuộc về một Student
               .WithMany(st => st.Scores) // Một Student có nhiều Scores
               .HasForeignKey(s => s.StudentID); // Chỉ định StudentId là khóa ngoại



            modelBuilder.Entity<Feedback>()
                .HasOne(e => e.Subjects)
                .WithMany(t => t.Feedbacks);

            modelBuilder.Entity<Student>()
                .HasOne(m => m.Classes)
                .WithMany(t => t.Students);

            modelBuilder.Entity<Question>()
                .HasOne(s => s.Quizzes)
                .WithMany(x => x.Questions)
                .HasForeignKey(x => x.QuizID);

            //modelBuilder.Entity<Notification>().HasOne(u => u.Students);
            modelBuilder.Entity<Answer>().ToTable("Answer");


        }




    }


}
