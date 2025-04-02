using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CoreEntities.Models.Common
{
    [Table("Question")]
    public class QuestionRequest
    {
        public Guid ID { get; set; }
        public Guid QuizID { get; set; }
        public DateTime? TimeLimit { get; set; }
        public string? Content { get; set; }
        public List<Answer> Answers { get; set; }
    }

}
