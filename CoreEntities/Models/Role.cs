using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace CoreEntities.Models
{
    [Table("Roles")]
    public class Role
    {
        public Guid RoleId { get; set; }
        public string RoleName { get; set; }
        public string RoleCode { get; set; }
    }
}
