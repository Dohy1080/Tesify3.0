using BusinessLogic.Repository;
using CoreBusiness;
using CoreBusiness.ForLogin;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Text;
using UseCases.Interfaces;

namespace StudentTeacherManagement.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LoginController : ControllerBase
    {
        private readonly IAuthenRepository _authenRepository;
        private readonly IAuthenService _authenService;

        public LoginController(IAuthenRepository authenRepository, IAuthenService authenService)
        {
            _authenRepository = authenRepository;
            _authenService = authenService;
        }

        [HttpPost("Login")]
        public async Task<IActionResult> Post(LoginRequest loginRequest)
        {
            var user = _authenRepository.GetUserByLoginRequest(loginRequest);

            if (user != null)
            {
                var token = _authenService.GenerateToken(user);
                return Ok(token);
            }

            return BadRequest();
        }
    }
}