using BusinessLogic.Repository;
using CoreBusiness.ForLogin;
using CoreEntities.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SqlServerPlugin
{
    public class AuthenRepository : IAuthenRepository
    {
        private readonly CustomDBContext _dbContext;

        public AuthenRepository(CustomDBContext dbContext)
        {
            _dbContext = dbContext;
        }

        public User GetUser(string userName)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<User> GetUser()
        {
            throw new NotImplementedException();
        }

        public async Task<User> GetUserByLoginRequest(LoginRequest loginRequest)
        {
            // Cài đặt logic để lấy thông tin người dùng từ cơ sở dữ liệu
            var user = await _dbContext.Users
                .FirstOrDefaultAsync(u => u.Username == loginRequest.UserName && u.Password == loginRequest.Password);


            
            return user;
        }

        public async Task<User> GetUserByUsernameAsync(string username)
        {
            return await _dbContext.Users.FirstOrDefaultAsync(u => u.Username == username);
        }

        public Task GetUserByUsernameAsync(object username)
        {
            throw new NotImplementedException();
        }

        User IAuthenRepository.GetUserByLoginRequest(LoginRequest loginRequest)
        {
            return _dbContext.Users.Include(i => i.Roles).FirstOrDefault(x => x.Username == loginRequest.UserName && x.Password == loginRequest.Password);
        }
    }
}
