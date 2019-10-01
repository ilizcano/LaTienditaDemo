using LaTiendita.Model;
using System.Collections.Generic;

namespace LaTiendita.Services.Interfaces
{
    public interface IProductsService
    {
        List<Product> GetProducts();
    }
}
