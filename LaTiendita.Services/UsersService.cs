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

        public User GetUserByName(string name)
        {
            return UnitOfWork.GetRepository<User>().GetAll(u => u.Name == name).FirstOrDefault();
        }

        public void UpdateBalance(int userId, double amount)
        {
            var user = UnitOfWork.GetRepository<User>().Get(u => u.UserId == userId).FirstOrDefault();
            user.Balance = (user.Balance - amount);
            UnitOfWork.SaveChanges();
        }

        public double GetBalance(int userId)
        {
            var user = UnitOfWork.GetRepository<User>().Get(u => u.UserId == userId).FirstOrDefault();

            if (user == null)
                throw new Exception("User does not exist");
            else
                return user.Balance;
        }
    }
}
