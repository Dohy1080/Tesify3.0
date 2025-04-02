using BusinessLogic.Interface;
using BusinessLogic.Repository;
using Common.DTOs.Request;
using CoreEntities.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic.UseCase
{


    public class TeacherService : ITeacherService
    {
        private ITeacherRepository _teacherRepository;
        public TeacherService(ITeacherRepository teacherRepository)
        {
            this._teacherRepository = teacherRepository;
        }

        public List<Teacher> GetAllTeacher()
        {
            return _teacherRepository.GetAllTeachers();
        }

        public async Task<IEnumerable<Teacher>> GetTeachers(int pageNumber, int pageSize)
        {
            return await _teacherRepository.GetTeachers(pageNumber, pageSize);
        }

        public async Task<int> GetTotalCount()
        {
            return await _teacherRepository.GetTotalCount();
        }

        public async Task DeleteTeacher(Guid id)
        {
            var teacher = await _teacherRepository.GetTeacherById(id);
            if (teacher != null)
            {
                await _teacherRepository.DeleteTeacher(teacher);
            }
            else
            {
                throw new KeyNotFoundException("Teacher not found.");
            }
        }

        public async Task<Teacher> GetTeacherById(Guid id)
        {
            return await _teacherRepository.GetTeacherById(id);
        }

        public async Task AddTeacher(TeacherRequest teacherDto)
        {
            var teacher = new Teacher
            {
                Id = Guid.NewGuid(), // Tạo GUID mới
                Name = teacherDto.Name,
                Email = teacherDto.Email,
                phoneNumber = teacherDto.phoneNumber,
                SubjectID = teacherDto.SubjectID,
                BirthDate = teacherDto.BirthDate,
                Gender = teacherDto.Gender,
                FirstLogin = DateTime.Now,
                
                
            };

            await _teacherRepository.AddTeacher(teacher);
        }

        //temporary
       



    }
}
