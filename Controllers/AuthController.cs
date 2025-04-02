using BusinessLogic.Repository;
using CoreEntities.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;


namespace testify3.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize(Roles = "Student")]

    public class AuthController : ControllerBase
    {
        private IAuthenRepository _authenRepository;
        public AuthController(IAuthenRepository authenRepository)
        {
            this._authenRepository = authenRepository;
        }

        [HttpGet("get")]
        public IEnumerable<User> Get()
        {
            return _authenRepository.GetUser();
        }
    }
}
