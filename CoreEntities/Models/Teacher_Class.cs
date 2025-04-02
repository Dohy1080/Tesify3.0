using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CoreEntities.Models
{
    [Table("Teacher_Class")]
    public class Teacher_Class
    {
        [Column("TeacherID")]
        public Guid TeacherID { get; set; }
        [Column("ClassID")]
        public Guid ClassID { get; set; }

        [ValidateNever]
        public virtual Teacher Teachers { get; set; }
        public virtual Class Classes { get; set; }
        
    }
}
