using BusinessLogic.Interface;
using BusinessLogic.Repository;
using CoreEntities.Models;
using CoreEntities.Models.Common;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic.TeacherUseCase
{
    public class ClassService : IClassService
    {
        private readonly IClassRepository _repository;

        public ClassService(IClassRepository repository)
        {
            _repository = repository;
        }

        public async Task<List<ClassRequest>> GetClassesAsync()
        {
            // Giả sử _repository.GetClassesAsync() trả về List<Class>
            var classes = await _repository.GetClassesAsync();

            // Chuyển đổi danh sách Class sang danh sách ClassRequest
            return classes.Select(c => new ClassRequest
            {
                Id = c.Id,
                Name = c.Name,
                TotalStudent = c.TotalStudent,
                GradeID = c.GradeID,
                StudentId = c.StudentId
            }).ToList();
        }
    }
}
