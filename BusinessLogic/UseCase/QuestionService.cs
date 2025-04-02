using BusinessLogic.Interface;
using BusinessLogic.Repository;
using CoreEntities.Models;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace BusinessLogic.UseCase
{
    public class QuestionService : IQuestionService
    {
        private readonly IQuestionRepository _questionRepository;

        public QuestionService(IQuestionRepository questionRepository)
        {
            _questionRepository = questionRepository;
        }

        public Task<List<Question>> GetAllQuestionsAsync() => _questionRepository.GetAllQuestionsAsync();

        public Task<Question> GetQuestionByIdAsync(Guid id) => _questionRepository.GetQuestionByIdAsync(id);

        public Task<Question> AddQuestionAsync(Question question) => _questionRepository.AddQuestionAsync(question);

        public Task AddQuestionsAsync(IEnumerable<Question> questions) => _questionRepository.AddQuestionsAsync(questions); // Thêm phương thức này

        public Task<Question> UpdateQuestionAsync(Question question) => _questionRepository.UpdateQuestionAsync(question);

        public Task<bool> DeleteQuestionAsync(Guid id) => _questionRepository.DeleteQuestionAsync(id);
    }
}