using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CoreEntities.Models
{
    [Table("Question")]
    public class Question
    {
        public Guid ID { get; set; }
        public Guid QuizID { get; set; }
        public DateTime? TimeLimit { get; set; }
        public string? Content { get; set; }
        public string Score { get; set; }

        [ValidateNever]
        public virtual IEnumerable<Answer> Answers {  get; set; }

        public virtual Quiz Quizzes { get; set; }
        
    }
}
