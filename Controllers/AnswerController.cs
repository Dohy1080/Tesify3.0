using BusinessLogic.Interface;
using CoreEntities.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace StudentTeacherManagementBE.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    [Authorize]
    public class AnswerController : ControllerBase
    {
        private readonly IAnswerService _answerService;

        public AnswerController(IAnswerService answerService)
        {
            _answerService = answerService;
        }

        [HttpGet("question/{questionId}")]
        public async Task<IActionResult> GetAllByQuestionId(Guid questionId)
        {
            var answers = await _answerService.GetAllAnswersByQuestionIdAsync(questionId);
            return Ok(answers);
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetById(Guid id)
        {
            var answer = await _answerService.GetAnswerByIdAsync(id);
            if (answer == null) return NotFound();
            return Ok(answer);
        }

        [HttpPost]
        public async Task<IActionResult> AddAnswer([FromBody] Answer answer)
        {
            if (answer == null) return BadRequest();
            var createdAnswer = await _answerService.AddAnswerAsync(answer);
            return CreatedAtAction(nameof(GetById), new { id = createdAnswer.Id }, createdAnswer);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateAnswer(Guid id, [FromBody] Answer answer)
        {
            if (answer == null || answer.Id != id) return BadRequest();
            var updatedAnswer = await _answerService.UpdateAnswerAsync(answer);
            return Ok(updatedAnswer);
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteAnswer(Guid id)
        {
            var result = await _answerService.DeleteAnswerAsync(id);
            if (!result) return NotFound();
            return NoContent();
        }
    }
}
