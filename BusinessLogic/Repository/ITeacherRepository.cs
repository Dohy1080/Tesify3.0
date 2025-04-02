using CoreEntities.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic.Repository
{
    public interface ITeacherRepository
    {
        public List<Teacher> GetAllTeachers();
        Task<Teacher> GetTeacherById(Guid id);
        Task DeleteTeacher(Teacher teacher);
        Task AddTeacher(Teacher teacher);
        Task<IEnumerable<Teacher>> GetTeachers(int pageNumber, int pageSize);
        Task<int> GetTotalCount();



    }
}
