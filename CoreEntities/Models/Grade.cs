using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CoreEntities.Models
{
    [Table("Grade")]
    public class Grade
    {
        [Column("id")]
        public Guid Id { get; set; }
        [Column("name")]
        public string? Name { get; set; }

        [ValidateNever]
        public virtual ICollection<Class> Classes { get; set; }
        public virtual int TotalStudent { get; set; }
       
        //public int TotalClasses { get; set; }
    }
}
