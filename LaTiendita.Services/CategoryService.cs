using LaTiendita.DataAccess.Interfaces;
using LaTiendita.Model;
using LaTiendita.Model.Dto;
using LaTiendita.Model.Exceptions;
using LaTiendita.Services.Interfaces;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LaTiendita.Services
{
    public class CategoryService : ICategoryService
    {
        private readonly IUnitOfWork UnitOfWork;

        public CategoryService(IUnitOfWork unitOfWork)
        {
            UnitOfWork = unitOfWork;
        }

       
        public CategoryDto SaveCategory(CategoryDto model)
        {
            var record = UnitOfWork.GetRepository<Category>().GetAll().FirstOrDefault(p => p.Name.Equals(model.Name));

            if (record != null && record.IsDeleted == true)
            {
                model.CategoryId = record.CategoryId;
                record.Description = model.Description;
                record.UpdateDate = DateTime.Now;
                record.IsDeleted = false;
                UnitOfWork.GetRepository<Category>().Add(record);
            }
            else
            {
                if (record == null)
                {
                    Category category = new Category();
                    category.Name = model.Name;
                    category.Description = model.Description;
                    category.CreationDate = DateTime.Now;
                    category.IsDeleted = false;
                    UnitOfWork.GetRepository<Category>().Add(category);
                    model.CategoryId = category.CategoryId;
                }
                else {
                    throw new ValidateNameExeption(model.Name, "Category");
                }
                
            }

            UnitOfWork.SaveChanges();

            return model;
        }

    }
}
