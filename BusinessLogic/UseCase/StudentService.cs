using BusinessLogic.Interface;
using BusinessLogic.Repository;
using Common.DTOs.Response;
using CoreEntities.Models;
using StudentTeacherManagementBE.DTOs.Request;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic.UseCase
{
    public class StudentService : IStudentService
    {
        private readonly IStudentRepository _repository;

        public StudentService(IStudentRepository repository)
        {
            _repository = repository;
        }

        public List<AddNewStudentRequest> GetAllStudent()
        {
            // Giả sử _repository.GetAllStudent() trả về List<Student>
            var students = _repository.GetAllStudent();

            // Chuyển đổi danh sách Student sang danh sách AddNewStudentRequest
            return students.Select(student => new AddNewStudentRequest
            {
                Id = student.Id,
                Name = student.Name,
                Gender = student.Gender,
                Mail = student.Mail,
                PhoneNumber = student.PhoneNumber,
                BirthDate = student.BirthDate,
                Image = student.Image,
                FirstLogin = student.FirstLogin,
                SubjectID = student.SubjectID,
                StudentCode = student.StudentCode,
                ClassId = student.ClassId,
                ClassName = student.ClassName
            }).ToList();
        }

        public async Task<IEnumerable<Student>> SearchStudents(string name)
        {
            return await _repository.GetAllStudents()  // Lấy toàn bộ danh sách học sinh
                .ContinueWith(task => task.Result
                    .Where(s => s.Name.Contains(name, StringComparison.OrdinalIgnoreCase))); // Sử dụng LINQ để tìm kiếm
        }
        public async Task<IEnumerable<Student>> GetStudents(int pageNumber, int pageSize)
        {
            return await _repository.GetStudents(pageNumber, pageSize);
        }

        public async Task<int> GetTotalCount()
        {
            return await _repository.GetTotalCount();
        }

        public async Task AddStudent(AddNewStudentRequest studentDto)
        {
            var student = new Student
            {
                Id = Guid.NewGuid(),  // Tạo GUID mới
                Name = studentDto.Name,
                Gender = studentDto.Gender,
                Mail = studentDto.Mail,
                PhoneNumber = studentDto.PhoneNumber,
                BirthDate = studentDto.BirthDate,
                Image = studentDto.Image,
                FirstLogin = DateTime.UtcNow, // Hoặc giá trị phù hợp
                StudentCode = studentDto.StudentCode,
                ClassId = studentDto.ClassId,
                ClassName = studentDto.ClassName,
                SubjectID = studentDto.SubjectID,
            };

            await _repository.AddStudent(student);
        }
        public async Task DeleteStudent(Guid id)
        {
            await _repository.DeleteStudent(id);
        }

        public async Task<Student> GetStudentById(Guid id)
        {
            return await _repository.GetStudentById(id);
        }


    }
}
