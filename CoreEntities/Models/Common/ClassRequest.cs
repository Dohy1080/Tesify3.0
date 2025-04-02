using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CoreEntities.Models.Common
{
    [Table("Class")]
    public class ClassRequest
    {
        [Column("id")]
        public Guid Id { get; set; }
        [Column("name")]
        public string Name { get; set; }
        [Column("totalstudent")]
        public int TotalStudent { get; set; }
        [Column("gradeID")]
        public Guid? GradeID { get; set; }
        public Guid? StudentId { get; set; }
    }
}
