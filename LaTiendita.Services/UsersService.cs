using LaTiendita.DataAccess.Interfaces;
using LaTiendita.Model;
using LaTiendita.Services.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LaTiendita.Services
{
    public class UsersService : IUserService
    {
        private readonly IUnitOfWork UnitOfWork;

        public UsersService(IUnitOfWork unitOfWork)
        {
            UnitOfWork = unitOfWork;
        }

        public List<User> GetUsers()
        {
            return UnitOfWork.GetRepository<User>().GetAll().ToList();
        }
    }
}
