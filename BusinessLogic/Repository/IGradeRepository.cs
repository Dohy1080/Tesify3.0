using CoreEntities.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic.Repository
{
    public interface IGradeRepository
    {
        Task<List<Grade>> GetAllGradesAsync();
    }
}
