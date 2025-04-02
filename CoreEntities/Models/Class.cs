using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using Microsoft.Extensions.Caching.Memory;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CoreEntities.Models
{
    [Table("Class")]
    public class Class
    {   
        [Column("id")]
        public Guid Id { get; set; }
        [Column("name")]
        public string Name { get; set; }
        [Column("totalstudent")]
        public int TotalStudent {  get; set; }
        [Column("gradeID")]
        public Guid? GradeID{ get; set; }
        public Guid? StudentId { get; set; }

        [Column("Year")]
        public string Year { get; set; }
        
       

        [ValidateNever]
       
        public virtual Grade Grades { get; set; }
        public virtual ICollection<Teacher_Class> TeacherClasses { get; set; }

        public virtual IEnumerable<ClassQuiz> ClassQuiz { get; set; } 
        public virtual ICollection<Student> Students { get; set; }
    }
}
