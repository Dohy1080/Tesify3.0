using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CoreEntities.Models
{
    [Table("Subject")]
    public class Subject
    {
        [Column("id")]
        public Guid Id { get; set; }
        [Column("name")]
        public string? Name { get; set; }
        [Column("image")]
        public string? Image { get; set; }
        [ValidateNever]
        public virtual ICollection<Feedback> Feedbacks { get; set; }
    }
}
