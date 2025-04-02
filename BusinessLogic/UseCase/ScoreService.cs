using BusinessLogic.Interface;
using BusinessLogic.Repository;
using CoreEntities.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic.UseCase
{
    public class ScoreService : IScoreService
    {
        private readonly IScoreRepository _repository;

        public ScoreService(IScoreRepository repository)
        {
            _repository = repository;
        }

        public Task<IEnumerable<Score>> GetAllScoresAsync()
        {
            throw new NotImplementedException();
        }

        public Task<Score> GetScoreByIdAsync(int id)
        {
            throw new NotImplementedException();
        }

        public async Task UpdateScoreAsync(Score studentScore)
        {
            var score = await _repository.GetScoreByIdAsync(studentScore.ID);
            if (score == null)
            {
                throw new KeyNotFoundException("Score not found.");
            }

            score.StartTime = studentScore.StartTime;
            score.EndTime = studentScore.EndTime;
            score.Status = studentScore.Status;
            score.StudentID = studentScore.StudentID;
            score.QuizID = studentScore.QuizID;

            await _repository.UpdateScoreAsync(score);
        }
    }
}
