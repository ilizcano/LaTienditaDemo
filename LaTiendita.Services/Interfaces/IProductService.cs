using LaTiendita.Model;
using LaTiendita.Model.Dto;
using System.Collections.Generic;

namespace LaTiendita.Services.Interfaces
{
    public interface IProductService
    {
        List<Product> GetProducts();
        ProductDto SaveOrUpdateProduct(ProductDto model);
        void DeleteProduct(int id);
        ProductDto GetProductById(int id);
    }
}
