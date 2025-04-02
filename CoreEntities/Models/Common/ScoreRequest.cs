using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CoreEntities.Models.Common
{
    public class StudentScoreDto
    {
        public Guid StudentId { get; set; }
        public string? StudentName { get; set; }
        public Guid AnswerId { get; set; }
        public string? QuestionContent { get; set; }
        public bool IsCorrect { get; set; }
        public int Score { get; set; } // Tổng điểm
    }
}
