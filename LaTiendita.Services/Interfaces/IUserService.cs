using LaTiendita.Model;
using System.Collections.Generic;

namespace LaTiendita.Services.Interfaces
{
    public interface IUserService
    {
        List<User> GetUsers();
        User GetUserByName(string name);
        void UpdateBalance(int userId, double amount);
        double GetBalance(int userId);
    }
}
