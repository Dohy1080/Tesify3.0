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
    public class SubjectRepository : ISubjectRepository
    {
        private readonly CustomDBContext _dbContext;

        public SubjectRepository(CustomDBContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task<List<Subject>> GetAllSubjectsAsync()
        {
            return await _dbContext.Subjects.ToListAsync();
        }

        public async Task<Subject> GetSubjectByIdAsync(Guid id)
        {
            return await _dbContext.Subjects.FindAsync(id);
        }

        public async Task<Subject> AddSubjectAsync(Subject subject)
        {
            subject.Id = Guid.NewGuid(); // Tạo ID mới
            _dbContext.Subjects.Add(subject);
            await _dbContext.SaveChangesAsync();
            return subject;
        }

        public async Task<Subject> UpdateSubjectAsync(Subject subject)
        {
            _dbContext.Subjects.Update(subject);
            await _dbContext.SaveChangesAsync();
            return subject;
        }

        public async Task<bool> DeleteSubjectAsync(Guid id)
        {
            var subject = await _dbContext.Subjects.FindAsync(id);
            if (subject == null) return false;

            _dbContext.Subjects.Remove(subject);
            await _dbContext.SaveChangesAsync();
            return true;
        }
    }
}
