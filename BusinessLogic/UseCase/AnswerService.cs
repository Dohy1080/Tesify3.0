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
    public class AnswerService : IAnswerService
    {
        private readonly IAnswerRepository _repository;

        public AnswerService(IAnswerRepository repository)
        {
            _repository = repository;
        }

        public Task<List<Answer>> GetAllAnswersByQuestionIdAsync(Guid questionId) => _repository.GetAllAnswersByQuestionIdAsync(questionId);
        public Task<Answer> GetAnswerByIdAsync(Guid id) => _repository.GetAnswerByIdAsync(id);
        public Task<Answer> AddAnswerAsync(Answer answer) => _repository.AddAnswerAsync(answer);
        public Task<Answer> UpdateAnswerAsync(Answer answer) => _repository.UpdateAnswerAsync(answer);
        public Task<bool> DeleteAnswerAsync(Guid id) => _repository.DeleteAnswerAsync(id);
    }
}
