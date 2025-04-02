using BusinessLogic.Repository;
using BusinessLogic.TeacherUseCase;
using CoreEntities.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Moq;
using Xunit;


namespace BusinessLogic.UseCase
{
    public class QuizServiceTests
    {
        private readonly Mock<IQuizRepository> _mockQuizRepository;
        private readonly QuizService _quizService;

        public QuizServiceTests()
        {
            _mockQuizRepository = new Mock<IQuizRepository>();
            _quizService = new QuizService(_mockQuizRepository.Object);
        }

        [Fact]
        public async Task SubmitQuizAsync_QuizNotFound_ThrowsException()
        {
            // Arrange
            var submitQuizDto = new SubmitQuiz { QuizID = Guid.NewGuid() };
            _mockQuizRepository.Setup(repo => repo.GetQuizByIdAsync(submitQuizDto.QuizID)).ReturnsAsync((Quiz)null);

            // Act & Assert
            await Assert.ThrowsAsync<Exception>(() => _quizService.SubmitQuizAsync(submitQuizDto));
        }

        [Fact]
        public async Task SubmitQuizAsync_ValidQuiz_ReturnsResult()
        {
            // Arrange
            var quiz = new Quiz { ID = Guid.NewGuid(), Title = "Test Quiz" };
            _mockQuizRepository.Setup(repo => repo.GetQuizByIdAsync(quiz.ID)).ReturnsAsync(quiz);
            var submitQuizDto = new SubmitQuiz { QuizID = quiz.ID, StudentID = Guid.NewGuid(), Answers = new List<Answer>() };

            // Act
            var result = await _quizService.SubmitQuizAsync(submitQuizDto);

            // Assert
            Assert.NotNull(result);
            Assert.Equal(quiz.ID, result.QuizID);
        }
    }
}
