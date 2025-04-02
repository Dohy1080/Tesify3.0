using CoreEntities.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic.Repository
{
    public interface IAnswerRepository
    {
        Task<List<Answer>> GetAllAnswersByQuestionIdAsync(Guid questionId);
        Task<Answer> GetAnswerByIdAsync(Guid id);
        Task<Answer> AddAnswerAsync(Answer answer);
        Task<Answer> UpdateAnswerAsync(Answer answer);
        Task<bool> DeleteAnswerAsync(Guid id);
    }
}
