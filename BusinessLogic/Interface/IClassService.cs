﻿using CoreEntities.Models;
using CoreEntities.Models.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic.Interface
{
    public interface IClassService
    {
        Task<List<ClassRequest>> GetClassesAsync();
        
    }
}
