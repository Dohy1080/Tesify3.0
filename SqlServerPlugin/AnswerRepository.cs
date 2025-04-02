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
    public class AnswerRepository : IAnswerRepository
    {
        private readonly CustomDBContext _dbContext;

        public AnswerRepository(CustomDBContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task<List<Answer>> GetAllAnswersByQuestionIdAsync(Guid questionId)
        {
            return await _dbContext.Answers.Where(a => a.QuestionID == questionId).ToListAsync();
        }

        public async Task<Answer> GetAnswerByIdAsync(Guid id)
        {
            return await _dbContext.Answers.FindAsync(id);
        }

        public async Task<Answer> AddAnswerAsync(Answer answer)
        {
            answer.Id = Guid.NewGuid();
            _dbContext.Answers.Add(answer);
            await _dbContext.SaveChangesAsync();
            return answer;
        }

        public async Task<Answer> UpdateAnswerAsync(Answer answer)
        {
            _dbContext.Answers.Update(answer);
            await _dbContext.SaveChangesAsync();
            return answer;
        }

        public async Task<bool> DeleteAnswerAsync(Guid id)
        {
            var answer = await _dbContext.Answers.FindAsync(id);
            if (answer == null) return false;

            _dbContext.Answers.Remove(answer);
            await _dbContext.SaveChangesAsync();
            return true;
        }
    }
}
