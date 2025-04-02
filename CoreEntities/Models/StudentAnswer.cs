using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CoreEntities.Models
{
    [Table("StudentAnswer")]
    public class StudentAnswer
    {
        [Column("studentid")]
        public Guid StudentID { get; set; }
        [Column("answerid")]
        public Guid AnswerID { get; set; }

        [ValidateNever]
        public virtual Student Students {  get; set; }
        public virtual Answer Answers {  get; set; }
    }
}
