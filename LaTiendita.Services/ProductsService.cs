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
    public class ProductsService: IProductsService
    {
        private readonly IUnitOfWork UnitOfWork;

        public ProductsService(IUnitOfWork unitOfWork)
        {
            UnitOfWork = unitOfWork;
        }

        public List<Product> GetProducts()
        {
            return UnitOfWork.GetRepository<Product>().GetAll().ToList();
        }
    }
}
