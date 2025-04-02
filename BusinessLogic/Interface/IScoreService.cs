using BusinessLogic.Repository;
using CoreEntities.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic.Interface
{
    public interface IScoreService
    {
        Task<IEnumerable<Score>> GetAllScoresAsync();
        Task<Score> GetScoreByIdAsync(int id);
        Task UpdateScoreAsync(Score studentScore);
    }

    public class ScoreService : IScoreService
    {
        private readonly IScoreRepository _repository;

        public ScoreService(IScoreRepository repository)
        {
            _repository = repository;
        }

        public async Task<IEnumerable<Score>> GetAllScoresAsync()
        {
            return await _repository.GetAllScoresAsync();
        }

        public async Task<Score> GetScoreByIdAsync(int id)
        {
            return await _repository.GetScoreByIdAsync(id);
        }

        public async Task UpdateScoreAsync(Score studentScore)
        {
            await _repository.UpdateScoreAsync(studentScore);
        }
    }

    
}
