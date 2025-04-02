using CoreEntities.Models;
using CoreEntities.Models.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic.Repository
{
    public interface IQuizRepository
    {
        Task<List<QuizRequest>> GetQuizzesAsync();

        Task<List<Quiz>> SearchQuizzesAsync(string searchTerm);
        Task<Quiz> AddQuizAsync(Quiz quiz);
        Task<bool> DeleteQuizAsync(Guid id);
        Task<Quiz> GetQuizByIdAsync(Guid quizId);
        Task<List<Quiz>> GetAllQuizzesAsync();

        Task<IEnumerable<Quiz>> GetQuizzes(int pageNumber, int pageSize);
        Task<int> GetTotalCount();
       
    }



}
