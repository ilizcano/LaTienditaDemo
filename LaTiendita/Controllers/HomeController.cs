using LaTiendita.Model;
using LaTiendita.Model.Dto;
using LaTiendita.Services.Interfaces;
using System;
using System.Collections.Generic;
using System.DirectoryServices.AccountManagement;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace LaTiendita.Controllers
{
    public class HomeController : Controller
    {
        private readonly IProductService ProductsService;
        private readonly IUserService UserService;
        private readonly IPaymentService PaymentService;
        private readonly IPurchaseService PurchaseService;

        public HomeController(IProductService productsService, IUserService usersService, IPaymentService paymentService, IPurchaseService purchaseService)
        {
            ProductsService = productsService;
            UserService = usersService;
            PaymentService = paymentService;
            PurchaseService = purchaseService;
        }

        public ActionResult Index()
        {
            //using (var ctx = new PrincipalContext(ContextType.Domain, "test"))
            //{
            //    var user = UserPrincipal.FindByIdentity(ctx, IdentityType.SamAccountName, Environment.UserName);

            //    if (user == null)
            //    {
            //        return View("AccessDenied");
            //    }

            //    ViewBag.UserName = user.DisplayName;
            //}
            
            return View();
        }

        public JsonResult GetProducts()
        {
            var result = ProductsService.GetProducts();
            return Json(result, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public async Task<ActionResult> SaveProduct(ProductDto model)
        {

            //if (!ModelState.IsValid)
            //{
            //    return BadRequest(ModelState);
            //}

            var newRecord = ProductsService.GetProducts();

            return Json(newRecord, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetUsers()
        {
            var result = UserService.GetUsers();
            return Json(result, JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetPayment()
        {
            var result = PaymentService.GetPayments();
            return Json(result, JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetPurchase()
        {
            var result = PurchaseService.GetPurchases();
            return Json(result, JsonRequestBehavior.AllowGet);
        }
    }
}