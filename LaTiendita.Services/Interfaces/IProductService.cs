using LaTiendita.Model;
using System.Collections.Generic;

namespace LaTiendita.Services.Interfaces
{
    public interface IProductService
    {
        List<Product> GetProducts();
    }
}
