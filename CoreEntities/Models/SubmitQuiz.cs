using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CoreEntities.Models
{
    public class SubmitQuiz
    {
        public Guid StudentID { get; set; }
        public Guid QuizID { get; set; }
        public List<Answer> Answers { get; set; } // Danh sách câu trả lời
    }
}
