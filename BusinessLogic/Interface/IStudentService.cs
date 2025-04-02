using BusinessLogic.Repository;
using Common.DTOs.Response;
using CoreEntities.Models;
using StudentTeacherManagementBE.DTOs.Request;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic.Interface
{
    public interface IStudentService
    {
        public List<AddNewStudentRequest> GetAllStudent();
        Task<IEnumerable<Student>> SearchStudents(string searchTerm);
        Task<IEnumerable<Student>> GetStudents(int pageNumber, int pageSize);
        Task<int> GetTotalCount();
        Task AddStudent(AddNewStudentRequest studentDto);
        Task<Student> GetStudentById(Guid id);
        Task DeleteStudent(Guid id);
    }

    
}
