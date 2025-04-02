using BusinessLogic.Repository;
using CoreBusiness;
using CoreBusiness.ForLogin;
using CoreEntities.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UseCases.Interfaces
{
    public interface IAuthenService
    {
        public string GenerateToken(User user);
       
    }

    public class AuthenService : IAuthenService
    {
        private IAuthenRepository _authenRepository;
        public AuthenService(IAuthenRepository authenRepository)
        {
            _authenRepository = authenRepository;
        }

        public string GenerateToken(User user)
        {
            throw new NotImplementedException();
        }

        public User GetUserByLoginRequest(LoginRequest loginRequest)
        {
            return _authenRepository.GetUser(loginRequest.UserName);
        }
    }
}