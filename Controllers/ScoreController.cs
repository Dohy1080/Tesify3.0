using BusinessLogic.Interface;
using BusinessLogic.UseCase;
using CoreEntities.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Cors.Infrastructure;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Runtime.CompilerServices;

namespace StudentTeacherManagementBE.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    [Authorize]
    public class StudentScoreController : ControllerBase
    {
        private readonly IScoreService _ScoreService;

        public StudentScoreController(IScoreService studentScoreService)
        {
            _ScoreService = studentScoreService;
        }

        [HttpGet]
        public async Task<IActionResult> GetAllScores()
        {
            var scores = await _ScoreService.GetAllScoresAsync();
            return Ok(scores);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateScore(Guid id, [FromBody] Score studentScore)
        {
            if (studentScore.ID != id)
            {
                return BadRequest("Score ID mismatch.");
            }

            try
            {
                await _ScoreService.UpdateScoreAsync(studentScore);
                return NoContent(); // 204 No Content
            }
            catch (KeyNotFoundException)
            {
                return NotFound("Score not found.");
            }
        }
    }
}
