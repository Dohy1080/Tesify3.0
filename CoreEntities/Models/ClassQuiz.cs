using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CoreEntities.Models
{
    [Table("Class_Quiz")]
    public class ClassQuiz
    {
        public Guid ClassID { get; set; }
        public Guid QuizID { get; set; }

        [ValidateNever]
        public virtual List<Quiz> Quizzes { get; set; }

      
        public virtual List<Class> Class { get; set; }
    }
}
