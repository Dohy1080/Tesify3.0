using BusinessLogic.Repository;
using CoreEntities.Models;
using CoreEntities.Models.Common;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SqlServerPlugin
{
    public class QuizRepository : IQuizRepository
    {
        private readonly CustomDBContext _dbContext;

        public QuizRepository(CustomDBContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task<List<QuizRequest>> GetQuizzesAsync()
        {
            return await _dbContext.Quizzes
                .Include(q => q.Questions) // Nối với bảng Question
                    .ThenInclude(q => q.Answers) // Nối với bảng Answer
                .Select(q => new QuizRequest
                {
                    ID = q.ID,
                    Title = q.Title,
                    Deadline = q.Deadline,
                    Description = q.Description,
                    Duration = q.Duration,
                    Questions = q.Questions.Select(question => new Question
                    {
                        ID = question.ID,
                        Content = question.Content,
                        QuizID = question.ID,
                        Answers = question.Answers.Where(x => x.QuestionID == question.ID).ToList()
                    }).ToList(),
                })
                .ToListAsync();
        }

        public async Task<Quiz> AddQuizAsync(Quiz quiz)
        {
            quiz.ID = Guid.NewGuid(); // Tạo ID mới cho quiz
            _dbContext.Quizzes.Add(quiz);
            await _dbContext.SaveChangesAsync();
            return quiz;
        }

        public async Task<bool> DeleteQuizAsync(Guid id)
        {
            var quiz = await _dbContext.Quizzes.FindAsync(id);
            if (quiz == null)
            {
                return false; // Không tìm thấy quiz
            }

            _dbContext.Quizzes.Remove(quiz);
            await _dbContext.SaveChangesAsync();
            return true; // Xóa thành công
        }

        public async Task<Quiz> GetQuizByIdAsync(Guid quizId)
        {
            return await _dbContext.Quizzes.FindAsync(quizId);
        }

        public async Task<List<Quiz>> GetAllQuizzesAsync()
        {
            return await _dbContext.Quizzes.ToListAsync();
        }


        public async Task<IEnumerable<Quiz>> GetQuizzes(int pageNumber, int pageSize)
        {
            return await _dbContext.Quizzes
                .Skip((pageNumber - 1) * pageSize)
                .Take(pageSize)
                .ToListAsync();
        }

        public async Task<int> GetTotalCount()
        {
            return _dbContext.Quizzes.Count();
        }

        public async Task<List<Quiz>> SearchQuizzesAsync(string searchTerm)
        {
            return await _dbContext.Quizzes
                .Where(q => q.Title.Contains(searchTerm) || q.Description.Contains(searchTerm))
                .ToListAsync();
        }
    }
}
