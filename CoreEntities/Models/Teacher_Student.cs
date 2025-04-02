using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CoreEntities.Models
{
    [Table("Teacher_Student")]
    public class Teacher_Student
    {
        [Column("TeacherID")]
        public Guid TeacherID { get; set; }
        [Column("StudentID")]
        public Guid StudentID { get; set; }

        [ValidateNever]
        public virtual Teacher Teachers { get; set; }

        [ValidateNever]
        public virtual Student Student { get; set; }
    }
}
