using BusinessLogic.Repository;
using CoreEntities.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SqlServerPlugin
{
    public class QuestionRepository : IQuestionRepository
    {
        private readonly CustomDBContext _dbContext;

        public QuestionRepository(CustomDBContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task<List<Question>> GetAllQuestionsAsync()
        {
            return await _dbContext.Questions.ToListAsync();
        }

        public async Task<Question> GetQuestionByIdAsync(Guid id)
        {
            return await _dbContext.Questions.FindAsync(id);
        }

        public async Task<Question> AddQuestionAsync(Question question)
        {
            question.ID = Guid.NewGuid();
            _dbContext.Questions.Add(question);
            await _dbContext.SaveChangesAsync();
            return question;
        }

        public async Task<Question> UpdateQuestionAsync(Question question)
        {
            _dbContext.Questions.Update(question);
            await _dbContext.SaveChangesAsync();
            return question;
        }

        public async Task<bool> DeleteQuestionAsync(Guid id)
        {
            var question = await _dbContext.Questions.FindAsync(id);
            if (question == null) return false;

            _dbContext.Questions.Remove(question);
            await _dbContext.SaveChangesAsync();
            return true;
        }

        
        public async Task AddQuestionsAsync(IEnumerable<Question> questions)
        {
            await _dbContext.Questions.AddRangeAsync(questions);
            await _dbContext.SaveChangesAsync();
        }
    }
}
