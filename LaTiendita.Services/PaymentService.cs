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
    public class PaymentService : IPaymentService
    {
        private readonly IUnitOfWork UnitOfWork;

        public PaymentService(IUnitOfWork unitOfWork)
        {
            UnitOfWork = unitOfWork;
        }

        public List<Payment> GetPayments()
        {
            return UnitOfWork.GetRepository<Payment>().GetAll().ToList();
        }
    }
}
