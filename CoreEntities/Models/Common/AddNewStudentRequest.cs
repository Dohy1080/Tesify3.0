using System.ComponentModel.DataAnnotations.Schema;

namespace StudentTeacherManagementBE.DTOs.Request
{
    public class AddNewStudentRequest
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
        public required string Image { get; set; }
        [Column("firstlogin")]
        public DateTime FirstLogin { get; set; }
        [Column("SubjectID")]
        public Guid SubjectID { get; set; }
        [Column("StudentCode")]
        public string StudentCode { get; set; }
        public Guid ClassId { get; set; }
        public string? ClassName { get; set; }
    }
}
