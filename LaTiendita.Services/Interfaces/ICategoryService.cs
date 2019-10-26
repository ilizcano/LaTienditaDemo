using LaTiendita.Model.Dto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LaTiendita.Services.Interfaces
{
   public interface ICategoryService
    {
      CategoryDto SaveCategory(CategoryDto model);
    }
}
