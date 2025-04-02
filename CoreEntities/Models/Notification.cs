using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CoreEntities.Models
{
    [Table("Notification")]
    public class Notification
    {
        [Column("id")]
        public Guid Id { get; set; }
        [Column("context")]
        public string? Context { get; set; }
        [Column("time")]
        public DateTime Time { get; set; }
        [Column("studentid")]
        public Guid StudentID { get; set; }
        [Column("teacherid")]
        public Guid? TeacherID { get; set; }
        [ValidateNever]
        public virtual Student Students { get; set; } // Mối quan hệ đến Student
        public virtual Teacher Teachers { get; set; } // Mối quan hệ đến Teacher
    }



}
