using BusinessLogic.Interface;
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
    public class ScoreRepository : IScoreRepository
    {   
        private readonly CustomDBContext _dbContext;

        public ScoreRepository(CustomDBContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task<IEnumerable<Score>> GetAllScoresAsync()
        {
            return await _dbContext.Scores
                .Include(s => s.Student)  // Bao gồm thông tin học sinh
                .ToListAsync();
        }

        public async Task<Score> GetScoreByIdAsync(int id)
        {
            return await _dbContext.Scores.FindAsync(id);
        }

        public async Task UpdateScoreAsync(Score studentScore)
        {
            _dbContext.Scores.Update(studentScore);
            await _dbContext.SaveChangesAsync();
        }

        public async Task<Score> GetScoreByIdAsync(Guid id)
        {
            return await _dbContext.Scores.FindAsync(id);
        }

        


    }
}

