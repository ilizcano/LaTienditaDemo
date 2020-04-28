using LaTiendita.Model;
using System.Collections.Generic;

namespace LaTiendita.Services.Interfaces
{
    public interface IPurchaseService
    {
        List<Purchase> GetPurchases();

        List<Purchase> GetPurchasesByUserId(int userId);
        void SavePurchase(Purchase purchase);
    }
}
