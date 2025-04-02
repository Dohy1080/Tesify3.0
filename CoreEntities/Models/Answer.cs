using CoreEntities.Models.Common;
using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CoreEntities.Models
{
    public class Answer
    {
        public Guid Id { get; set; }
        public string? Text { get; set; }
        public bool Incorrect { get; set; }
        
        [Column("QuestionID")]
        public Guid QuestionID { get; set; }

        [ValidateNever]
        public virtual IEnumerable<StudentAnswer> StudentAnswers { get; set; }
        public virtual Question Questions { get; set; }

        
    }
}
