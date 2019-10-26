using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LaTiendita.Model.Exceptions
{
   public class ValidateNameExeption: Exception
    {
        public ValidateNameExeption() { }

        public ValidateNameExeption(string name, string entity)
        : base(String.Format("Duplicate {0} Name: {1}", entity, name))
        {

        }
    }
}
