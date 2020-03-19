using System;
using System.Linq;
using System.Web.Mvc;
using LaTiendita.Models;
using LaTiendita.Services.Interfaces;

namespace LaTiendita.Controllers
{
    public class ComprarController : Controller
    {
        private readonly IProductService ProductsService;
        private readonly IPurchaseService PurchaseService;
        private readonly IUserService UserService;
        public ComprarController(IProductService productsService, IPurchaseService purchaseService, IUserService userService) {
            ProductsService = productsService;
            PurchaseService = purchaseService;
            UserService = userService;
        }

        // GET: Venta
        public ActionResult Index()
        {
            PurchaseModel model = new PurchaseModel();
            model.IsNew = true;
            ViewBag.Products = ProductsService.GetProducts();
            return View(model);
        }

        public JsonResult GetPurchase()
        {
            var result = PurchaseService.GetPurchases();
            return Json(result, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        [AllowAnonymous]
        public ActionResult Index(PurchaseModel model) {
            model.IsNew = false;
            model.IsValid = ModelState.IsValid;
            if (ModelState.IsValid)
            {

                var currentUser = UserService.GetUserByName("demoUser");/*TODO: change to current user*/
                var userId = currentUser == null ? 0 : currentUser.UserId;

                PurchaseService.SavePurchase(new Model.Purchase
                {
                    ProductId = model.ProductId,
                    Amount = model.Price * model.Quantity,
                    Quantity = model.Quantity,
                    UserId = userId,
                    IsDeleted = false,
                    CreationDate = DateTime.Now,
                    UpdateDate = DateTime.Now
                });

                var amount = Decimal.ToDouble(model.Price * model.Quantity) * -1;
                UserService.UpdateBalance(userId, amount);
            }
            ViewBag.Products = ProductsService.GetProducts();
            return PartialView(model);
        }
    }
}