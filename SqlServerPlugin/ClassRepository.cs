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
    public class ClassRepository : IClassRepository
    {
        private readonly CustomDBContext _dbContext;

        public ClassRepository(CustomDBContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task<List<Class>> GetClassesAsync()
        {
            return await _dbContext.Classes.ToListAsync();
        }
    }
}
