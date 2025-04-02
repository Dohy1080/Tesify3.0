using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CoreEntities.Models
{
    [Table("Quiz")]
    public class Quiz
    {
        [Column("id")]
        public Guid ID { get; set; }
        [Column("title")]
        public string? Title { get; set; }
        [Column("Description")]
        public string? Description { get; set; }    
        [Column("duration")]
        public TimeSpan? Duration { get; set; }
        [Column("Deadline")]
        public DateTime? Deadline { get; set; }
      


        [ValidateNever]
        public virtual Score Scores { get; set; }
        
        public virtual ICollection<Question> Questions { get; set; }
        public virtual IEnumerable<ClassQuiz> ClassQuiz { get; set; }   

    }
}
