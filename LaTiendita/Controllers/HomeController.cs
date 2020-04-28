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
        private readonly IPurchaseService PurchaseService;

        public HomeController(IProductService productsService, IUserService userService, IPurchaseService purchaseService)
        {
            ProductsService = productsService;
            UserService = userService;
            PurchaseService = purchaseService;
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
            model.PurchaseList = (from pp in PurchaseService.GetPurchasesByUserId(user.UserId).OrderByDescending(p => p.CreationDate).Take(10)
                                  join p in ProductsService.GetProducts() on pp.ProductId equals p.ProductId
                                  select new PurchaseModel { ProductId = p.ProductId, ProductName = p.Name, Price = p.Price, Quantity = pp.Quantity, Total = pp.Amount, PurchaseDate = pp.CreationDate }).ToList();

            return View(model);
        }

        public JsonResult GetProducts()
        {
            var result = ProductsService.GetProducts();
            return Json(result, JsonRequestBehavior.AllowGet);
        }
    
    }
}