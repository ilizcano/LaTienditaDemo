using LaTiendita.Model;
using LaTiendita.Models;
using LaTiendita.Services.Interfaces;
using System;
using System.Collections.Generic;
using System.DirectoryServices.AccountManagement;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LaTiendita.Controllers
{
    public class HomeController : Controller
    {
        private readonly IProductService ProductsService;
        private readonly IUserService UserService;

        public HomeController(IProductService productsService, IUserService userService)
        {
            ProductsService = productsService;
            UserService = userService;
        }

        public ActionResult Index()
        {
            UserModel model = new UserModel();
            var user = UserService.GetUserByName("demoUser");
            model.UserId = user.UserId;
            model.Name = user.Name;
            model.IsDeleted = user.IsDeleted;
            model.Email = user.Email;
            model.Balance = user.Balance;

            return View(model);
        }

        public JsonResult GetProducts()
        {
            var result = ProductsService.GetProducts();
            return Json(result, JsonRequestBehavior.AllowGet);
        }
    
    }
}