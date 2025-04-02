using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace CoreEntities.Models
{

    [Table("UserLogin")]
    public class User
    {
        
        public Guid UserId { get; set; }
        [Column("username")]
        public string Username { get; set; }
        [Column("password")]
        public string Password { get; set; }
        public Guid RoleId { get; set; }
        [ValidateNever]
        public virtual Role Roles { get; set; }

    }
}

