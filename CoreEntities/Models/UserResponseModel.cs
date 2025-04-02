using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CoreEntities.Models
{
    public class UserResponseModel
    {
        public string? Username { get; set; }
        public string Roles { get; set; }
    }
}
