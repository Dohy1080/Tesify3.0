using BusinessLogic.Interface;
using BusinessLogic.Repository;
using CoreEntities.Models;
using CoreEntities.Models.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic.TeacherUseCase
{
    public class QuizService : IQuizService
    {
        private IQuizRepository _quizRepository;
        public QuizService(IQuizRepository quizRepository)
        {
            this._quizRepository = quizRepository;
        }

        public async Task<List<QuizRequest>> GetQuizzesAsync()
        {
            return await _quizRepository.GetQuizzesAsync();
        }

       

        public async Task<List<Quiz>> SearchQuizzesAsync(string title)
        {
            return await _quizRepository.SearchQuizzesAsync(title);
        }

        //public async Task AddQuizAsync(QuizRequest quiz)
        //{
        //    var quizzes = new Quiz
        //    {
        //        ID = Guid.NewGuid(),
        //        Title = quiz.Title,

        //    };

        //    await _quizRepository.AddQuizAsync(quizzes);
        //}


        public async Task<bool> DeleteQuizAsync(Guid id)
        {
            return await _quizRepository.DeleteQuizAsync(id);
        }

        public async Task<QuizResult> SubmitQuizAsync(SubmitQuiz submitQuizDto)
        {
            var quiz = await _quizRepository.GetQuizByIdAsync(submitQuizDto.QuizID);
            if (quiz == null)
            {
                throw new Exception("Quiz not found");
            }

            // Logic chấm bài (giả định có một phương thức tính điểm)
            int score = CalculateScore(submitQuizDto.Answers);

            // Lưu kết quả
            var result = new QuizResult
            {
                QuizID = submitQuizDto.QuizID,
                StudentID = submitQuizDto.StudentID,
                Score = score,
                Status = "Completed"
            };

            return result;
        }

        private int CalculateScore(List<Answer> answers)
        {
            // Logic tính điểm (giả định)
            return answers.Count; // Ví dụ: tính dựa trên số lượng câu trả lời đúng
        }

        public async Task<Quiz> CreateQuizAsync(CreateQuiz createQuizDto)
        {
            var quiz = new Quiz
            {
                Title = createQuizDto.Title,
                Deadline = createQuizDto.Deadline,
                Duration = TimeSpan.FromHours(1),
                Questions = new List<Question>(createQuizDto.QuestionCount), // Tạo danh sách câu hỏi
                Description = createQuizDto.Description,
            };

            return await _quizRepository.AddQuizAsync(quiz);
        }


        public async Task<IEnumerable<Quiz>> GetQuizzes(int pageNumber, int pageSize)
        {
            return await _quizRepository.GetQuizzes(pageNumber, pageSize);
        }

        public async Task<int> GetTotalCount()
        {
            return await _quizRepository.GetTotalCount();
        }

    }
}
