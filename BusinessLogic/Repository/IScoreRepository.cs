using CoreEntities.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic.Repository
{
    public interface IScoreRepository
    {
        Task<IEnumerable<Score>> GetAllScoresAsync();
        Task<Score> GetScoreByIdAsync(int id);
        Task UpdateScoreAsync(Score studentScore);
        Task<Score> GetScoreByIdAsync(Guid id);
     
    }
}
