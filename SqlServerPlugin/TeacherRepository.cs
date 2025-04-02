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
    public class TeacherRepository : ITeacherRepository
    {
        private CustomDBContext _dbContext;
        public TeacherRepository(CustomDBContext dBContext)
        {
            _dbContext = dBContext;
        }
        public List<Teacher> GetAllTeachers()
        {
            return _dbContext.Teachers.ToList();
        }

        public async Task<Teacher> GetTeacherById(Guid id)
        {
            return _dbContext.Teachers.Find(id);
        }

        public async Task DeleteTeacher(Teacher teacher)
        {
            _dbContext.Teachers.Remove(teacher);
            await _dbContext.SaveChangesAsync();
        }

        public async Task AddTeacher(Teacher teacher)
        {
            await _dbContext.Teachers.AddAsync(teacher);
            await _dbContext.SaveChangesAsync();
        }

        public Task GetUserByUsernameAsync(object username)
        {
            throw new NotImplementedException();
        }

        public async Task<IEnumerable<Teacher>> GetTeachers(int pageNumber, int pageSize)
        {
            return await _dbContext.Teachers
                .Skip((pageNumber - 1) * pageSize)
                .Take(pageSize)
                .ToListAsync();
        }

        public async Task<int> GetTotalCount()
        {
            return _dbContext.Teachers.Count();
        }
    }

}
