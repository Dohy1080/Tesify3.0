using BusinessLogic.Repository;
using Common.DTOs.Request;
using CoreEntities.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic.Interface
{
    public interface ITeacherService
    {
        public List<Teacher> GetAllTeacher();
        Task DeleteTeacher(Guid id);
        Task<Teacher> GetTeacherById(Guid id);
        Task AddTeacher(TeacherRequest teacher);
        Task<IEnumerable<Teacher>> GetTeachers(int pageNumber, int pageSize);
        Task<int> GetTotalCount();


    }


}