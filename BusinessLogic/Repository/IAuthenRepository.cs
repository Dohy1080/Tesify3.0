using CoreBusiness.ForLogin;
using CoreEntities.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic.Repository
{
    public interface IAuthenRepository
    {
        Task<User> GetUserByUsernameAsync(string username);
        public User GetUser(string userName);
        Task GetUserByUsernameAsync(object username);
        public User GetUserByLoginRequest(LoginRequest loginRequest);
        IEnumerable<User> GetUser();
    }

}
