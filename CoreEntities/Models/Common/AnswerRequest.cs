using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CoreEntities.Models.Common
{
    public class AnswerRequest
    {
        public Guid Id { get; set; }
        public string? Text { get; set; }
        public bool Incorrect { get; set; }
        public Guid QuestionID { get; set; }
    }
}
