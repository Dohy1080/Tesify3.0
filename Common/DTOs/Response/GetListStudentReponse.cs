using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common.DTOs.Response
{
    public class GetListStudentReponse
    {
        public Guid Id { get; set; }
        [Column("name")]
        public string? Name { get; set; }
        [Column("gender")]
        public string? Gender { get; set; }
        [Column("mail")]
        public string? Mail { get; set; }
        [Column("phonenumber")]
        public string? PhoneNumber { get; set; }
        [Column("birthdate")]
        public DateTime BirthDate { get; set; }
        [Column("image")]
        public string Image { get; set; }
        [Column("firstlogin")]
        public DateTime FirstLogin { get; set; }
        [Column("subjectid")]
        public Guid Subject { get; set; }
        [Column("studentcode")]
        public string? StudentCode { get; set; }
    }
}
