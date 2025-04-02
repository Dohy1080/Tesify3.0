using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common.DTOs.Request
{
    [Table("Teacher")]
    public class TeacherRequest 
    {
        [Column("id")]
        public Guid Id { get; set; }
        [Column("name")]
        public string? Name { get; set; }
        [Column("phonenumber")]
        public string? phoneNumber { get; set; }
        [Column("subjectid")]
        public Guid SubjectID { get; set; }
        [Column("birthdate")]
        public DateTime BirthDate { get; set; }
        [Column("gender")]
        public string? Gender { get; set; }
        [Column("image")]
        public string? Image { get; set; }
        [Column("firstlogin")]
        public DateTime FirstLogin { get; set; }
        [Column("email")]
        public string? Email { get; set; }
       
    }
}