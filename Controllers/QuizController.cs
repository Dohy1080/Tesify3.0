using BusinessLogic.Interface;
using BusinessLogic.UseCase;
using CoreEntities.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace StudentTeacherManagementBE.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    
    public class QuizController : ControllerBase
    {
        private readonly IQuizService _quizService;

        public QuizController(IQuizService quizService)
        {
            _quizService = quizService;
        }

        [HttpGet]
        public async Task<IActionResult> GetQuizzes()
        {
            var quizzes = await _quizService.GetQuizzesAsync();
            return Ok(quizzes);
        }

        [HttpGet("search")]
        public async Task<IActionResult> SearchQuizzes([FromQuery] string title)
        {
            var quizzes = await _quizService.SearchQuizzesAsync(title);
            return Ok(quizzes);
        }

        //[HttpPost("AddNewQuiz")]
        //public async Task<IActionResult> AddQuizAsync([FromBody] QuizRequest quiz)
        //{
        //    if (quiz == null)
        //    {
        //        return BadRequest("Quiz null");
        //    }
        //    await _quizService.AddQuizAsync(quiz);

        //    var quizzes = _quizService.GetQuizzesAsync();
        //    return Ok(quizzes);
        //}

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteQuiz(Guid id)
        {
            var result = await _quizService.DeleteQuizAsync(id);
            if (!result)
            {
                return NotFound(); // Không tìm thấy quiz
            }
            return NoContent(); // Xóa thành công
        }

        [HttpPost("submit")]
        public async Task<IActionResult> SubmitQuiz([FromBody] SubmitQuiz submitQuizDto)
        {
            try
            {
                var result = await _quizService.SubmitQuizAsync(submitQuizDto);
                return Ok(result); // Happy case
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message); // Unhappy case
            }


        }

        [HttpPost("create")]
        public async Task<IActionResult> CreateQuiz([FromBody] CreateQuiz createQuizDto)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var quiz = await _quizService.CreateQuizAsync(createQuizDto);
            return CreatedAtAction(nameof(CreateQuiz), new { id = quiz.ID }, quiz);
        }


        [HttpGet("PageNumber")]
        public async Task<IActionResult> GetQuizzes([FromQuery] int pageNumber = 1, [FromQuery] int pageSize = 10)
        {
            var quizzes = await _quizService.GetQuizzes(pageNumber, pageSize);
            var totalCount = await _quizService.GetTotalCount();

            var response = new
            {
                TotalCount = totalCount,
                PageNumber = pageNumber,
                PageSize = pageSize,
                Quizzes = quizzes
            };

            return Ok(response);
        }
    }
}
