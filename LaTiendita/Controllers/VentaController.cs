using System;
using System.Web.Mvc;
using LaTiendita.Models;

namespace LaTiendita.Controllers
{
    public class VentaController : Controller
    {
        // GET: Venta
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        [AllowAnonymous]
        public ActionResult Buy(PurchaseModel model) {
            if (ModelState.IsValid) { 
            }
            Console.WriteLine("Enter");
            return new EmptyResult();
        }
    }
}