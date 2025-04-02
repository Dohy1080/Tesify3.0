using CoreEntities.Models;
using CoreEntities.Models.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic.Interface
{
    public interface IQuizService
    {
        Task<List<QuizRequest>> GetQuizzesAsync();
        Task<List<Quiz>> SearchQuizzesAsync(string title);
        //Task AddQuizAsync(QuizRequest quiz);
        Task<bool> DeleteQuizAsync(Guid id);
        Task<QuizResult> SubmitQuizAsync(SubmitQuiz submitQuizDto);
        Task<Quiz> CreateQuizAsync(CreateQuiz createQuizDto);

        Task<IEnumerable<Quiz>> GetQuizzes(int pageNumber, int pageSize);
        Task<int> GetTotalCount();

    }
}