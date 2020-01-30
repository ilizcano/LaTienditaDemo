using System;
using System.Linq;
using System.Web.Mvc;
using LaTiendita.Models;
using LaTiendita.Services.Interfaces;

namespace LaTiendita.Controllers
{
    public class VentaController : Controller
    {
        private readonly IProductService ProductsService;
        private readonly IPurchaseService PurchaseService;
        public VentaController(IProductService productsService, IPurchaseService purchaseService) {
            ProductsService = productsService;
            PurchaseService = purchaseService;
        }

        // GET: Venta
        public ActionResult Index()
        {
            ViewBag.Products = ProductsService.GetProducts();
            return View();
        }

        [HttpPost]
        [AllowAnonymous]
        public ActionResult Index(PurchaseModel model) {
            if (ModelState.IsValid) {
                PurchaseService.SavePurchase(new Model.Purchase
                {
                    ProductId = model.ProductId,
                    Amount = model.Price * model.Quantity,
                    Quantity = model.Quantity,
                    IsDeleted = false,
                    CreationDate = DateTime.Now,
                    UpdateDate = DateTime.Now,
                    
                });
            }
            ViewBag.Products = ProductsService.GetProducts();
            return PartialView();
        }
    }
}