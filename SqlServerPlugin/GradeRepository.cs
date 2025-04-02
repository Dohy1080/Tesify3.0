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
    public class GradeRepository : IGradeRepository
    {
        private readonly CustomDBContext _dbContext;

        public GradeRepository(CustomDBContext dbContext)
        {
            _dbContext = dbContext;
        }

        //public async Task<List<Grade>> GetAllGradesAsync()
        //{
        //    return await _dbContext.Grades.ToListAsync();
        //}

        public async Task<List<Grade>> GetAllGradesAsync()
        {
            return await _dbContext.Grades
                .Include(g => g.Classes) // Nối với bảng Class
                .Select(g => new Grade
                {
                    Name = g.Name, // Tên khối
                    Classes = g.Classes,
                    //TotalStudent = g.Classes.Sum(c => c.TotalStudent) // Tổng số sinh viên trong tất cả các lớp
                })
                .ToListAsync();
        }
    }
}
