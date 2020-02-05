using LaTiendita.Services;
using LaTiendita.Services.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LaTiendita.Controllers
{
    public class PagoController : Controller
    {
        IPaymentService PaymentService;
        public PagoController(IPaymentService paymentService) {
            PaymentService = paymentService;
        }
        // GET: Pago
        public ActionResult Index()
        {
            return View();
        }

        public JsonResult GetPayment()
        {
            var result = PaymentService.GetPayments();
            return Json(result, JsonRequestBehavior.AllowGet);
        }
    }
}