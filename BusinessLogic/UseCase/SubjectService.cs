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
    public class SubjectService : ISubjectService
    {
        private readonly ISubjectRepository _repository;

        public SubjectService(ISubjectRepository repository)
        {
            _repository = repository;
        }

        public Task<List<Subject>> GetAllSubjectsAsync() => _repository.GetAllSubjectsAsync();
        public Task<Subject> GetSubjectByIdAsync(Guid id) => _repository.GetSubjectByIdAsync(id);
        public Task<Subject> AddSubjectAsync(Subject subject) => _repository.AddSubjectAsync(subject);
        public Task<Subject> UpdateSubjectAsync(Subject subject) => _repository.UpdateSubjectAsync(subject);
        public Task<bool> DeleteSubjectAsync(Guid id) => _repository.DeleteSubjectAsync(id);
    }
}
