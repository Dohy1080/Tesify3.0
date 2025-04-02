using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CoreEntities.Models
{
    public class QuizResult
    {
        public Guid QuizID { get; set; }
        public Guid StudentID { get; set; }
        public int Score { get; set; }
        public string Status { get; set; } // "Completed", "In Progress", etc.
    }
}
