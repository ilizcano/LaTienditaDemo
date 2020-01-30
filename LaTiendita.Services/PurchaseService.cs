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
    public class PurchaseService : IPurchaseService
    {
        private readonly IUnitOfWork UnitOfWork;

        public PurchaseService(IUnitOfWork unitOfWork)
        {
            UnitOfWork = unitOfWork;
        }

        public List<Purchase> GetPurchases()
        {
            return UnitOfWork.GetRepository<Purchase>().GetAll().ToList();
        }

        public void SavePurchase(Purchase purchase) {
            UnitOfWork.GetRepository<Purchase>().Add(purchase);
            UnitOfWork.SaveChanges();
        }
    }
}
