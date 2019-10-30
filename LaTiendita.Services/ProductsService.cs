using LaTiendita.DataAccess.Interfaces;
using LaTiendita.Model;
using LaTiendita.Model.Dto;
using LaTiendita.Services.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LaTiendita.Services
{
    public class ProductsService: IProductService
    {
        private readonly IUnitOfWork UnitOfWork;

        public ProductsService(IUnitOfWork unitOfWork)
        {
            UnitOfWork = unitOfWork;
        }

        public void DeleteProduct(int id)
        {
            var product = UnitOfWork.GetRepository<Product>().GetAll().FirstOrDefault(p => p.ProductId == id);
            product.IsDeleted = true;
            UnitOfWork.GetRepository<Product>().Update(product);
            UnitOfWork.SaveChanges();
        }

        public ProductDto GetProductById(int id)
        {
            ProductDto dto = new ProductDto();
            var result = UnitOfWork.GetRepository<Product>().GetAll().FirstOrDefault(p => p.ProductId == id);
            if (result != null) {
                dto.ProductId = result.ProductId;
                dto.Name = result.Name;
                dto.Price = result.Price;
                dto.Description = result.Description;
            }

            return dto;
        }

        public List<Product> GetProducts()
        {
            return UnitOfWork.GetRepository<Product>().GetAll().Where(p => p.IsDeleted == false).ToList();
        }

        public ProductDto SaveOrUpdateProduct(ProductDto model)
        {
            //ToDo falta validacion en caso de que sea un update y exista el mismo nombre
            var record = UnitOfWork.GetRepository<Product>().GetAll().FirstOrDefault(p => p.Name.Equals(model.Name));

            if (record != null)
            {
                model.ProductId = record.ProductId;
                record.Price = model.Price;
                record.Description = model.Description;
                record.UpdateDate = DateTime.Now;
                record.IsDeleted = false;
                
            }
            else
            {
                var product = new Product();
                product.ProductId = model.ProductId;
                product.Name = model.Name;
                product.Description = model.Description;
                product.Price = model.Price;
                product.CreationDate = DateTime.Now;
                product.UpdateDate = DateTime.Now;
                product.IsDeleted = false;
                if (model.ProductId == 0)
                {
                    UnitOfWork.GetRepository<Product>().Add(product);
                }
                else {
                    UnitOfWork.GetRepository<Product>().Update(product);
                }     
            }

            UnitOfWork.SaveChanges();

            return model;
        }

    }
}
