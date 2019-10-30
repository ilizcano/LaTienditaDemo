using LaTiendita.Model.Dto;
using LaTiendita.Services.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LaTiendita.Controllers
{
    public class ProductController : Controller
    {
        private readonly IProductService ProductsService;

        public ProductController(IProductService productsService)
        {
            ProductsService = productsService;
        }

        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public JsonResult GetProducts()
        {
            var result = ProductsService.GetProducts();
            return Json(result, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        [Route("")]
        public JsonResult SaveProduct(ProductDto model)
        {

            if (!ModelState.IsValid)
            {
                //return BadRequest(ModelState);
            }

            var result = ProductsService.SaveOrUpdateProduct(model);

            return Json(result, JsonRequestBehavior.AllowGet);
        }

        [HttpDelete]
        public JsonResult DeleteProduct(int id) {
            ProductsService.DeleteProduct(id);
            return Json("", JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public JsonResult GetProductById(int id)
        {
            var result = ProductsService.GetProductById(id);
            return Json(result, JsonRequestBehavior.AllowGet);
        }



    }
}