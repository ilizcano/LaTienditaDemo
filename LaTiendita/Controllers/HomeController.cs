using LaTiendita.Model;
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
        private readonly IProductsService ProductsService;

        public HomeController(IProductsService productsService)
        {
            ProductsService = productsService;
        }

        public ActionResult Index()
        {
            using (var ctx = new PrincipalContext(ContextType.Domain, "test"))
            {
                var user = UserPrincipal.FindByIdentity(ctx, IdentityType.SamAccountName, Environment.UserName);

                if (user == null)
                {
                    return View("AccessDenied");
                }

                ViewBag.UserName = user.DisplayName;
            }
            
            return View();
        }

        public JsonResult GetProducts()
        {
            var result = ProductsService.GetProducts();
            return Json(result, JsonRequestBehavior.AllowGet);
        }
    }
}