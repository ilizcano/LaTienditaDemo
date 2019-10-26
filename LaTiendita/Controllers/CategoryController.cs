using LaTiendita.Model.Dto;
using LaTiendita.Services.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LaTiendita.Controllers
{
    public class CategoryController : Controller
    {
        private readonly ICategoryService CategoryService;

        public CategoryController(ICategoryService categoryService) {
            CategoryService = categoryService;
        }
        // GET: Category
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public JsonResult SaveCategory(CategoryDto model) {

            var result = CategoryService.SaveCategory(model);

             return Json(result, JsonRequestBehavior.AllowGet);
        }
    }
}